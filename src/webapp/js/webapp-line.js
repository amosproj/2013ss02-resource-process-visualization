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

Line = {
	// Loads the respective hall data as JSON object
	getData: function(lID, callback) {
		$.ajax({
			dataType: "json",
			type: "POST",
			url: "./line",
			data: {getData: true, lid: lID},
			
			success: function(response, textStatus, jqXHR){
                callback.call(this, lID, response);
			},
	
			error: function(jqXHR, textStatus, errorThrown){
				notAvailable();
				console.error("The following error occured: " +
					textStatus, errorThrown);
			}
		});
	}
};


////////////////////// DEPRECATED

function lineZoom(lineId){
	$.ajax({
		url: "./line",
		type: "POST",
		data: {lid: lineId},
		success: function(response, textStatus, jqXHR){
			displayLine(response);
			//$("#canvas #dataLayer").html(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}

function displayLine(json){
	var container = document.createElement("div");
	var locations = document.createElement("div");
	var info = document.createElement("div");
	
	locations.setAttribute("class", "span6");
	var locHtml = "<ul>";
	for(var i = 0; i < json.locations.length; ++i){
		locHtml += "<li onclick=\"javascript:locationZoom(" + json.locations[i].id + ")\" ";
		locHtml += "class=\"list\">";
		locHtml += "<div class=\"" + getStatusClass(json.locations[i].status)+ " listStatus\"></div>";
		locHtml += json.locations[i].name;
		locHtml += "</li>";
	}
	locHtml += "</ul>";
	locations.innerHTML = locHtml;
	
	info.setAttribute("class", "span5");
	var infoHtml = "<div class=\"statusSummary\">";
	infoHtml += "Status: ";
	infoHtml += "<div class=\"" + getStatusClass(json.status) + "\"></div>";
	infoHtml += "</div>";
	infoHtml += "<table>";
	infoHtml += "<tr>";
	infoHtml += "<td>Name</td>";
	infoHtml += "<td>" + json.name + "</td>";
	infoHtml += "</tr>";
	infoHtml += "</table>";
	info.innerHTML = infoHtml;
	
	container.appendChild(locations);
	container.appendChild(info);
	
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}