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


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import de.osramos.reprovis.MasterData.TrafficLight;
import de.osramos.reprovis.exception.DatabaseException;

public class ElectricalComponentDAO extends HierarchieElementDAO {


	public static TrafficLight getStatus(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "status");

		return MasterData.stringToTrafficLight(s);
	}

	public static String getShiftResponsibility(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "shiftresponsibility");

		return s;
	}

	public static String getCategory(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "category");

		return s;
	}

	public static Date getTroubeOccurrenceTime(int id) throws DatabaseException {
		Timestamp t = (Timestamp) getAttribute(id, "troubleoccurrencetime");

		return new Date(t.getTime());
	}

	public static String getTroubleOccurrenceSite(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "troubleoccurrencesite");

		return s;
	}

	public static String getSector(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "sector");

		return s;
	}

	public static String getSerialnumber(int id) throws DatabaseException {
		String s = (String) getAttribute(id, "serialnumber");

		return s;
	}

	public static List<Integer> getElectricalComponentIds(int id) throws Exception {
		List<Integer> l = getChildIds(id, "component");
		
		return l;
	}
	
	
	private static Object getAttribute(int id, String attributeName) throws DatabaseException {
		
		return HierarchieElementDAO.getAttribute(id, attributeName, "component");
	}

}
