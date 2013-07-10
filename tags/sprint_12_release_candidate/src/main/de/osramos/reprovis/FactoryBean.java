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

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.MasterData.Company;
import de.osramos.reprovis.handler.Registry;

public class FactoryBean extends HierarchieElementBean {

	public FactoryBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {
		super(id, parent, registry);

		initName();
		initCountry();
		initGPSLatitude();
		initGPSLongitude();
		initCity();
		initCompany();
		initCarModels();
		initSizeOfStaff();
		initUPSServers();
		initUPSSystems();
		initUPSProvider();
		initSizeOfStaffDate();
		initVehiclesPerDay();
		initVehiclesPerYear();
		initMap();

		try {

			this.aggreagationStrategie = FactoryDAO
					.getAggreagationStrategie(id);

		} catch (IOException e) {

			throw new HierarchieException("Element does not exist");
		}
	}

	private void initName() {
		try {
			name = FactoryDAO.getName(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			name = "N/A";
		}
		
	}

	private void initCountry() {
		try {
			country = FactoryDAO.getCountry(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
			country = "N/A";
		}
		

	}

	private void initGPSLatitude() {
		try {
			gpsLatitude = FactoryDAO.getGpsLatitude(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			gpsLatitude = 0;
		}
		
	}

	private void initGPSLongitude() {
		try {
			gpsLongitude = FactoryDAO.getGpsLongitude(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			gpsLongitude = 0;
		}
		
	}

	private void initCity() {
		try {
			city = FactoryDAO.getCity(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			city = "N/A";
		}
		
	}

	private void initCompany() {
		try {
			company = FactoryDAO.getCompany(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			company = Company.Audi;
		}
		
	}


	private String name;
	private String country;
	private double gpsLatitude;
	private double gpsLongitude;
	private String city;
	private Company company;
	private String[] carModels;
	private int sizeOfStaff;
	private int vehiclesPerYear;
	private int upsServers;
	private int upsSystems;
	private String upsProvider;
	private Date sizeOfStaffDate;
	private int vehiclesPerDay;
	private int upsClients;
	private String map;

	public String getName() {
		return name;
	}

	public String getCountry() {
		return country;
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

	public int getSizeOfStaff() {
		return sizeOfStaff;
	}

	public void initSizeOfStaff() {
		try {
			sizeOfStaff = FactoryDAO.getSizeOfStaff(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sizeOfStaff = 0;
		}
		
	}

	public Date getSizeOfStaffDate() {
		return sizeOfStaffDate;
	}

	public void initSizeOfStaffDate() {
		try {
			sizeOfStaffDate = FactoryDAO.getSizeOfStaffDate(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sizeOfStaffDate = null;
		}
		
	}

	public int getVehiclesPerYear() {
		return vehiclesPerYear;
	}

	public void initVehiclesPerYear() {
		try {
			vehiclesPerYear = FactoryDAO.getVehiclesPerYear(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			vehiclesPerYear = 0;
		}
		
	}

	public int getVehiclesPerDay() {
		return vehiclesPerDay;
	}

	public void initVehiclesPerDay() {
		try {
			vehiclesPerDay = FactoryDAO.getVehiclesPerDay(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			vehiclesPerDay = 0;
		}
		
	}

	public String[] getCarModels() {
		return carModels;
	}

	public void initCarModels() {
		try {
			carModels = FactoryDAO.getCarModels(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			carModels = new String[] { "" };
		}
		
	}

	public int getUPSSystems() {
		return upsSystems;
	}

	public void initUPSSystems() {
		try {
			upsSystems = FactoryDAO.getUPSSystems(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			upsSystems = 0;
		}
		
	}

	public int getUPSServers() {
		return upsServers;
	}

	public void initUPSServers() {
		try {
			upsServers = FactoryDAO.getUPSServers(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			upsServers = 0;
		}
		
	}

	public String getUPSProvider() {
		return upsProvider;
	}

	public void initUPSProvider() {
		try {
			upsProvider = FactoryDAO.getUPSProvider(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			upsProvider = "";
		}
		
	}

	public void initUPSClients() {

		upsClients = getNumOfLeafs(TestingDeviceBean.class);
	}

	public int getUPSClients() {

		return getNumOfLeafs(TestingDeviceBean.class);
	}

	public String getMap() {
		return map;
	}

	public void initMap() {
		try {
			map = FactoryDAO.getMap(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
			map = "Error";
		}
		
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = HallDAO.getHallIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				HallBean childBean = new HallBean(id, this, registry);

				childs.add(childBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void initAttributes() {
		initUPSClients();
		
	}

}
