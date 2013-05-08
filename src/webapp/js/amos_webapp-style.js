function getStatusIcon(status){
	var c = "statusIcon ";
	if(status === "green"){
		c += "statusIconOk";
	}else if(status === "yellow"){
		c += "statusIconWarning";
	}else if(status === "red"){
		c += "statusIconCritical";
	}
	var div = document.createElement("div");
	div.setAttribute("class", c);
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