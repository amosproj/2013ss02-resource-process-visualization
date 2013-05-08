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

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import de.osramos.reprovis.MasterData.TrafficLight;

/**
 * This class is used to provide a simple and 
 * easily changeable data-access for trying out
 * different approaches.
 * @author JP
 *
 */
public class TestData {
	
	public ArrayList<Factory> factories;
	public List<Hall> halls;
	public List<Line> lines;
	public List<Location> locations;
	public List<Component> components;
	private TestDataUpdater up;
	
	public TestData(InputStream is){
		ObjectMapper mapper = new ObjectMapper();
		try {
			factories = mapper.readValue(is, new TypeReference<ArrayList<Factory>>(){});
			halls = new ArrayList<Hall>();
			lines = new ArrayList<Line>();
			locations = new ArrayList<Location>();
			components = new ArrayList<Component>();
			setIds();
		} catch (IOException e) {
			e.printStackTrace();
		}
		up = new TestDataUpdater(this);
		up.setDaemon(true);
		up.start();
	}
	
	private void setIds(){
		int fid = 0;
		for(Factory f: factories){
			f.setId(fid++);
			for(Hall h: f.getHalls()){
				h.setId(halls.size());
				halls.add(h);
				for(Line l: h.getLines()){
					l.setId(lines.size());
					lines.add(l);
					for(Location loc: l.getLocations()){
						loc.setId(locations.size());
						locations.add(loc);
						for(Component c: loc.getComponents()){
							c.setId(components.size());
							components.add(c);
						}
					}
				}
			}
		}
	}
	
	public List<Factory> getFactories(){
		return factories;
	}
	
	public Factory getFactory(int fid){
		return factories.get(fid);
	}
	
	public Hall getHall(int hid){
		return halls.get(hid);
	}
	
	public static class Node{
		protected int id;
		protected TrafficLight status = TrafficLight.red;
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public TrafficLight getStatus() {
			return status;
		}
		public void setStatus(TrafficLight status) {
			this.status = status;
		}
	}

	public static class Factory extends Node{
		private String name;
		private int staff;
		private ArrayList<String> brands;
		private ArrayList<String> vehicles;
		private ArrayList<Hall> halls;
		private Coordinate coordinate;
		private String country;
		private int vehicleOutput;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getStaff() {
			return staff;
		}
		public int getSizeOfStaff() {
			return staff;
		}
		public void setStaff(int staff) {
			this.staff = staff;
		}
		public ArrayList<String> getBrands() {
			return brands;
		}
		public void setBrands(ArrayList<String> brands) {
			this.brands = brands;
		}
		public ArrayList<String> getVehicles() {
			return vehicles;
		}
		public String[] getCarModels() {
			return (String[]) vehicles.toArray(new String[0]);
		}
		public void setVehicles(ArrayList<String> vehicles) {
			this.vehicles = vehicles;
		}
		public ArrayList<Hall> getHalls() {
			return halls;
		}
		public void setHalls(ArrayList<Hall> halls) {
			this.halls = halls;
		}
		public Coordinate getCoordinate() {
			return coordinate;
		}
		public void setCoordinate(Coordinate coordinate) {
			this.coordinate = coordinate;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public int getVehicleOutput() {
			return vehicleOutput;
		}
		public int getNumOfVehicles() {
			return vehicleOutput;
		}
		public void setVehicleOutput(int vehicleOutput) {
			this.vehicleOutput = vehicleOutput;
		}
	}
	
	public static class Coordinate{
		public double latitude;
		public double longitude;
	}
	
	public static class Hall extends Node{
		private String name;
		private String type;
		private ArrayList<String> vehicles;
		private ArrayList<Line> lines;
		private String path;
		private int staff;
		private int capacity;
		@JsonBackReference public Factory parent;
		
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
		public ArrayList<String> getVehicles() {
			return vehicles;
		}
		public void setVehicles(ArrayList<String> vehicles) {
			this.vehicles = vehicles;
		}
		public ArrayList<Line> getLines() {
			return lines;
		}
		public void setLines(ArrayList<Line> lines) {
			this.lines = lines;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public int getStaff() {
			return staff;
		}
		public int getSizeOfStaff(){
			return staff;
		}
		public void setStaff(int staff) {
			this.staff = staff;
		}
		public int getCapacity() {
			return capacity;
		}
		public int getProductionCapacity(){
			return capacity;
		}
		public void setCapacity(int capacity) {
			this.capacity = capacity;
		}
		
	}
	
	public static class Line extends Node{
		private String name;
		private ArrayList<Location> locations;
		private String path;
		@JsonBackReference public Hall parent;

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
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
	}
	
	public static class Location extends Node{
		private String name;
		private ArrayList<Component> components;
		@JsonBackReference public Line parent;

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
	
	public static class Component extends Node{
		private String type;
		@JsonBackReference public Location parent;

		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
	}
}
