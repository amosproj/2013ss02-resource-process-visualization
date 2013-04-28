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

public class FactoryDAO {

	private String name;
	private String country; // later: private Country country;
	private String gpsLocation;
	private String city;
	private List<String> productionHalls; // later: private List<Hall>
											// productionHalls;

	public String getName() {

		return name;
	}

	public String getCountry() {
		return country;
	}

	public String getCity() {

		return city;
	}

	public String getGpsLocation() {
		return gpsLocation;
	}

	public List<String> getProductionHalls() {
		return productionHalls;
	}

	private void initName(String tableName) {
		// TODO get data
		// String query = "Select name from  " + tableName;

		// set mock data
		if (tableName.equals("Ingolstadt")) {
			name = "AudiIngolstadt1";
		} else if (tableName.equals("Neckarsulm")) {
			name = "AudiNeckarsulm1";
		}

	}

	private void initCountry(String tableName) {
		// TODO get data
		// String query = "Select country from  " + tableName;

		// set mock data

		country = "Germany";
	}

	private void initCity(String tableName) {
		// TODO get data
		// String query = "Select city from  " + tableName;

		// set mock data
		if (tableName.equals("Ingolstadt")) {
			city = "Ingolstadt";
		} else if (tableName.equals("Neckarsulm")) {
			city = "Neckarsulm";
		}

	}

	private void initGpsLocation(String tableName) {
		if (tableName.equals("Ingolstadt")) {
			gpsLocation = "48.78302°N 11.41373°E";
		} else if (tableName.equals("Neckarsulm")) {
			gpsLocation= "49.19396°N 9.22174°E";
		}
	}

	private void initProductionHalls(String tableName) {
		productionHalls = new ArrayList<String>();
		productionHalls.add("Hall 1");
		productionHalls.add("Hall 2");
	}

	public FactoryDAO(String id) {
		// Find Database by Factory
		String tablename = null;
		if (id.equals("Ingolstadt")) {
			tablename = "Ingolstadt";
		} else if (id.equals("Neckarsulm")) {
			tablename = "Neckarsulm";
		}

		initCity(tablename);
		initCountry(tablename);
		initGpsLocation(tablename);
		initName(tablename);
		initProductionHalls(tablename);
	}

}
