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

package de.osramos.reprovis;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import de.osramos.reprovis.MasterData.Company;
import de.osramos.reprovis.exception.DatabaseException;

public class FactoryDAO {

	public static String getCity(int id) throws DatabaseException {

		String s = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement.executeQuery("SELECT city FROM factory WHERE id = "
					+ id);

			res.next();
			s = res.getString(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return s.trim();

	}

	public static String getCountry(int id) throws DatabaseException {

		String s = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT country FROM factory WHERE id = "
							+ id);

			res.next();
			s = res.getString(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return s.trim();
	}

	public static String getName(int id) throws DatabaseException {

		String s = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement.executeQuery("SELECT name FROM factory WHERE id = "
					+ id);

			res.next();
			s = res.getString(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return s.trim();
	}

	public static Company getCompany(int id) throws DatabaseException {
		String s = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT company FROM factory WHERE id = "
							+ id);

			res.next();
			s = res.getString(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return MasterData.stringToCompany(s.trim());
	}

	public static String[] getCarModels(int id) throws DatabaseException {

		String s = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT carmodels FROM factory WHERE id = "
							+ id);

			res.next();
			s = res.getString(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return s.split(", ");

	}

	public static int getSizeOfStaff(int id) throws DatabaseException {

		int i = -1;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT sizeofstaff FROM factory WHERE id = "
							+ id);

			res.next();
			i = res.getInt(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return i;
	}

	public static int getNumOfVehicles(int id) throws DatabaseException {

		int i = -1;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT numofvehicles FROM factory WHERE id = "
							+ id);

			res.next();
			i = res.getInt(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return i;
	}

	public static double getGpsLatitude(int id) throws DatabaseException {

		double d = -1.d;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT gpslatitude FROM factory WHERE id = "
							+ id);

			res.next();
			d = res.getDouble(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return d;
	}

	public static double getGpsLongitude(int id) throws DatabaseException {

		double d = -1.d;

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT gpslongitude FROM factory WHERE id = "
							+ id);

			res.next();
			d = res.getDouble(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return d;
	}

	/*
	 * private static NodeList getFactoriyNodes() throws Exception {
	 * 
	 * DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	 * DocumentBuilder db; try { db = dbf.newDocumentBuilder();
	 * 
	 * Document doc = db.parse(FactoryDAO.class.getClassLoader()
	 * .getResourceAsStream(MasterData.getConfigFile())); Document doc =
	 * db.parse(MasterData.getConfigFile());
	 * 
	 * doc.getDocumentElement().normalize();
	 * 
	 * return doc.getElementsByTagName("factory"); } catch (Exception e) { throw
	 * new Exception("no Elements found"); }
	 * 
	 * }
	 */
	/*
	 * public static Element getFactoryById(int id) throws Exception {
	 * 
	 * NodeList factories = getFactoriyNodes();
	 * 
	 * for (int i = 0; i < factories.getLength(); i++) {
	 * 
	 * Node factory = factories.item(i);
	 * 
	 * if (factory.getNodeType() == Node.ELEMENT_NODE) { Element element =
	 * (Element) factory;
	 * 
	 * if (id == getFactoryHash(element)) { return element; } } } throw new
	 * Exception("no Element found");
	 * 
	 * }
	 */

	/*
	 * public static int getFactoryHash(Element factory) { String name =
	 * factory.getAttribute("name"); // double latitude = //
	 * Double.parseDouble(factory.getAttribute("gpsLatitude")); // double
	 * longitude = // Double.parseDouble(factory.getAttribute("gpsLongitude"));
	 * 
	 * return (int) (name.hashCode());
	 * 
	 * }
	 */

	public static List<Integer> getFactoryIds(int globalId) throws Exception {

		List<Integer> l = new ArrayList<Integer>();

		try {
			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement.executeQuery("SELECT id FROM factory");

			while (res.next()) {
				l.add(res.getInt(1));
			}
		

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}

		return l;

/*		try {

			ResultSet res = null;

			DataSource db = Database.getAmosDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();

			res = Database.executeQuery("SELECT id FROM factory");

			int i = 1;
			while (true) {
				try {

					l.add(res.getInt(i++));
				} catch (Exception e) {
					e.printStackTrace();
					break;
				}
			}

			statement.close();
			connection.close();
			return l;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;*/

		/*
		 * NodeList factories = getFactoriyNodes();
		 * 
		 * if (factories == null) { throw new
		 * Exception("No factories initialized"); }
		 * 
		 * for (int i = 0; i < factories.getLength(); i++) {
		 * 
		 * Node factory = factories.item(i);
		 * 
		 * if (factory.getNodeType() == Node.ELEMENT_NODE) { Element element =
		 * (Element) factory;
		 * 
		 * l.add(getFactoryHash(element)); } }
		 * 
		 * return l;
		 */
	}

	/*
	 * public static List<Integer> getChildIds(int id) throws Exception {
	 * List<Integer> l = new ArrayList<Integer>();
	 * 
	 * NodeList factories = getFactoriyNodes();
	 * 
	 * if (factories == null) { throw new Exception("No factories initialized");
	 * }
	 * 
	 * for (int i = 0; i < factories.getLength(); i++) {
	 * 
	 * Node factory = factories.item(i);
	 * 
	 * if (factory.getNodeType() == Node.ELEMENT_NODE) { Element element =
	 * (Element) factory;
	 * 
	 * l.add(getFactoryHash(element)); } }
	 * 
	 * return l; }
	 */
}
