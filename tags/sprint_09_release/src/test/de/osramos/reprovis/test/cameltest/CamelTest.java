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

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.camel.builder.NotifyBuilder;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.test.junit4.CamelTestSupport;
import org.apache.camel.component.mock.MockEndpoint;
import org.junit.BeforeClass;
import org.junit.Test;
import org.postgresql.ds.PGSimpleDataSource;

import de.osramos.reprovis.connectivity.ComponentUpdater;
import de.osramos.reprovis.connectivity.DeviceHandler;

public class CamelTest extends CamelTestSupport  {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		System.setProperty(Context.URL_PKG_PREFIXES, "org.apache.naming");

		System.setProperty(Context.INITIAL_CONTEXT_FACTORY,
				"org.apache.naming.java.javaURLContextFactory");

		InitialContext ctx = new InitialContext();

		ctx.createSubcontext("java:");
		ctx.createSubcontext("java:comp");
		ctx.createSubcontext("java:comp/env");
		ctx.createSubcontext("java:comp/env/jdbc");

		PGSimpleDataSource ds = new PGSimpleDataSource();
		ds.setServerName(System.getenv("AMOS_DB_SERVER"));
		ds.setPortNumber(Integer.parseInt(System.getenv("AMOS_DB_PORT")));
		ds.setDatabaseName(System.getenv("AMOS_DB_NAME"));
		ds.setUser(System.getenv("AMOS_DB_USER"));
		ds.setPassword(System.getenv("AMOS_DB_PASSWORD"));

		ctx.bind("java:comp/env/jdbc/postgresql", ds);

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
				
				
				from("direct:testin")
					.to("http://localhost:8080/audi/test")
					.to("mock:2");
			}
		};
		
		
	}
	
	
	@Test
	public void Test2() throws InterruptedException  {

	
		
		MockEndpoint ende = getMockEndpoint("mock:2");
		ende.expectedMessageCount(1);
		

		NotifyBuilder notify = new NotifyBuilder(this.context()).whenDone(
				1).create();

		
		String message=
			"<tasks>"+	
			"<device factory=\"Ingolstadt\" hall=\"C6\" line=\"C6 Finish\" location=\"BC3\" name=\"MFTD2XI1-052\" >"+
            "<component name=\"Network\">" +
            "    <status>yellow</status>"+
			"	<value>aaal</value>"+
            "</component>"+
            "<component name=\"Tests\">"+
            "    <status>yellow</status>"+
			"	<value>aaal</value>"+
            "</component>"+
            "<component name=\"Maintainance\">"+
            "    <status>yellow</status>"+
			"	<value>aaal</value>"+
            "</component>"+
            "</device>"+
            "</tasks>";
		
		template.sendBody("direct:in" ,message);

	
		assertTrue(notify.matches(10, TimeUnit.SECONDS));
		ende.assertIsSatisfied();
	}
	
	@Test
	public void Test() throws InterruptedException  {

	
		
		MockEndpoint ende = getMockEndpoint("mock:out");
		ende.expectedMessageCount(3);
		ende.expectedHeaderReceived("id", 2660);
		

		NotifyBuilder notify = new NotifyBuilder(this.context()).whenDone(
				1).create();

		
		String message=
			"<tasks>"+	
			"<device factory=\"Ingolstadt\" hall=\"C6\" line=\"C6 Finish\" location=\"BC3\" name=\"MFTD2XI1-052\" >"+
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
	}
	
}
