<%@page import="de.osramos.reprovis.GlobalBean"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.FactoryBean" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<%@ page import="java.util.List" %>
[
<%! @SuppressWarnings("unchecked") %>
<% boolean first = true; %>
<% for(FactoryBean factory: (List<FactoryBean>)request.getAttribute("factories")){ %>
<% if(!first){ %>
,
<% }else first = false; %>
	{
		"fid": <%= factory.getId() %>,
		"fName": "<%= factory.getName() %>",
		"active": false,
		"lat": <%= factory.getGpsLatitude() %>, 
		"lon": <%= factory.getGpsLongitude() %>, 
		"companyImg": "<img class=\"companyImgSmall\" src=\"./img/logo_audi-small.png\" />", 
		"flagImg": "<img class=\"flagImgSmall\" src=\"./img/flag_germany-bavaria.png\" />",
		"statusImg": "<span class=\"statusIcon <%= MasterData.getTrafficIconClass(factory.getStatus()) %>\">&nbsp;</span>"
	}
<% } %>
]