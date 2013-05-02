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

// Hardcoded data; will be pulled dynamically in further releases
/*var data = {
	factories: [
		{"fid": 1, "fName": "Werk Ingolstadt", "lat": 48.762201, "lon": 11.425374, "active": true,
		 "companyImg": '<img class="companyImgSmall" src="./img/logo_audi-small.png" />', "flagImg": '<img class="flagImgSmall" src="./img/flag_germany-bavaria.png" />',
		 "statusImg": '<span class="statusIcon statusIconOk">&nbsp;</span>'},
			  
		{"fid": 2, "fName": "Werk Neckarsulm", "lat": 49.192780, "lon": 9.2261100, "active": false,
		 "companyImg": '<img class="companyImgSmall" src="./img/logo_audi-small.png" />', "flagImg": '<img class="flagImgSmall" src="./img/flag_germany-bawu.png" />',
		 "statusImg": '<span class="statusIcon statusIconWarning">&nbsp;</span>'}
	]
};*/
var data = {};

// Add tile layer to map (the actual map images)
L.tileLayer('http://{s}.tile.cloudmade.com/'+pluginConf['apikey']+'/'+pluginConf['style']+'/256/{z}/{x}/{y}.png', {
	maxZoom: pluginConf['maxZoom'],
	attribution: ''
}).addTo(map);

function factoryPopup(factory) {
	var result = '<div><p style="text-align: center;">'+factory.companyImg+'&nbsp;'+factory.flagImg+
	             '</p><hr /><h4>'+factory.fName+'</h4>Status: '+factory.statusImg+'<hr />'+
				 '<p style="text-align: center;"><p>Ingolstadt, Deutschland<br />Seit 1949<br />35.386 Mitarbeiter</p>'+
				 '<a href="#" onClick="factoryZoom(this.id)" id="fid-'+factory.fid+'" fid="'+factory.fid+'"role="button" class="btn factoryBtn">View details &raquo;</a>'
				 '</p></div>';	
				 
	return result;
}

jQuery.getJSON('./factory', function(factories){
	data.factories = factories;
	// Draw factories into map
	for(var i=0; i<data.factories.length; i++) {
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


function onMapClick(e) {	
    // map.panTo(e.latlng);
}

// Bind click handler to map
map.on('click', onMapClick);


function showGlobalMap() {
	$("#canvas").animate({height: pluginConf.startHeight}, 500);
	$("#canvas #map").animate({height: pluginConf.startHeight}, 500);
	$("#canvas #dataLayer").animate({height: "0px", display: "none"}, 500, function() {
		$("#canvas #dataLayer").css({display: "none"});
	});
}

function factoryZoom(el) {
	var factoryID = parseInt($("#"+el).attr("fid"));	
    var request = $.ajax({
        url: "./factory",
        type: "post",
        data: { fid: factoryID }
    });
	
	// callback handler that will be called on success
    request.done(function (response, textStatus, jqXHR){
	    $("#canvas #map").animate({height: "0px"}, 500);
		
		$("#canvas #dataLayer").css({display: "block", height: "300px"});
		$("#canvas").animate({height: "300px"}, 500);
		
        $("#canvas #dataLayer").html(response);
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown){
        notAvailable();
		console.error(
            "The following error occured: "+
            textStatus, errorThrown
        );
    });
}

function hallZoom(hallId){
	$.ajax({
		url: "./hall",
		type: "POST",
		data: {hid: hallId},
		success: function(response, textStatus, jqXHR){
			$("#canvas #dataLayer").html(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}

function notAvailable() {
    $("#feature-announcement").modal("show");
}
