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

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import de.osramos.reprovis.MasterData.TrafficLight;
import de.osramos.reprovis.exception.DatabaseException;

public class HallDAO extends HierarchieElementDAO {

	public static String getName(int id) throws DatabaseException {
		return (String) getAttribute(id, "name");
	}
	
/*	public static TrafficLight getStatus (int id){
		int r = ((int)(Math.random()*100))%10;
		if (r < 6){
			return TrafficLight.green;
		} else if (r < 8){
			return TrafficLight.yellow;
		} else {
			return TrafficLight.red;
		}
	}
	*/
	public static int getUpsServers(int id) throws DatabaseException{
		return (Integer) getAttribute(id, "upsServers");
	}
	
	public static String getType(int id) throws DatabaseException{
		return (String) getAttribute(id, "type");
	}

/*	public static FactoryBean getFactory(int id) throws DatabaseException {
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT parent FROM hall WHERE id = " + id);
			res.next();
			FactoryBean factory = new FactoryBean(res.getInt(1));
			stmt.close();
			conn.close();
			return factory;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}

	}*/

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

	//private static int count = 0;
/*	
	public static List<Integer> getHallIds(int factoryId) throws DatabaseException {
		List<Integer> l = new ArrayList<Integer>();
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT id FROM hall WHERE parent = " + factoryId);
			while(res.next()){
				l.add(res.getInt(1));
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
		return l;
	}*/
	
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
	
}
