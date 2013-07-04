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


package de.osramos.reprovis.test.botests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.LineBean;
import de.osramos.reprovis.LocationBean;
import de.osramos.reprovis.TestingDeviceDAO;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;
import de.osramos.reprovis.test.testhelper.Setup;

public class LocationBeanTest {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Before
	public void resetGlobal(){
		GlobalBean.resetGlobal();
		Registry.cleanRegistry();
	}
	
	@Test
	public void childTest() throws Exception{
		LocationBean b = new LocationBean(1);
		assertTrue(b.getChilds().size() == TestingDeviceDAO.getTestingDeviceIds(1).size());
	}
	
	@Test
	public void notExistingTest() throws HierarchieException{
		LocationBean loc = new LocationBean(-1);
		assertNotNull(loc.getChilds());
		assertNotNull(loc.getDescription());
		assertNotNull(loc.getName());
		assertNotNull(loc.getPersonInCharge());
	}
	
	@Test
	public void parentTest() throws HierarchieException{
		assertEquals(4, (new LineBean(3)).getChilds().get(0).getId());
	}
	
	@Test
	public void getterTest() throws HierarchieException{
		LocationBean loc = new LocationBean(4);
		assertEquals("Lo1", loc.getName());
		assertEquals("ABS test", loc.getDescription());
		assertEquals("Peter Merkel", loc.getPersonInCharge());
	}
}
