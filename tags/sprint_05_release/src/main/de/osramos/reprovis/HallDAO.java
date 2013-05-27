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

public class HallDAO {

	public static String getName(int id) throws DatabaseException {
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT name FROM hall WHERE id = " + id);
			res.next();
			String name = res.getString(1);
			stmt.close();
			conn.close();
			return name;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Error";
	}
	
	public static TrafficLight getStatus (int id){
		int r = ((int)(Math.random()*100))%10;
		if (r < 6){
			return TrafficLight.green;
		} else if (r < 8){
			return TrafficLight.yellow;
		} else {
			return TrafficLight.red;
		}
	}

	public static FactoryBean getFactory(int id) throws DatabaseException {
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
		}
		return null;
	}

	public static int getSizeOfStaff(int id) throws DatabaseException {
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT staff FROM hall WHERE id = " + id);
			res.next();
			int staff = res.getInt(1);
			stmt.close();
			conn.close();
			return staff;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public static String getPath(int id) throws DatabaseException {
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT path FROM hall WHERE id = " + id);
			res.next();
			String path = res.getString(1);
			stmt.close();
			conn.close();
			return path;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static int getProductionCapacity(int id) throws DatabaseException {
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT capacity FROM hall WHERE id = " + id);
			res.next();
			int capacity = res.getInt(1);
			stmt.close();
			conn.close();
			return capacity;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	//private static int count = 0;
	
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
		}
		return l;
	}
}