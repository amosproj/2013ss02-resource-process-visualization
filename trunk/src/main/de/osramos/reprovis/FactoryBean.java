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

import javax.naming.InitialContext;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import de.osramos.reprovis.MasterData.Company;
import de.osramos.reprovis.MasterData.TrafficLight;


public class FactoryBean {
	
	public static FactoryBean getFactoryById(int id){
/*		try {
			Context ctx = new InitialContext();
			return (FactoryBean) ctx.lookup("de.osramos/reprovis/HierarchieElement/"+id);
		} catch (NamingException e) {
			return null;
		}*/
		
		return (FactoryBean) GlobalBean.getElementById(id);
	}

	private int id;
	private String name;	
	private String country; 
	private double gpsLatitude;
	private double gpsLongitude;
/*	private String city;*/
	private Company company;
	private GlobalBean parent;
	private String[] carModels;
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
	
	public String[] getCarModels(){
		return carModels;
	}
	
/*	public String getCity(){
		return city;
	}*/
	
	public double getGpsLatitude(){
		return gpsLatitude;
	}
	
	public double getGpsLongitude(){
		return gpsLongitude;
	}
	
	public Company getCompany(){
		return company;
	}
	
	public GlobalBean getGlobal(){
		return  GlobalBean.getGlobal();
	}
	
	public int getId() {
		return id;
	}
	
	
	public FactoryBean(int id){

		GlobalBean.getGlobal().reg.put(id, this);
/*		try {
			Context ctx = new InitialContext();
			ctx.bind("de.osramos/reprovis/HierarchieElement/"+id, this);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		this.id = id;
		name = FactoryDAO.getName(id);
		country = FactoryDAO.getCountry(id);
/*		city = FactoryDAO.getCity(id);*/
		gpsLatitude = FactoryDAO.getGpsLatitude(id);
		gpsLongitude = FactoryDAO.getGpsLongitude(id);
		company = FactoryDAO.getCompany(id);
		carModels = FactoryDAO.getCarModels(id);
		sizeOfStaff = FactoryDAO.getSizeOfStaff(id);
		numOfVehicles = FactoryDAO.getNumOfVehicles(id);
	}



	public TrafficLight getStatus() throws Exception{
		List<HallBean> halls = getHalls();
		
		TrafficLight status = TrafficLight.green;
		
		for(HallBean hall: halls){
			// aggregate to worst status
			if ( status == TrafficLight.green){
				try {
					status = hall.getStatus();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (status == TrafficLight.yellow){
				try {
					if (hall.getStatus() == TrafficLight.red){
						status = TrafficLight.red;
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return status;
	}


	
	public List<HallBean> getHalls() throws Exception{
		
		List<Integer> hallIds = HallDAO.getHallIds(id);
		List<HallBean> halls = new ArrayList<HallBean>();
		
		for(int hallId : hallIds){
			halls.add(new HallBean(hallId));
		}
		return halls;
	}

}
