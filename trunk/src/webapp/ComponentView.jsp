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
<%@ page import="de.osramos.reprovis.TestData" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<%
ElectricalComponentBean electricalComponent = (ElectricalComponentBean)request.getAttribute("cid");

//We only allow access to this template via request.
//If there is none, exit here.
//@TODO: Only allow access if post parameter was submitted
if(request.getParameter("cid") == null)
	return;

//Process the post data here
int id = Integer.parseInt(request.getParameter("cid"));
%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	<h4 id="myModalLabel">Trouble Electrical Component (ID: <%= id %>)</h4>
</div>

<div class="modal-body">
	<div class="pull-right">
		<button type="button" class="btn" onclick="notAvailable();">Print (soon available)</button>
	</div><br /><br />
	
	<table id="componentDetails" class="table table-striped table-hover">
		<tr><td>ID</td><td>4711004</td></tr>
		<tr><td>Serial Number</td><td>47110040000</td></tr>
		<tr><td>Test Status</td><td>Status</td></tr>
		<tr><td>Category</td><td>EC3</td></tr>
		<tr><td>Trouble Occurence Time:</td><td>2013-04-22 10:32:16</td></tr>
		<tr><td>Trouble Occurence Site:</td><td>Germany &gt;&gt; Ingolstadt &gt;&gt; Production Hall 1 &gt;&gt; Line 2 &gt;&gt; Location 3</td></tr>
		<tr><td>Responsible Sector:</td><td>Sector 3</td></tr>
		<tr><td>Shift Responsible:</td><td>Thomas Muller</td></tr>
		<tr><td>More 1</td><td>More Information 1</td></tr>
		<tr><td>More 2</td><td>More Information 2</td></tr>
	</table>
</div>

<div class="modal-footer">
	<button class="btn" data-dismiss="modal">Close</button>
</div>