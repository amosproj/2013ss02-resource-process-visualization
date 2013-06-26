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


package de.osramos.reprovis.test.daotests;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.LocationDAO;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.test.testhelper.Setup;

public class LocationDAOTest {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();

	}

	@Before
	public void setUp() throws Exception{
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void initTest() throws Exception{
		assertEquals(LocationDAO.getLocationIds(3).size(), 1);
	}
	
	@Test
	public void getNameTest() throws Exception{
		assertEquals(LocationDAO.getName(4), "Lo1");
	}
	
	@Test (expected=DatabaseException.class)
	public void nameForInvalidTest() throws DatabaseException{
		LocationDAO.getName(-1);
	}
	
	@Test
	public void getDescriptionTest() throws Exception{
		assertEquals(LocationDAO.getDescription(4), "ABS test");
	}
	
	@Test (expected=DatabaseException.class)
	public void descriptionForInvalidTest() throws DatabaseException{
		LocationDAO.getDescription(-1);
	}
	
	@Test
	public void getpersonInChargeTest() throws Exception{
		assertEquals(LocationDAO.getPersonInCharge(4), "Peter Merkel");
	}
	
	@Test (expected=DatabaseException.class)
	public void personInChargeForInvalidTest() throws DatabaseException{
		LocationDAO.getPersonInCharge(-1);
	}
}
