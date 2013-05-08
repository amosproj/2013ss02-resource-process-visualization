var svgNS = "http://www.w3.org/2000/svg";

function displayLocation(json){
	var container = document.createElement("div");
	var components = document.createElement("div");
	var info = document.createElement("div");
	
	components.setAttribute("class", "span6");
	var cHtml = "<ul>";
	for(var i = 0; i < json.components.length; ++i){
		cHtml += "<li onclick=\"javascript:componentZoom(" + json.components[i].id + ")\" ";
		cHtml += "class=\"list\">";
		cHtml += "<div class=\"" + getStatusClass(json.components[i].status)+ " listStatus\"></div>";
		cHtml += json.components[i].type;
		cHtml += "</li>";
	}
	cHtml += "</ul>";
	components.innerHTML = cHtml;
	
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
	
	container.appendChild(components);
	container.appendChild(info);
	
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}

function locationZoom(locId){
	$.ajax({
		url: "./location",
		type: "POST",
		data: {locid: locId},
		success: function(response, textStatus, jqXHR){
			displayLocation(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}