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

package de.osramos.reprovis.test.testhelper;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.io.IOUtils;
import org.postgresql.ds.PGSimpleDataSource;

import de.osramos.reprovis.Database;


public class Setup {
	
	public static void setUpTestDS () throws NamingException{
		
		System.setProperty(Context.URL_PKG_PREFIXES, "org.apache.naming");

		System.setProperty(Context.INITIAL_CONTEXT_FACTORY,
				"org.apache.naming.java.javaURLContextFactory");

		InitialContext ctx = new InitialContext();

		ctx.createSubcontext("java:");
		ctx.createSubcontext("java:comp");
		ctx.createSubcontext("java:comp/env");
		ctx.createSubcontext("java:comp/env/jdbc");

		PGSimpleDataSource ds = new PGSimpleDataSource();
		ds.setServerName(System.getenv("AMOS_DB_SERVER"));
		ds.setPortNumber(Integer.parseInt(System.getenv("AMOS_DB_PORT")));
		ds.setDatabaseName(System.getenv("AMOS_DB_NAME"));
		ds.setUser(System.getenv("AMOS_DB_USER"));
		ds.setPassword(System.getenv("AMOS_DB_PASSWORD"));

		ctx.bind("java:comp/env/jdbc/postgresql", ds);
		
	}
	
	public static void loadDBData(String path) throws Exception {

		

			String sql;

			String resource = Setup.class.getClassLoader()
					.getResource(path).getPath();
			
			InputStream i = new FileInputStream(new File(resource));

			sql = IOUtils.toString(i);

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			
			statement.execute(sql);

			statement.close();
			connection.close();
			
			

		

	}
	

}
