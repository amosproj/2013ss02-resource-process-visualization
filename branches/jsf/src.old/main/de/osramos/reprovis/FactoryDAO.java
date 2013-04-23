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
