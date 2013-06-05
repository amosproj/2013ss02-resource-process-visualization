<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>An error occurred while processing your request:</h2>
<%
String message = (String)request.getAttribute("message");
if(message != null){ 
%>
	<p>
		<%= message %>
	</p>
<% } %>