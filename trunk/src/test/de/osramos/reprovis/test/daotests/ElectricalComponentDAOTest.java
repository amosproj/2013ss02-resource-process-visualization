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

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.ElectricalComponentDAO;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.handler.MasterData.TrafficLight;
import de.osramos.reprovis.test.testhelper.Setup;


public class ElectricalComponentDAOTest {
	
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
		assertEquals(ElectricalComponentDAO.getElectricalComponentIds(5).size(), 3);
	}
	
	@Test
	public void test2() throws DatabaseException{
		assertEquals(ElectricalComponentDAO.getIdByName("Tests", 5), 6);
	}
	
	@Test
	public void getNameTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getName(6), "Tests");
		assertEquals(ElectricalComponentDAO.getName(7), "Network");
		assertEquals(ElectricalComponentDAO.getName(8), "Maintainance");
	}
	
	@Test (expected=DatabaseException.class)
	public void nameForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getName(-1);
	}
	
	@Test
	public void getValueTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getValue(6), "Ok");
		assertEquals(ElectricalComponentDAO.getValue(7), "IP: 10.0.0.1");
		assertEquals(ElectricalComponentDAO.getValue(8), "no scheduled offtime");
	}
	
	@Test (expected=DatabaseException.class)
	public void valueForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getValue(-1);
	}
	
	@Test
	public void getSectorTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getSector(6), "B");
		assertEquals(ElectricalComponentDAO.getSector(7), "B");
		assertEquals(ElectricalComponentDAO.getSector(8), "C");
	}
	
	@Test (expected=DatabaseException.class)
	public void sectorForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getSector(-1);
	}
	
	@Test
	public void getCategoryTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getCategory(6), "F");
		assertEquals(ElectricalComponentDAO.getCategory(7), "F");
		assertEquals(ElectricalComponentDAO.getCategory(8), "H");
	}
	
	@Test (expected=DatabaseException.class)
	public void categoryForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getCategory(-1);
	}
	
	@Test
	public void getSerialTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getSerialnumber(6), "70036775");
		assertEquals(ElectricalComponentDAO.getSerialnumber(7), "71054617");
		assertEquals(ElectricalComponentDAO.getSerialnumber(8), "32935192");
	}
	
	@Test (expected=DatabaseException.class)
	public void serialForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getSerialnumber(-1);
	}
	
	@Test
	public void getShiftTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getShiftResponsibility(6), "Howard Joel Wolowitz");
		assertEquals(ElectricalComponentDAO.getShiftResponsibility(7), "Dr. Leonard Leakey Hofstadter");
		assertEquals(ElectricalComponentDAO.getShiftResponsibility(8), "Dr. Leonard Leakey Hofstadter");
	}
	
	@Test (expected=DatabaseException.class)
	public void shiftForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getShiftResponsibility(-1);
	}
	
	@Test
	public void getTTimeTest() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
		assertTrue(ElectricalComponentDAO.getTroubeOccurrenceTime(6).compareTo(format.parse("2013-06-18 00:44:47.937")) == 0);
		assertTrue(ElectricalComponentDAO.getTroubeOccurrenceTime(7).compareTo(format.parse("2013-06-18 08:06:43.370")) == 0);
		assertTrue(ElectricalComponentDAO.getTroubeOccurrenceTime(8).compareTo(format.parse("2013-06-18 00:56:28.457")) == 0);
	}
	
	@Test (expected=DatabaseException.class)
	public void tTimeForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getTroubeOccurrenceTime(-1);
	}
	
	@Test
	public void getTSiteTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getTroubleOccurrenceSite(6), "G5");
		assertEquals(ElectricalComponentDAO.getTroubleOccurrenceSite(7), "A3");
		assertEquals(ElectricalComponentDAO.getTroubleOccurrenceSite(8), "B8");
	}
	
	@Test (expected=DatabaseException.class)
	public void tSiteForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getTroubleOccurrenceSite(-1);
	}
	
	@Test
	public void getStatusTest() throws Exception{
		assertEquals(ElectricalComponentDAO.getStatus(6), TrafficLight.green);
		assertEquals(ElectricalComponentDAO.getStatus(7), TrafficLight.green);
		assertEquals(ElectricalComponentDAO.getStatus(8), TrafficLight.green);
	}
	
	@Test (expected=DatabaseException.class)
	public void statusForInvalidTest() throws DatabaseException{
		ElectricalComponentDAO.getStatus(-1);
	}
}
