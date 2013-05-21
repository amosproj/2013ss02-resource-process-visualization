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

// Set up the map
var map = L.map('map').setView([48.762201, 11.425374], 5);

// Set up initial configuration data
var pluginName = "worldMap",
	pluginConf = {
		apikey: '941204b6a0ac4efe9938a21535446d28',
		style: '997',
		center: [0,0],
		maxZoom : 18,
		startHeight: 400
	};


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
				 '<a href="#" onClick="GlobalHierarchyHandler.hierarchyZoom(\'factory\', this.id);" id="fid-'+factory.fid+'" fid="'+factory.fid+'"role="button" class="btn factoryBtn">View details &raquo;</a>'
				 '</p></div>';	
				 
	return result;
}

// Load factories ...
jQuery.getJSON('./factory', function(factories){
	data.factories = factories;
	// ... and draw factories into map
	for(var i=0; i < data.factories.length; i++) {
		var obj = data.factories[i];
		for(var key in obj) {
			var markerObj = L.marker([data.factories[i].lat, data.factories[i].lon]).addTo(map)
							.bindPopup(data.factories[i].hardTpl);

	        markerObj.bindPopup(factoryPopup(data.factories[i]), {offset: new L.Point(0,-10), autoPanPadding: new L.Point(10,30)});
			if(data.factories[i].active == true || data.factories[i].active == 1)
				markerObj.openPopup();
		}
	}
});

// Bind click handler to map
function onMapClick(e) {
	// map.panTo(e.latlng);
}

map.on('click', onMapClick);

function showGlobalMap() {
	$("#canvas").animate({height: pluginConf.startHeight}, 500);
	$("#canvas #map").animate({height: pluginConf.startHeight}, 500);
	$("#canvas #dataLayer").animate({height: "0px", display: "none"}, 500, function() {
		$("#canvas #dataLayer").css({display: "none"});
	});
}

function notAvailable() {
    $("#feature-announcement").modal("show");
}