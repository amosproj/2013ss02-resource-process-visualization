package de.osramos.reprovis;

import java.util.ArrayList;

public class Location {
	private String name;
	private ArrayList<Component> components;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Component> getComponents() {
		return components;
	}
	public void setComponents(ArrayList<Component> components) {
		this.components = components;
	}
}
