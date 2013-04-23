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