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

import java.io.InputStream;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class MasterData {

	public static String getConfigFile() {
		String path;
		InputStream resource;

		path = "../../config.xml";
		resource = MasterData.class.getClassLoader().getResourceAsStream(path);
		if (resource != null) {

			return path;
		}


		return "config.xml";

	}

	public enum Company {
		Audi, Volkswagen, Skoda, Seat
	}

	public static Company stringToCompany(String string) {
		if (string.equals("Audi")) {
			return Company.Audi;
		}
		if (string.equals("Volkswagen")) {
			return Company.Volkswagen;
		}
		if (string.equals("Skoda")) {
			return Company.Skoda;
		}
		if (string.equals("Seat")) {
			return Company.Seat;
		}
		return null;
	}

	public enum TrafficLight {
		red, yellow, green
	}
	
	public static TrafficLight stringToTrafficLight(String string) {
		if (string.equals(TrafficLight.yellow.name())) {
			return TrafficLight.yellow;
		}
		if (string.equals(TrafficLight.red.name())) {
			return TrafficLight.red;
		}
		if (string.equals(TrafficLight.green.name())) {
			return TrafficLight.green;
		}
		return null;
	}

	public static String getTrafficIconClass(TrafficLight status) {
		switch (status) {
		case red:
			return "statusIconCritical";
		case yellow:
			return "statusIconWarning";
		default:
			return "statusIconOk";
		}
	}

	public static String getHallClass(TrafficLight status) {
		switch (status) {
		case red:
			return "statusHallCritical";
		case yellow:
			return "statusHallWarning";
		default:
			return "statusHallOk";
		}
	}
	
	public static Class getHierarchieClassByString(String className){
		if (className.equals("Factory")) {
			return FactoryBean.class;
		}
		if (className.equals("Hall")) {
			return HallBean.class;
		}
		if (className.equals("Line")) {
			return LineBean.class;
		}
		if (className.equals("Location")) {
			return LocationBean.class;
		}
		if (className.equals("TestingDevice")) {
			return TestingDeviceBean.class;
		}
		if (className.equals("ElectricalComponent")) {
			return ElectricalComponentBean.class;
		}
		return null;
	}
}
