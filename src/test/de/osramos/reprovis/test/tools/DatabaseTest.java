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
package de.osramos.reprovis.test.tools;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.junit.Test;

import de.osramos.reprovis.Database;

/**
 * @author Martin
 *
 */
public class DatabaseTest {

	@Test
	public void testDataSource() throws NamingException, SQLException{
		DataSource db = Database.getAmosDB();
		assertNotNull(db);
		
		Connection connection = db.getConnection();
		Statement statement = connection.createStatement();
		
		ResultSet query = statement.executeQuery("create table factory(id int , name char(25), city char(25), country char(25) ); " +
				"insert into factory (id, name, city, country) values (1, 'German1', 'Ingolstadt', 'Germany');");

		
		statement.close();
		connection.close();
	}
	
}
