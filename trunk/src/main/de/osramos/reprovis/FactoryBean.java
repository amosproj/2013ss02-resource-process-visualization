package de.osramos.reprovis;

import java.util.List;

public class FactoryBean {

	private String name;	
	private String country; //later: private Country country;
	private String gpsLocation;
	private String city;
	private List<String> productionHalls; //later: private List<Hall> productionHalls;

	public String getName(){
		return name;
	}
	
	public String getCountry(){
		return country;
	}
	
	public String getCity(){
		return city;
	}
	
	public String getGpsLocation(){
		return gpsLocation;
	}
	
	public List<String> getProductionHalls(){
		return productionHalls;
	}
	
	public FactoryBean(String id){
		FactoryDAO f = new FactoryDAO(id);
		name = f.getName();
		country = f.getCountry();
		city = f.getCity();
		gpsLocation = f.getGpsLocation();
		productionHalls = f.getProductionHalls();
		
	}
	

}
