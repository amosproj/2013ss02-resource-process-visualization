﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html>
<html lang="eng" dir="ltr">
<!-- 
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
 -
 - *************** PLEASE NOTE ****************
 - ********************************************
 - ***									    ***
 - *** do NOT change the first line of this ***
 - *** document (DOCTYPE html), otherwise   ***
 - *** the Internet Explorer will turn into ***
 - *** quirks mode and cause problems.      ***
 - ***									    ***
 - *************** PLEASE NOTE ****************
 - ********************************************
 -->
<head>
	<meta charset="utf-8">
	<title>OSRAMOS: AUDI Resource Hierarchy Visualization</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- WORLDMAP Framework -->
	<!-- Include leaflet open-source javascript library for mobile friendly interactive maps -->
	<!-- PLEASE NOTE: Currently pulled from the server, maybe there is a need to hard-copy them to the system -->
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.css" />
	<!--[if lte IE 8]>
		<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.ie.css" />
	<![endif]-->
	<script src="http://cdn.leafletjs.com/leaflet-0.5/leaflet.js"></script>
	<script src="./js/jquery.min.js"></script>
	
	<!-- CSS Framework -->
	<link href="./css/bootstrap.css" rel="stylesheet">
	<link href="./css/bootstrap-responsive.css" rel="stylesheet">
	<link href="./css/webapp-custom.css" rel="stylesheet">
	<link href="./css/webapp-custom-audi.css" rel="stylesheet">

	<!-- SVG Framework Raphael -->
	<script src="./js/raphael-min_2-1-0.js"></script>
	<script src="./js/webapp-svgWrapper.js"></script>
	<script src="./js/browserdetect.js"></script>
	
	<!-- HTML5 shiv, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="./js/html5shiv.js"></script>
	<![endif]-->
	
	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="./ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="./ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="./ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="./ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="./img/favicon.ico">
	
	<!-- Custom webapp Javascript -->
	<script src="./js/webapp-worldmap.js"></script>
	<script src="./js/webapp-style.js"></script>	  
	<script src="./js/webapp-hierarchyHandler.js"></script>	
	<script src="./js/webapp-factory.js"></script>
	<script src="./js/webapp-hall.js"></script>
	<script src="./js/webapp-line.js"></script>
	<script src="./js/webapp-location.js"></script>
	<script src="./js/webapp-testingDevice.js"></script>
	<script src="./js/webapp-component.js"></script>
	<script src="./js/webapp-list.js"></script>	
</head>

<body>
    <header id="header">
    	<div class="container">
    		<h1>AUDI Resource Hierarchy Visualization</h1>
    		<img src="./img/audi_logo_new.gif" alt="&nbsp;" class="logo" data-component="nav_logo">
    		<div id="breadCrumbNavi">
    			<span><a>Global</a></span>
    		</div>
    	</div>
    </header>

	<div id="feature-announcement" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-header">
			Feature Announcement
		</div>
		<div class="modal-body">
			This feature will be available in the upcoming releases. Please stay tuned!
		</div>
		<div class="modal-footer">
			<button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">OK</button>
		</div>
	</div>

    <div class="container">	  
	  <div id="canvas">
	      <div id="map"></div>
		  <div id="dataLayer"></div>
		  <div id="filterModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Filter</h3>
			</div>
			<div class="modal-body" id="filterModalBody">
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div>
	  </div>
	  
	  <div class=caption>
	  	<font color="#006400">green</font> = OK,
 		<font color="#FF8C00">yellow</font> = warning,
  		<font color="#8B0000">red</font> = critical,
  		<font color="#BBBBBB">grey</font> = unknown
	  </div>
	  <div id="addBlocks" class="row-fluid">
		  <div class="span4">
		  	<h5>Information Block 1</h5>
		  	<p>
			  	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
			  	invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
			  	accusam et justo duo dolores.
		  	</p>
		  </div>
		  
		  <div class="span4">
		  	<h5>Information Block 2</h5>
		  	<p>
			  	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
			  	invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
			  	accusam et justo duo dolores.
		  	</p>
		  </div>
		  
		  <div class="span4">
		  	<h5>Information Block 3</h5>
		  	<p>
			  	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
			  	invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
			  	accusam et justo duo dolores.
		  	</p>
		  </div>
	  </div>
	  
	  <div class="audibar">&nbsp;</div>
	  
      <footer>
        <p>&copy; AMOS Project Team 02 // 2013. Alle Rechte vorbehalten.</p>
      </footer>

    </div> <!-- /container -->
 
    <!-- Remaining JavaScript, placed at bottom for faster page load -->
    <script src="./js/bootstrap-transition.js"></script>
    <script src="./js/bootstrap-alert.js"></script>
    <script src="./js/bootstrap-modal.js"></script>
    <script src="./js/bootstrap-dropdown.js"></script>
    <script src="./js/bootstrap-scrollspy.js"></script>
    <script src="./js/bootstrap-tab.js"></script>
    <script src="./js/bootstrap-tooltip.js"></script>
    <script src="./js/bootstrap-popover.js"></script>
    <script src="./js/bootstrap-button.js"></script>
    <script src="./js/bootstrap-collapse.js"></script>
    <script src="./js/bootstrap-carousel.js"></script>
    <script src="./js/bootstrap-typeahead.js"></script>
  </body>
</html>