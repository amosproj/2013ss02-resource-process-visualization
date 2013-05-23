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
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class TestingDeviceDAO {



	
	public static List<Integer> getTestingDeviceIds(int id) {
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < 3; i++)
		{
			l.add(id * 10 +i);
		}

		return l;
	}

	public static String getSerialnumber(int id) {
		// TODO Auto-generated method stub
		return "0123456";
	}

	public static String getComponentCategory(int id) {
		// TODO Auto-generated method stub
		return "testCategory";
	}

	public static Date getTroublePeriod(int id) {
		GregorianCalendar.getInstance().getTime();
		return GregorianCalendar.getInstance().getTime();
	}

	public static boolean getTestFailure(int id) {
		double r = Math.random();
		if (r > 0.1d){
			return true;
		}
		return false;
	}

	public static String getSector(int id) {
		// TODO Auto-generated method stub
		return "testSector";
	}

}
