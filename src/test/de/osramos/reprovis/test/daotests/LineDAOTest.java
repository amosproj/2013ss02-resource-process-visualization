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

import de.osramos.reprovis.LineDAO;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.test.testhelper.Setup;

public class LineDAOTest {
	
	
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
		assertEquals(LineDAO.getLineIds(2).size(), 1);
	}
	
	@Test
	public void getNameTest() throws Exception{
		assertEquals(LineDAO.getName(3), "L1 Assembly");
	}
	
	@Test (expected=DatabaseException.class)
	public void nameForInvalidTest() throws DatabaseException{
		LineDAO.getName(-1);
	}
	
	@Test
	public void getSeriesTest() throws Exception{
		assertEquals(LineDAO.getproductionSeries(3), "Series 3");
	}
	
	@Test (expected=DatabaseException.class)
	public void seriesForInvalidTest() throws DatabaseException{
		LineDAO.getproductionSeries(-1);
	}
	
	@Test
	public void getCapacityTest() throws Exception{
		assertEquals(LineDAO.getproductionCapacity(3), 98);
	}
	
	@Test (expected=DatabaseException.class)
	public void capacityForInvalidTest() throws DatabaseException{
		LineDAO.getproductionCapacity(-1);
	}
	
	@Test
	public void getPathTest() throws Exception{
		assertEquals(LineDAO.getPath(3), "rect217");
	}
	
	@Test (expected=DatabaseException.class)
	public void pathForInvalidTest() throws DatabaseException{
		LineDAO.getPath(-1);
	}
	
}
