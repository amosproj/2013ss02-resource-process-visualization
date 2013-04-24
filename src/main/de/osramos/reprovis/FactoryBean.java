/*
 * Copyright (c) 2013 by Martin Gumbrecht, Christian Muehlroth, 
 *						Jan-Philipp Stauffert, Kathrin Koenig, Yao Guo 
 *
 * This file is part of the Resource Process Visualization application.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this program. If not, see
 * <http://www.gnu.org/licenses/>.
 */



package de.osramos.reprovis;

import java.util.List;

public class FactoryBean {

	private String name;	
	private String country; //later: private Country country;
	private String gpsLocation;
	private String city;
	private List<String> productionHalls; //later: private List<Hall> productionHalls;

	public String getName(){
		return name;
	}
	
	public String getCountry(){
		return country;
	}
	
	public String getCity(){
		return city;
	}
	
	public String getGpsLocation(){
		return gpsLocation;
	}
	
	public List<String> getProductionHalls(){
		return productionHalls;
	}
	
	public FactoryBean(String id){
		FactoryDAO f = new FactoryDAO(id);
		name = f.getName();
		country = f.getCountry();
		city = f.getCity();
		gpsLocation = f.getGpsLocation();
		productionHalls = f.getProductionHalls();
		
	}
	

}
