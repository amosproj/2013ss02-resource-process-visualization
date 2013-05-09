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

function displayHall(json){
	var container = document.createElement("div");
	var mapContainer = document.createElement("div");
	mapContainer.setAttribute("class", "span6");
	var infoContainer = document.createElement("div");
	infoContainer.setAttribute("class", "span5");
	
	var svg = document.createElementNS(svgNS, "svg");
	svg.setAttributeNS(null, "class", "plan");
	for(var i = 0; i < json.lines.length; ++i){
		var lineElem = document.createElementNS(svgNS, "path");
		lineElem.setAttributeNS(null, "d", json.lines[i].path);
		lineElem.setAttributeNS(null, "class", getSvgClass(json.lines[i].status));
		var id = json.lines[i].id;
		lineElem.onclick = (function(id){
			return function(){lineZoom(id);};
			})(id);
		svg.appendChild(lineElem);
	}
	mapContainer.appendChild(svg);
	
	var status = document.createElement("div");
	status.appendChild(document.createTextNode("Status "));
	status.appendChild(getStatusIcon(json.status));
	status.setAttribute("class", "statusSummary");
	infoContainer.appendChild(status);
	
	var info = document.createElement("table");
	var html = "<tr>";
	html += "<td>Name</td>";
	html += "<td>" + json.name + "</td>";
	html += "</tr><tr>";
	html += "<td>Staff</td>";
	html += "<td>" + json.staff + "</td>";
	html += "</tr><tr>";
	html += "<td>Production Capacity</td>";
	html += "<td>" + json.capacity + "</td>";
	html += "</tr>";
	info.innerHTML = html;
	infoContainer.appendChild(info);
	
	container.appendChild(mapContainer);
	container.appendChild(infoContainer);
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}

function hallZoom(hallId){
	$.ajax({
		url: "./hall",
		type: "POST",
		data: {hid: hallId},
		success: function(response, textStatus, jqXHR){
			displayHall(response);
		},
//		success: function(response, textStatus, jqXHR){
//			$("#canvas #dataLayer").html(response);
//		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}