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

package de.osramos.reprovis.connectivity;

import org.apache.camel.builder.RouteBuilder;

public class XMLAdapter extends RouteBuilder{
	

	@Override
	public void configure() throws Exception {
		
		from ("servlet:///input")
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
				.to("log:finished")
			.otherwise()
				.to("seda:fail");
		
		from("seda:unregister")
		.split().tokenizeXML("device")
		.choice()
			.when().xpath("/device")
				.process(new UnregisterDevice())
				.to("log:finished")
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
			.process(new ComponentUpdater());
		
		from("seda:fail")
			.to("log:failedRequests");
		
		

		
	}

}
