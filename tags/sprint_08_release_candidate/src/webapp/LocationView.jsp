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
	<table id="locationDetails" class="table table-striped table-hover">
		<tr><td>Status</td><td id="locationStatus"></td></tr>
		<tr><td>Name</td><td id="locationName"></td></tr>
		<tr><td>Description</td><td id="locationDescription"></td></tr>
		<tr><td>Person in charge</td><td id="locationPersonInCharge"></td></tr>
		<tr><td>Devices</td><td id="locationCountOfDevices"></td></tr>
	</table>
</div>
</div><br class="clear" />

<script type="text/javascript">
$(document).ready(function() {
	Location.getData(<%= id %>, function(a, data) {
		// Create hierarchical navigation first
		$("#breadCrumbNavi").html(GlobalHierarchyHandler.Navigation.createBreadcrumb(data.parent));
		
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

	    $("#dynamicHeading").html("Location: "+data.name);
	    $("#locationName").html(data.name);
	    $("#locationDescription").html(data.description);
	    $("#locationPersonInCharge").html(data.personincharge);
	    $("#locationStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	    $("#locationCountOfDevices").html(data.testDeviceCount);	
	});
});
</script>