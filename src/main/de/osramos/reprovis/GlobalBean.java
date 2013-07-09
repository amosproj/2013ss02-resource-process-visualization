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
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.DatabaseHandler;
import de.osramos.reprovis.handler.Registry;

public class GlobalBean extends HierarchieElementBean {

	private static Object lock = new Object();

	private static GlobalBean instance = null;

	public Registry getRegistry() {
		return registry;
	}

	private GlobalBean(int id, Registry registry) throws HierarchieException {
		super(id, null, registry);

	}

	public static GlobalBean createInstance() {
		GlobalBean global = null;
		try {
			Registry r = new Registry();
			global = new GlobalBean(0, r);
			//global.initAggregatedAttributes();
			return global;
		} catch (HierarchieException e) {
			e.printStackTrace();
		}
		return global;
	}

	@Override
	public HierarchieElementBean getParent() throws HierarchieException {
		throw new HierarchieException("Element is root");
	}

	public static void resetGlobal() {
		instance = null;
		getInstance();
	}

	public static void setInstance(GlobalBean global) {
		synchronized (lock) {
			instance = global;
		}
	}

	public static GlobalBean getInstance() {

		synchronized (lock) {

			if (instance == null) {
				instance = createInstance();
			}

			return instance;
		}
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = FactoryDAO.getFactoryIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				try {
					FactoryBean childBean = new FactoryBean(id, this, registry);
					childs.add(childBean);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
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
