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

import static org.junit.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.LocationBean;
import de.osramos.reprovis.LocationDAO;
import de.osramos.reprovis.TestingDeviceDAO;
import de.osramos.reprovis.test.testhelper.Setup;

public class LocationBeanTest {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void initTest() throws Exception{
		LocationBean b = new LocationBean(1);
		assertTrue(b.getChilds().size() == TestingDeviceDAO.getTestingDeviceIds(1).size());
	}
}
