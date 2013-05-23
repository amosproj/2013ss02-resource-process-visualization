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
<%@ page import="de.osramos.reprovis.GlobalBean"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.FactoryBean" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean" %>
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
		"country": "<%= factory.getCountry() %>",
		"city": "<%= factory.getCity() %>",
		"sizeOfStaff": "<%= factory.getSizeOfStaff() %>",
		"lat": <%= factory.getGpsLatitude() %>, 
		"lon": <%= factory.getGpsLongitude() %>, 
		"companyImg": "<img class=\"companyImgSmall\" src=\"./config/logo_company/<%= factory.getCompany().toString()%>.png\" />", 
		"flagImg": "<img class=\"flagImgSmall\" src=\"./config/flag_country/<%= factory.getCountry()%>.png\" />",
		"statusImg": "<span class=\"statusIcon <%= MasterData.getTrafficIconClass(factory.getStatus()) %>\">&nbsp;</span>"
	}
<% } %>
]