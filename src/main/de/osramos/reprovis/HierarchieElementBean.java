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

public abstract class HierarchieElementBean {

	protected int id;
	protected List<HierarchieElementBean> childs;
	protected HierarchieElementBean parent;

	public HierarchieElementBean(int id) {

		/* try { */
		this.id = id;
		/*
		 * Context ctx = new InitialContext();
		 * ctx.bind("de.osramos/reprovis/HierarchieElement" +id, this);
		 */
		/*
		 * } catch (NamingException e1) { throw new
		 * Exception("could not bind to registry"); }
		 */

		Registry.getRegistry().reg.put(id, this);

		childs = new ArrayList<HierarchieElementBean>();
		initChilds();

	}

	public static HierarchieElementBean getElementById(int id) {

		/*
		 * try { Context ctx = new InitialContext(); return
		 * (HierarchieElementBean)
		 * ctx.lookup("de.osramos/reprovis/HierarchieElement/"+id); } catch
		 * (NamingException e) { return null; }
		 */
		return (HierarchieElementBean) Registry.getRegistry().lookup(id);
	}

	protected void setParent(HierarchieElementBean parent) throws Exception {
		/*
		 * if (parent != null) { throw new
		 * Exception("Element already initialized."); }
		 */

		this.parent = parent;
	}

	public int getId() {
		return id;
	}

	public HierarchieElementBean getParent() throws HierarchieException {
		return parent;
	}

	public List<HierarchieElementBean> getChilds() {
		return childs != null ? childs : new ArrayList<HierarchieElementBean>();
	}

	public TrafficLight getStatus() throws HierarchieException {

		try {
			return computeMinimalStatus();
		} catch (Exception e1) {

		}
		try {
			return getDistinctStatus();
		} catch (Exception e) {
		}
		throw new HierarchieException("Element has no status");
	}

	protected TrafficLight computeMinimalStatus() throws HierarchieException {

		TrafficLight status = TrafficLight.green;
		/*
		 * double rand = Math.random(); if(rand > 0.5)return TrafficLight.green;
		 * else if(rand > 0.25)return TrafficLight.yellow; else if(rand >=
		 * 0)return TrafficLight.red; if (childs == null){ return status;
		 * //throw new HierarchieException("no child Elements"); }
		 */
		for (HierarchieElementBean child : childs) {
			// aggregate to worst status
			if (status == TrafficLight.green) {
				status = child.getStatus();
			} else if (status == TrafficLight.yellow) {
				if (child.getStatus() == TrafficLight.red) {
					status = TrafficLight.red;
				}
			}
		}
		return status;

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
