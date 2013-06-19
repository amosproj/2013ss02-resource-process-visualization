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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import de.osramos.reprovis.exception.DatabaseException;

public class TestingDeviceDAO extends HierarchieElementDAO {


	private static AggreagationStrategie aggreagationStrategie = null;
	

	// get all Elements
	public static List<Integer> getTestingDeviceIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "device");
		
		return l;
	}
	
	public static int getIdByNames(String factory, String hall, String Line, String Location, String Device) throws DatabaseException{
		
		int result;

		String query = "select id from device where parent=" +
				"(select id from location where name=\'" + Location +
				"\' and parent=(select id from line where name=\'" + Line +
				"\' and parent=(select id from hall where name=\'" + hall +
				"\' and parent=(select id from factory where name=\'" +factory +
				"\')))) and name='" + Device + "\'";
		
		try {
			ResultSet res = null;

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery(query);

			res.next();
			result = res.getInt(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
			
			return result;
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}
		
		

	}
	
	public static void updateIpAddress(int id, String IpAddress) throws DatabaseException{
		HierarchieElementDAO.updateString(id, "ipaddress", IpAddress, "device");
	}
	
	public static void updateNetworkStatus(int id, String status) throws DatabaseException{
		HierarchieElementDAO.updateString(id, "networkstatus", status, "device");
	}
	
	public static void updateTestfailure(int id, boolean failure) throws DatabaseException{
		HierarchieElementDAO.updateBool(id, "testfailure", failure, "device");
	}
	
	public static void updateTroublePeriod(int id, Date time) throws DatabaseException{
		HierarchieElementDAO.updateDate(id, "troubleperiod", time, "device");
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
		String propfile = "../../config/device.properties";
		
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
