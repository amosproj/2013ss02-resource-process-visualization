function displayLine(json){
	var container = document.createElement("div");
	var locations = document.createElement("div");
	var info = document.createElement("div");
	
	locations.setAttribute("class", "span6");
	var locHtml = "<ul>";
	for(var i = 0; i < json.locations.length; ++i){
		locHtml += "<li>";
		locHtml += "<div class=\"" + getStatusClass(json.locations[i].status)+ "\"></div>";
		locHtml += json.locations[i].name;
		locHtml += "</li>";
	}
	locHtml += "</ul>";
	locations.innerHTML = locHtml;
	
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
	
	container.appendChild(locations);
	container.appendChild(info);
	
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}

function lineZoom(lineId){
	$.ajax({
		url: "./line",
		type: "POST",
		data: {lid: lineId},
		success: function(response, textStatus, jqXHR){
			displayLine(response);
			//$("#canvas #dataLayer").html(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}