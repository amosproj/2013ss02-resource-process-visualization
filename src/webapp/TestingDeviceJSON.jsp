<%-- Copyright (c) 2013 by Martin Gumbrecht, Christian Muehlroth, 
 						Jan-Philipp Stauffert, Kathrin Koenig, Yao Guo 
 
 This file is part of the Resource Process Visualization application.
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful, 
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.
 
 You should have received a copy of the GNU Affero General Public
 License along with this program. If not, see
 http://www.gnu.org/licenses/ --%>

<%@ page language="java" contentType="application/json; charset=UTF-8" %>
<%@ page import="de.osramos.reprovis.HierarchieElementBean"%>
<%@ page import="de.osramos.reprovis.LocationBean"%>
<%@ page import="de.osramos.reprovis.LineBean" %>
<%@ page import="de.osramos.reprovis.TestingDeviceBean" %>
<%@ page import="de.osramos.reprovis.MasterData" %>
<%@ page import="java.util.List" %>
{
	"name": "Testing Device 4711-Test",
	"status": "red",
	"componentCount": "167",
	"components": [
	    {
	    	"id": "4711001",
	    	"status": "green",
	    	"category": "EC1",
	    	"troublePeriod": "-",
	    	"sector": "Sector 1"
	    },
	    {
	    	"id": "4711002",
	    	"status": "green",
	    	"category": "EC1",
	    	"troublePeriod": "-",
	    	"sector": "Sector 1"
	    },
	    {
	    	"id": "4711003",
	    	"status": "green",
	    	"category": "EC2",
	    	"troublePeriod": "-",
	    	"sector": "Sector 2"
	    },
	    {
	    	"id": "4711004",
	    	"status": "red",
	    	"category": "EC3",
	    	"troublePeriod": "00:27:18",
	    	"sector": "Sector 3"
	    }
	]
}