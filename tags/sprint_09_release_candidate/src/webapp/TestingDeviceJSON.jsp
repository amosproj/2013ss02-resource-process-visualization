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
<%@ page import="de.osramos.reprovis.MasterData" %>
<%@ page import="java.util.List" %>
<%

TestingDeviceBean device = (TestingDeviceBean)request.getAttribute("device");

// @TODO: Dynamically create the hierarchy
// For now, the hierarchy here is inserted manually
// This crashes as soon as the hierarchy structure will be altered
// Therefore it must be generated automatically in future.
// Due to time constraints, it is currently hardcoded in here.
LocationBean locParent = (LocationBean)device.getParent();
int locationID = locParent.getId();

LineBean lineParent = (LineBean)locParent.getParent();
int lineID = lineParent.getId();

HallBean hallParent = (HallBean)lineParent.getParent();
int hallID = hallParent.getId();

FactoryBean factoryParent = (FactoryBean)hallParent.getParent();
int factoryID = factoryParent.getId(); 
%>
{
	"name": "<%= device.getName() %>",
	"status": "<%= device.getStatus() %>",
	"serialnumber": "<%= device.getSerialnumber() %>",
	"category": "<%=device.getType()%>",
	"description": "<%=device.getDescription()%>",
	"ipaddress": "<%=device.getIpAddress()%>",
	"maintainanceinfo": "<%=device.getMaintainanceInfo()%>",
	"networkstatus": "<%=device.getNetworkStatus()%>",
	"componentCount": "<%= device.getChilds().size() %>",
	"troubleperiod": "<%= device.getTroublePeriod() %>",
	"testfailure": <%= device.isTestFailure() %>,
	"sector": "<%= device.getSector() %>",
	"components": [
		<% boolean first = true; %>
		<% for(HierarchieElementBean child: device.getChilds()){ %>
		<% ElectricalComponentBean component = (ElectricalComponentBean) child; %>
		<% if(!first){out.print(","); }else first = false; %>
			{
				"id": <%= component.getId() %>,
				"name": "<%= component.getName() %>",
				"status": "<%= component.getStatus() %>",
				"category": "<%= component.getCategory() %>",
				"troublePeriod": "<%= component.getTroubeOccurrenceTime() %>",
				"sector": "<%= component.getSector() %>"
			}
		<% } %>
	],
	"parent": {
		"id": "<%= device.getId() %>",
		"name": "<%= device.getName() %>",
		"type": "testingDevice",
		"parent": {
			"id" : "<%= locationID %>",
			"name": "<%= locParent.getName() %>",
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
}