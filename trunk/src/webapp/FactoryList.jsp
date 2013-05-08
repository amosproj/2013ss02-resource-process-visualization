<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.FactoryBean" %>
<%@ page import="de.osramos.reprovis.TestData" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<%@ page import="java.util.List" %>
[
<%! @SuppressWarnings("unchecked") %>
<% boolean first = true; %>
<% for(TestData.Factory factory: (List<TestData.Factory>)request.getAttribute("factories")){ %>
<% if(!first){ %>
,
<% }else first = false; %>
	{
		"fid": <%= factory.getId() %>,
		"fName": "<%= factory.getName() %>",
		"active": false,
		"lat": <%= factory.getCoordinate().latitude %>, 
		"lon": <%= factory.getCoordinate().longitude %>, 
		"companyImg": "<img class=\"companyImgSmall\" src=\"./img/logo_audi-small.png\" />", 
		"flagImg": "<img class=\"flagImgSmall\" src=\"./img/flag_germany-bavaria.png\" />",
		"statusImg": "<span class=\"statusIcon <%= MasterData.getTrafficIconClass(factory.getStatus()) %>\">&nbsp;</span>"
	}
<% } %>
]