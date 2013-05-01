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
	};

// Hardcoded data; will be pulled dynamically in further releases
var data = {
	factories: [
		{"fid": 1, "fName": "Ingolstadt", "lat": 48.762201, "lon": 11.425374, "active": true,
		 "hardTpl": '<p style="text-align: center;"><img width="50" src="./img/logo_audi-small.png" />&nbsp;<img width="50" src="./img/flag_germany-bavaria.png" />'+
			'</p><hr /><h4>Werk Ingolstadt</h4>Status: <span class="statusIcon statusIconOk">&nbsp;</span><hr />'+
			'<p style="text-align: center;"><p>Ingolstadt, Deutschland<br />Seit 1949<br />35.386 Mitarbeiter</p></p>'+
			'<p><a class="btn mapDetailBtn" href="#" id="fid-1">View details &raquo;</a></p>'},
			  
		{"fid": 2, "fName": "Neckarsulm", "lat": 49.192780, "lon": 9.2261100, "active": false,
		"hardTpl": '<p style="text-align: center;"><img width="50" src="./img/logo_audi-small.png" />&nbsp;<img width="50" src="./img/flag_germany-bawu.png" />'+
			'</p><hr /><h4>Werk Neckarsulm</h4>Status: <span class="statusIcon statusIconWarning">&nbsp;</span><hr />'+
			'<p style="text-align: center;"><p>Neckarsulm, Deutschland<br />Seit 1880<br />14.764 Mitarbeiter</p></p>'+
			'<p><a class="btn mapDetailBtn" href="#" id="fid-2">View details &raquo;</a></p>'}
	]
};

// Add tile layer to map (the actual map images)
L.tileLayer('http://{s}.tile.cloudmade.com/'+pluginConf['apikey']+'/'+pluginConf['style']+'/256/{z}/{x}/{y}.png', {
	maxZoom: pluginConf['maxZoom'],
	attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
}).addTo(map);

// Draw factories into map
for(var i=0; i<data.factories.length; i++) {
	var obj = data.factories[i];
	for(var key in obj) {
		var markerObj = L.marker([data.factories[i].lat, data.factories[i].lon]).addTo(map)
						.bindPopup(data.factories[i].hardTpl);
						
		if(data.factories[i].active == true || data.factories[i].active == 1)
			markerObj.openPopup();
	}
}

var popup = L.popup();

function onMapClick(e) {	
	// Hide the information layer
	$("#dataLayer").stop(true, true).animate({right:"-51%"}, 750);
	alert(jQuery("#map .btn").attr("class"));
}

map.on('click', onMapClick);

// jQuery additionals
$(function() {
	$( ".mapDetailBtn" ).click(function( event ) {
		alert(jQuery("#map .btn").attr("class"));
		event.preventDefault();
		jQuery("#dataLayer").stop(true, true).animate({right:"1%"}, 750);
	});
});