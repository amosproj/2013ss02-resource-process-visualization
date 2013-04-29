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

import java.util.ArrayList;
import java.util.List;

import de.osramos.reprovis.MasterData.Company;
import de.osramos.reprovis.MasterData.TrafficLight;


public class FactoryBean {

	private int id;
	private String name;	
	private String country; 
/*	private String gpsLocation;*/
/*	private String city;*/
	private Company company;
	private GlobalBean parent;
	private String[] models;
	private int sizeOfStaff;
	private int numOfVehicles;

	public String getName(){
		return name;
	}
	
	public String getCountry(){
		return country;
	}
	
	public int getSizeOfStaff(){
		return sizeOfStaff;
	}
	
	public int getNumOfVehicles(){
		return numOfVehicles;
	}
	
	public String[] getModels(){
		return models;
	}
	
/*	public String getCity(){
		return city;
	}*/
	
/*	public String getGpsLocation(){
		return gpsLocation;
	}*/
	
	public Company getCompany(){
		return company;
	}
	
	public GlobalBean getGlobal(){
		return parent;
	}
	
	public int getId() {
		return id;
	}
	
	
	public FactoryBean(int id){

		this.id = id;
		name = FactoryDAO.getName(id);
		country = FactoryDAO.getCountry(id);
/*		city = FactoryDAO.getCity(id);*/
/*		gpsLocation = FactoryDAO.getGpsLocation(id);*/
		company = FactoryDAO.getCompany(id);
		
	}



	public TrafficLight getStatus(){
		List<HallBean> halls = getHalls();
		
		TrafficLight status = TrafficLight.green;
		
		for(HallBean hall: halls){
			// aggregate to worst status
			if ( status == TrafficLight.green){
				status = hall.getStatus();
			} else if (status == TrafficLight.yellow){
				if (hall.getStatus() == TrafficLight.red){
					status = TrafficLight.red;
				}
			}
		}
		return status;
	}


	
	public List<HallBean> getHalls(){
		
		List<Integer> hallIds = HallDAO.getHalls(id);
		List<HallBean> halls = new ArrayList<HallBean>();
		
		for(int id : hallIds){
			halls.add(new HallBean(id, this));
		}
		return halls;
	}

}