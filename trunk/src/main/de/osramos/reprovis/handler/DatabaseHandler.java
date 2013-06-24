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

/**
 * 
 */
package de.osramos.reprovis.handler;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.io.IOUtils;

import de.osramos.reprovis.MasterData;
import de.osramos.reprovis.exception.DatabaseException;

/**
 * @author Martin
 * 
 */
public class DatabaseHandler {

	private static boolean init = false;

	public static void initDB() throws DatabaseException {

		try {
			
			String path = "../../config/init.sql";
			String sql;

			InputStream resource = MasterData.class.getClassLoader()
					.getResourceAsStream(path);

			sql = IOUtils.toString(resource);

			DataSource db = DatabaseHandler.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			
			statement.execute(sql);

			statement.close();
			connection.close();
			
			DatabaseHandler.init = true;
			
		} catch (Exception e) {
			//throw new DatabaseException("could not init database");
		} 
		

	}

	synchronized public static DataSource getDB() throws DatabaseException {

	
		
		DataSource datasource;
		try {
			Context ctx = new InitialContext();

			datasource = (DataSource) ctx
					.lookup("java:comp/env/jdbc/postgresql");
		} catch (NamingException e) {
			throw new DatabaseException("could not find database");

		}

		return datasource;

	}

	public static boolean databaseIsInitialized() {
		return init;
	}

	
}
