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
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.DatabaseHandler;
import de.osramos.reprovis.statusaggregation.AggreagationStrategie;

public class LineDAO {
	
	
	private static AggreagationStrategie aggreagationStrategie = null;

	public static String getName(int id) throws DatabaseException {
		try {
			DataSource db = DatabaseHandler.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT name FROM line WHERE id = " + id);
			res.next();
			String name = res.getString(1);
			stmt.close();
			conn.close();
			return name;
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
	}
	
	public static String getPath(int id) throws DatabaseException{
		try {
			DataSource db = DatabaseHandler.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT path FROM line WHERE id = " + id);
			res.next();
			String path = res.getString(1);
			stmt.close();
			conn.close();
			return path;
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
	}

	public static List<Integer> getLineIds(int id) throws DatabaseException {
		List<Integer> l = new ArrayList<Integer>();
		try {
			DataSource db = DatabaseHandler.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT id FROM line WHERE parent = " + id);
			while(res.next()){
				l.add(res.getInt(1));
			}
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
		return l;
	}


	public static String getproductionSeries(int id) throws DatabaseException {
		try {
			DataSource db = DatabaseHandler.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT series FROM line WHERE id = " + id);
			res.next();
			String path = res.getString(1);
			stmt.close();
			conn.close();
			return path;
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
	}


	public static int getproductionCapacity(int id) throws DatabaseException {
		try {
			DataSource db = DatabaseHandler.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT capacity FROM line WHERE id = " + id);
			res.next();
			int capacity = res.getInt(1);
			stmt.close();
			conn.close();
			return capacity;
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
	}
	
	public static HallBean getHall(int id) throws DatabaseException, HierarchieException{
		try {
			DataSource db = DatabaseHandler.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT parent FROM line WHERE id = " + id);
			res.next();
			HallBean hall = new HallBean(res.getInt(1));
			stmt.close();
			conn.close();
			return hall;
		} catch (SQLException e) {
			//e.printStackTrace();
			throw new DatabaseException("DB access Failed");
		}
	}
	
	public static AggreagationStrategie getAggreagationStrategie(int id) throws IOException{
		String propfile = "/../../config/line.properties";
		
		if (aggreagationStrategie == null){
			aggreagationStrategie = HierarchieElementDAO.getAggregationStrategie(propfile);
			System.out.println("AggreagtionStragety for lines set to " + aggreagationStrategie.toString());
		}
		
		return aggreagationStrategie;
	}

	public static void resetCache() {
		aggreagationStrategie = null;
		
	}
}
