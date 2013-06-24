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
<%@ page import="de.osramos.reprovis.handler.MasterData" %>
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
<% FactoryBean factory = (FactoryBean)request.getAttribute("factory"); %>

<div id="dataLayerContent" class="row">
	<div id="SVGPlanHolder" class="span7">
		<h3 id="dynamicHeading"></h3>
		<div id="svgCanvas">
		<!--[if gt IE 8]>
			<%= factory.getMap() %>
		<![endif]-->
		</div>
	</div>
	
	<div id="informationBlock" class="span4">
		<table id="factoryDetails" class="table table-striped table-hover">
			<tr><td class="keyCol">Status</td><td id="factoryStatus"></td></tr>
			<tr><td class="keyCol">Country</td><td id="factoryCountry"></td></tr>
			<tr><td class="keyCol">City</td><td id="factoryName"></td></tr>
			<tr><td class="keyCol">Brands</td><td id="factoryBrand"></td></tr>
			<tr><td class="keyCol">UPS Systems</td><td id="factoryUPSSystems"></td></tr>
			<tr><td class="keyCol">UPS Provider</td><td id="factoryUPSProvider"></td></tr>
			<tr><td class="keyCol">UPS Servers</td><td id="factoryUPSServers"></td></tr>
			<tr><td class="keyCol">UPS Clients</td><td id="factoryUPSClients"></td></tr>
			<tr><td class="keyCol">Staff</td><td id="factoryStaff"></td></tr>
			<tr><td class="keyCol">Vehicles per year</td><td id="factoryVehiclesPerYear"></td></tr>
			<tr><td class="keyCol">Vehicles per day</td><td id="factoryVehiclesPerDay"></td></tr>
			<tr><td class="keyCol">Vehicles</td><td id="factoryCars"></td></tr>
		</table>
	</div>
</div><br class="clear" />

<div style="display: none;" id="DBDataHolder">
<%= factory.getMap() %>
</div>

<script type="text/javascript">
$(document).ready(function() {
	Factory.getData(<%= id %>, function(a, data) {
		// Create hierarchical navigation first
		$("#breadCrumbNavi").html(GlobalHierarchyHandler.Navigation.createBreadcrumb(data.parent));
		
		// Draw the factory plan using Raphael and custom SVG Wrapper
		if (BrowserDetect.browser == "Explorer" && BrowserDetect.version < 9.0) {
			var svgData = $('#DBDataHolder').html();
			var raphaelElements = SVGWrapper.drawCanvas(svgData);
			
			//for(var rEL in raphaelElements) {
				//raphaelElements[rEL].click(IEClickHandler);
				//console.log("rEL: "+raphaelElements[rEL].attr('id'));
			//}
		}
				
	    // Attach click handler
	    for(var i = 0; i < data.halls.length; i++) {
	    	
	    	// Bad performance, but working hack for <= IE8
	    	if (BrowserDetect.browser == "Explorer" && BrowserDetect.version < 9.0) {
	    		for(var rEL in raphaelElements) {
	    			if(raphaelElements[rEL].attr('id') == data.halls[i].path) {
	    				raphaelElements[rEL].attr({fill: getVmlColor(data.halls[i].status)});
	    				
	    				var hallID = data.halls[i].id;	    				
	    				raphaelElements[rEL].click(function () {
    						GlobalHierarchyHandler.hierarchyZoom('hall', hallID);
	    				});
	    			}
	    		}
	    	}
	    	
	    	// All other browsers are just doing fine
	    	else {
		    	$("#" + data.halls[i].path)
		    		.attr("onclick", 'GlobalHierarchyHandler.hierarchyZoom(\'hall\', '+data.halls[i].id+')')
		    		.attr("class", getSvgClass(data.halls[i].status))
		    		.hover(function() {
		    			$(this).stop().animate({"opacity": "0.5"}, 300);
		    		}, function() {
		    			$(this).stop().animate({"opacity": "1.0"}, 300);
		    		});
		    	
		    		//location.hash = "hall-"+data.halls[i].id;
	    	}
	    }
	    
	    if (BrowserDetect.browser != "Explorer" || BrowserDetect.version >= 9.0) {
		    // Refresh only <> IE8 - otherwise clickhandlers crash!
		    $("#SVGPlanHolder").html($("#SVGPlanHolder").html());
	    }
	    
	    // Insert static data
	    // @TODO: Later possible pull some data in real-time (e.g. vehicles?)
	    //		  That is why the DOM architecture has been chosen like this(!)
	    $("#dynamicHeading").html("Factory: "+data.name+", "+data.country);
	    $("#factoryStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	    $("#factoryCountry").html(data.country);
	    $("#factoryName").html(data.name);
	    $("#factoryStaff").html(data.staff+" ("+data.staffdate+")");
	    $("#factoryVehiclesPerYear").html(data.vehiclesperyear);
	    $("#factoryVehiclesPerDay").html(data.vehiclesperday);
	    $("#factoryBrand").html(data.brand);
	    $("#factoryUPSServers").html(data.upsservers);
	    $("#factoryUPSClients").html(data.upsclients);
	    $("#factoryUPSProvider").html(data.upsprovider);
	    $("#factoryUPSSystems").html(data.upssystems);	    
	    
	    var factoryCars = "";
	    for(var j = 0; j < data.brands.length; ++j) {
	    	if(j != 0) factoryCars += ", ";
	    	factoryCars += data.brands[j];
	    }
	    
	    $("#factoryCars").html(factoryCars);
    });
});
</script>