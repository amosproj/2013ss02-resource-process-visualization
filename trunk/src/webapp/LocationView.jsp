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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="de.osramos.reprovis.HallBean" %>
<%@ page import="de.osramos.reprovis.LineBean" %>
<%@ page import="de.osramos.reprovis.LocationBean" %>
<%@ page import="de.osramos.reprovis.TestData" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.MasterData" %>

<%
LocationBean location = (LocationBean)request.getAttribute("locid");

//We only allow access to this template via request.
//If there is none, exit here.
//@TODO: Only allow access if post parameter was submitted
if(request.getParameter("locid") == null)
	return;

//Process the post data here
int id = Integer.parseInt(request.getParameter("locid"));
%>

<div id="dataLayerContent" class="row">
<div id="SVGPlanHolder" class="span7">
	<div id="breadCrumbNavi"></div>
	<h3 id="dynamicHeading"></h3>
	<div id="locationDevices">
		<table id="locationDevicesList" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Status</th>
					<th>Device</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>

<div id="informationBlock" class="span4">
	<a href="javascript:showGlobalMap()">Go back to global view</a>
	<table id="locationDetails" class="table table-striped table-hover">
		<tr><td>Status</td><td id="locationStatus"></td></tr>
		<tr><td>Name</td><td id="locationName"></td></tr>
		<tr><td>Number of types</td><td id="locationCountOfDevices"></td></tr>
	</table>
</div>
</div><br class="clear" />

<script type="text/javascript">
$(document).ready(function() {
	Location.getData(<%= id %>, function(a, data) {
		for(var i = 0; i < data.testDevices.length; ++i) {
			var rowClass = "";
			
			switch(data.testDevices[i].status) {
				case "green": rowClass = "success"; break;
				case "yellow": rowClass = "warning"; break;
				case "red": default: rowClass = "error"; break;
			}
			
			var sElm = $("<td></td>")
					.html("<div class=\""+getStatusClass(data.testDevices[i].status)+"\"></div>");
			
			var lElm = $("<td></td>")
					.html(data.testDevices[i].name);
			
			var rElm = $("<tr></tr>")
					.attr("class", rowClass)					
	    			.attr("onclick", 'GlobalHierarchyHandler.hierarchyZoom(\'testingDevice\', '+data.testDevices[i].id+')')
					.append(sElm)
					.append(lElm);
			
			$("#locationDevicesList tbody").append(rElm);
		}	

	    $("#dynamicHeading").html("Location: "+data.name+" (ID: <%= id %>)");
	    $("#locationName").html(data.name);
	    $("#locationStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	    $("#locationCountOfDevices").html(data.testDeviceCount);	
	});
});
</script>