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
import java.sql.Timestamp;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

import de.osramos.reprovis.AggreagationStrategie;
import de.osramos.reprovis.ElectricalComponentBean;
import de.osramos.reprovis.ElectricalComponentDAO;
import de.osramos.reprovis.HierarchieElementDAO;
import de.osramos.reprovis.PercentageAggregationStrategy;
import de.osramos.reprovis.TestingDeviceDAO;
import de.osramos.reprovis.exception.DatabaseException;

import org.postgresql.ds.PGSimpleDataSource;

public class HierarchieElementDAOTest {

	@BeforeClass
	public static void setUpClass() throws Exception {

		System.setProperty(Context.URL_PKG_PREFIXES, "org.apache.naming");

		System.setProperty(Context.INITIAL_CONTEXT_FACTORY,
				"org.apache.naming.java.javaURLContextFactory");

		InitialContext ctx = new InitialContext();

		ctx.createSubcontext("java:");
		ctx.createSubcontext("java:comp");
		ctx.createSubcontext("java:comp/env");
		ctx.createSubcontext("java:comp/env/jdbc");

		PGSimpleDataSource ds = new PGSimpleDataSource();
		ds.setServerName(System.getenv("AMOS_DB_SERVER"));
		ds.setPortNumber(Integer.parseInt(System.getenv("AMOS_DB_PORT")));
		ds.setDatabaseName(System.getenv("AMOS_DB_NAME"));
		ds.setUser(System.getenv("AMOS_DB_USER"));
		ds.setPassword(System.getenv("AMOS_DB_PASSWORD"));

		ctx.bind("java:comp/env/jdbc/postgresql", ds);

	}


	@Test
	public void updateStringTest() throws DatabaseException {

		String testString = "test";

		TestDAO.updateString(2003, "type", "other", "Device");
		String attribute = (String) TestDAO
				.getAttribute(2003, "type", "Device");
		assertTrue(!attribute.equals(testString));
		assertNotNull(attribute);

		TestDAO.updateString(2003, "type", testString, "Device");
		String updated = (String) TestDAO.getAttribute(2003, "type", "Device");

		assertEquals(testString, updated);

	}

	@Test
	public void updateIntTest() throws DatabaseException {

		int testInt = 42;
		
		TestDAO.updateNumber(2000, "staff", 41, "Hall");

		int attribute = (Integer) TestDAO.getAttribute(2000, "staff",
				"Hall");
		assertTrue(attribute != testInt);
		assertNotNull(attribute);

		TestDAO.updateNumber(2000, "staff", testInt, "Hall");
		int updated = (Integer) TestDAO.getAttribute(2000, "staff",
				"Hall");

		assertEquals(testInt, updated);

	}
	
	
	@Test
	public void updateDoubleTest() throws DatabaseException {

		double testDouble = 42d;
		
		TestDAO.updateNumber(1, "gpslatitude", 77d, "Factory");

		double attribute = (Double) TestDAO.getAttribute(1, "gpslatitude",
				"Factory");
		assertTrue(attribute!=testDouble);
		assertNotNull(attribute);

		TestDAO.updateNumber(1, "gpslatitude", testDouble, "Factory");
		double updated = (Double) TestDAO.getAttribute(1, "gpslatitude",
				"Factory");

		assertTrue(testDouble==updated);

	}
	
	
	@Test
	public void updateBoolTest() throws DatabaseException {

		boolean testbool = true;
		
		TestDAO.updateBool(2003, "testfailure", false, "Device");

		boolean attribute = (Boolean) TestDAO.getAttribute(2003, "testfailure",
				"Device");
		assertTrue(attribute!=testbool);
		assertNotNull(attribute);

		TestDAO.updateBool(2003, "testfailure", testbool, "Device");
		boolean updated = (Boolean) TestDAO.getAttribute(2003, "testfailure",
				"Device");

		assertTrue(testbool==updated);

	}
	
	@Test
	public void updateDateTest() throws DatabaseException {
		
		
		Date testDate = new GregorianCalendar(2012, 11, 31).getTime();
		
		TestDAO.updateDate(1, "sizeofstaffdate", new GregorianCalendar(2011, 11, 31).getTime(), "Factory");

		Timestamp t = (Timestamp) TestDAO.getAttribute(1, "sizeofstaffdate",
				"Factory");
		Date attribute = new Date(t.getTime());
		
		assertTrue(!attribute.equals(testDate));
		assertNotNull(attribute);

		TestDAO.updateDate(1, "sizeofstaffdate", testDate, "Factory");
		Timestamp t2 = (Timestamp) TestDAO.getAttribute(1, "sizeofstaffdate",
				"Factory");
		Date updated = new Date(t2.getTime());

		assertTrue(testDate.equals(updated));

	}
	
	@Test
	public void propTest() throws IOException{
		AggreagationStrategie aggregationStrategie = TestDAO.getAggregationStrategie("./config/factory.properties");
		assertTrue(aggregationStrategie instanceof PercentageAggregationStrategy);
		
		PercentageAggregationStrategy a = (PercentageAggregationStrategy) aggregationStrategie;
		assertTrue(a.getRedPercentageForRed() == 30);
		assertTrue(a.getYellowPercentageForRed() == 50);
		assertTrue(a.getRedPercentageForYellow() == 30);
		assertTrue(a.getYellowPercentageForYellow() == 50);
		assertTrue(a.getAggregationLevel().equals(ElectricalComponentBean.class));
	}
	
	@Test
	public void test1() throws DatabaseException{
		System.out.println (TestingDeviceDAO.getIdByNames("Ingolstadt", "C6", "C6 Finish", "BC3", "MFTD2XI1-052"));
	}
	
	@Test
	public void test2() throws DatabaseException{
		System.out.println (ElectricalComponentDAO.getIdByName("Tests", 2660));
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
			Number attributeValue, String tableName) throws DatabaseException  {
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

}