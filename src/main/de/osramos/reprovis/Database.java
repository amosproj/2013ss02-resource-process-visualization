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
package de.osramos.reprovis;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.io.IOUtils;
import org.postgresql.ds.PGSimpleDataSource;

import de.osramos.reprovis.exception.DatabaseException;

/**
 * @author Martin
 * 
 */
public class Database {

	static boolean init = false;

	public static void initDB() throws DatabaseException {

		try {
			String path = "../../init.sql";
			String sql;

			InputStream resource = MasterData.class.getClassLoader()
					.getResourceAsStream(path);

			sql = IOUtils.toString(resource);

			sql = "drop table if exists factory;"
					+ "create table factory (id int , name char(25), company char(25), city char(25), country char(25), "
					+ "gpslatitude double precision , gpslongitude double precision, "
					+ "carmodels char(512), sizeofstaff int, numofvehicles int );"
					+ "insert into factory values (1, \'German1\', \'Audi\', \'Ingolstadt\', \'Germany\', 48.762201, 11.425374, "
					+ "\'Audi A3, Audi A3 Sportback, Audi S3, Audi S3 Sportback, Audi A4, Audi A4 Avant, Audi S4, Audi S4 Avant, Audi A4 allroad quattro, Audi RS4 Avant, Audi A5 Sportback, Audi A5 Coupé, Audi S5 Sportback, Audi S5 Coupé, Audi RS 5 Coupé, Audi Q5, Audi Q5 hybrid quattro, Audi SQ5 TDI, Karosseriebau/Lackiererei des Audi TT Coupé, Audi TT Roadster, Audi TTS Coupé, Audi TTS Roadster, Audi TT RS Coupé, Audi TT RS Roadster, Audi A3 Cabriolet\',"
					+ "35386, 551889);"
					+ "insert into factory values (2, \'German2\', \'Audi\', \'Neckarsulm\', \'Germany\', 49.194213, 9.221771, "
					+ "\'Audi A4, Audi A5 Cabriolet, Audi S5 Cabriolet, Audi RS 5 Cabriolet, Audi A6, Audi A6 hybrid, Audi A6 Avant, Audi S6, Audi A6 allroad quattro, Audi RS 6 Avant, Audi A7, Audi S7, Audi RS7, Audi A8, Audi A8 L, Audi A8 hybrid, Audi S8, Audi R8, Audi R8 Spyder, Audi R8 GT, Audi R8 GT Spyder\',"
					+ "	14764, 262965 );";

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();

			statement.execute(sql);

			statement.close();
			connection.close();
			
		} catch (Exception e) {
			throw new DatabaseException("could not init database");
		}

	}

	public static DataSource getDB() {

		DataSource datasource;
		try {
			Context ctx = new InitialContext();

			datasource = (DataSource) ctx
					.lookup("java:comp/env/jdbc/postgresql");
		} catch (NamingException e) {
			datasource = getAmosDB();
		}

		return datasource;

	}

	public static DataSource getTestDB() {
		PGSimpleDataSource ds = new PGSimpleDataSource();
		ds.setServerName("localhost");
		ds.setPortNumber(5432);
		ds.setDatabaseName("ss13-proj2");
		ds.setUser("ss13-proj2");
		ds.setPassword("12345");

		return ds;
	}

	public static DataSource getAmosDB() {
		PGSimpleDataSource ds = new PGSimpleDataSource();
		ds.setServerName("faui2o2j.informatik.uni-erlangen.de");
		ds.setPortNumber(5432);
		ds.setDatabaseName("ss13-proj2");
		ds.setUser("ss13-proj2");
		ds.setPassword("");

		return ds;
	}

}
