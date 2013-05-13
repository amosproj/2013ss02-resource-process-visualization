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

Location = {
		// Loads the respective data as JSON object
		getData: function(lID, callback) {
			$.ajax({
				dataType: "json",
				type: "POST",
				url: "./location",
				data: {getData: true, locid: lID},
				
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

function displayLocation(json){
	var container = document.createElement("div");
	var components = document.createElement("div");
	var info = document.createElement("div");
	
	components.setAttribute("class", "span6");
	var cHtml = "<ul>";
	for(var i = 0; i < json.components.length; ++i){
		cHtml += "<li onclick=\"javascript:componentZoom(" + json.components[i].id + ")\" ";
		cHtml += "class=\"list\">";
		cHtml += "<div class=\"" + getStatusClass(json.components[i].status)+ " listStatus\"></div>";
		cHtml += json.components[i].type;
		cHtml += "</li>";
	}
	cHtml += "</ul>";
	components.innerHTML = cHtml;
	
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
	
	container.appendChild(components);
	container.appendChild(info);
	
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}

function locationZoom(locId){
	$.ajax({
		url: "./location",
		type: "POST",
		data: {locid: locId},
		success: function(response, textStatus, jqXHR){
			displayLocation(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}