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



package de.osramos.reprovis.handler;

import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.ConcurrentHashMap;

import de.osramos.reprovis.HierarchieElementBean;

public class Registry {

	private static Registry registry;
	
	private Map<Integer, Object> reg;
	
	public static Registry getRegistry(){
		if (registry == null){
			initRegistry();
		}
		
		return registry;
	}
	
	public static void cleanRegistry(){
		registry = null;
	}
	
	public static void initRegistry(){
		registry = new Registry();
	}
	
	public static HierarchieElementBean getElementById(int id) {

		return (HierarchieElementBean) Registry.getRegistry().lookup(id);
	}
	
	public void register(int id, HierarchieElementBean element) throws Exception{
		
//		Object object = reg.get(id);
//		if (object == null || !(object instanceof HierarchieElementBean))
//		{
			reg.put(id, element);
//		}
//		else{
//			throw new Exception("Element already registered");
//		}
	}
	
	private Registry(){
		reg = new ConcurrentHashMap<Integer, Object>();
	}
	
	public HierarchieElementBean lookup(int id){
		return (HierarchieElementBean) reg.get(id);
	}
	
	private int nextId= 1000000;
	
	public int getNewId(){
		
		int start = nextId;
		
		while(reg.containsKey(nextId)){
			
			if (nextId != Integer.MAX_VALUE){
				nextId++;
			} else {
				nextId = 1;
			}
			if (nextId == start){
				throw new RuntimeException("no new id available");
			}
		}
		
		reg.put(nextId, new Object());
		return nextId;
		
	}

	public void remove(int id) {
		reg.remove(id);
		
	}

}
