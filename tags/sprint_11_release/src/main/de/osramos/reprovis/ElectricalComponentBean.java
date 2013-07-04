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

import java.io.IOException;

import java.util.Date;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.MasterData.TrafficLight;

public class ElectricalComponentBean extends HierarchieElementBean {

	private String serialnumber;
	private String category;
	private Date troubeOccurrenceTime;
	private String troubleOccurrenceSite;
	private String sector;
	private String shiftResponsibility;

	public ElectricalComponentBean(int id) throws HierarchieException {

		super(id);

		try {
			this.aggreagationStrategie = ElectricalComponentDAO.getAggreagationStrategie(id);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void initChilds() {
		childs = null;

	}
	
	
	public String getName(){
		try {
			return ElectricalComponentDAO.getName(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}
	
	public String getValue(){
		try {
			return ElectricalComponentDAO.getValue(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}
	

	public String getShiftResponsibility() {
		try {
		return ElectricalComponentDAO
					.getShiftResponsibility(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}



	public String getSector() {
		try {
			return ElectricalComponentDAO.getSector(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}


	public String getTroubleOccurrenceSite() {
		try {
			return ElectricalComponentDAO
					.getTroubleOccurrenceSite(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}

	public Date getTroubeOccurrenceTime() {
		try {
			return ElectricalComponentDAO
					.getTroubeOccurrenceTime(id);
		} catch (DatabaseException e) {
		}
		return null;
	}


	public String getCategory() {
		try {
			return ElectricalComponentDAO.getCategory(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}


	public String getSerialnumber() {
		try {
			return ElectricalComponentDAO.getSerialnumber(id);
		} catch (DatabaseException e) {
		}
		return "N/A";
	}

	
	@Override
	public TrafficLight getDistinctStatus() {
		
		try {
			return ElectricalComponentDAO.getStatus(id);
		} catch (DatabaseException e) {
		}
		return TrafficLight.grey;

	}

	

	

}
