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
			case "global": break;
			case "factory":
				// Get the ID out of DOM element
				request.id = (!isNaN(parseInt(id))) ? id : parseInt($("#"+id).attr("fid"));
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
				
			case "component":
				request.id = id;
				request.url = "./component";
				request.data = {cid: id};
				break;
	
			default: notAvailable(); return; break;
		}
		
		if(hLevel == "global") {
			$("#canvas").animate({height: pluginConf.startHeight}, 500);
			$("#canvas #map").animate({height: pluginConf.startHeight}, 500);
			$("#canvas #dataLayer").animate({height: "0px", display: "none"}, 500, function() {
				$("#canvas #dataLayer").css({display: "none"});
			});
		}
		
		else {		
			// Send an AJAX request to load data
			$.ajax({
				url: request.url,
				type: request.type,
				data: request.data,
				
				success: function(response, textStatus, jqXHR) {
					// Switch-case handler for different levels of hierarchy
					switch(hLevel) {
						case "factory":
							// If we are coming from the global map, the animation
							// is different than coming upwards the hierarchy
							if($("#canvas #map").height() == 0) {
								// We are coming from upwards the hierarchy
								$('#canvas #dataLayer').fadeOut('fast', function() {
									$("#canvas #dataLayer").html(response);
									$('#canvas #dataLayer').fadeIn('fast');
								});
							}
							
							else {
								// We are coming from the global map
								$("#canvas #dataLayer").html('').html(response);
								$("#canvas #map").animate({height: "0px"}, 500);
								$("#canvas #dataLayer").css({display: "block", height: "400px"});
								$("#canvas").animate({height: "400px"}, 500);
							}
							break;
							
						case "component":
							$('#componentModal').html(response).modal('show');
						    $('#componentModal').on('shown', function() {
						        // Some handling, if necessary in future
						    });
							break;
				
						default:
							$('#canvas #dataLayer').fadeOut('fast', function() {
								$("#canvas #dataLayer").html('').html(response);
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
	},

	// Navigation handler
	Navigation: {
		// Returns hierarchy navigation elements in correct order (flattened array of objects)
		composeNavElements: function(parentElm) {
			var navElements = new Array();
			if(parentElm == null) return navElements;
			
			while(parentElm) {
				navElements.push(parentElm);
				if(parentElm.parent)
					parentElm = parentElm.parent;
				
				else
					parentElm = null;
			}
			
			navElements.reverse();
			return navElements;
		},
		
		// Creates breadcrumb navigation als HTML DOM elements and appends
		// them to the DOM automatically
		createBreadcrumb: function(parentElm) {			
			// Compose data elements
			var navElements = GlobalHierarchyHandler.Navigation.composeNavElements(parentElm);
			var navDOM = $('<span></span>');

			// Add the global / start element always
			$('<a>', {
			    text: 'Global',
			    title: 'Global',
			    href: '#',
			    onclick: 'GlobalHierarchyHandler.hierarchyZoom("global", "0");',
			    //click: function() { GlobalHierarchyHandler.hierarchyZoom('global', '0'); return false; }
			}).appendTo(navDOM);
			
			// Create navigation
			$.each(navElements, function(idx, navElm) {
				// Null // no object means: Links for global (anyways)
				if(navElm && navElm != null && navElm instanceof Object) {
					$('<a>', {
					    text: navElm.type + ' '+navElm.id,
					    title: navElm.type + ' '+navElm.id,
					    href: '#',
					    onclick: 'GlobalHierarchyHandler.hierarchyZoom("'+navElm.type+'", '+navElm.id+');',
					    //click: function() { GlobalHierarchyHandler.hierarchyZoom(navElm.type, navElm.id); return false; }
					}).appendTo(navDOM);
				}
			});
			
			// Add a > separator after each child but the last one ..
			$(navDOM).children('a:not(:last-child)').after(' > ');
		
			// .. and append the DOM elements to the navigation div
			$('#breadCrumbNavi').html('').append(navDOM);
		}
	}
};