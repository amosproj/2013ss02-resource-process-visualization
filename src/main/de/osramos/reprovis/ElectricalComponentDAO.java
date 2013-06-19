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
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.sql.DataSource;

import de.osramos.reprovis.MasterData.TrafficLight;
import de.osramos.reprovis.exception.DatabaseException;

public class ElectricalComponentDAO extends HierarchieElementDAO {
	
	private static AggreagationStrategie aggreagationStrategie = null;


	public static TrafficLight getStatus(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "status");

		return MasterData.stringToTrafficLight(s);
	}

	public static String getShiftResponsibility(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "shiftresponsibility");

		return s;
	}

	public static String getCategory(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "category");

		return s;
	}

	public static Date getTroubeOccurrenceTime(int id) throws DatabaseException {
		Timestamp t = (Timestamp) getAttribute(id, "troubleoccurrencetime");

		return new Date(t.getTime());
	}

	public static String getTroubleOccurrenceSite(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "troubleoccurrencesite");

		return s;
	}

	public static String getSector(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "sector");

		return s;
	}

	public static String getSerialnumber(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "serialnumber");

		return s;
	}
	
	public static String getName(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "name");

		return s;
	}
	
	public static void updateStatus(int id, TrafficLight status) throws DatabaseException{
		HierarchieElementDAO.updateStatus(id, "status", status, "component");
	}
	
	public static void updateValue(int id, String Value) throws DatabaseException{
		HierarchieElementDAO.updateString(id, "value", Value, "component");
	}
	
	public static String getValue(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "value");

		return s;
	}

	public static List<Integer> getElectricalComponentIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "component");
		
		return l;
	}
	
	
	private static Object getAttribute(int id, String attributeName) throws DatabaseException {
		
		return HierarchieElementDAO.getAttribute(id, attributeName, "component");
	}
	
	public static AggreagationStrategie getAggreagationStrategie(int id) throws IOException{
		String propfile = "../../config/component.properties";
		
		if (aggreagationStrategie == null){
			aggreagationStrategie = HierarchieElementDAO.getAggregationStrategie(propfile);
			System.out.println("AggreagtionStragety for electrical components set to " + aggreagationStrategie.toString());
		}
		
		return aggreagationStrategie;
	}

	public static void resetCache() {
		aggreagationStrategie = null;
		
	}
	
	public static int getIdByName(String name, int parentId) throws DatabaseException{
		
		int result;

		String query = "select id from component where parent=" + parentId +" and name=\'" + name+"\'";
		
		
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
}
