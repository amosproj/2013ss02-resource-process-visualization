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
function AMOSList(tableId, data, zoomTo){
	this.sort = [];
	this.tableId = tableId;
	this.data = data;
	this.zoomTo = zoomTo;
	this.showKey = {};
	this.keyOrder = [];
	this.initKeys();
	this.initFilter();
	this.update();
}

AMOSList.prototype.update = function(){
	this.updateHead();
	this.updateTable();
	this.updateColumnAdd();
};

AMOSList.prototype.updateData = function(data){
	this.data = data;
	this.initFilter();
	for(var i = 0; i < this.sort.length; ++i){
		this.sortBy(this.sort[i].key, this.sort[i].order);
	}
	update();
};

AMOSList.prototype.initFilter = function(){
	if(this.filter === undefined)this.filter = {};
	for(var colIndex = 0; colIndex < this.keyOrder.length; ++colIndex){
		var key = this.keyOrder[colIndex];
		if(this.filter[key] === undefined){
			this.filter[key] = {};
		}
	}
	for(var rowIndex = 0; rowIndex < this.data.length; ++rowIndex){
		var row = this.data[rowIndex];
		for(var colIndex = 0; colIndex < this.keyOrder.length; ++colIndex){
			var key = this.keyOrder[colIndex];
			if(this.filter[key][row[key]] === undefined){
				this.filter[key][row[key]] = true;
			}
		}
	}
};

AMOSList.prototype.showFilterModal = function(key){
	var html = '<table>';
	for(var entry in this.filter[key]){
		html += '<tr>';
		html += '<td><input type="checkbox" ';
		if(this.filter[key][entry])html += 'checked="checked" ';
		html += 'onclick="elementList.toggleFilter(\'' + key + '\', \'' + entry + '\')"';
		html += '/></td><td>';
		html += entry;
		html += '</td></tr>';
	}
	html += '</table>';
	$("#filterModalBody").html(html);
};

AMOSList.prototype.toggleFilter = function(key, val){
	this.filter[key][val] = !this.filter[key][val];
	this.update();
};

AMOSList.prototype.initKeys = function(){
	if(this.data.length > 0){
		this.keyOrder = [];
		for(var key in this.data[0]){
			var show = this.showKey[key] === undefined ? true : this.showKey[key];
			if(key === 'id')show = false;
			this.showKey[key] = show;
			this.keyOrder.push(key);
		}
	} else {
		throw {message: 'Empty data array in AMOSList'};
	}
	this.statusToFront();
};

AMOSList.prototype.statusToFront = function(){
	var order = this.keyOrder;
	for(var i = 0; i < order.length; ++i){
		if(order[i] === 'status'){
			if(i !== 0){
				var tmp = order[0];
				order[0] = order[i];
				order[i] = tmp;
			}
			break;
		}
	}
};

AMOSList.prototype.hide = function(key){
	this.showKey[key] = false;
	this.update();
};

AMOSList.prototype.show = function(key){
	this.showKey[key] = true;
	this.update();
};

AMOSList.prototype.colNames = {
	status: "Status",
	name: "Name",
	category: "Category",
	troublePeriod: "Trouble Period",
	sector: "Responsible Sector"
};

AMOSList.prototype.updateColumnAdd = function(){
	var list = $(this.tableId + 'ColumnAdd');
	var listhtml = '';
	var elements = 0;
	for(var i = 0; i < this.keyOrder.length; ++i){
		if(this.keyOrder[i] === 'id')continue;
		if(!this.showKey[this.keyOrder[i]]){
			listhtml += '<li><a onclick="javascript:elementList.show(\'';
			listhtml += this.keyOrder[i];
			listhtml += '\')">Show ';
			listhtml += this.keyOrder[i];
			listhtml += '</a></li>';
			elements++;
		}
	}
	if(elements === 0){
		listhtml = '<li><a>No additional columns to add</a></li>';
	}
	list.html(listhtml);
};

AMOSList.prototype.updateHead = function(){
	var thead = $(this.tableId + " thead tr");
	thead.html('');
	var order = this.keyOrder;
	for(var i = 0; i < order.length; ++i){
		if(this.showKey[order[i]]){
			var name = this.colNames[order[i]] ? this.colNames[order[i]] : order[i];
			var elem = '<div class="dropdown">'; 
			elem += '<a class="dropdown-toggle" data-toggle="dropdown" href="#">';
			elem += name;
			elem += '</a>';
			elem += '<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">';
			if(order[i] !== 'status'){
				elem += '<li><a onclick="javascript:elementList.sortBy(\'' + order[i] + '\')">Sort ASC</a></li>';
				elem += '<li><a onclick="javascript:elementList.sortBy(\'' + order[i] + '\', \'desc\')">Sort DESC</a></li>';
				elem += '<li class="divider" role="presentation"></li>';
				elem += '<li><a onclick="javascript:elementList.hide(\'' + order[i] + '\')">Hide Column</a></li>';
			} else {
				elem += '<li><a onclick="javascript:elementList.sortBy(\'' + order[i] + '\', [2, 1, 0, -1])">Sort</a></li>';
			}
			elem += '<li class="divider" role="presentation"></li>';
			elem += '<li><a href="#filterModal" data-toggle="modal" onclick="elementList.showFilterModal(\'' + order[i] + '\')">Filter</a></li>';
			elem += '</ul>';
			elem += '</div>';
			var th = $("<th></th>").html(elem);
			thead.append(th);
		}
	}
};

AMOSList.prototype.updateTable = function(){
	var tbody = $(this.tableId + " tbody");
	tbody.html('');
	for(var i = 0; i < this.data.length; ++i){
		var display = true;
		var elem = this.data[i];
		var row = $("<tr></tr>");
		row.attr("class", this.getRowClass(elem.status));					
		row.attr("onclick", 
				'GlobalHierarchyHandler.hierarchyZoom(\'' + this.zoomTo + '\', '+ elem.id +')');
		for(var col = 0; col < this.keyOrder.length; ++col){
			var key = this.keyOrder[col];
			display = display && this.filter[key][elem[key]];
			if(this.showKey[key]){
				var td = $("<td></td>");
				if(key === 'status'){
					td.html("<div class=\""+getStatusClass(elem[key])+"\"></div>");
				} else {
					td.html(elem[key]); 
				}
				row.append(td);
			}
		}
		if(display)tbody.append(row);
	}
};

AMOSList.prototype.getRowClass = function(status){
	switch(status) {
		case "green": 
			return rowClass = "success";
		case "yellow": 
			return rowClass = "warning";
		case "red":
			return rowClass = "error";
		case "grey":
		default: 
			return rowClass = "info";
			
	}
};

/*!
 * 
 * @param key
 * Key to order by.
 * @param order
 * 'desc' for descending order, otherwise ascending.
 * If the key is 'status', order is a list with the 
 * priorities of red, green and yellow for sorting.
 * For ordering status in this order use [2, 1, 0].
 */
AMOSList.prototype.sortBy = function(key, order){
	if(key === 'status'){
		this.data.sort(function(a, b){
			var assign = function(status){
				switch(status){
				case 'red': return 0;
				case 'yellow': return 1;
				case 'green': return 2;
				case 'grey':
				default: return 3;
				}
			};
			return order[assign(a.status)] < order[assign(b.status)]; 
		});
	} else {
		this.data.sort(function(a, b){
			return order === 'desc' ? a[key] < b[key] : a[key] > b[key];
		});
	}
	this.sort.push({key: key, order: order});
	this.updateTable();
};

