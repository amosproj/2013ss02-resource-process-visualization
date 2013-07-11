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
import java.util.List;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;

public class HallBean extends HierarchieElementBean {

	

	public HallBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {
		super(id, parent, registry);
		
		initMap();
		initName();
		initPath();
		initProductionCapacity();
		initSizeOfStaff();
		initType();
		initUpsServer();
		initVehicles();

		try {
			this.aggreagationStrategie = HallDAO.getAggreagationStrategie(id);
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private String map;
	private String name;
	private String path;
	private int productionCapacity;
	private int sizeOfStaff;
	private String type;
	private int upsClients;
	private int upsServers;
	private String vehicles;
	
	public void initName() {
		try {
			name = HallDAO.getName(id);
		} catch (DatabaseException e) {
			name = "Error";
		}
	}

	public void initPath() {
		try {
			path = HallDAO.getPath(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
			path = "Error";
		}
		
	}

	public void initVehicles() {
		try {
			vehicles = HallDAO.getVehicles(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			vehicles = "Error";
		}
		
	}
	
	public void initSizeOfStaff() {
		try {
			sizeOfStaff = HallDAO.getSizeOfStaff(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sizeOfStaff = 0;
		}
		
	}

	public void initProductionCapacity() {
		try {
			productionCapacity = HallDAO.getProductionCapacity(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productionCapacity = 0;
		}
		 
	}

	public void initUpsServer() {
		try {
			upsServers = HallDAO.getUpsServers(id);
		} catch (DatabaseException e) {
			upsServers = -1;
		}
	}

	public void initType() {
		try {
			type = HallDAO.getType(id);
		} catch (DatabaseException e) {
			type = "Error";
		}
	}

	public void initUPSClients() {
		//TODO
	}
	
	public void initMap() {
		try {
			map = HallDAO.getMap(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
			map = "Error";
		}
		
	}
	
	
	public String getName() {
		return name;
	}

	public String getPath() {
		return path;
	}

	public String getVehicles() {
		return vehicles;
	}
	
	public int getSizeOfStaff() {

		return sizeOfStaff;
	}

	public int getProductionCapacity() {
	
		return productionCapacity;
	}

	public int getUpsServer() {
		return upsServers;
	}

	public String getType() {
		return type;
	}

	public int getUPSClients() {
		return getNumOfLeafs(TestingDeviceBean.class);
	}
	
	public String getMap() {
		return map;
	}
	
	

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = LineDAO.getLineIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				LineBean childBean = new LineBean(id, this, registry);

				childs.add(childBean);
			}
		} catch (Exception e) {
		}

	}

	@Override
	protected void initAttributes() {
		// TODO Auto-generated method stub
		
	}


}
