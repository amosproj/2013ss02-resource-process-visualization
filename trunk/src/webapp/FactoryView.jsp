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

<% FactoryBean factory = (FactoryBean)request.getAttribute("factory"); %>
<table>
<tr>
	<td>Name</td>
	<td><%= factory.getName() %></td>
</tr>
<tr>
	<td>Country</td>
	<td><%= factory.getCountry() %></td>
</tr>
<tr>
	<td>Car Models</td>
	<td><% 
	String[] carNames = factory.getCarModels();
	if(carNames.length > 0){
		out.print(carNames[0]);
	}
	for(int i = 1; i < carNames.length; ++i){
		out.print(", " + carNames[i]);
	}
	%></td>
</tr>
<tr>
	<td>Vehicle output</td>
	<td><%= factory.getNumOfVehicles() %></td>
</tr>
<tr>
	<td>Staff</td>
	<td><%= factory.getSizeOfStaff() %></td>
</tr>
</table>
<a href="javascript:showGlobalMap()">Go back to global view</a>
