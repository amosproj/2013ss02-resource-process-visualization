package de.osramos.reprovis;

import java.util.Map;
import java.util.TreeMap;

public class Registry {

	private static Registry registry;
	
	public Map<Integer, Object> reg;
	
	public static Registry getRegistry(){
		if (registry == null){
			registry = new Registry();
		}
		
		return registry;
	}
	
	public Registry(){
		reg = new TreeMap<Integer, Object>();
	}
	
	public Object lookup(int id){
		return reg.get(id);
	}
}
