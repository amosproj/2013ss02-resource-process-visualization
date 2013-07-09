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
import java.util.List;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;

public class LineBean extends HierarchieElementBean {
	
	
	private String name;
	private String path;
	private int productionCapacity;
	private String productionSeries;


	

	public LineBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {
		super(id, parent,  registry);
		
		initName();
		initPath();
		initProductionCapacity();
		initProductionSeries();

		try{
			this.aggreagationStrategie = LineDAO.getAggreagationStrategie(id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = LocationDAO.getLocationIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				LocationBean childBean = new LocationBean(id, this, registry);

				childs.add(childBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void initName() {
		try {
			name = LineDAO.getName(id);
		} catch (DatabaseException e){
			name = "Error";
		}
	}
	
	public void initPath() {
		try {
			path = LineDAO.getPath(id);
		} catch (DatabaseException e){
			path = "Error";
		}
	}

	public void initProductionSeries() {
		try {
			productionSeries = LineDAO.getproductionSeries(id);
		} catch(DatabaseException e){
			productionSeries = "Error";
		}
	}

	public void initProductionCapacity() {
		try {
			productionCapacity = LineDAO.getproductionCapacity(id);
		} catch (DatabaseException e){
			productionCapacity = -1;
		}
	}
	
	
	
	public String getName(){
		return name;
	}
	
	
	public String getPath() {
		return path;
	}

	public String getProductionSeries() {
		return productionSeries;
	}

	public int getProductionCapacity() {
		return productionCapacity;
	}

	@Override
	protected void initAttributes() {
		// TODO Auto-generated method stub
		
	}

}
