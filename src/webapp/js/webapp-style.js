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
function getStatusClass(status){
	var c = "statusIcon ";
	if(status === "green"){
		c += "statusIconOk";
	}else if(status === "yellow"){
		c += "statusIconWarning";
	}else if(status === "red"){
		c += "statusIconCritical";
	}else if(status === "grey"){
		c += "statusIconUnknown";
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
	}else if(status === "grey"){
		return "statusHallUnknown";
	}
}

function getVmlColor(status) {
	if(status === "green"){
		return "#006400";
	}else if(status === "yellow"){
		return "#FF8C00";
	}else if(status === "red"){
		return "#8B0000";
	}else if(status === "grey"){
		return "#BBBBBB";
	}
}