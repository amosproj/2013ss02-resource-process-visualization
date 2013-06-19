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
import java.util.List;

import de.osramos.reprovis.exception.DatabaseException;

public class HallDAO extends HierarchieElementDAO {
	
	
	private static AggreagationStrategie aggreagationStrategie = null;
	

	public static String getName(int id) throws DatabaseException {
		return (String) getAttribute(id, "name");
	}
	

	public static int getUpsServers(int id) throws DatabaseException{
		return (Integer) getAttribute(id, "upsServers");
	}
	
	public static String getType(int id) throws DatabaseException{
		return (String) getAttribute(id, "type");
	}

	public static int getSizeOfStaff(int id) throws DatabaseException {
		int i = (Integer) getAttribute(id, "staff");

		return i;
	}

	public static String getPath(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "path");

		return s;
	}
	
	public static int getProductionCapacity(int id) throws DatabaseException {
		int i = (Integer) getAttribute(id, "capacity");

		return i;
	}
	
	public static String getMap(int id) throws DatabaseException{
		return (String) getAttribute(id, "map");
	}
	
	public static List<Integer> getHallIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "hall");

		return l;
	}
	
	private static Object getAttribute(int id, String attributeName) throws DatabaseException {
		return HierarchieElementDAO.getAttribute(id, attributeName, "hall");
	}

	public static String getVehicles(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "Vehicles");

		return s;
	}
	
	public static AggreagationStrategie getAggreagationStrategie(int id) throws IOException{
		String propfile = "/../../config/hall.properties";
		
		if (aggreagationStrategie == null){
			aggreagationStrategie = HierarchieElementDAO.getAggregationStrategie(propfile);
			System.out.println("AggreagtionStragety for halls set to " + aggreagationStrategie.toString());
		}
		
		return aggreagationStrategie;
	}

	public static void resetCache() {
		aggreagationStrategie = null;
		
	}
	
}
