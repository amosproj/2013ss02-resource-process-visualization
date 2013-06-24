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

import de.osramos.reprovis.MasterData.TrafficLight;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;

public abstract class HierarchieElementBean {

	protected int id;
	protected List<HierarchieElementBean> childs;
	protected HierarchieElementBean parent;

	protected List<HierarchieElementBean> cache;
	protected Class cacheLevel;

	protected AggreagationStrategie aggreagationStrategie;

	public HierarchieElementBean(int id) {

		this.id = id;

		Registry.getRegistry().register(id, this);

		childs = new ArrayList<HierarchieElementBean>();
		initChilds();

	}

	public int getId() {
		return id;
	}

	protected void setParent(HierarchieElementBean parent) throws Exception {

		this.parent = parent;
	}
	
	public HierarchieElementBean getParent() throws HierarchieException {
		return parent;
	}

	public List<HierarchieElementBean> getChilds() {
		return childs != null ? childs : new ArrayList<HierarchieElementBean>();
	}

	public TrafficLight getStatus() throws HierarchieException {

		try {
			return aggreagationStrategie.aggregate(this);
		} catch (HierarchieException e) {

		}

		try {
			return getDistinctStatus();
		} catch (HierarchieException e) {
		}
		throw new HierarchieException("Element has no status");

	}

	protected List<HierarchieElementBean> getChildsByClass(Class c) {

		if (cacheLevel != null && cacheLevel.equals(c) && cache != null) {
			return cache;
		} else {
			

			List<HierarchieElementBean> l = getChilds();
			if (l == null || l.isEmpty()) {
				return null;
			}

			cacheLevel = c;
			if (l.get(0).getClass().equals(c)) {
				cache = l;
			} else {
				List<HierarchieElementBean> ls = new ArrayList<HierarchieElementBean>();
				for (HierarchieElementBean h : l) {
					ls.addAll(h.getChildsByClass(c));
				}
				cache = ls;
			}
			
			return cache;
		}

	}

	protected TrafficLight getDistinctStatus() throws HierarchieException {
		throw new HierarchieException("Element has no distinct status");
	}

	protected abstract void initChilds();

	public int getNumOfLeafs() {

		if (this.getClass() == TestingDeviceBean.class) {
			return 1;
		} else {
			int num = 0;
			if (getChilds() != null) {
				for (HierarchieElementBean child : getChilds()) {
					num += child.getNumOfLeafs();
				}
			}
			return num;
		}
	}
}
