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

import de.osramos.reprovis.MasterData.TrafficLight;

public class LineDAO {

	public static List<LineBean> getLines(){
		return null;
		
	}

	public static List<Integer> getLineIds(int id) {
		
		int n = id %3 +2;
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < n; i++)
		{
			l.add(id * 100 +i);
		}

		return l;
	}

	public static String getName(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static TrafficLight getStatus(int id) {
		int r = ((int)(Math.random()*100))%10;
		if (r < 8){
			return TrafficLight.green;
		} else if (r < 9){
			return TrafficLight.yellow;
		} else {
			return TrafficLight.red;
		}
	}
	
}
