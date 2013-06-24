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

import java.io.IOException;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.junit.*;

import de.osramos.reprovis.FactoryDAO;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.handler.MasterData;
import de.osramos.reprovis.handler.MasterData.Company;
import de.osramos.reprovis.statusaggregation.AggreagationStrategie;
import de.osramos.reprovis.test.testhelper.Setup;
import static org.junit.Assert.*;

public class FactoryDAOTest {

	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();

	}

	@Before
	public void setUpData() throws Exception {
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void getAggregtionStrategieTest() throws IOException {
		AggreagationStrategie aggreagationStrategie = FactoryDAO
				.getAggreagationStrategie(1);

		assertNotNull(aggreagationStrategie);
	}

	@Test
	public void getCarModelsTest() throws DatabaseException {

		String[] expected = new String[] { "Audi A3", "Audi A3 Sportback" };
		String[] carModels = FactoryDAO.getCarModels(1);

		assertEquals(expected.length, carModels.length);
		for (int i = 0; i < expected.length; i++) {
			assertEquals(expected[i], carModels[i]);
		}

	}

	@Test
	public void getCityTest() throws DatabaseException {
		String expected = "Ingolstadt";
		String city = FactoryDAO.getCity(1);
		assertEquals(expected, city);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getCity(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getCompanyTest() throws DatabaseException {

		Company expected = Company.Audi;
		Company company = FactoryDAO.getCompany(1);
		assertEquals(expected, company);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getCompany(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getCountryTest() throws DatabaseException {
		String expected = "Germany";
		String country = FactoryDAO.getCountry(1);
		assertEquals(expected, country);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getCountry(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}

	}

	@Test
	public void getFactoryIdsTest() throws Exception {
		{
			List<Integer> factoryIds = FactoryDAO.getFactoryIds(0);
			assertEquals(1, factoryIds.size());
			assertTrue(1 == factoryIds.get(0));
		}
		{
			List<Integer> factoryIds = FactoryDAO.getFactoryIds(-1);

			assertTrue(factoryIds.isEmpty());
		}
	}

	@Test
	public void getGpsLatitudeTest() throws DatabaseException {
		double gpsLatitude = FactoryDAO.getGpsLatitude(1);
		assertEquals(48.762201d, gpsLatitude, 0);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getGpsLatitude(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getGpsLongitudeTest() throws DatabaseException {
		double gpsLongitude = FactoryDAO.getGpsLongitude(1);
		assertEquals(11.425374d, gpsLongitude, 0);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getGpsLongitude(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getMapTest() throws DatabaseException {
		String map = FactoryDAO.getMap(1);
		assertNotNull(map);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getMap(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getNameTest() throws DatabaseException {
		String name = FactoryDAO.getName(1);
		assertEquals("Ingolstadt", name);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getName(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getSizeOfStaffTest() throws DatabaseException {
		int sizeOfStaff = FactoryDAO.getSizeOfStaff(1);
		assertTrue(35386 == sizeOfStaff);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getSizeOfStaff(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getSizeOfStaffDateTest() throws DatabaseException {
		Date sizeOfStaffDate = FactoryDAO.getSizeOfStaffDate(1);
		assertEquals(
				new Date(new GregorianCalendar(2012, 11, 31).getTimeInMillis()),
				sizeOfStaffDate);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getSizeOfStaffDate(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getUPSProviderTest() throws DatabaseException {
		String upsProvider = FactoryDAO.getUPSProvider(1);
		assertEquals("DSA GmbH", upsProvider);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getUPSProvider(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getUPSServersTest() throws DatabaseException {
		int upsServers = FactoryDAO.getUPSServers(1);
		assertTrue(upsServers == 3);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getUPSServers(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getUPSSystemsTest() throws DatabaseException {
		int upsSystems = FactoryDAO.getUPSSystems(1);
		assertTrue(1 == upsSystems);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getUPSSystems(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getVehiclesPerDayTest() throws DatabaseException {
		int vehiclesPerDay = FactoryDAO.getVehiclesPerDay(1);
		assertTrue(2580 == vehiclesPerDay);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getVehiclesPerDay(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

	@Test
	public void getVehiclesPerYearTest() throws DatabaseException {
		int vehiclesPerYear = FactoryDAO.getVehiclesPerYear(1);
		assertTrue(551889 == vehiclesPerYear);

		{
			Exception exception = null;
			Object o = null;

			try {
				o = FactoryDAO.getVehiclesPerYear(-1);
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}
	}

}
