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
<%@ page import="de.osramos.reprovis.TestData" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.MasterData" %>

<%
HallBean hall = (HallBean)request.getAttribute("hall");

//We only allow access to this template via request.
//If there is none, exit here.
//@TODO: Only allow access if post parameter was submitted
if(request.getParameter("hid") == null)
	return;

//Process the post data here
int id = Integer.parseInt(request.getParameter("hid"));
%>

<div id="dataLayerContent" class="row">
<div id="SVGPlanHolder" class="span7">
	<div id="breadCrumbNavi"></div>
	<h3 id="dynamicHeading"></h3>
	<svg id="SVGPlan"></svg>
</div>

<div id="informationBlock" class="span4">
	<a href="javascript:showGlobalMap()">Go back to global view</a>
	<table id="hallDetails" class="table table-striped table-hover">
		<tr><td>Name</td><td id="hallName"></td></tr>
		<tr><td>Staff</td><td id="hallStaff"></td></tr>
		<tr><td>Capacity</td><td id="hallCapacity"></td></tr>
	</table>
</div>
</div><br class="clear" />

<script type="text/javascript">
$(document).ready(function() {
	Hall.getData(<%= id %>, function(a, data) {
	    // Draw the plan and attach click handler
	    for(var i = 0; i < data.lines.length; ++i) {
	    	var svgPath = $("<path></path>")
	    			.attr("d", data.lines[i].path)
	    			.attr("class", getSvgClass(data.lines[i].status))
	    			.attr("onclick", 'GlobalHierarchyHandler.hierarchyZoom(\'line\', '+data.lines[i].id+')');
	    	
			$("#SVGPlan").append(svgPath);
	    }
	    
	    // Refresh
	    $("#SVGPlanHolder").html($("#SVGPlanHolder").html());
	    
	    // Insert static data
	    // @TODO: Later possible pull some data in real-time (e.g. vehicles?)
	    //		  That is why the DOM architecture has been chosen like this(!)
	    $("#dynamicHeading").html("Hall: "+data.name+" (ID: <%= id %>)");
	    $("#hallName").html(data.name);
	    $("#hallStaff").html(data.staff);
	    $("#hallCapacity").html(data.capacity);
	});
});
</script>