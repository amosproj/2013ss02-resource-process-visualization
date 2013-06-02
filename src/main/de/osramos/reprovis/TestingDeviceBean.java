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
import java.util.Date;
import java.util.List;

import de.osramos.reprovis.exception.DatabaseException;

public class TestingDeviceBean extends HierarchieElementBean {

	private String serialnumber;
	private String category;
	private String sector;
	
	private Date troublePeriod;
	private boolean testFailure;
	


	public TestingDeviceBean(int id) {
		super(id);
		try {

			serialnumber = TestingDeviceDAO.getSerialnumber(id);
			category = TestingDeviceDAO.getCategory(id);
			sector = TestingDeviceDAO.getSector(id);
		} catch (DatabaseException e) {
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
		return sector;
	}

	public String getCategory() {
		return category;
	}

	public String getSerialnumber() {
		return serialnumber;
	}


	
	public boolean isTestFailure() {
		try {
			return TestingDeviceDAO.getTestFailure(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
		}
		return false;
	}


	public Date getTroublePeriod() {
		try {
			return TestingDeviceDAO.getTroublePeriod(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
		}
		return null;
	}







}
