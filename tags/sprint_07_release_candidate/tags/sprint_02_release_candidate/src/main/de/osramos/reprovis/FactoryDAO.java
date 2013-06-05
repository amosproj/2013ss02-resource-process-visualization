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
import java.util.Arrays;
import java.util.List;

import de.osramos.reprovis.MasterData.Company;

public class FactoryDAO {

	public static String getCity(int id) {

		if (id == 1) {
			return "Ingolstadt";
		} else if (id == 2) {
			return "Neckarsulm";
		}
		return "TestCity" + id;
	}

	public static String getCountry(int id) {
		if ((id == 1) || (id == 2)) {
			return "Germany";
		}

		return "TestCountry" + id;
	}

	/*
	 * public static String getGpsLocation(int id) { return null; }
	 */

	public static String getName(int id) {

		if (id == 1) {
			return "AudiIngolstadt1";
		} else if (id == 2) {
			return "AudiNeckarsulm1";
		}
		return "AudiFactory" + id;
	}

	public static Company getCompany(int id) {
		if ((id == 1) || (id == 2))
		{
			return Company.Audi;
		}
		int i = id % 4;
		switch (i) {
		case 0:
			return Company.Audi;
		case 1:
			return Company.Seat;
		case 2:
			return Company.Volkswagen;
		case 3:
			return Company.Skoda;
		}
		return null;
	}

	public static List<Integer> getFactoryIds() {

		// get List by conf file/ DB

		List<Integer> l = new ArrayList<Integer>(Arrays.asList(1/*,2,3,4,5,6,7,8*/));
		return l;

	}

	public static String[] getCarModels(int id) {
		return new String[]{"Q7", "R8"};
	}

	public static int getSizeOfStaff(int id) {
		return 500;
	}

	public static int getNumOfVehicles(int id) {
		return 200;
	}



}
