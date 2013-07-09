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
import de.osramos.reprovis.handler.ConfigHandler;
import de.osramos.reprovis.handler.Registry;

public class TestingDeviceBean extends HierarchieElementBean {

	public TestingDeviceBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {

		super(id, parent, registry);
		
		initDescription();
		initName();
		initSerialnumber();
		initTroublePeriod();
		initType();
		
		try {
			this.aggreagationStrategie = TestingDeviceDAO
					.getAggreagationStrategie(id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static int createTestingDevice(int locationId) {

		try {
			int id = TestingDeviceDAO.createDevice(locationId);

			return id;
		} catch (Exception e) {
			return -1;
		}
	}
	
	public void delete() {

		try {
			TestingDeviceDAO.deleteDevice(id);

		
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = ElectricalComponentDAO
					.getElectricalComponentIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				ElectricalComponentBean childBean = new ElectricalComponentBean(
						id, this, registry);


				childs.add(childBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String type;
	private String serialnumber;
	private Date troublePeriod;
	private String description;
	private String name;
	
	
	public void initType() {
		try {
			type = TestingDeviceDAO.getType(id);
		} catch (DatabaseException e) {
			type = "N/A";
		}
	}

	public void initSerialnumber() {
		try {
			serialnumber = TestingDeviceDAO.getSerialnumber(id);
		} catch (DatabaseException e) {
			serialnumber = "N/A";
		}
	}

	public void initDescription() {
		try {
			description = TestingDeviceDAO.getDescription(id);
		} catch (DatabaseException e) {
			description = "N/A";
		}
	}


	public void initName() {
		try {
			name = TestingDeviceDAO.getName(id);
		} catch (DatabaseException e) {
			name = "N/A";
		}
	}

	public void initTroublePeriod() {
		try {
			troublePeriod = TestingDeviceDAO.getTroublePeriod(id);
		} catch (DatabaseException e) {
			troublePeriod = null;
		}
		
	}
	
	
	public String getType() {
		return type;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	public String getDescription() {
		return description;
	}


	public String getName() {
		return name;
	}

	public Date getTroublePeriod() {
		return troublePeriod;
	}

	@Override
	protected void initAttributes() {
		// TODO Auto-generated method stub
		
	}

}
