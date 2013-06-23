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
<%@page import="de.osramos.reprovis.FactoryBean"%>
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
	<h3 id="dynamicHeading"></h3>
	<div id="svgCanvas">
	<!--[if gt IE 8]>
		<%= hall.getMap() %>
	<![endif]-->
	</div>
</div>

<div id="informationBlock" class="span4">
	<table id="hallDetails" class="table table-striped table-hover">
		<tr><td>Status</td><td id="hallStatus"></td></tr>
		<tr><td>Name</td><td id="hallName"></td></tr>
		<tr><td>Type</td><td id="hallType"></td></tr>
		<tr><td>Vehicles</td><td id="hallVehicles"></td></tr>
<!-- 		<tr><td>Staff</td><td id="hallStaff"></td></tr>
		<tr><td>Capacity</td><td id="hallCapacity"></td></tr> -->
		<tr><td>UPS Server</td><td id="hallUpsServer"></td></tr>
		<tr><td>UPS Clients</td><td id="hallUpsClients"></td></tr>
		
	</table>
</div>
</div><br class="clear" />

<div style="display: none;" id="DBDataHolder">
<%= hall.getMap() %>
</div>

<script type="text/javascript">
$(document).ready(function() {
	Hall.getData(<%= id %>, function(a, data) {
		// Create hierarchical navigation first
		$("#breadCrumbNavi").html(GlobalHierarchyHandler.Navigation.createBreadcrumb(data.parent));
		
		// Draw the factory plan using Raphael and custom SVG Wrapper
	    if (BrowserDetect.browser == "Explorer" && BrowserDetect.version < 9.0) {
	    	var svgData = $('#DBDataHolder').html();
	    	var raphaelElements = SVGWrapper.drawCanvas(svgData);
		}
		
		// Attach click handler
	    for(var i = 0; i < data.lines.length; i++) {

	    	// Bad performance, but working hack for <= IE8
	    	if (BrowserDetect.browser == "Explorer" && BrowserDetect.version < 9.0) {
	    		for(var rEL in raphaelElements) {
	    			if(raphaelElements[rEL].attr('id') == data.lines[i].path) {
	    				raphaelElements[rEL].attr({fill: getVmlColor(data.lines[i].status)});
	    				
	    				var lineID = data.lines[i].id;
	    				raphaelElements[rEL].click(function () {
    						GlobalHierarchyHandler.hierarchyZoom('line', lineID);
	    				});
	    			}
	    		}
	    	}
	    	
	    	// All other browsers are just doing fine
	    	else {
		    	$("#" + data.lines[i].path)
		    		.attr("onclick", 'GlobalHierarchyHandler.hierarchyZoom(\'line\', '+data.lines[i].id+')')
		    		.attr("class", getSvgClass(data.lines[i].status))
		    		.hover(function() {
		    			$(this).stop().animate({"opacity": "0.5"}, 300);
		    		}, function() {
		    			$(this).stop().animate({"opacity": "1.0"}, 300);
		    		});
	    	}
	    	
    		//location.hash = "line-"+data.lines[i].id;
	    }
	    
	    if (BrowserDetect.browser != "Explorer" || BrowserDetect.version >= 9.0) {
		    // Refresh only <> IE8 - otherwise clickhandlers crash!
	    	$("#SVGPlanHolder").html($("#SVGPlanHolder").html());
	    }
	    
	    // Insert static data
	    // @TODO: Later possible pull some data in real-time (e.g. vehicles?)
	    //		  That is why the DOM architecture has been chosen like this(!)
	    $("#dynamicHeading").html("Hall: "+data.name);
	    $("#hallStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	    $("#hallName").html(data.name);
	    $("#hallStaff").html(data.staff);
	    $("#hallVehicles").html(""+data.vehicles);
	    $("#hallCapacity").html(data.capacity);
	    $("#hallType").html(""+data.type);
	    $("#hallUpsServer").html(data.upsServer);
	    $("#hallUpsClients").html(data.upsClients);
	});
});
</script>