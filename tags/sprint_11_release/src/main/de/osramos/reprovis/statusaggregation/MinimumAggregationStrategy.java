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

package de.osramos.reprovis.statusaggregation;

import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.MasterData;
import de.osramos.reprovis.handler.MasterData.TrafficLight;

public class MinimumAggregationStrategy implements AggreagationStrategie{
	
	
	public MinimumAggregationStrategy(){
		
	}

	@Override
	public TrafficLight aggregate(HierarchieElementBean element) throws HierarchieException {
		TrafficLight status = TrafficLight.green;
		
		if(element.getChilds() == null || element.getChilds().isEmpty()){
			throw new HierarchieException("Element has no Childs");
		}

		for (HierarchieElementBean child : element.getChilds()) {
			// aggregate to worst status
			if (status == TrafficLight.green) {
				status = child.getStatus();
			} else if (status == TrafficLight.yellow) {
				if (child.getStatus() == TrafficLight.red) {
					status = TrafficLight.red;
				}
			}
		}
		return status;
	}
	
	public String toString(){
		return "MinimumAggregationStrategy";
	}


}
