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
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.handler.MasterData" %>

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
	<div id="locationPlan">
		<div class="dropdown">
		    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="addColumn">+</a>
		    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" id="testListColumnAdd">
		    </ul>
	    </div>
		<table id="testList" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Status</th>
					<th>Location Name</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>

<div id="informationBlock" class="span4">
	<table id="lineDetails" class="table table-striped table-hover">
		<tr><td class="keyCol">Status</td><td id="lineStatus"></td></tr>
		<tr><td class="keyCol">Name</td><td id="lineName"></td></tr>
	<!-- 	<tr><td class="keyCol">Production Capacity</td><td id="lineProductionCapacity"></td></tr>
		<tr><td class="keyCol">Production Series</td><td id="lineProductionSeries"></td></tr> -->
	</table>
</div>
</div><br class="clear" />

<script type="text/javascript">
$(document).ready(function() {
	Line.getData(<%= id %>, function(a, data) {
		// Create hierarchical navigation first
		$("#breadCrumbNavi").html(GlobalHierarchyHandler.Navigation.createBreadcrumb(data.parent));
		
		elementList = new AMOSList("#testList", data.locations, 'location');
		elementList.sortBy("name");
		elementList.sortBy("status", [2, 1, 0, -1]);
		elementList.hide("description");
		
	    // Insert static data
	    // @TODO: Later possible pull some data in real-time (e.g. vehicles?)
	    //		  That is why the DOM architecture has been chosen like this(!)
	    $("#dynamicHeading").html("Assembly Line: "+data.name);
	    $("#lineName").html(data.name);
	    $("#lineStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	    $("#lineProductionCapacity").html("" + data.capacity + " units");
	    $("#lineProductionSeries").html(data.series);
	});
});
</script>