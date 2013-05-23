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

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class HallBean extends HierarchieElementBean {

	private String name;
	private int sizeOfStaff;
	private int productionCapacity;
	private String path;

	public HallBean(int id) {
		super(id);
		/*
		 * try { Context ctx = new InitialContext();
		 * ctx.bind("de.osramos/reprovis/factory/"+id, this); } catch
		 * (NamingException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */

		name = HallDAO.getName(id);
		sizeOfStaff = HallDAO.getSizeOfStaff(id);
		productionCapacity = HallDAO.getProductionCapacity();
		path = HallDAO.getPath(id);
	}

	public String getName() {
		return name;
	}

	public String getPath() {
		return path;
	}

	public int getSizeOfStaff() {
		return sizeOfStaff;
	}

	public int getProductionCapacity() {
		return productionCapacity;
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = LineDAO.getLineIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				LineBean childBean = new LineBean(id);

				childBean.setParent(this);

				childs.add(childBean);
			}
		} catch (Exception e) {
		}

	}

	/*
	 * public FactoryBean getFactory(){ return HallDAO.getFactory(id); }
	 * 
	 * public TrafficLight getStatus(){ return HallDAO.getStatus(id); }
	 * 
	 * public List<LineBean> getLines(){
	 * 
	 * List<Integer> idList = LineDAO.getLineIds(id); List<LineBean> lineList =
	 * new ArrayList<LineBean>();
	 * 
	 * for(int id : idList){ lineList.add(new LineBean(id)); }
	 * 
	 * return lineList;
	 * 
	 * }
	 */

}
