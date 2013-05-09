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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;




public class GlobalBean {

	private static GlobalBean global;
	
	public Map<Integer, Object> reg;
	
	public static Object getElementById(int id){
		return getGlobal().reg.get(id);
	}
	
	private GlobalBean(){
		reg = new TreeMap<Integer, Object>();
		reg.put(0, this);
		
/*		try {
			Context ctx = new InitialContext();
			ctx.bind("de.osramos/reprovis/HierarchieElement/global", this);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
	}
	
	public static GlobalBean getGlobal(){
		if (global == null){
			global = new GlobalBean();
		}
		return global;
	}

	public List<FactoryBean> getFactories(){
		
		try{
			List<Integer> idList = FactoryDAO.getFactoryIds();
			List<FactoryBean> factoryList = new ArrayList<FactoryBean>();
			
			for(int id : idList){
				factoryList.add(new FactoryBean(id));
			}
			
			return factoryList;
		}
		catch(Exception e){
			
			return null;
		}
	}

	public int getId() {
		return 0;
	}
	
}
