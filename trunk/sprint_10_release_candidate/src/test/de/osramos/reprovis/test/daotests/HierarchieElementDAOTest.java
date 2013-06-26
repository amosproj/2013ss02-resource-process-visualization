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

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

import de.osramos.reprovis.ElectricalComponentBean;
import de.osramos.reprovis.HierarchieElementDAO;
import de.osramos.reprovis.TestingDeviceBean;
import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.handler.MasterData;
import de.osramos.reprovis.handler.MasterData.TrafficLight;
import de.osramos.reprovis.statusaggregation.AggreagationStrategie;
import de.osramos.reprovis.statusaggregation.MinimumAggregationStrategy;
import de.osramos.reprovis.statusaggregation.PercentageAggregationStrategy;
import de.osramos.reprovis.test.testhelper.Setup;

public class HierarchieElementDAOTest {

	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();

	}

	@Before
	public void setUpData() throws Exception {
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void getAttributeTestCorrect() throws DatabaseException {
		{
			Object o = TestDAO.getAttribute(1, "id", "factory");
			assertTrue(o instanceof Integer);
			assertEquals(1, o);
		}

		{
			Object o = TestDAO.getAttribute(1, "name", "factory");
			assertTrue(o instanceof String);
			assertEquals("Ingolstadt", o);
		}
		{
			Object o = TestDAO.getAttribute(1, "gpslatitude", "factory");
			assertTrue(o instanceof Double);
			assertEquals(48.762201d, o);
		}
		{
			Object o = TestDAO.getAttribute(1, "sizeofstaffdate", "factory");
			assertTrue(o instanceof java.sql.Timestamp);
		}
	}

	@Test
	public void getAttributeTestFailures() throws DatabaseException {
		{
			Exception exception = null;
			Object o = null;

			try {
				o = TestDAO.getAttribute(2, "id", "factory");
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}

		{
			Exception exception = null;
			Object o = null;

			try {
				o = TestDAO.getAttribute(1, "wrongattribute", "factory");
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}

		{
			Exception exception = null;
			Object o = null;

			try {
				o = TestDAO.getAttribute(2, "id", "wrongtable");
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}

		{
			Exception exception = null;
			Object o = null;

			try {
				o = TestDAO.getAttribute(2, "wrongattribute", "wrongtable");
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(o);
			assertTrue(exception instanceof DatabaseException);
		}

	}

	@Test
	public void getChildIdsTestCorrect() throws Exception {

		List<Integer> childIds = TestDAO.getChildIds(1, "hall");
		assertEquals(1, childIds.size());
		assertTrue(childIds.get(0).equals(2));
	}

	@Test
	public void getChildIdsTestFailures() throws Exception {

		{
			Exception exception = null;
			List<Integer> childIds = null;

			try {
				childIds = TestDAO.getChildIds(-1, "hall");
			} catch (Exception e) {
				exception = e;
			}
			assertNull(exception);
			assertNotNull(childIds);
			assertTrue(childIds.isEmpty());
		}

		{
			Exception exception = null;
			List<Integer> childIds = null;

			try {
				childIds = TestDAO.getChildIds(-1, "wrongtable");
			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertNull(childIds);
			assertTrue(exception instanceof DatabaseException);
		}

	}

	@Test
	public void updateStringTestCorrect() throws DatabaseException {

		String testString = "test";

		TestDAO.updateString(5, "type", testString, "device");
		String updated = (String) TestDAO.getAttribute(5, "type", "device");

		assertEquals(testString, updated);

	}

	@Test
	public void updateStringTestFailure() throws DatabaseException {

		{
			Exception exception = null;

			try {
				String testString = "test";

				TestDAO.updateString(-1, "type", testString, "device");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				String testString = "test";

				TestDAO.updateString(5, "wrongattribute", testString, "device");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				String testString = "test";

				TestDAO.updateString(5, "type", testString, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				String testString = "test";

				TestDAO.updateString(-1, "wrongAttribute", testString,
						"wrongTable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}
	}

	@Test
	public void updateIntTestCorrect() throws DatabaseException {

		int testInt = 42;

		TestDAO.updateNumber(2, "staff", testInt, "Hall");
		int updated = (Integer) TestDAO.getAttribute(2, "staff", "Hall");

		assertEquals(testInt, updated);

	}

	@Test
	public void updateIntTestFailure() throws DatabaseException {

		{
			Exception exception = null;

			try {
				int testInt = 42;

				TestDAO.updateNumber(-1, "staff", testInt, "Hall");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				int testInt = 42;

				TestDAO.updateNumber(2, "wrongattribute", testInt, "Hall");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				int testInt = 42;

				TestDAO.updateNumber(2, "staff", testInt, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				int testInt = 42;

				TestDAO.updateNumber(-1, "wrongattribute", testInt,
						"wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

	}

	@Test
	public void updateDoubleTestCorrect() throws DatabaseException {

		double testDouble = 42.13d;

		TestDAO.updateNumber(1, "gpslatitude", testDouble, "Factory");
		double updated = (Double) TestDAO.getAttribute(1, "gpslatitude",
				"Factory");

		assertTrue(testDouble == updated);

	}

	@Test
	public void updateDoubleTestFailure() throws DatabaseException {

		{
			Exception exception = null;

			try {
				double testDouble = 42.13d;

				TestDAO.updateNumber(-1, "gpslatitude", testDouble, "Factory");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				double testDouble = 42.13d;

				TestDAO.updateNumber(1, "wrongattribute", testDouble, "Factory");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				double testDouble = 42.13d;

				TestDAO.updateNumber(1, "gpslatitude", testDouble, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				double testDouble = 42.13d;

				TestDAO.updateNumber(-1, "wrongattribute", testDouble,
						"wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

	}

	@Test
	public void updateBoolTestCorrect() throws DatabaseException {

		boolean testbool = true;

		TestDAO.updateBool(5, "testfailure", testbool, "Device");
		boolean updated = (Boolean) TestDAO.getAttribute(5, "testfailure",
				"Device");

		assertTrue(testbool == updated);

	}

	@Test
	public void updateBoolTestFailure() throws DatabaseException {

		{
			Exception exception = null;

			try {
				boolean testbool = true;

				TestDAO.updateBool(-1, "testfailure", testbool, "Device");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				boolean testbool = true;

				TestDAO.updateBool(5, "wrongattribute", testbool, "Device");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				boolean testbool = true;

				TestDAO.updateBool(5, "testfailure", testbool, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				boolean testbool = true;

				TestDAO.updateBool(5, "wrongattribute", testbool, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				boolean testbool = true;

				TestDAO.updateBool(5, "id", testbool, "device");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

	}

	@Test
	public void updateDateTestCorrect() throws DatabaseException {

		Date testDate = new GregorianCalendar(1986, 9, 14).getTime();

		TestDAO.updateDate(1, "sizeofstaffdate", testDate, "Factory");
		Timestamp t2 = (Timestamp) TestDAO.getAttribute(1, "sizeofstaffdate",
				"Factory");
		Date updated = new Date(t2.getTime());

		assertTrue(testDate.equals(updated));

	}

	@Test
	public void updateDateTestFailure() throws DatabaseException {

		{
			Exception exception = null;

			try {
				Date testDate = new GregorianCalendar(1986, 9, 14).getTime();

				TestDAO.updateDate(-1, "sizeofstaffdate", testDate, "Factory");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				Date testDate = new GregorianCalendar(1986, 9, 14).getTime();

				TestDAO.updateDate(1, "wrongattribute", testDate, "Factory");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				Date testDate = new GregorianCalendar(1986, 9, 14).getTime();

				TestDAO.updateDate(1, "sizeofstaffdate", testDate, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				Date testDate = new GregorianCalendar(1986, 9, 14).getTime();

				TestDAO.updateDate(-1, "wrongattribute", testDate, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				Date testDate = new GregorianCalendar(1986, 9, 14).getTime();

				TestDAO.updateDate(1, "id", testDate, "Factory");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}
	}

	@Test
	public void updateStatusTestCorrect() throws DatabaseException {

		TrafficLight status = TrafficLight.red;

		TestDAO.updateStatus(6, "status", status, "component");

		String attribute = (String) TestDAO.getAttribute(6, "status",
				"component");
		TrafficLight updated = MasterData.stringToTrafficLight(attribute);

		assertTrue(status.equals(updated));

	}

	@Test
	public void updateStatusTestFailure() throws DatabaseException {

		{
			Exception exception = null;

			try {
				TrafficLight status = TrafficLight.red;

				TestDAO.updateStatus(-1, "status", status, "component");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				TrafficLight status = TrafficLight.red;

				TestDAO.updateStatus(6, "wrongattribute", status, "component");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				TrafficLight status = TrafficLight.red;

				TestDAO.updateStatus(6, "status", status, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

		{
			Exception exception = null;

			try {
				TrafficLight status = TrafficLight.red;

				TestDAO.updateStatus(-1, "wrongattribute", status, "wrongtable");

			} catch (Exception e) {
				exception = e;
			}
			assertNotNull(exception);
			assertTrue(exception instanceof DatabaseException);

		}

	}

	@Test
	public void getAggregationStrategyCorrect() throws IOException {

		String path = "./de/osramos/reprovis/test/testdata/test.properties";
		
		{
			File propfile = new File(ClassLoader.getSystemResource(path)
					.getPath());

			FileOutputStream out = new FileOutputStream(propfile);

			Properties p = new Properties();
			p.put("strategie", "minimum");
			p.store(out, "");

			AggreagationStrategie aggregationStrategie = TestDAO
					.getAggregationStrategie(path);
			
			assertTrue(aggregationStrategie  instanceof MinimumAggregationStrategy);
		}

		{
			File propfile = new File(ClassLoader.getSystemResource(path)
					.getPath());

			FileOutputStream out = new FileOutputStream(propfile);

			Properties p = new Properties();
			p.put("strategie", "percentage");
			p.put("aggregationLevel", "TestingDevice");
			p.put("redPercentageForRed", "10");
			p.put("yellowPercentageForRed", "20");
			p.put("redPercentageForYellow", "30");
			p.put("yellowPercentageForYellow", "40");
			p.store(out, "");


			AggreagationStrategie aggregationStrategie = TestDAO
					.getAggregationStrategie(path);
			
			assertTrue(aggregationStrategie instanceof PercentageAggregationStrategy);

			PercentageAggregationStrategy a = (PercentageAggregationStrategy) aggregationStrategie;
			assertTrue(a.getRedPercentageForRed() == 10);
			assertTrue(a.getYellowPercentageForRed() == 20);
			assertTrue(a.getRedPercentageForYellow() == 30);
			assertTrue(a.getYellowPercentageForYellow() == 40);
			assertTrue(a.getAggregationLevel()
					.equals(TestingDeviceBean.class));
		}
		
		
	}
	
	@Test
	public void getAggregationStrategyFailure() throws IOException {

		String path = "./de/osramos/reprovis/test/testdata/test.properties";
		
		{
			File propfile = new File(ClassLoader.getSystemResource(path)
					.getPath());

			FileOutputStream out = new FileOutputStream(propfile);

			Properties p = new Properties();
			p.store(out, "");

			AggreagationStrategie aggregationStrategie = TestDAO
					.getAggregationStrategie(path);
			
			assertTrue(aggregationStrategie  instanceof MinimumAggregationStrategy);
		}

		{
			File propfile = new File(ClassLoader.getSystemResource(path)
					.getPath());

			FileOutputStream out = new FileOutputStream(propfile);

			Properties p = new Properties();
			p.put("strategie", "percentage");
			p.put("aggregationLevel", "TestingDevice");
			p.put("redPercentageForRed", "10");
			p.store(out, "");


			AggreagationStrategie aggregationStrategie = TestDAO
					.getAggregationStrategie(path);
			
			assertTrue(aggregationStrategie  instanceof MinimumAggregationStrategy);
		}
		
		{
			File propfile = new File(ClassLoader.getSystemResource(path)
					.getPath());

			FileOutputStream out = new FileOutputStream(propfile);

			Properties p = new Properties();
			p.put("strategie", "percentage");
			p.put("aggregationLevel", "bla");
			p.put("redPercentageForRed", "10");
			p.store(out, "");


			AggreagationStrategie aggregationStrategie = TestDAO
					.getAggregationStrategie(path);
			
			assertTrue(aggregationStrategie  instanceof MinimumAggregationStrategy);
		}
		
		{
			File propfile = new File(ClassLoader.getSystemResource(path)
					.getPath());

			FileOutputStream out = new FileOutputStream(propfile);

			Properties p = new Properties();
			p.put("strategie", "percentage");
			p.put("aggregationLevel", "TestingDevice");
			p.put("redPercentageForRed", "10.1d");
			p.store(out, "");


			AggreagationStrategie aggregationStrategie = TestDAO
					.getAggregationStrategie(path);
			
			assertTrue(aggregationStrategie  instanceof MinimumAggregationStrategy);
		}
		
	}

}

class TestDAO extends HierarchieElementDAO {

	public static Object getAttribute(int id, String attributeName,
			String tableName) throws DatabaseException {
		return HierarchieElementDAO.getAttribute(id, attributeName, tableName);
	}

	public static List<Integer> getChildIds(int parentId, String tableName)
			throws Exception {
		return HierarchieElementDAO.getChildIds(parentId, tableName);
	}

	public static void updateString(int id, String attributeName,
			String attributeValue, String tableName) throws DatabaseException {
		HierarchieElementDAO.updateString(id, attributeName, attributeValue,
				tableName);
	}

	public static void updateNumber(int id, String attributeName,
			Number attributeValue, String tableName) throws DatabaseException {
		HierarchieElementDAO.updateNumber(id, attributeName, attributeValue,
				tableName);
	}

	public static void updateBool(int id, String attributeName,
			boolean attributeValue, String tableName) throws DatabaseException {
		HierarchieElementDAO.updateBool(id, attributeName, attributeValue,
				tableName);
	}

	public static void updateDate(int id, String attributeName,
			Date attributeValue, String tableName) throws DatabaseException {
		HierarchieElementDAO.updateDate(id, attributeName, attributeValue,
				tableName);
	}

	public static void updateStatus(int id, String attributeName,
			TrafficLight attributeValue, String tableName)
			throws DatabaseException {
		HierarchieElementDAO.updateStatus(id, attributeName, attributeValue,
				tableName);
	}

}