package de.osramos.reprovis;

import java.util.ArrayList;

public class ProductionHall {
	private String name;
	private String type;
	private String[] vehicles;
	private ArrayList<Line> lines;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String[] getVehicles() {
		return vehicles;
	}
	public void setVehicles(String[] vehicles) {
		this.vehicles = vehicles;
	}
	public ArrayList<Line> getLines() {
		return lines;
	}
	public void setLines(ArrayList<Line> lines) {
		this.lines = lines;
	}
}
