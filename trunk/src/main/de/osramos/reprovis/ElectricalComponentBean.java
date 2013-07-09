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
import de.osramos.reprovis.handler.Registry;

public class ElectricalComponentBean extends HierarchieElementBean {

	private String serialnumber;
	private String category;
	private Date troubeOccurrenceTime;
	private String troubleOccurrenceSite;
	private String sector;
	private String shiftResponsibility;
	private String name;
	private String value;

	public ElectricalComponentBean(int id, HierarchieElementBean parent, Registry registry) throws HierarchieException {

		super(id, parent, registry);
		
		initCategory();
		initName();
		initSector();
		initSerialnumber();
		initShiftResponsibility();
		initTroubeOccurrenceTime();
		initTroubleOccurrenceSite();
		initValue();

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
	
	public void initName(){
		try {
			name = ElectricalComponentDAO.getName(id);
		} catch (DatabaseException e) {
			name = "N/A";
		}
		
	}
	
	public void initValue(){
		try {
			value = ElectricalComponentDAO.getValue(id);
		} catch (DatabaseException e) {
			value = "N/A";
		}
		
	}
	

	public void initShiftResponsibility() {
		try {
		shiftResponsibility = ElectricalComponentDAO
					.getShiftResponsibility(id);
		} catch (DatabaseException e) {
			shiftResponsibility = "N/A";
		}
		
	}



	public void initSector() {
		try {
			sector = ElectricalComponentDAO.getSector(id);
		} catch (DatabaseException e) {
			sector = "N/A";
		}
		
	}


	public void initTroubleOccurrenceSite() {
		try {
			troubleOccurrenceSite = ElectricalComponentDAO
					.getTroubleOccurrenceSite(id);
		} catch (DatabaseException e) {
			troubleOccurrenceSite = "N/A";
		}
		
	}

	public void initTroubeOccurrenceTime() {
		try {
			troubeOccurrenceTime = ElectricalComponentDAO
					.getTroubeOccurrenceTime(id);
		} catch (DatabaseException e) {
			troubeOccurrenceTime = null;
		}
		
	}


	public void initCategory() {
		try {
			category = ElectricalComponentDAO.getCategory(id);
		} catch (DatabaseException e) {
			category = "N/A";
		}
		
	}


	public void initSerialnumber() {
		try {
			serialnumber = ElectricalComponentDAO.getSerialnumber(id);
		} catch (DatabaseException e) {
			serialnumber = "N/A";
		}
		
	}
	
	
	public String getName(){
		return name;
	}
	
	public String getValue(){
		return value;
	}
	

	public String getShiftResponsibility() {
		return shiftResponsibility;
	}



	public String getSector() {
		return sector;
	}


	public String getTroubleOccurrenceSite() {
		return troubleOccurrenceSite;
	}

	public Date getTroubeOccurrenceTime() {
		return troubeOccurrenceTime;
	}


	public String getCategory() {
		return category;
	}


	public String getSerialnumber() {
		return serialnumber;
	}

	
	@Override
	public TrafficLight getDistinctStatus() {
		
		try {
			return ElectricalComponentDAO.getStatus(id);
		} catch (DatabaseException e) {
		}
		return TrafficLight.grey;

	}

	@Override
	protected void initAttributes() {
		// TODO Auto-generated method stub
		
	}

	

	

}
