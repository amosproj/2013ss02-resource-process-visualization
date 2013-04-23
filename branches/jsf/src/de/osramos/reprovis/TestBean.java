package de.osramos.reprovis;

import javax.faces.bean.*;

@ManagedBean
public class TestBean{
	private String property;

	public String getProperty(){
		return property;
	}

	public void setProperty(String property){
		this.property = property;
	}

	public String actionController(){
		return "page-b";
	}
}
