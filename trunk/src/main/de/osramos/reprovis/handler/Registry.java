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
	
	public void register(int id, HierarchieElementBean element){
		reg.put(id, element);
	}
	
	private Registry(){
		reg = new TreeMap<Integer, Object>();
	}
	
	public HierarchieElementBean lookup(int id){
		return (HierarchieElementBean) reg.get(id);
	}

}
