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
<%@ page import="de.osramos.reprovis.ElectricalComponentBean" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.handler.MasterData" %>
<% ElectricalComponentBean component = (ElectricalComponentBean)request.getAttribute("component"); %>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="myModalLabel">Trouble Electrical Component </h4>
</div>

<div class="modal-body">
	<div class="pull-right">
		<button type="button" class="factoryBtn" onclick="notAvailable();">Print (soon available)</button>
	</div><br /><br />
	
	<table id="componentDetails" class="table table-striped table-hover">
		<tr><td>Name</td><td><%= component.getName() %></td></tr>
		<tr><td>Status</td><td><%= MasterData.getTrafficDescription(component.getStatus()) %></td></tr>
		<tr><td>Value</td><td><%= component.getValue() %></td></tr>
		<tr><td>Last Status Change</td><td><%= component.getTroubeOccurrenceTime() %></td></tr>
		<tr><td>Trouble Period</td><td><%= component.getPeriod() %></td></tr>
	</table>
</div>

<div class="modal-footer">
	<button class="factoryBtn" data-dismiss="modal">Close</button>
</div>