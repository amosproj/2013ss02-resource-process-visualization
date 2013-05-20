<!DOCTYPE html>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>OSRAMOS: AUDI Resource Hierarchy Visualization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS Framework -->
    <link href="./css/bootstrap.css" rel="stylesheet">
    <link href="./css/bootstrap-responsive.css" rel="stylesheet">
    <link href="./css/webapp-custom.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="./js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="./ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="./ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="./ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="./ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="./img/favicon.ico">
	
	<!-- WORLDMAP Framework -->
	<!-- Include leaflet open-source javascript library for mobile friendly interactive maps -->
	<!-- PLEASE NOTE: Currently pulled from the server, maybe there is a need to hard-copy them to the system -->
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.css" />
	<!--[if lte IE 8]>
		<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.ie.css" />
	<![endif]-->
	<script src="http://cdn.leafletjs.com/leaflet-0.5/leaflet.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<!-- Custom webapp Javascript -->
	<script src="./js/webapp-hierarchyHandler.js"></script>	
	<script src="./js/webapp-factory.js"></script>
	<script src="./js/webapp-hall.js"></script>
	<script src="./js/webapp-line.js"></script>
	<script src="./js/webapp-location.js"></script>
	<script src="./js/webapp-testingDevice.js"></script>
	<script src="./js/webapp-component.js"></script>	
  </head>

<body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">OSRAMOS AUDI RHV</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="./">Home</a></li>
              <li><a href="javascript:notAvailable()">About</a></li>
              <li><a href="javascript:notAvailable()">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="javascript:notAvailable()">Action</a></li>
                  <li><a href="javascript:notAvailable()">Another action</a></li>
                  <li><a href="javascript:notAvailable()">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="javascript:notAvailable()">Separated link</a></li>
                  <li><a href="javascript:notAvailable()">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <!-- <form class="navbar-form pull-right" onSubmit="notAvailable()">
              <input class="span2" type="text" placeholder="Email">
              <input class="span2" type="password" placeholder="Password">
              <button type="submit" class="btn">Sign in</button>
            </form> -->
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

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
	<h2>OSRAMOS AUDI Resource Hierarchy Visualization</h2>	  
	  <div id="canvas">
	      <div id="map"></div>
		  <div id="dataLayer"></div>
	  </div>
	  
	  <script src="./js/webapp-worldmap.js"></script>
	  <script src="./js/webapp-style.js"></script>	  
	  
      <hr>
      <footer>
        <p>&copy; AMOS Project Team 02 // 2013</p>
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