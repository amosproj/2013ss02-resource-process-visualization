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
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import de.osramos.reprovis.exception.DatabaseException;

public class TestingDeviceDAO extends HierarchieElementDAO {


	private static AggreagationStrategie aggreagationStrategie = null;
	

	// get all Elements
	public static List<Integer> getTestingDeviceIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "device");
		
		return l;
	}
	
	
	
	
	// Get Attributes by id
	
	public static String getDescription(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "description");

		return s;
	}
	
	public static String getName(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "name");

		return s;
	}
	
	public static String getNetworkStatus(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "NetworkStatus");

		return s;
	}
	
	public static String getIpAddress(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "IpAddress");

		return s;
	}
	
	public static String getMaintainanceInfo(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "MaintainanceInfo");

		return s;
	}
	
	public static String getSerialnumber(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "serialnumber");

		return s;
	}

	public static String getType(int id) throws DatabaseException {
		
		String s = (String) getAttribute(id, "type");

		return s;
	}

	public static Date getTroublePeriod(int id) throws DatabaseException {
		
		Timestamp t = (Timestamp) getAttribute(id, "troubleperiod");

		return new Date (t.getTime());
	}

	public static boolean getTestFailure(int id) throws DatabaseException  {
		boolean b = (Boolean) getAttribute(id, "testfailure");

		return b;
	}

	public static String getSector(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "sector");

		return s;
	}

	
	// 
	private static Object getAttribute(int id, String attributeName) throws DatabaseException {
		
		return HierarchieElementDAO.getAttribute(id, attributeName, "device");
	}

	
	public static AggreagationStrategie getAggreagationStrategie(int id) throws IOException{
		String propfile = "/../../config/device.properties";
		
		if (aggreagationStrategie == null){
			aggreagationStrategie = HierarchieElementDAO.getAggregationStrategie(propfile);
			System.out.println("AggreagtionStragety for testing devices set to " + aggreagationStrategie.toString());
		}
		
		return aggreagationStrategie;
	}


	public static void resetCache() {
		aggreagationStrategie = null;
		
	}

}
