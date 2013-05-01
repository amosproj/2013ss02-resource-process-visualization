package de.osramos.reprovis;

import java.util.ArrayList;

public class Factory {
	private String name;
	private int staff;
	private String[] brands;
	private String[] vehicles;
	private ArrayList<ProductionHall> halls;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStaff() {
		return staff;
	}
	public void setStaff(int staff) {
		this.staff = staff;
	}
	public String[] getBrands() {
		return brands;
	}
	public void setBrands(String[] brands) {
		this.brands = brands;
	}
	public String[] getVehicles() {
		return vehicles;
	}
	public void setVehicles(String[] vehicles) {
		this.vehicles = vehicles;
	}
	public ArrayList<ProductionHall> getHalls() {
		return halls;
	}
	public void setHalls(ArrayList<ProductionHall> halls) {
		this.halls = halls;
	}
}
