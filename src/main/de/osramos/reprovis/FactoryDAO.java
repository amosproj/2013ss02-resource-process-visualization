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

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import de.osramos.reprovis.MasterData.Company;

public class FactoryDAO {

	public static String getCity(int id) {

		try {
			Element factory = getFactoryById(id);
			return factory.getAttribute("city");
		} catch (Exception e) {
			return null;
		}
	}

	public static String getCountry(int id) {
	
		try {
			Element factory = getFactoryById(id);
			return factory.getAttribute("name");
		} catch (Exception e) {
			return null;
		}
		
		
	}


	public static String getName(int id) {

		try {
			Element factory = getFactoryById(id);
			return factory.getAttribute("name");
		} catch (Exception e) {
			return null;
		}	
	}

	public static Company getCompany(int id) {
		try {
			Element factory = getFactoryById(id);
			String brand = factory.getAttribute("brand");
			return MasterData.stringToCompany(brand);
		} catch (Exception e) {
			return null;
		}
	}

/*	public static List<Integer> getFactoryIds() throws Exception {



	}*/

	public static String[] getCarModels(int id) {
		
		try {
			Element factory = getFactoryById(id);
			String vehicles = factory.getAttribute("vehicles");
			return vehicles.split(", ");
		} catch (Exception e) {
			return null;
		}	
	}

	public static int getSizeOfStaff(int id) {
		try {
			Element factory = getFactoryById(id);
			return Integer.parseInt(factory.getAttribute("sizeOfStaff"));
		} catch (Exception e) {
			return -1;
		}	
	}

	public static int getNumOfVehicles(int id) {
		try {
			Element factory = getFactoryById(id);
			return Integer.parseInt(factory.getAttribute("numOfVehicles"));
		} catch (Exception e) {
			return -1;
		}	
	}
	
	public static double getGpsLatitude(int id) {
		try {
			Element factory = getFactoryById(id);
			return Double.parseDouble(factory.getAttribute("gpsLatitude"));
		} catch (Exception e) {
			return -1;
		}	
	}
	
	public static double getGpsLongitude(int id) {
		try {
			Element factory = getFactoryById(id);
			return Double.parseDouble(factory.getAttribute("gpsLongitude"));
		} catch (Exception e) {
			return -1;
		}	
	}

	private static NodeList getFactoriyNodes() throws Exception{
		
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db;
		try {
			db = dbf.newDocumentBuilder();

		Document doc = db.parse(FactoryDAO.class.getClassLoader().getResourceAsStream(MasterData.getConfigFile()));
/*		Document doc = db.parse(MasterData.getConfigFile());*/
		
		doc.getDocumentElement().normalize();
		
		return doc.getElementsByTagName("factory");
		} catch (Exception e) {
			throw new Exception("no Elements found");
		}
		
	}
	
	public static Element getFactoryById(int id) throws Exception{
		
		NodeList factories = getFactoriyNodes();
		
		for (int i = 0; i < factories.getLength(); i++) {
			
			Node factory = factories.item(i);

			if (factory.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) factory;
				
	
				if (id == getFactoryHash(element)){
					return element;
				}
			}
		}
		throw new Exception("no Element found");
		
	}
	
	public static int getFactoryHash(Element factory){
		String name = factory.getAttribute("name");
		//double latitude = Double.parseDouble(factory.getAttribute("gpsLatitude"));
		//double longitude = Double.parseDouble(factory.getAttribute("gpsLongitude"));
		
		return (int) (name.hashCode());
		
    }

	public static List<Integer> getFactoryIds(int globalId) throws Exception {
		List<Integer> l = new ArrayList<Integer>();
		
		NodeList factories = getFactoriyNodes();
		
		if (factories == null) {
			throw new Exception("No factories initialized");
		}

		for (int i = 0; i < factories.getLength(); i++) {
			
			Node factory = factories.item(i);

			if (factory.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) factory;
				
				l.add(getFactoryHash(element));
			}
		}

		return l;
	}
	
	
/*	public static List<Integer> getChildIds(int id) throws Exception {
		List<Integer> l = new ArrayList<Integer>();
		
		NodeList factories = getFactoriyNodes();
		
		if (factories == null) {
			throw new Exception("No factories initialized");
		}

		for (int i = 0; i < factories.getLength(); i++) {
			
			Node factory = factories.item(i);

			if (factory.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) factory;
				
				l.add(getFactoryHash(element));
			}
		}

		return l;
	}*/
}
