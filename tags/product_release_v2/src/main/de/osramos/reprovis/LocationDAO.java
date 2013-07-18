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
import java.util.List;

import javax.sql.DataSource;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.handler.DatabaseHandler;
import de.osramos.reprovis.statusaggregation.AggreagationStrategie;



public class LocationDAO extends HierarchieElementDAO {
	
	
	private static AggreagationStrategie aggreagationStrategie = null;
	
	
	public static int getIdByNames(String factory, String hall, String line, String location) throws DatabaseException{
		
		int result;

		String query = "select id from location where parent=" +
				"(select id from line where name=\'" + line +
				"\' and parent=(select id from hall where name=\'" + hall +
				"\' and parent=(select id from factory where name=\'" +factory +
				"\'))) and name='" + location + "\'";
		
		
		try {
			ResultSet res = null;

			DataSource db = DatabaseHandler.getDB();

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

	
	public static AggreagationStrategie getAggreagationStrategie(int id) throws IOException{
		String propfile = "/../../config/location.properties";
		
		if (aggreagationStrategie == null){
			aggreagationStrategie = HierarchieElementDAO.getAggregationStrategie(propfile);
			System.out.println("AggreagtionStragety for locations set to " + aggreagationStrategie.toString());
		}
		
		return aggreagationStrategie;
	}


	public static void resetCache() {
		aggreagationStrategie = null;
		
	}
}
