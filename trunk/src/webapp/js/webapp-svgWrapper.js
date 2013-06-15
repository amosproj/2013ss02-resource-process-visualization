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
			
			// Extract metadata and paths
			SVGView.metadata = SVGWrapper.extractMetadata(data);
			SVGView.paths = SVGWrapper.extractPaths(data);
			
			// Create Raphael object
			if(SVGView.metadata.viewBox)
				var dim = SVGView.metadata.viewBox.split(' ');
			
			else {
				// Fallback
				dim = new Array();
				dim[2] = '670'; dim[3] = '300';
			}
			
			var paper = Raphael("svgCanvas", SVGView.metadata.width, SVGView.metadata.height);
			paper.setViewBox(dim[0], dim[1], dim[2], dim[3], true);			
			
			// Draw the path elements with Raphael
			jQuery.each($(SVGView.paths), function(k, v) {
				var e = paper.path(v.d);
				e.attr({'id': v.id});
				
				if(v.style) {
					e.attr({fill: v.fill, 'fill-opacity': v.fillopacity, });
				}
			});
		},
		
		extractMetadata: function(data) {
			//var jq = $.parseHTML(data);
			var jq = data;
			
			if(!jq[5]) {
				var metadata = {};
				// Something went wrong, so we need to do regex..
				var a = data.match(/width="(.*?)"/im);
				metadata.width = a[1];

				var a = data.match(/height="(.*?)"/im);
				metadata.height = a[1];

				var a = data.match(/id="(.*?)"/im);
				metadata.id = a[1];
				
				var a = data.match(/viewBox="(.*?)"/im);
				metadata.viewBox = a[1];
			}
			
			else {			
				var metadata = {
					'width': $(jq[5]).attr('width'),
					'height': $(jq[5]).attr('height'),
					'id': $(jq[5]).attr('id'),
					'viewBox': $(jq[5]).attr('viewbox')
				};			
			}
			
			return metadata;
		},
		
		extractPaths: function(data) {
			//var jq = $.parseHTML(data);
			var jq = data;
			var paths = [];

			console.log($(data));
			
			jQuery.each($(data[5]).find("path"), function(k, v) {
				// Extract basic information
				paths[k] = {
					'd': $(v).attr('d'),
					'id': $(v).attr('id')
				};		
				/*
				// Extract styling information (if available)
				if($(v).attr('style')) {
					var a = $(v).attr('style').match(/fill:(.?#?)([A-Z0-9]*)/im);
					var b = $(v).attr('style').match(/fill-opacity:(.?#?)([A-Z0-9]*)/im);
					
					paths[k].fill = '#'+a[2];
					paths[k].fillopacity = b[2];
					paths[k].style = $(v).attr('style');					
				}*/
			});
			
			return paths;
		}
};