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

HallBean hall = (HallBean)request.getAttribute("hall");

//@TODO: Dynamically create the hierarchy
//For now, the hierarchy here is inserted manually
//This crashes as soon as the hierarchy structure will be altered
//Therefore it must be generated automatically in future.
//Due to time constraints, it is currently hardcoded in here.
HierarchieElementBean factoryParent = (FactoryBean)hall.getParent();
int factoryID = factoryParent.getId(); 

%>
{
	"name": "<%= hall.getName() %>",
	"staff": <%= hall.getSizeOfStaff() %>,
	"capacity": <%= hall.getProductionCapacity() %>,
	"status": "<%= hall.getStatus() %>",
	"upsServer": <%= hall.getUpsServer() %>,
	"type": "<%= hall.getType() %>",
	"lines": [
		<% boolean first = true; %>
		<% for(HierarchieElementBean elem: hall.getChilds()){ %>
		<%		LineBean line = (LineBean) elem; %>
		<% if(!first){out.print(","); }else first = false; %>
		{
			"id": <%= line.getId() %>,
			"path": "<%= line.getPath() %>",
			"status": "<%= line.getStatus() %>"
		}
		<% } %>	
	],
	"parent": {
		"id": "<%= hall.getId() %>",
		"type": "hall",
		"parent": {
			"id": "<%= factoryID %>",
			"type": "factory",
			"parent": "null"
		}
	}
}