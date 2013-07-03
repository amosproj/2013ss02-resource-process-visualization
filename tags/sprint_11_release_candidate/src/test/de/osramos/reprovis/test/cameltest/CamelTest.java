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
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.apache.camel.component.mock.MockEndpoint;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.connectivity.ComponentUpdater;
import de.osramos.reprovis.connectivity.DeviceHandler;
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
				
				from("direct:in")
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
					.to("mock:out");
				
				from("seda:fail")
					.to("mock:fail");
	
			}
		};
		
		
	}
	
	
	
	@Test
	public void Test() throws InterruptedException  {

	
		
		MockEndpoint ende = getMockEndpoint("mock:out");
		ende.expectedMessageCount(3);
		ende.expectedHeaderReceived("id", 5);
		
		MockEndpoint fail = getMockEndpoint("mock:out");
		fail.expectedMessageCount(0);

		NotifyBuilder notify = new NotifyBuilder(this.context()).whenDone(
				1).create();

		
		String message=
			"<tasks>"+	
			"<device factory=\"Ingolstadt\" hall=\"H1\" line=\"L1 Assembly\" location=\"Lo1\" name=\"D1\" >"+
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
            "</tasks>";
		
		template.sendBody("direct:in" ,message);

	
		assertTrue(notify.matches(10, TimeUnit.SECONDS));
		ende.assertIsSatisfied();
		fail.assertIsSatisfied();
	}
	
}
