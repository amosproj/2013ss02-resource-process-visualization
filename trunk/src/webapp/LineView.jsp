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
LineBean line = (LineBean)request.getAttribute("line");

//We only allow access to this template via request.
//If there is none, exit here.
//@TODO: Only allow access if post parameter was submitted
if(request.getParameter("lid") == null)
	return;

//Process the post data here
int id = Integer.parseInt(request.getParameter("lid"));
%>

<div id="dataLayerContent" class="row">
<div id="SVGPlanHolder" class="span7">
	<h3 id="dynamicHeading"></h3>
	<div id="locationPlan"><ul></ul></div>
</div>

<div id="informationBlock" class="span4">
	<a href="javascript:showGlobalMap()">Go back to global view</a>
	<table id="lineDetails" class="table table-striped table-hover">
		<tr><td>Status</td><td id="lineStatus"></td></tr>
		<tr><td>Name</td><td id="lineName"></td></tr>
	</table>
</div>
</div><br class="clear" />

<script type="text/javascript">
$(document).ready(function() {
	Line.getData(<%= id %>, function(a, data) {
		
		for(var i = 0; i < data.locations.length; ++i) {
			var dElm = $("<div></div>")
					.attr("class", "listStatus" + getStatusClass(data.locations[i].status));
			
			var lElm = $("<li></li>")
					.attr("class", "list")
					.attr("onclick", "locationZoom('"+data.locations[i].id+"')")
					.html(dElm);
		}		
		
	    // Insert static data
	    // @TODO: Later possible pull some data in real-time (e.g. vehicles?)
	    //		  That is why the DOM architecture has been chosen like this(!)
	    $("#dynamicHeading").html("Line: "+data.name+" (ID: <%= id %>)");
	    $("#lineName").html(data.name);
	    $("#lineStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	});
});
</script>