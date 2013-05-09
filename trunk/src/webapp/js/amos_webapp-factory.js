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

// Displays the outlays and information of a Factory
// Called by: factoryZoom(el)
function displayFactory(json) {
	console.log(json);
	var container = document.createElement("div");
	var mapContainer = document.createElement("div");
	mapContainer.setAttribute("class", "span6");
	
	var infoContainer = document.createElement("div");
	infoContainer.setAttribute("class", "span5");
	
	var svg = document.createElementNS(svgNS, "svg");
	svg.setAttributeNS(null, "class", "plan");
	
	for(var i = 0; i < json.halls.length; ++i){
		var hallElem = document.createElementNS(svgNS, "path");
		hallElem.setAttributeNS(null, "d", json.halls[i].path);
		hallElem.setAttributeNS(null, "class", getSvgClass(json.halls[i].status));
		
		var id = json.halls[i].id;
		hallElem.onclick = (function(id){
			return function(){hallZoom(id);};
			})(id);
			
		svg.appendChild(hallElem);
	}
	
	mapContainer.appendChild(svg);
	
	var status = document.createElement("div");
	status.appendChild(document.createTextNode("Status "));
	status.appendChild(getStatusIcon(json.status));
	status.setAttribute("class", "statusSummary");
	infoContainer.appendChild(status);
	
	var info = document.createElement("table");
	var html = "<tr>";
	html += "<td>NameX</td>";
	html += "<td>" + json.name + "</td>";
	html += "</tr><tr>";
	html += "<td>Country</td>";
	html += "<td>" + json.country + "</td>";
	html += "</tr><tr>";
	html += "<td>Staff</td>";
	html += "<td>" + json.staff + "</td>";
	html += "</tr><tr>";
	html += "<td>Vehicle output</td>";
	html += "<td>" + json.vehicles + "</td>";
	html += "</tr><tr>";
	html += "<td>Car Models</td>";
	html += "<td>";
	for(var i = 0; i < json.brands.length; ++i){
		if(i != 0)html += ", ";
		html += json.brands[i];
	}
	html += "</td>";
	html += "</tr>";
	info.innerHTML = html;
	infoContainer.appendChild(info);
	
	container.appendChild(mapContainer);
	container.appendChild(infoContainer);
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
	
	$("#canvas #map").animate({height: "0px"}, 500);
	
	$("#canvas #dataLayer").css({display: "block", height: "300px"});
	$("#canvas").animate({height: "300px"}, 500);
}