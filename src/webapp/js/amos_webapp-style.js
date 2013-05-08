function getStatusClass(status){
	var c = "statusIcon ";
	if(status === "green"){
		c += "statusIconOk";
	}else if(status === "yellow"){
		c += "statusIconWarning";
	}else if(status === "red"){
		c += "statusIconCritical";
	}
	return c;
}

function getStatusIcon(status){
	var div = document.createElement("div");
	div.setAttribute("class", getStatusClass(status));
	return div;
}

function getSvgClass(status){
	if(status === "green"){
		return "statusHallOk";
	}else if(status === "yellow"){
		return "statusHallWarning";
	}else if(status === "red"){
		return "statusHallCritical";
	}
}