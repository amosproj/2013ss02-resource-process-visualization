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
import de.osramos.reprovis.handler.MasterData.TrafficLight;

public class ElectricalComponentBean extends HierarchieElementBean {

	private String serialnumber;
	private String category;
	private Date troubeOccurrenceTime;
	private String troubleOccurrenceSite;
	private String sector;
	private String shiftResponsibility;

	public ElectricalComponentBean(int id) {

		super(id);

		try {
			setSerialnumber(ElectricalComponentDAO.getSerialnumber(id));
			setCategory(ElectricalComponentDAO.getCategory(id));
			setTroubeOccurrenceTime(ElectricalComponentDAO
					.getTroubeOccurrenceTime(id));
			setTroubleOccurrenceSite(ElectricalComponentDAO
					.getTroubleOccurrenceSite(id));
			setSector(ElectricalComponentDAO.getSector(id));
			setShiftResponsibility(ElectricalComponentDAO
					.getShiftResponsibility(id));
			this.aggreagationStrategie = ElectricalComponentDAO.getAggreagationStrategie(id);
		} catch (DatabaseException e) {
			e.printStackTrace();
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	public String getValue(){
		try {
			return ElectricalComponentDAO.getValue(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	

	public String getShiftResponsibility() {
		try {
			setShiftResponsibility(ElectricalComponentDAO
					.getShiftResponsibility(id));
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return shiftResponsibility != null ? shiftResponsibility : "";
	}

	private void setShiftResponsibility(String shiftResponsibility) {
		this.shiftResponsibility = shiftResponsibility;
	}

	public String getSector() {
		try {
			setSector(ElectricalComponentDAO.getSector(id));
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sector != null? sector : "";
	}

	private void setSector(String sector) {
		this.sector = sector;
	}

	public String getTroubleOccurrenceSite() {
		try {
			setTroubleOccurrenceSite(ElectricalComponentDAO
					.getTroubleOccurrenceSite(id));
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return troubleOccurrenceSite != null ? troubleOccurrenceSite : "";
	}

	private void setTroubleOccurrenceSite(String troubleOccurrenceSite) {
		this.troubleOccurrenceSite = troubleOccurrenceSite;
	}

	public Date getTroubeOccurrenceTime() {
		try {
			setTroubeOccurrenceTime(ElectricalComponentDAO
					.getTroubeOccurrenceTime(id));
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return troubeOccurrenceTime;
	}

	private void setTroubeOccurrenceTime(Date troubeOccurrenceTime) {
		this.troubeOccurrenceTime = troubeOccurrenceTime;
	}

	public String getCategory() {
		try {
			setCategory(ElectricalComponentDAO.getCategory(id));
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category != null ? category : "";
	}

	private void setCategory(String category) {
		this.category = category;
	}

	public String getSerialnumber() {
		try {
			setSerialnumber(ElectricalComponentDAO.getSerialnumber(id));
		} catch (DatabaseException e) {
			e.printStackTrace();
		}
		return serialnumber != null ? serialnumber : "";
	}

	private void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

	
	@Override
	public TrafficLight getDistinctStatus() {
		
		try {
			return ElectricalComponentDAO.getStatus(id);
		} catch (DatabaseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	

}