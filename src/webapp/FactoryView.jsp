<!-- 
 - Copyright (c) 2013 by Martin Gumbrecht, Christian Muehlroth, 
 -						Jan-Philipp Stauffert, Kathrin Koenig, Yao Guo 
 -
 - This file is part of the Resource Process Visualization application.
 -
 - This program is free software: you can redistribute it and/or modify
 - it under the terms of the GNU Affero General Public License as
 - published by the Free Software Foundation, either version 3 of the
 - License, or (at your option) any later version.
 -
 - This program is distributed in the hope that it will be useful, 
 - but WITHOUT ANY WARRANTY; without even the implied warranty of
 - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 - GNU Affero General Public License for more details.
 -
 - You should have received a copy of the GNU Affero General Public
 - License along with this program. If not, see
 - <http://www.gnu.org/licenses/>.
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="de.osramos.reprovis.FactoryBean" %>

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
Hi! You just clicked the factory with the ID <%= factory.getId() %><br />
<table>
<tr>
	<td>Name</td>
	<td><%= factory.getName() %></td>
</tr>
<tr>
	<td>Country</td>
	<td><%= factory.getCountry() %></td>
</tr>
</table>
<a href="javascript:showGlobalMap()">Go back to global view</a>
