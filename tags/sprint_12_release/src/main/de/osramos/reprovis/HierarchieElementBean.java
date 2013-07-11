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

import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;
import de.osramos.reprovis.handler.MasterData.TrafficLight;
import de.osramos.reprovis.statusaggregation.AggreagationStrategie;

public abstract class HierarchieElementBean {

	protected int id;
	protected List<HierarchieElementBean> childs;
	protected HierarchieElementBean parent;

	protected List<HierarchieElementBean> cache;
	protected Class cacheLevel;

	protected AggreagationStrategie aggreagationStrategie;
	
	protected Registry registry;
	
	protected TrafficLight status;

	public HierarchieElementBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {

		this.id = id;
		this.parent = parent;
		this.registry = registry;
		
		try {
			registry.register(id, this);

		} catch (Exception e) {
			e.printStackTrace();
			throw new HierarchieException("could not register Element");
		}

		childs = new ArrayList<HierarchieElementBean>();
		initChilds();

	}


	protected abstract void initChilds();

	
	protected void initAggregatedAttributes(){
		
		initAttributes();
		initStatus();
		
		for (HierarchieElementBean c : childs){
			initAggregatedAttributes();
		}
		
	}
	protected abstract void initAttributes();


	// Simple getters

	public int getId() {
		return id;
	}

	public HierarchieElementBean getParent() throws HierarchieException {
		return parent;
	}

	public List<HierarchieElementBean> getChilds() {
		return childs;
	}

	// Get Hierarchy Information

	public TrafficLight getStatus() throws HierarchieException {
		
		if ( status == null){
			try {
				status = aggreagationStrategie.aggregate(this);
				return status;
			} catch (HierarchieException e) {

			} catch (NullPointerException e) {

			}

			try {
				status =  getDistinctStatus();
				return status;
			} catch (HierarchieException e) {
			}
			status = TrafficLight.grey;
			return status;

		} else {
			return status;
		}

		
	}
	
	public void initStatus(){
		
		try {
			getStatus();
		} catch (HierarchieException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public List<HierarchieElementBean> getChildsByClass(Class c) {

		if (cacheLevel != null && cacheLevel.equals(c) && cache != null) {
			return cache;
		} else {

			List<HierarchieElementBean> l = getChilds();
			if (l == null || l.isEmpty()) {
				return new ArrayList<HierarchieElementBean>();
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

	public int getNumOfLeafs(Class LeafClass) {

		List<HierarchieElementBean> l = getChilds();
		if (l == null || l.isEmpty()) {
			return 0;
		} else if (getChilds().get(0).getClass() == LeafClass) {
			return l.size();
		} else {
			int num = 0;
			for (HierarchieElementBean child : l) {
				num += child.getNumOfLeafs(LeafClass);
			}

			return num;
		}
	}
}
