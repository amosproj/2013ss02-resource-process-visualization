var svgNS = "http://www.w3.org/2000/svg";

function displayFactory(json){
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
	html += "<td>Name</td>";
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

function factoryZoom(el){
	var fId = parseInt($("#"+el).attr("fid"));
	$.ajax({
		url: "./factory",
		type: "POST",
		data: {fid: fId},
		success: function(response, textStatus, jqXHR){
			displayFactory(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}