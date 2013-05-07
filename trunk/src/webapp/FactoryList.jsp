<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.FactoryBean" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
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
		"statusImg": "<span class=\"statusIcon <%= MasterData.getTrafficIconClass(factory.getStatus()) %>\">&nbsp;</span>"
	}
<% } %>
]