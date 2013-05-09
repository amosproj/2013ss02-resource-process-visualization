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