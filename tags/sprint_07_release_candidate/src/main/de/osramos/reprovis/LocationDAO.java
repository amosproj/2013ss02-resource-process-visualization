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

import java.util.List;

import de.osramos.reprovis.exception.DatabaseException;



public class LocationDAO extends HierarchieElementDAO {
	
	
	// get Attributes by id
	public static String getName(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "name");
		
		return s;
	}

	public static String getDescription(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "description");
		
		return s;
	}

	
	public static String getPersonInCharge(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "personincharge");
		
		return s;
	}
	
	
	// get all Elements
	public static List<Integer> getLocationIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "location");
		
		return l;
	}
	
	private static Object getAttribute(int id, String attributeName) throws DatabaseException {
		
		return HierarchieElementDAO.getAttribute(id, attributeName, "location");
	}

	
}
