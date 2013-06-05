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

import de.osramos.reprovis.exception.DatabaseException;

public class LocationBean extends HierarchieElementBean {

	private String name;
	
	public LocationBean(int id) {
		super(id);
		try {
			name = LocationDAO.getName(id);
		}catch(DatabaseException e){
			
		}
	}
	
	public String getName(){
		return name;
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = TestingDeviceDAO.getTestingDeviceIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				TestingDeviceBean childBean = new TestingDeviceBean(id);
				childBean.setParent(this);
				childs.add(childBean);
			}
		} catch (Exception e) {
		}
	}

}
