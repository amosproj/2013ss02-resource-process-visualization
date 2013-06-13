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

public class HallDAO {



	public static String getName(int id) {
		return "Hall" + id;
	}
	
	public static TrafficLight getStatus (int id){
		int r = ((int)(Math.random()*100))%10;
		if (r < 6){
			return TrafficLight.green;
		} else if (r < 8){
			return TrafficLight.yellow;
		} else {
			return TrafficLight.red;
		}
	}

	public static FactoryBean getFactory(int id) {
/*
		return new FactoryBean( (int) (id/10) );*/
		return null;
	}

	public static int getSizeOfStaff(int id) {
		// TODO Auto-generated method stub
		return 300;
	}

	public static String getPath(int id) {
		if (id == 1){
			return "m 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z";
		}
		if (id == 2){
			return "m 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z";
		}
		else{
			return "m 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z";
		}
	}
	
	public static int getProductionCapacity() {
		// TODO Auto-generated method stub
		return 8000;
	}

	private static int count = 0;
	
	public static List<Integer> getHallIds(int factoryId) {
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i =1; i < 5; i++)
		{
			l.add(i*10 + count);
		}

		return l;
	}
	


}
