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
<%@ page import="de.osramos.reprovis.FactoryBean" %>
<%@ page import="de.osramos.reprovis.TestData" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<%@ page import="java.util.List" %>

<%
// We only allow access to this template via request.
// If there is none, exit here.
// @TODO: Only allow access if post parameter was submitted
if(request.getParameter("fid") == null)
	return;

// Process the post data here
int id = Integer.parseInt(request.getParameter("fid"));
%>

<div class="row">
	<div id="SVGPlanHolder" class="span7">
		<svg id="SVGPlan" class="plan"></svg>
	</div>
	
	<div class="span4">
		<table id="factoryDetails">
			<tr><td>Country</td><td id="factoryCountry"></td></tr>
			<tr><td>Name</td><td id="factoryName"></td></tr>
			<tr><td>Staff</td><td id="factoryStaff"></td></tr>
			<tr><td>Vehicles</td><td id="factoryVehicles"></td></tr>
			<tr><td>Car Models</td><td id="factoryCars"></td></tr>
		</table>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	Factory.getData(<%= id %>, function(a, factoryData) {
	    // Draw the factory plan and attach click handler
	    for(var i = 0; i < factoryData.halls.length; ++i) {
	    	var svgPath = $("<path></path>")
	    			.attr("d", factoryData.halls[i].path)
	    			.attr("class", getSvgClass(factoryData.halls[i].status))
	    			.attr("onclick", 'hallZoom('+factoryData.halls[i].id+')');
	    	
			$("#SVGPlan").append(svgPath);
	    }
	    
	    // Refresh
	    $("#SVGPlanHolder").html($("#SVGPlanHolder").html());
	    
	    // Insert static data
	    // @TODO: Later possible pull some data in real-time (e.g. vehicles?)
	    //		  That is why the DOM architecture has been chosen like this(!)
	    $("#factoryCountry").html(factoryData.country);
	    $("#factoryName").html(factoryData.name);
	    $("#factoryStaff").html(factoryData.staff);
	    $("#factoryVehicles").html(factoryData.vehicles);
	    
	    var factoryCars = "";
	    for(var j = 0; j < factoryData.brands.length; ++j) {
	    	if(j != 0) factoryCars += ", ";
	    	factoryCars += factoryData.brands[j];
	    }
	    
	    $("#factoryCars").html(factoryCars);
    });
});
</script>

Hi! You just clicked the factory with the ID <%= id %><br />
<a href="javascript:showGlobalMap()">Go back to global view</a>
