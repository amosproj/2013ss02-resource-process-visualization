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
<%@ page import="de.osramos.reprovis.TestingDeviceBean" %>
<%@ page import="de.osramos.reprovis.TestData" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<%
TestingDeviceBean testingDevice = (TestingDeviceBean)request.getAttribute("tdid");

//We only allow access to this template via request.
//If there is none, exit here.
//@TODO: Only allow access if post parameter was submitted
if(request.getParameter("tdid") == null)
	return;

//Process the post data here
int id = Integer.parseInt(request.getParameter("tdid"));
%>

<div id="dataLayerContent" class="row">
<div id="SVGPlanHolder" class="span7">
	<h3 id="dynamicHeading"></h3>
	<div id="testingDeviceComponents">
		<div class="dropdown">
		    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="addColumn">+</a>
		    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" id="componentlistColumnAdd">
		    </ul>
	    </div>
		<table id="componentlist" class="table table-striped table-hover">
			<thead>
				<tr>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	
	<!-- Modal box holder for electrical component detail display -->
	<div id="componentModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-body">Loading, please wait... <img src="./img/loading-animation.gif" alt="Loading animation"></div>
	</div>
</div>

<div id="informationBlock" class="span4">
	<table id="testingDeviceDetails" class="table table-striped table-hover">
		<tr><td>Status</td><td id="testingDeviceStatus"></td></tr>
		<tr><td>Name</td><td id="testingDeviceName"></td></tr>
		<tr><td>Description</td><td id="testingDeviceDescription"></td></tr>
		<tr><td>Type</td><td id="testingDeviceCategory"></td></tr>
		<tr><td>Serial number</td><td id="testingDeviceSerialnumber"></td></tr>
<!-- 		<tr><td>IP Address</td><td id="testingDeviceIpAddress"></td></tr>
		<tr><td>Network Status</td><td id="testingDeviceNetworkStatus"></td></tr> -->
<!-- 		<tr><td>Maintainance Info</td><td id="testingDeviceMaintainanceInfo"></td></tr>
		<tr><td>Components</td><td id="testingDevicesCountComponents"></td></tr>
		<tr><td>Troubleperiod</td><td id="testingDevicesTroublePeriod"></td></tr>
		<tr><td>Testfailure</td><td id="testingDevicesFailure"></td></tr> -->
<!-- 		<tr><td>Sektor</td><td id="testingDevicesSector"></td></tr> -->
	</table>
</div>
</div><br class="clear" />

<script type="text/javascript">
$(document).ready(function() {
	TestingDevice.getData(<%= id %>, function(a, data) {
		// Create hierarchical navigation first
		$("#breadCrumbNavi").html(GlobalHierarchyHandler.Navigation.createBreadcrumb(data.parent));
		
		elementList = new AMOSList("#componentlist", data.components, 'component');
		elementList.sortBy("status", [2, 1, 0, -1]);
		
	    $("#dynamicHeading").html("Testing Device: "+data.name);
	    $("#testingDeviceName").html(data.name);
	    $("#testingDeviceSerialnumber").html(data.serialnumber);
	    $("#testingDeviceCategory").html(data.category);
	    $("#testingDeviceDescription").html(data.description);
	    $("#testingDeviceIpAddress").html(data.ipaddress);
	    $("#testingDeviceMaintainanceInfo").html(data.maintainanceinfo);
	    $("#testingDeviceNetworkStatus").html(data.networkstatus);
	    $("#testingDeviceStatus").html("<div class='"+getStatusClass(data.status)+"'></div>");
	    $("#testingDevicesCountComponents").html(data.componentCount);
	    $("#testingDevicesTroublePeriod").html(data.troubleperiod);	
	    $("#testingDevicesFailure").html("" + data.testfailure);	
	    $("#testingDevicesSector").html(data.sector);	
	});
});
</script>
