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

import de.osramos.reprovis.exception.DatabaseException;

public class LocationDAO {
	
	public static String getName(int id) throws DatabaseException {
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT name FROM location WHERE id = " + id);
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

	public static List<Integer> getLocationIds(int lineId) throws DatabaseException {
		List<Integer> l = new ArrayList<Integer>();
		try {
			DataSource db = Database.getDB();
			Connection conn = db.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(
					"SELECT id FROM location WHERE parent = " + lineId);
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
