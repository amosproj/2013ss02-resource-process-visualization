var svgNS = "http://www.w3.org/2000/svg";

function displayComponent(json){
	var container = document.createElement("div");
	
	var infoHtml = "<div class=\"statusSummary\">";
	infoHtml += "Status: ";
	infoHtml += "<div class=\"" + getStatusClass(json.status) + "\"></div>";
	infoHtml += "</div>";
	infoHtml += "<table>";
	infoHtml += "<tr>";
	infoHtml += "<td>Type</td>";
	infoHtml += "<td>" + json.type + "</td>";
	infoHtml += "</tr>";
	infoHtml += "</table>";
	container.innerHTML = infoHtml;
	
	$("#canvas #dataLayer").html("");
	$("#canvas #dataLayer").append(container);
}

function componentZoom(cId){
	$.ajax({
		url: "./component",
		type: "POST",
		data: {cid: cId},
		success: function(response, textStatus, jqXHR){
			displayComponent(response);
		},
		error: function(jqXHR, textStatus, errorThrown){
			notAvailable();
		}
	});
}