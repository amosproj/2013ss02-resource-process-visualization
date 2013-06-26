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
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.LocationBean;
import de.osramos.reprovis.TestingDeviceBean;
import de.osramos.reprovis.test.testhelper.Setup;


public class TestingDeviceBeanTest {
	
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void childTest(){
		assertEquals(3, (new TestingDeviceBean(5)).getChilds().size());
	}
	
	@Test
	public void parentTest(){
		assertEquals(5, (new LocationBean(4)).getChilds().get(0).getId());
	}
	
	@Test
	public void notExistingTest(){
		TestingDeviceBean device = new TestingDeviceBean(-1);
		assertNotNull(device.getType());
		assertNotNull(device.getDescription());
		assertNotNull(device.getName());
		assertNotNull(device.getNetworkStatus());
		assertNotNull(device.getIpAddress());
		assertNotNull(device.getMaintainanceInfo());
		assertNotNull(device.getSector());
		assertNotNull(device.getSerialnumber());
		assertNull(device.getTroublePeriod());
		assertNotNull(device.isTestFailure());
	}
	
	@Test
	public void getterTest() throws Exception{
		TestingDeviceBean device = new TestingDeviceBean(5);
		assertEquals("D1", device.getType());
		assertEquals("DSA Multifunction-tester Gen. 2", device.getDescription());
		assertEquals("MFTD2XI1-052", device.getName());
		assertEquals("N/A", device.getNetworkStatus());
		assertEquals("N/A", device.getIpAddress());
		assertEquals(" ", device.getMaintainanceInfo());
		assertEquals("B", device.getSector());
		assertEquals("28994613", device.getSerialnumber());
		Date shouldBe = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS")).parse("2013-06-18 06:00:41.701");
		assertTrue(shouldBe.compareTo(device.getTroublePeriod()) == 0);
		assertEquals(false, device.isTestFailure());
	}
}
