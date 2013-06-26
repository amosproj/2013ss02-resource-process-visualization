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

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.FactoryDAO;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.MasterData;
import de.osramos.reprovis.handler.MasterData.Company;
import de.osramos.reprovis.test.testhelper.Setup;

public class FactoryBeanTest {

	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void initChildsTest() throws Exception {

		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
		
		{
			FactoryBean b = new FactoryBean(1);
			List<HierarchieElementBean> childs = b.getChilds();
			assertNotNull(childs);
			assertTrue(childs.size() == 1);
			assertTrue(childs.get(0).getId() == 2);
		}


	}

	@Test
	public void constructorTest() throws HierarchieException{
		
		{
			FactoryBean factoryBean = new FactoryBean(1);
			assertNotNull(factoryBean);
		}
		
		
		{
			HierarchieException e = null;
			FactoryBean factoryBean = null;
			try {
				factoryBean = new FactoryBean(-1);
			} catch (HierarchieException ex) {
				e = ex;
			}

			assertNotNull(e);
			assertNull(factoryBean);
		}
	}
	
	
	@Test
	public void getterTest() throws Exception {

		FactoryBean f = new FactoryBean(FactoryDAO.getFactoryIds(0).get(0));
		String[] carModels = f.getCarModels();
		String city = f.getCity();
		Company company = f.getCompany();
		String country = f.getCountry();
		double gpsLatitude = f.getGpsLatitude();
		double gpsLongitude = f.getGpsLongitude();
		String map = f.getMap();
		String name = f.getName();
		int sizeOfStaff = f.getSizeOfStaff();
		Date sizeOfStaffDate = f.getSizeOfStaffDate();
		int upsClients = f.getUPSClients();
		String upsProvider = f.getUPSProvider();
		int upsServers = f.getUPSServers();
		int upsSystems = f.getUPSSystems();
		int vehiclesPerDay = f.getVehiclesPerDay();
		int vehiclesPerYear = f.getVehiclesPerYear();

		assertArrayEquals(new String[] { "Audi A3", "Audi A3 Sportback" },
				carModels);
		assertEquals("Ingolstadt", city);
		assertEquals(MasterData.Company.Audi, company);
		assertEquals("Germany", country);
		assertEquals(48.762201d, gpsLatitude, 0);
		assertEquals(11.425374, gpsLongitude, 0);
		assertEquals("", map);
		assertEquals("Ingolstadt", name);
		assertEquals(35386, sizeOfStaff);
		assertEquals(
				new Date(new GregorianCalendar(2012, 11, 31).getTimeInMillis()),
				sizeOfStaffDate);
		assertEquals(1, upsClients);
		assertEquals("DSA GmbH", upsProvider);
		assertEquals(3, upsServers);
		assertEquals(1, upsSystems);
		assertEquals(2580, vehiclesPerDay);
		assertEquals(551889, vehiclesPerYear);

	}

}
