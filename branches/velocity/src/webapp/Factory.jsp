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

<%@page import="de.osramos.reprovis.FactoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Audi Factory</title>
</head>
<body>
	<h1>Audi Factory</h1>
	<%
		String id = request.getParameter("id");;
 		FactoryBean f = new FactoryBean(id);
/* 		out.println(f.getName());
		out.println(f.getCountry());
		out.println(f.getCity());
		out.println(f.getGpsLocation());  */
	%>


	<table border="1">
		<tr>
			<th>Name</th>
			<th>Country</th>
			<th>City</th>
			<th>GPS Location</th>
		</tr>
		<tr>
			<td><%out.println(f.getName()); %></td>
			<td><%out.println(f.getCountry()); %></td>
			<td><%out.println(f.getCity()); %></td>
			<td><%out.println(f.getGpsLocation()); %></td>
		</tr>
	</table>
</body>
</html>