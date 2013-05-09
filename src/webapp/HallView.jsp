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
<%@ page import="de.osramos.reprovis.HallBean" %>
<%@ page import="de.osramos.reprovis.LineBean" %>
<%@ page import="de.osramos.reprovis.TestData" %>
<%@page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="java.util.List" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<% HallBean hall = (HallBean)request.getAttribute("hall"); %>
<div class="statusSummary">
Status: 
<div class="statusIcon <%= MasterData.getTrafficIconClass(hall.getStatus()) %>"></div>
</div>
<table>
<tr>
	<td>Name</td>
	<td><%= hall.getName() %></td>
</tr>
<tr>
	<td>Staff</td>
	<td><%= hall.getSizeOfStaff() %></td>
</tr>
<tr>
	<td>Production Capacity</td>
	<td><%= hall.getProductionCapacity() %></td>
</tr>
</table>
<div class="hallplan">
<svg
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="447.16"
   height="224.94"
   id="svg2">
<% for(HierarchieElementBean elem: hall.getChilds()){ %>
<% 		LineBean line = (LineBean) elem; %>
<path d="<%= line.getPath() %>" 
	class="<%= MasterData.getHallClass(line.getStatus()) %>" 
	onclick="javascript:lineZoom(<%= line.getId() %>)"/>
<% } %>
   <!-- <path class="statusHallOk" onclick="javascript:lineZoom(1)"
     d="m 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(2)"
     d="m 118.39838,71.469706 143.94673,0 0,32.829964 -143.94673,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(3)"
     d="m 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(4)"
     d="m 121.42884,149.25145 141.42135,0 0,21.2132 -141.42135,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(5)"
     d="m 154.76386,181.07127 97.98479,0 0,12.12184 -97.98479,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(6)"
     d="m 155.26895,199.25401 98.99495,0 0,11.11168 -98.99495,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(7)"
     d="m 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z"/>
  <path class="statusHallWarning" onclick="javascript:lineZoom(8)"
     d="m 16.372971,83.086466 76.77159,0 0,67.680224 -76.77159,0 z" />
  <path class="statusHallOk" onclick="javascript:lineZoom(9)"
     d="m 41.626791,18.436686 54.04316,0 0,50.00255 -54.04316,0 z"/>
  <path class="statusHallOk" onclick="javascript:lineZoom(10)"
     d="m 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z"/>-->
</svg>
</div>