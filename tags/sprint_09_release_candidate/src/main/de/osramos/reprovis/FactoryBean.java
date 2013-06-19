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

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import de.osramos.reprovis.MasterData.Company;
import de.osramos.reprovis.exception.DatabaseException;

public class FactoryBean extends HierarchieElementBean {

	public FactoryBean(int id) {
		super(id);

		
		try {
			name = FactoryDAO.getName(id);
			country = FactoryDAO.getCountry(id);
			city = FactoryDAO.getCity(id);
			gpsLatitude = FactoryDAO.getGpsLatitude(id);
			gpsLongitude = FactoryDAO.getGpsLongitude(id);
			company = FactoryDAO.getCompany(id);
			carModels = FactoryDAO.getCarModels(id);
			sizeOfStaff = FactoryDAO.getSizeOfStaff(id);
			numOfVehicles = FactoryDAO.getVehiclesPerYear(id);
			sizeOfStaffDate = FactoryDAO.getSizeOfStaffDate(id);
			upsSystems = FactoryDAO.getUPSSystems(id);
			upsProvider = FactoryDAO.getUPSProvider(id);
			this.aggreagationStrategie = FactoryDAO.getAggreagationStrategie(id);
		} catch (DatabaseException e) {

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*
	 * public static FactoryBean getElementById(int id){ try { Context ctx = new
	 * InitialContext(); return (FactoryBean)
	 * ctx.lookup("de.osramos/reprovis/HierarchieElement/"+id); } catch
	 * (NamingException e) { return null; }
	 * 
	 * return (FactoryBean) GlobalBean.getElementById(id); }
	 */

	// private int id;
	private String name;
	private String country;
	private double gpsLatitude;
	private double gpsLongitude;
	private String city;
	private Company company;
	private String[] carModels;
	private int sizeOfStaff;
	private int numOfVehicles;
	private int upsServers;
	private int upsSystems;
	private String upsProvider;
	private Date sizeOfStaffDate;

	public String getName() {
		return name;
	}

	public String getCountry() {
		return country;
	}

	public int getSizeOfStaff() {
		try {
			sizeOfStaff = FactoryDAO.getSizeOfStaff(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sizeOfStaff;
	}
	
	public Date getSizeOfStaffDate() {
		try {
			sizeOfStaffDate = FactoryDAO.getSizeOfStaffDate(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sizeOfStaffDate;
	}

	public int getVehiclesPerYear() {
		try {
			numOfVehicles = FactoryDAO.getVehiclesPerYear(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return numOfVehicles;
	}
	
	public int getVehiclesPerDay(){
		try {
			return FactoryDAO.getVehiclesPerDay(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public String[] getCarModels() {
		try {
			carModels = FactoryDAO.getCarModels(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return carModels;
	}

	public String getCity() {
		return city;
	}

	public double getGpsLatitude() {
		return gpsLatitude;
	}

	public double getGpsLongitude() {
		return gpsLongitude;
	}

	public Company getCompany() {
		return company;
	}
	
	public int getUPSSystems() {
		try {
			upsSystems = FactoryDAO.getUPSSystems(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return upsSystems;
	}

	public int getUPSServers() {
		try {
			upsServers = FactoryDAO.getUPSServers(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return upsServers;
	}
	
	public String getUPSProvider() {
		try {
			upsProvider = FactoryDAO.getUPSProvider(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return upsProvider;
	}

	public int getUPSClients() {
		
		return getNumOfLeafs();
	}
	
	public String getMap() {
		try {
			return FactoryDAO.getMap(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
		}
		return "Error";
	}
	
	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = HallDAO.getHallIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				HallBean childBean = new HallBean(id);

				childBean.setParent(this);

				childs.add(childBean);
			}
		} catch (Exception e) {
		}

	}

}
