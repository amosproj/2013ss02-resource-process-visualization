package de.osramos.reprovis;

import java.util.ArrayList;

public class Line {
	private String name;
	private ArrayList<Location> locations;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Location> getLocations() {
		return locations;
	}
	public void setLocations(ArrayList<Location> locations) {
		this.locations = locations;
	}

}
