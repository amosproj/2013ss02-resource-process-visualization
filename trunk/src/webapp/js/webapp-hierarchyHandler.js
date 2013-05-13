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

GlobalHierarchyHandler = {
	// Generic hierarchy clickhandler
	hierarchyZoom: function(hLevel, id) {
		var request = {
			id: "",
			url: "",
			type: "POST",
			data: ""
		};
		
		// Switch-case handler for different levels of hierarchy
		switch(hLevel) {
			case "factory":
				// Get the ID out of DOM element
				request.id = parseInt($("#"+id).attr("fid"));
				request.url = "./factory";
				request.data = {fid: request.id};				
				break;
				
			case "hall":
				request.id = id;
				request.url = "./hall";
				request.data = {hid: id};
				break;
				
			case "line":
				request.id = id;
				request.url = "./line";
				request.data = {lid: id};
				break;

			case "location":
				request.id = id;
				request.url = "./location";
				request.data = {locid: id};
				break;
				
			case "testingDevice":
				request.id = id;
				request.url = "./testingdevice";
				request.data = {tdid: id};
				break;
	
			default: notAvailable(); return; break;
		}
		
		// Send an AJAX request to load data
		$.ajax({
			url: request.url,
			type: request.type,
			data: request.data,
			
			success: function(response, textStatus, jqXHR) {
				// Switch-case handler for different levels of hierarchy
				switch(hLevel) {
					case "factory":
						$("#canvas #dataLayer").html(response);
						$("#canvas #map").animate({height: "0px"}, 500);
						$("#canvas #dataLayer").css({display: "block", height: "400px"});
						$("#canvas").animate({height: "400px"}, 500);
						break;
			
					default:
						$('#canvas #dataLayer').fadeOut('fast', function() {
							$("#canvas #dataLayer").html(response);
							$('#canvas #dataLayer').fadeIn('fast');
						});
					break;
				}				
			},
			
			error: function(jqXHR, textStatus, errorThrown) {
				notAvailable();
				console.error(jqXHR);
				console.error("The following error occured: " +
					textStatus, errorThrown);
			}
		});
	}
};