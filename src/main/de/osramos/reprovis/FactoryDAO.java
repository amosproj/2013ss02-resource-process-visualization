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

import java.sql.Timestamp;

import java.util.Date;
import java.util.List;

import de.osramos.reprovis.MasterData.Company;
import de.osramos.reprovis.exception.DatabaseException;

public class FactoryDAO extends HierarchieElementDAO {

	// get all Elements
	public static List<Integer> getFactoryIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "factory");

		return l;
	}

	// Get Attributes by id
	public static String getCity(int id) throws DatabaseException {

		String s = (String) getAttribute(id, "City");

		return s;
	}

	public static String[] getCarModels(int id) throws DatabaseException {

		String s = (String) getAttribute(id, "CarModels");

		s = s == null ? "" : s;
		return s.split(", ");

	}

	public static String getCountry(int id) throws DatabaseException {

		String s = (String) getAttribute(id, "Country");

		return s;
	}

	public static String getName(int id) throws DatabaseException {

		String s = (String) getAttribute(id, "Name");

		return s;
	}

	public static Company getCompany(int id) throws DatabaseException {

		String s = (String) getAttribute(id, "Company");

		return MasterData.stringToCompany(s);
	}

	public static int getSizeOfStaff(int id) throws DatabaseException {

		int i = (Integer) getAttribute(id, "SizeOfStaff");

		return i;
	}

	public static Date getSizeOfStaffDate(int id) throws DatabaseException {

		Timestamp t = (Timestamp) getAttribute(id, "SizeOfStaffDate");

		return new Date(t.getTime());
	}

	public static int getVehiclesPerYear(int id) throws DatabaseException {

		int i = (Integer) getAttribute(id, "vehiclesperyear");

		return i;
	}

	public static double getGpsLatitude(int id) throws DatabaseException {

		double d = (Double) getAttribute(id, "GpsLatitude");

		return d;
	}

	public static double getGpsLongitude(int id) throws DatabaseException {

		double d = (Double) getAttribute(id, "GpsLongitude");

		return d;
	}

	public static int getUPSServers (int id) throws DatabaseException {

		int i = (Integer) getAttribute(id, "UPSServers");

		return i;
	}
	
	public static int getUPSSystems (int id) throws DatabaseException {

		int i = (Integer) getAttribute(id, "UPSSystems");

		return i;
	}
	
	public static String getUPSProvider(int id) throws DatabaseException {

		String s = (String) getAttribute(id, "UPSProvider");

		return s;
	}

	private static Object getAttribute(int id, String attributeName)
			throws DatabaseException {

		return HierarchieElementDAO.getAttribute(id, attributeName, "factory");
	}

	public static int getVehiclesPerDay(int id) throws DatabaseException {
		
		int i = (Integer) getAttribute(id, "vehiclesperday");

		return i;
	}

}
