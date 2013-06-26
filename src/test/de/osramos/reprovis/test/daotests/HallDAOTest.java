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

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.HallDAO;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.test.testhelper.Setup;

public class HallDAOTest {
	
	
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
		assertEquals(HallDAO.getHallIds(1).size(), 1);
	}
	
	@Test
	public void getNameTest() throws Exception{
		assertEquals(HallDAO.getName(2), "H1");
	}
	
	@Test (expected=DatabaseException.class)
	public void nameForInvalidTest() throws DatabaseException{
		HallDAO.getName(-1);
	}
	
	@Test
	public void getTypeTest() throws Exception{
		assertEquals(HallDAO.getType(2), "Assembly+Finish");
	}
	
	@Test (expected=DatabaseException.class)
	public void typeForInvalidTest() throws DatabaseException{
		HallDAO.getType(-1);
	}
	
	@Test
	public void getStaffTest() throws Exception{
		assertEquals(HallDAO.getSizeOfStaff(2), 351);
	}
	
	@Test (expected=DatabaseException.class)
	public void staffForInvalidTest() throws DatabaseException{
		HallDAO.getSizeOfStaff(-1);
	}
	
	@Test
	public void getCapacityTest() throws Exception{
		assertEquals(HallDAO.getProductionCapacity(2), 1914);
	}
	
	@Test (expected=DatabaseException.class)
	public void capacityForInvalidTest() throws DatabaseException{
		HallDAO.getProductionCapacity(-1);
	}
	
	@Test
	public void getVehiclesTest() throws Exception{
		assertEquals(HallDAO.getVehicles(2), "Audi A4");
	}
	
	@Test (expected=DatabaseException.class)
	public void vehiclesForInvalidTest() throws DatabaseException{
		HallDAO.getVehicles(-1);
	}
	
	@Test
	public void getUpsServersTest() throws Exception{
		assertEquals(HallDAO.getUpsServers(2), 2);
	}
	
	@Test (expected=DatabaseException.class)
	public void upsServersForInvalidTest() throws DatabaseException{
		HallDAO.getUpsServers(-1);
	}
	
	@Test
	public void getPathTest() throws Exception{
		assertEquals(HallDAO.getPath(2), "polygon249");
	}
	
	@Test (expected=DatabaseException.class)
	public void pathForInvalidTest() throws DatabaseException{
		HallDAO.getPath(-1);
	}
	
	@Test
	public void getMapTest() throws Exception{
		assertEquals(HallDAO.getMap(2), "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>");
	}
	
	@Test (expected=DatabaseException.class)
	public void mapForInvalidTest() throws DatabaseException{
		HallDAO.getMap(-1);
	}
}
