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

import java.util.List;

import de.osramos.reprovis.ElectricalComponentBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.TestingDeviceBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.MasterData;
import de.osramos.reprovis.handler.MasterData.TrafficLight;

public class PercentageAggregationStrategy implements AggreagationStrategie {

	private Class aggregationLevel = ElectricalComponentBean.class;
	private float redPercentageForRed = 20;
	private float yellowPercentageForRed = 40;
	private float redPercentageForYellow = 20;
	private float yellowPercentageForYellow = 40;

	public PercentageAggregationStrategy(float redPercentageForRed,
			float yellowPercentageForRed, float redPercentageForYellow,
			float yellowPercentageForYellow, Class aggregationLevel) {

		this.setRedPercentageForRed(redPercentageForRed);
		this.setYellowPercentageForRed(yellowPercentageForRed);
		this.setRedPercentageForYellow(redPercentageForYellow);
		this.setYellowPercentageForYellow(yellowPercentageForYellow);
		this.setAggregationLevel(aggregationLevel);
	}

	@Override
	public TrafficLight aggregate(HierarchieElementBean element)
			throws HierarchieException {

		if (this.getClass().equals(getAggregationLevel())) {
			throw new HierarchieException("aggregation level reached");
		}

		List<HierarchieElementBean> l = element
				.getChildsByClass(getAggregationLevel());

		if (l == null) {
			throw new HierarchieException("Element has no childs with class "
					+ getAggregationLevel());
		}

		try {
			if (element instanceof TestingDeviceBean) {
				for (HierarchieElementBean h : element.getChilds()) {
					if (h.getStatus().equals(TrafficLight.grey)) {
						ElectricalComponentBean e = (ElectricalComponentBean) h;
						if (e.getName().equals("Tests")
								|| e.getName().equals("Network")) {
							return TrafficLight.grey;
						}
					}
				}
			}
		} catch (Exception e) {

		}

		int red = 0;
		int yellow = 0;
		int green = 0;

		for (HierarchieElementBean h : l) {
			if (h.getStatus().equals(TrafficLight.green)) {
				green++;
			} else if (h.getStatus().equals(TrafficLight.yellow)) {
				yellow++;
			} else if (h.getStatus().equals(TrafficLight.red)) {
				red++;
				yellow++;
			}

		}

		float total = red + yellow + green;

		if (getRedPercentageForRed() < (red / total) * 100) {
			return TrafficLight.red;
		}
		if (getYellowPercentageForRed() < (yellow / total) * 100) {
			return TrafficLight.red;
		}
		if (getRedPercentageForYellow() < (red / total) * 100) {
			return TrafficLight.yellow;
		}
		if (getYellowPercentageForYellow() < (yellow / total) * 100) {
			return TrafficLight.yellow;
		}
		if (green > 0) {
			return TrafficLight.green;
		}

		return TrafficLight.grey;
	}

	public float getRedPercentageForRed() {
		return redPercentageForRed;
	}

	public void setRedPercentageForRed(float redPercentageForRed) {
		this.redPercentageForRed = redPercentageForRed;
	}

	public float getYellowPercentageForRed() {
		return yellowPercentageForRed;
	}

	public void setYellowPercentageForRed(float yellowPercentageForRed) {
		this.yellowPercentageForRed = yellowPercentageForRed;
	}

	public float getRedPercentageForYellow() {
		return redPercentageForYellow;
	}

	public void setRedPercentageForYellow(float redPercentageForYellow) {
		this.redPercentageForYellow = redPercentageForYellow;
	}

	public float getYellowPercentageForYellow() {
		return yellowPercentageForYellow;
	}

	public void setYellowPercentageForYellow(float yellowPercentageForYellow) {
		this.yellowPercentageForYellow = yellowPercentageForYellow;
	}

	public Class getAggregationLevel() {
		return aggregationLevel;
	}

	public void setAggregationLevel(Class aggregationLevel) {
		this.aggregationLevel = aggregationLevel;
	}

	public String toString() {
		return "PercentageAggregationStrategie(" + aggregationLevel + ", "
				+ redPercentageForRed + ", " + yellowPercentageForRed + ", "
				+ redPercentageForYellow + ", " + yellowPercentageForYellow
				+ ")";
	}

}
