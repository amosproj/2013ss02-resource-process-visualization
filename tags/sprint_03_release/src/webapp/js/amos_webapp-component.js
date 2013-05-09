/*
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
*/
var svgNS = "http://www.w3.org/2000/svg";

function displayComponent(json){
	var container = document.createElement("div");
	
	var infoHtml = "<div class=\"statusSummary\">";
	infoHtml += "Status: ";
	infoHtml += "<div class=\"" + getStatusClass(json.status) + "\"></div>";
	infoHtml += "</div>";
	infoHtml += "<table>";
	infoHtml += "<tr>";
	infoHtml += "<td>Type</td>";
	infoHtml += "<td>" + json.type + "</td>";
	infoHtml += "</tr>";
	infoHtml += "</table>";
	container.innerHTML = infoHtml;
	
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}

function componentZoom(cId){
	$.ajax({
		url: "./component",
		type: "POST",
		data: {cid: cId},
		success: function(response, textStatus, jqXHR){
			displayComponent(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}