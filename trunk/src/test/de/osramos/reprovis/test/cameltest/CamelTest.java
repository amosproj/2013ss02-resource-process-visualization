/*
 * Copyright (c) 2013 by Martin Gumbrecht, Christian Muehlroth, 
 *						Jan-Philipp Stauffert, Kathrin Koenig, Yao Guo 
 *
 * This file is part of the Resource Process Visualization application.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this program. If not, see
 * <http://www.gnu.org/licenses/>.
 */

package de.osramos.reprovis.test.cameltest;

import java.util.concurrent.TimeUnit;


import org.apache.camel.builder.NotifyBuilder;
import org.apache.camel.builder.PredicateBuilder;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.builder.xml.XPathBuilder;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.apache.camel.component.mock.MockEndpoint;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.ElectricalComponentBean;
import de.osramos.reprovis.LocationBean;
import de.osramos.reprovis.TestingDeviceBean;
import de.osramos.reprovis.TestingDeviceDAO;
import de.osramos.reprovis.connectivity.ComponentUpdater;
import de.osramos.reprovis.connectivity.DeviceHandler;
import de.osramos.reprovis.connectivity.RegisterDevice;
import de.osramos.reprovis.connectivity.UnregisterDevice;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.test.testhelper.Setup;

public class CamelTest extends CamelTestSupport  {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();

	}
	
	@Before
	public void setUpData() throws Exception {
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	
	@Override
	protected RouteBuilder createRouteBuilder() throws Exception {
	
		return new RouteBuilder() {
			
			@Override
			public void configure() throws Exception {
				
				from ("direct:in")
				.to("seda:xmlIn");
				
				
				from("seda:xmlIn")
				.split().tokenizeXML("task")
				.choice()
					.when().xpath("/task/@name =\"update\" ")
						.to("seda:update")
					.when().xpath("/task/@name =\"register\" ")
						.to("seda:register")
					.when().xpath("/task/@name =\"unregister\" ")
						.to("seda:unregister")
					.otherwise()
						.to("seda:fail");
				
				
				from("seda:register")
				.split().tokenizeXML("device")
				.choice()
					.when().xpath("/device")
						.process(new RegisterDevice())
						.to("mock:registerout")
					.otherwise()
						.to("seda:fail");
				
				from("seda:unregister")
				.split().tokenizeXML("device")
				.choice()
					.when().xpath("/device")
						.process(new UnregisterDevice())
						.to("mock:unregisterout")
					.otherwise()
						.to("seda:fail");
				
				from("seda:update")
				.split().tokenizeXML("device")
				.choice()
					.when().xpath("/device/component")
						.to("direct:devices")
					.otherwise()
						.to("seda:fail");
				
				
				from("direct:devices")
					.process(new DeviceHandler())
					.split().tokenizeXML("component")
						.choice()
							.when(header("id").isGreaterThan(0))
								.to("direct:components")
							.otherwise()
								.to("seda:fail");
				
				from("direct:components")
					.process(new ComponentUpdater())
					.to("mock:updateout");
			
				
				
				from("seda:fail")
					.to("mock:fail");
	
			}
		};
		
		
	}
	
	
	
	@Test
	public void updateDeviceTest() throws InterruptedException  {

	
		
		MockEndpoint ende = getMockEndpoint("mock:updateout");
		ende.expectedMessageCount(3);
		ende.expectedHeaderReceived("id", 5);
		
		MockEndpoint fail = getMockEndpoint("mock:fail");
		fail.expectedMessageCount(0);

		NotifyBuilder notify = new NotifyBuilder(this.context()).whenDone(
				1).create();

		
		String message=
			"<tasks>"+	
			"<task name=\"update\">"+	
			"<device factory=\"Ingolstadt\" hall=\"H1\" line=\"L1 Assembly\" location=\"Lo1\" name=\"MFTD2XI1-052\" >"+
			"<component name=\"Network\">" +
            "    <status>red</status>"+
			"	<value>N/A</value>"+
            "</component>"+
            "<component name=\"Tests\">"+
            "    <status>red</status>"+
			"	<value>bla</value>"+
            "</component>"+
            "<component name=\"Maintainance\">"+
            "    <status>red</status>"+
			"	<value>N/A</value>"+
            "</component>"+
            "</device>"+
            "</task>" +
            "</tasks>";
		
		log.info(message);
		
		template.sendBody("direct:in" ,message);

	
		assertTrue(notify.matches(10, TimeUnit.SECONDS));
		ende.assertIsSatisfied();
		fail.assertIsSatisfied();
	}
	
	
	@Test
	public void registerDeviceTest() throws InterruptedException, HierarchieException, DatabaseException  {

	
		
		MockEndpoint ende = getMockEndpoint("mock:registerout");
		ende.expectedMessageCount(1);

		
		MockEndpoint fail = getMockEndpoint("mock:fail");
		fail.expectedMessageCount(0);

		NotifyBuilder notify = new NotifyBuilder(this.context()).whenDone(
				1).create();

		
		String message=
			"<tasks>"+	
			"<task name=\"register\">"+	
			"<device factory=\"Ingolstadt\" hall=\"H1\" line=\"L1 Assembly\" location=\"Lo1\" name=\"Test\" >"+
            "</device>"+
            "</task>" +
            "</tasks>";
		
		log.info(message);
		
		template.sendBody("direct:in" ,message);

		
	
		assertTrue(notify.matches(10, TimeUnit.SECONDS));
		ende.assertIsSatisfied();
		fail.assertIsSatisfied();
		

		int id = TestingDeviceDAO.getIdByNames("Ingolstadt", "H1", "L1 Assembly", "Lo1", "Test");
		TestingDeviceBean device = new TestingDeviceBean(id);
		assertTrue(device.getName().equals("Test"));
		assertEquals(3, device.getChilds().size());
		
		ElectricalComponentBean c1 = (ElectricalComponentBean) device.getChilds().get(0);
		ElectricalComponentBean c2 = (ElectricalComponentBean) device.getChilds().get(1);
		ElectricalComponentBean c3 = (ElectricalComponentBean) device.getChilds().get(2);
		assertTrue(c1.getName().equals("Tests") || c1.getName().equals("Maintenance") || c1.getName().equals("Network"));
		assertTrue(c2.getName().equals("Tests") || c2.getName().equals("Maintenance") || c2.getName().equals("Network"));
		assertTrue(c3.getName().equals("Tests") || c3.getName().equals("Maintenance") || c3.getName().equals("Network"));
	}
	
	
	@Test
	public void deleteDeviceTest() throws InterruptedException, HierarchieException, DatabaseException  {

	
		
		MockEndpoint ende = getMockEndpoint("mock:unregisterout");
		ende.expectedMessageCount(1);

		
		MockEndpoint fail = getMockEndpoint("mock:fail");
		fail.expectedMessageCount(0);

		NotifyBuilder notify = new NotifyBuilder(this.context()).whenDone(
				1).create();

		
		String message=
			"<tasks>"+	
			"<task name=\"unregister\">"+	
			"<device factory=\"Ingolstadt\" hall=\"H1\" line=\"L1 Assembly\" location=\"Lo1\" name=\"MFTD2XI1-052\" >"+
            "</device>"+
            "</task>" +
            "</tasks>";
		
		log.info(message);
		
		template.sendBody("direct:in" ,message);

		
	
		assertTrue(notify.matches(10, TimeUnit.SECONDS));
		ende.assertIsSatisfied();
		fail.assertIsSatisfied();
		

		LocationBean locationBean = new LocationBean(4);
		assertEquals(0, locationBean.getChilds().size());
	}
}
