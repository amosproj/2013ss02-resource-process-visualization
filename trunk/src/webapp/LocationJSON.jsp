<%-- Copyright (c) 2013 by Martin Gumbrecht, Christian Muehlroth, 
 						Jan-Philipp Stauffert, Kathrin Koenig, Yao Guo 
 
 This file is part of the Resource Process Visualization application.
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful, 
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.
 
 You should have received a copy of the GNU Affero General Public
 License along with this program. If not, see
 http://www.gnu.org/licenses/ --%>

<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="de.osramos.reprovis.FactoryBean"%>
<%@ page import="de.osramos.reprovis.HallBean"%>
<%@ page import="de.osramos.reprovis.LineBean" %>
<%@ page import="de.osramos.reprovis.LocationBean"%>
<%@ page import="de.osramos.reprovis.TestingDeviceBean"%>
<%@ page import="de.osramos.reprovis.ElectricalComponentBean"%>
<%@ page import="de.osramos.reprovis.handler.MasterData" %>
<%@ page import="java.util.List" %>
<%

LocationBean loc = (LocationBean) request.getAttribute("location");

//@TODO: Dynamically create the hierarchy
//For now, the hierarchy here is inserted manually
//This crashes as soon as the hierarchy structure will be altered
//Therefore it must be generated automatically in future.
//Due to time constraints, it is currently hardcoded in here.
LineBean lineParent = (LineBean)loc.getParent();
int lineID = lineParent.getId();

HallBean hallParent = (HallBean)lineParent.getParent();
int hallID = hallParent.getId();

FactoryBean factoryParent = (FactoryBean)hallParent.getParent();
int factoryID = factoryParent.getId(); 

%>
{
	"name": "<%= loc.getName() %>",
	"status": "<%= loc.getStatus() %>",
	"description": "<%= loc.getDescription() %>",
	"personincharge": "<%= loc.getPersonInCharge() %>",
	"testDeviceCount": "<%= loc.getChilds().size() %>",
	"testDevices": [
		<% boolean first = true; %>
		<% for(HierarchieElementBean child: loc.getChilds()){ %>
		<% TestingDeviceBean device = (TestingDeviceBean) child; %>
		<% if(!first){out.print(","); }else first = false; %>
			{
				"id": <%= device.getId() %>,
				"name": "<%= device.getName() %>",
				"status": "<%= device.getStatus() %>",
				"description": "<%= device.getDescription() %>",
				"type": "<%= device.getType() %>",
				"serialnumber": "<%= device.getSerialnumber() %>"
			}
		<% } %>
	],
	"parent": {
		"id": "<%= loc.getId() %>",
		"name": "<%= loc.getName() %>",
		"type": "location",
		"parent": {
			"id": "<%= lineID %>",
			"name": "<%= lineParent.getName() %>",
			"type": "line",
			"parent": {
				"id": "<%= hallID %>",
				"name": "<%= hallParent.getName() %>",
				"type": "hall",
				"parent": {
					"id": "<%= factoryID %>",
					"name": "<%= factoryParent.getName() %>",
					"type": "factory",
					"parent": "null"
				}
			}
		}	
	}
}