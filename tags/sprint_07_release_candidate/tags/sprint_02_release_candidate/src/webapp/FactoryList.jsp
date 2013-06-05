<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.FactoryBean" %>
<%@ page import="de.osramos.reprovis.MasterData.TrafficLight" %>
<%@ page import="java.util.List" %>
[
<%! @SuppressWarnings("unchecked") %>
<% for(FactoryBean factory: (List<FactoryBean>)request.getAttribute("factories")){ %>
	{
		"fid": <%= factory.getId() %>,
		"fName": "<%= factory.getName() %>",
		"active": true,
		"lat": 48.762201, 
		"lon": 11.425374, 
		"companyImg": "<img class=\"companyImgSmall\" src=\"./img/logo_audi-small.png\" />", 
		"flagImg": "<img class=\"flagImgSmall\" src=\"./img/flag_germany-bavaria.png\" />",
		<% 	
		TrafficLight status = factory.getStatus();
		String statusClass; 
		switch(status){
		case red:
			statusClass = "statusIconCritical";
			break;
		case yellow:
			statusClass = "statusIconWarning";
			break;
		default:
			statusClass = "statusIconOk";
			break;
		}
		%>
		"statusImg": "<span class=\"statusIcon <%= statusClass %>\">&nbsp;</span>"
	}
<% } %>
]