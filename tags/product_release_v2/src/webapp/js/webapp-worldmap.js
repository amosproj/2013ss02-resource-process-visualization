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

// Set up initial configuration data
var pluginName = "worldMap",
	pluginConf = {
		apikey: '941204b6a0ac4efe9938a21535446d28',
		style: '997',
		center: [0,0],
		maxZoom : 18,
		startHeight: 400
	};

var worldMapMarkers = new Array();

$(document).ready(function() {
	// Set up the map
	var map = L.map('map').setView([48.762201, 11.425374], 5);	
	var data = {};
	
	// Add tile layer to map (the actual map images)
	L.tileLayer('http://{s}.tile.cloudmade.com/'+pluginConf['apikey']+'/'+pluginConf['style']+'/256/{z}/{x}/{y}.png', {
		maxZoom: pluginConf['maxZoom'],
		attribution: ''
	}).addTo(map);
	
	function factoryPopup(factory) {
		var result = '<div><p style="text-align: center;">'+factory.companyImg+'&nbsp;'+factory.flagImg+
		             '</p><hr /><h4>'+factory.fName+'</h4>Status: '+factory.statusImg+'<hr />'+
					 '<p style="text-align: center;"><p>'+factory.city+', '+factory.country+'<br />'+factory.sizeOfStaff+' Mitarbeiter</p>'+
					 '<a href="#factory-'+factory.fid+'" onClick="GlobalHierarchyHandler.hierarchyZoom(\'factory\', this.id);" id="fid-'+factory.fid+'" fid="'+factory.fid+'"role="button" class="factoryBtn">View details</a>'
					 '</p></div>';	
					 
		return result;
	}
		
	// Load factories ...
	function factoryGetAll() {
		jQuery.getJSON('./factory', function(factories) {
			// If applicable, delete old ones
			for(var i=0; i < worldMapMarkers.length; i++) {
				map.removeLayer(worldMapMarkers[i]);
			}
			
			// Shortcut for data
			data.factories = factories;
			
			// ... and draw factories into map
			for(var i=0; i < data.factories.length; i++) {
				var obj = data.factories[i];
				
				var markerObj = L.marker([data.factories[i].lat, data.factories[i].lon]).addTo(map)
								.bindPopup(data.factories[i].hardTpl);
	
				worldMapMarkers.push(markerObj);
				
		        markerObj.bindPopup(factoryPopup(data.factories[i]), {offset: new L.Point(0,-10), autoPanPadding: new L.Point(10,30)});
				if(data.factories[i].active == true || data.factories[i].active == 1)
					markerObj.openPopup();
			}
		});
	}
	
	// Set interval to live-update the factories on the front map
	// Current setting is 1 minute (1000 * 60 * 1)
	window.onload = function(){
		  setInterval(function() {factoryGetAll(); }, 1000 * 60 * 1);
	};
	
	// Run factory setup on page load
	factoryGetAll();
	
	// Bind click handler to map
	function onMapClick(e) {
		// map.panTo(e.latlng);
	}
	
	map.on('click', onMapClick);
	
	function showGlobalMap() {
		GlobalHierarchyHandler.hierarchyZoom('global', '0');
	}
	
	function notAvailable() {
	    $("#feature-announcement").modal("show");
	}
});