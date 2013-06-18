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

import de.osramos.reprovis.exception.DatabaseException;

public class ConfigHandler {

	public static void InitApplication(){
		
		
		try {
			Registry.cleanRegistry();
			Database.initDB();
			Registry.initRegistry();
			
			FactoryDAO.resetCache();
			HallDAO.resetCache();
			LineDAO.resetCache();
			LocationDAO.resetCache();
			TestingDeviceDAO.resetCache();
			ElectricalComponentDAO.resetCache();
			
			GlobalBean.resetGlobal();
		} catch (DatabaseException e) {
			
			e.printStackTrace();
		}
		
		
	}
	
}
