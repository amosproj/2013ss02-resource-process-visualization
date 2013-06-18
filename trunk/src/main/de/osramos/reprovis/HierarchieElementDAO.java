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

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.io.IOUtils;

import de.osramos.reprovis.MasterData.TrafficLight;
import de.osramos.reprovis.exception.DatabaseException;

public abstract class HierarchieElementDAO {

	protected static List<Integer> getChildIds(int parentId, String tableName) throws Exception {

		List<Integer> l = new ArrayList<Integer>();

		try {
			ResultSet res = null;

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement.executeQuery("SELECT id FROM "+tableName+" where parent = " + parentId);

			while (res.next()) {
				l.add(res.getInt(1));
			}
		

			statement.close();
			connection.close();
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}
		return l;
	}

	
	protected static Object getAttribute(int id, String attributeName, String tableName) throws DatabaseException{
		Object o = null;

		try {
			ResultSet res = null;

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			res = statement
					.executeQuery("SELECT " + attributeName+ " FROM " + tableName+ " WHERE id = "
							+ id);

			res.next();
			o = res.getObject(1);
			if (res.next()) {

				throw new DatabaseException("bad data");
			}

			statement.close();
			connection.close();
			
			return o;
		} catch (SQLException e) {
			throw new DatabaseException("DB access Failed");
		}
	}
	
	private static void updateAttribute(int id, String attributeName, String attributeValue, String tableName) throws DatabaseException{
		try {

			DataSource db = Database.getDB();

			Connection connection = db.getConnection();
			Statement statement = connection.createStatement();
			int result = statement.executeUpdate("UPDATE " + tableName+ " SET "   + attributeName+ "= " + attributeValue + " WHERE id = "
					+ id);
			
			statement.close();
			connection.close();
			
			
		} catch (SQLException e) {
			throw new DatabaseException("Error while updating data");
		}
		
	}
	
	protected static void updateString(int id, String attributeName, String attributeValue, String tableName) throws DatabaseException{
		
		updateAttribute(id, attributeName, "\'"+attributeValue+"\'", tableName);
		
	}
	
	protected static void updateStatus(int id, String attributeName, TrafficLight attributeValue, String tableName) throws DatabaseException{
		
		updateAttribute(id, attributeName, "\'"+attributeValue.name()+"\'", tableName);
		
	}


	protected static void updateNumber(int id, String attributeName,
			Number attributeValue, String tableName) throws DatabaseException {
		
		updateAttribute(id, attributeName, attributeValue.toString(), tableName);
		
	}


	public static void updateBool(int id, String attributeName,
			boolean attributeValue, String tableName) throws DatabaseException {
		
		String boolString = "false";
		if (attributeValue == true){
			boolString = "true";
		}
		
		updateAttribute(id, attributeName, boolString , tableName);
		
	}


	public static void updateDate(int id, String attributeName,
			Date attributeValue, String tableName) throws DatabaseException {
		updateAttribute(id, attributeName, "\'" +new Timestamp(attributeValue.getTime()).toString() +"\'" , tableName);
		
	}
	

	
	public static AggreagationStrategie getAggregationStrategie(String propfile) throws IOException{
		

		Properties properties = new Properties();
		
		File file = new File( HierarchieElementDAO.class.getClassLoader().getResource(propfile).getPath());
		
		if (file == null ||  !file.exists()){
			throw new IOException("File not Found");
		}
		try {

			InputStream i = new FileInputStream(file);
			
		/*	InputStream stream = HierarchieElementDAO.class.getClassLoader().getSystemResourceAsStream(propfile);
			System.out.println(IOUtils.toString(stream));*/
			
			properties.load(i);
			i.close();
			String strategy = properties.getProperty("strategie");
			if (strategy == null){
				throw new IOException("no property found");
			}
			
			if (strategy.equals("percentage")){
				float redPercentageForRed = Float.parseFloat(properties.getProperty("redPercentageForRed"));
				float yellowPercentageForRed = Float.parseFloat(properties.getProperty("yellowPercentageForRed"));
				float redPercentageForYellow = Float.parseFloat(properties.getProperty("redPercentageForYellow"));
				float yellowPercentageForYellow = Float.parseFloat(properties.getProperty("yellowPercentageForYellow"));
				Class aggregationLevel = MasterData.getHierarchieClassByString(properties.getProperty("aggregationLevel"));
				
				return new PercentageAggregationStrategy(redPercentageForRed, yellowPercentageForRed, redPercentageForYellow, yellowPercentageForYellow, aggregationLevel);
			}
			if (strategy.equals("minimum")){
				return new MinimumAggregationStrategy();
			}
		} catch (Exception e) {
			System.out.println(e);
			return new MinimumAggregationStrategy();
			//throw new IOException("Error while parsing propfile", e);
		}
		return new MinimumAggregationStrategy();
		
	}
	

}
