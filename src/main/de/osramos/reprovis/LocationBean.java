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

public class LocationBean extends HierarchieElementBean {

	private String name;
	private String description;
	private String personInCharge;
	
	public LocationBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {
		super(id, parent, registry);
		
		initName();
		initDescription();
		initPersonInCharge();
		
		try {
			this.aggreagationStrategie = LocationDAO.getAggreagationStrategie(id);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void initName(){
		try {
			name = LocationDAO.getName(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			name = "N/A";
		}
	}
	
	public void initDescription() {
		try {
			description = LocationDAO.getDescription(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			description = "N/A";
		}
	}
	
	public void initPersonInCharge() {
		try{
			personInCharge = LocationDAO.getPersonInCharge(id);
		} catch (DatabaseException e){
			e.printStackTrace();
			personInCharge = "N/A";
		}
		
	}

	
	
	public String getName(){
		return name ;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getPersonInCharge() {
		return personInCharge;
	}

	
	
	
	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = TestingDeviceDAO.getTestingDeviceIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				TestingDeviceBean childBean = new TestingDeviceBean(id, this, registry);
				childs.add(childBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	protected void initAttributes() {
		// TODO Auto-generated method stub
		
	}

	



}
