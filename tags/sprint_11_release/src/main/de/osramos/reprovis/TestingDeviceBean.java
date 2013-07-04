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

public class TestingDeviceBean extends HierarchieElementBean {

	public TestingDeviceBean(int id) throws HierarchieException {

		super(id);
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

			ConfigHandler.reload();
			return id;
		} catch (Exception e) {
			return -1;
		}
	}
	
	public void delete() {

		try {
			TestingDeviceDAO.deleteDevice(id);

			
			getParent().initChilds();
			ConfigHandler.reload();
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (HierarchieException e) {
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
						id);

				childBean.setParent(this);

				childs.add(childBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String getSector() {
		try {
			return TestingDeviceDAO.getSector(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getType() {
		try {
			return TestingDeviceDAO.getType(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getSerialnumber() {
		try {
			return TestingDeviceDAO.getSerialnumber(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getDescription() {
		try {
			return TestingDeviceDAO.getDescription(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getIpAddress() {
		try {
			return TestingDeviceDAO.getIpAddress(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getName() {
		try {
			return TestingDeviceDAO.getName(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getNetworkStatus() {
		try {
			return TestingDeviceDAO.getNetworkStatus(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public String getMaintainanceInfo() {
		try {
			return TestingDeviceDAO.getMaintainanceInfo(id);
		} catch (DatabaseException e) {
			return "N/A";
		}
	}

	public boolean isTestFailure() {
		try {
			return TestingDeviceDAO.getTestFailure(id);
		} catch (DatabaseException e) {
		}
		return false;
	}

	public Date getTroublePeriod() {
		try {
			return TestingDeviceDAO.getTroublePeriod(id);
		} catch (DatabaseException e) {
		}
		return null;
	}

}
