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

public abstract class HierarchieElementDAO {

	public static List<Integer> getChildIds(int parentId, String tableName) throws Exception {

		List<Integer> l = new ArrayList<Integer>();

		try {
			ResultSet res = null;

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement.executeQuery("SELECT id FROM "+tableName+" where parent = " + parentId);

			while (res.next()) {
				l.add(res.getInt(1));
			}
		

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}
		return l;
	}

	
	protected static Object getAttribute(int id, String attributeName, String tableName) throws DatabaseException{
		Object o = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT " + attributeName+ " FROM " + tableName+ " WHERE id = "
							+ id);

			res.next();
			o = res.getObject(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
			
			return o;
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}
	}

}
