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

import de.osramos.reprovis.MasterData.TrafficLight;




public class LineBean extends HierarchieElementBean {

	String name;
	private String path;
	
	
	public LineBean(int id) throws Exception {
		super(id);
		
		/*try {
			Context ctx = new InitialContext();
			ctx.bind("de.orsamos/reprovis/factory/"+id, this);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		name = LineDAO.getName(id);
		path = LineDAO.getPath(id);
		
	}

	@Override
	protected void initChilds() throws Exception  {
		childs = null;
		throw new Exception("Element has no Childs");
		
	}

	@Override
	protected TrafficLight getDistinctStatus(){
		return LineDAO.getStatus(id);
		
	}
	
	public String getName(){
		return name;
	}

	public String getPath(){
		return path;
	}
}
