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

SVGWrapper = {
		// Fills the canvas with respect to SVG or VML conversion (IE 8)
		drawCanvas: function(data) {
			var SVGView = { };
			var dataIndex = -1;
			pdata = $.parseHTML(data);
			if(!pdata) pdata = $(data);
			
			$.each(pdata, function(k, v) {
				if($(pdata).find("svg"))
					dataIndex = k;
			});
			
			if(dataIndex == -1) {
				$("#svgCanvas").html("Error: The SVG output is not valid.");
				return;
			}
			
			var jqData = pdata[dataIndex];
			
			// Extract metadata and paths			
			SVGView.metadata = SVGWrapper.extractMetadata(data);
			SVGView.paths = SVGWrapper.extractPaths(jqData);
			
			// Create Raphael object
			if(SVGView.metadata.viewBox)
				var dim = SVGView.metadata.viewBox.split(' ');
			
			else {
				// Fallback
				var dim = new Array();
				dim[0] = 0; dim[1] = 0;
				dim[2] = 670; dim[3] = 300;
			}			

			// Fix dimensions for now
			dim[0] = 0; dim[1] = 0;
			dim[2] = 670; dim[3] = 300;
			
			// Create paper for Raphael canvas
			var paper = Raphael("svgCanvas", 
					parseInt(dim[2]),
					parseInt(dim[3]));
			
			paper.setViewBox(parseInt(dim[0]), parseInt(dim[1]),
					parseInt(dim[2]), parseInt(dim[3]), true);
			
			var raphaelElements = new Array();			
			var objectList = SVGView.paths;
			
			for(var objID in objectList) {
				var el = paper.path(objectList[objID].d)
						.attr({'id': objectList[objID].id});
				        //.click( clickHandler );
				
				if(objectList[objID].style)
					el.attr({fill: objectList[objID].fill, 'fill-opacity': objectList[objID].fillopacity})
				
				el.hover(function() {
				          this.animate({ opacity: 0.5 }, 300);
				      }, function() {
				          this.animate({ opacity: 1.0 }, 300);
				      });  
			
				raphaelElements.push(el);
			}
			
			return raphaelElements;
		},
		
		extractMetadata: function(data) {
			//var jq = $.parseHTML(data);
			var jq = data;
			
			if(jq) {
				var metadata = {};
				// Something went wrong, so we need to do regex..
				var a = data.match(/width="(.*?)"/im);
				if (a instanceof Array)
					metadata.width = a[1];

				var a = data.match(/height="(.*?)"/im);
				if (a instanceof Array)
					metadata.height = a[1];

				var a = data.match(/id="(.*?)"/im);
				if (a instanceof Array)
					metadata.id = a[1];
				
				var a = data.match(/viewBox="(.*?)"/im);
				if (a instanceof Array)
					metadata.viewBox = a[1];
			}
			
			else {			
				var metadata = {
					'width': $(jq).attr('width'),
					'height': $(jq).attr('height'),
					'id': $(jq).attr('id'),
					'viewBox': $(jq).attr('viewbox')
				};			
			}
			
			return metadata;
		},
		
		extractPaths: function(data) {
			//var jq = $.parseHTML(data);
			var jq = data;
			var paths = [];

			jQuery.each($(data).find("path"), function(k, v) {
				// Extract basic information
				paths[k] = {
					'd': $(v).attr('d'),
					'id': $(v).attr('id')
				};		
				
				// Extract styling information (if available)
				var style = $(v).attr('style');
				if(style) {
					var a = style.match(/fill:(.?#?)([A-Z0-9]*)/im);
					var b = style.match(/fill-opacity:(.?#?)([A-Z0-9]*)/im);
					
					if (a instanceof Array)
						paths[k].fill = '#'+a[2];
					
					else paths[k].fill = '#cccccc';
					
					if (b instanceof Array)
						paths[k].fillopacity = b[2];
					
					else paths[k].fillopacity = '1';
					
					if (a instanceof Array)
						paths[k].style = style;		
					
					else paths[k].style = '';
				}
			});
			
			return paths;
		}
};