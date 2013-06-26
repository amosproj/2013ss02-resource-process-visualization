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
import static org.junit.Assert.assertTrue;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.TestingDeviceDAO;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.test.testhelper.Setup;

public class TestingDeviceDAOTest {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();

	}
	
	@Before
	public void setUp() throws Exception{
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}
	
	@Test
	public void getIdByNamesTest() throws DatabaseException{
		assertEquals(TestingDeviceDAO.getIdByNames("Ingolstadt", "H1", "L1 Assembly", "Lo1", "MFTD2XI1-052"), 5);
	}
	
	@Test
	public void initTest() throws Exception{
		assertEquals(TestingDeviceDAO.getTestingDeviceIds(4).size(), 1);
	}
	
	@Test
	public void getTypeTest() throws Exception{
		assertEquals(TestingDeviceDAO.getType(5), "D1");
	}
	
	@Test (expected=DatabaseException.class)
	public void typeForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getType(-1);
	}
	
	@Test
	public void getDescriptionTest() throws Exception{
		assertEquals(TestingDeviceDAO.getDescription(5), "DSA Multifunction-tester Gen. 2");
	}
	
	@Test (expected=DatabaseException.class)
	public void descriptionForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getDescription(-1);
	}
	
	@Test
	public void getNameTest() throws Exception{
		assertEquals(TestingDeviceDAO.getName(5), "MFTD2XI1-052");
	}
	
	@Test (expected=DatabaseException.class)
	public void nameForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getName(-1);
	}

	@Test
	public void getNetworkTest() throws Exception{
		assertEquals(TestingDeviceDAO.getNetworkStatus(5), "N/A");
	}
	
	@Test (expected=DatabaseException.class)
	public void networkStatusForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getNetworkStatus(-1);
	}
	
	@Test
	public void getIpAddressTest() throws Exception{
		assertEquals(TestingDeviceDAO.getIpAddress(5), "N/A");
	}
	
	@Test (expected=DatabaseException.class)
	public void ipAddressForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getIpAddress(-1);
	}
	
	@Test
	public void getMaintenanceTest() throws Exception{
		assertEquals(TestingDeviceDAO.getMaintainanceInfo(5), " ");
	}
	
	@Test (expected=DatabaseException.class)
	public void maintenanceForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getMaintainanceInfo(-1);
	}
	
	@Test
	public void getSectorTest() throws Exception{
		assertEquals(TestingDeviceDAO.getSector(5), "B");
	}
	
	@Test (expected=DatabaseException.class)
	public void sectorForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getSector(-1);
	}
	
	@Test
	public void getSerialTest() throws Exception{
		assertEquals(TestingDeviceDAO.getSerialnumber(5), "28994613");
	}
	
	@Test (expected=DatabaseException.class)
	public void serialForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getSerialnumber(-1);
	}
	
	@Test
	public void getTroubleTest() throws Exception{
		Date shouldBe = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS")).parse("2013-06-18 06:00:41.701");
		assertTrue(TestingDeviceDAO.getTroublePeriod(5).compareTo(shouldBe) == 0);
	}
	
	@Test (expected=DatabaseException.class)
	public void troubleForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getTroublePeriod(-1);
	}
	
	@Test
	public void getFailureTest() throws Exception{
		assertEquals(TestingDeviceDAO.getTestFailure(5), false);
	}
	
	@Test (expected=DatabaseException.class)
	public void failureForInvalidTest() throws DatabaseException{
		TestingDeviceDAO.getTestFailure(-1);
	}
}
