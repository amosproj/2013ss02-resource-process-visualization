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

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.handler.DatabaseHandler;
import de.osramos.reprovis.test.testhelper.Setup;

/**
 * @author Martin
 *
 */
public class DatabaseTest {

	@BeforeClass
	public static void setUpClass() throws Exception {
		Setup.setUpTestDS();
	}
	
	@Test
	public void testDataSource() throws  SQLException, DatabaseException{
		DataSource db = DatabaseHandler.getDB();
		assertNotNull(db);
		
		assertNotNull(db.getConnection());
	
	}
	
	@Test
	public void testInit() throws  SQLException, DatabaseException{
		DatabaseHandler.initDB();
	
	}
	
}
