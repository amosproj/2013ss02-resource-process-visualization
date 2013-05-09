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

// Click handler for world map click on a factory details button
function factoryZoom(el){
	// Get the ID out of DOM element
	var fID = parseInt($("#"+el).attr("fid"));	
	
	// Load the data with specific factoryID
	$.ajax({
		url: "./factory",
		type: "POST",
		data: {fid: fID},
		success: function(response, textStatus, jqXHR){
			$("#canvas #dataLayer").html(response);			
			$("#canvas #map").animate({height: "0px"}, 500);			
			$("#canvas #dataLayer").css({display: "block", height: "300px"});
			$("#canvas").animate({height: "300px"}, 500);
			//displayFactory(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
			console.error("The following error occured: " +
				textStatus, errorThrown);
		}
	});
}

Factory = {
	// Loads the respective factory data as JSON object
	getData: function(fID, callback) {
		$.ajax({
			dataType: "json",
			type: "POST",
			url: "./factory",
			data: {getData: true, fid: fID},
			
			success: function(response, textStatus, jqXHR){
                callback.call(this, fID, response);
			},
	
			error: function(jqXHR, textStatus, errorThrown){
				notAvailable();
				console.error("The following error occured: " +
					textStatus, errorThrown);
			}
		});
	}
};