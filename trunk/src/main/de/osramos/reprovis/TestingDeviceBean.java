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

public class TestingDeviceBean extends HierarchieElementBean {

	private String serialnumber;
	private String componentCategory;
	private Date troublePeriod;
	private boolean testFailure;
	private String sector;

	public TestingDeviceBean(int id) {
		super(id);

		this.setSerialnumber(TestingDeviceDAO.getSerialnumber(id));
		this.setComponentCategory(TestingDeviceDAO.getComponentCategory(id));
		this.setTroublePeriod(TestingDeviceDAO.getTroublePeriod(id));
		this.setTestFailure(TestingDeviceDAO.getTestFailure(id));
		this.setSector(TestingDeviceDAO.getSector(id));
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

	private void setSector(String sector) {
		this.sector = sector;
	}

	public boolean isTestFailure() {
		return testFailure;
	}

	private void setTestFailure(boolean testFailure) {
		this.testFailure = testFailure;
	}

	public Date getTroublePeriod() {
		return troublePeriod;
	}

	private void setTroublePeriod(Date troublePeriod) {
		this.troublePeriod = troublePeriod;
	}

	public String getComponentCategory() {
		return componentCategory;
	}

	private void setComponentCategory(String componentCategory) {
		this.componentCategory = componentCategory;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	private void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

}
