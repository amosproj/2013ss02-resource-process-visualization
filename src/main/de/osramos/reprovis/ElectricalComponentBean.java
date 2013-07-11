package de.osramos.reprovis;

import java.util.Date;
import java.util.List;



public class ElectricalComponentBean extends HierarchieElementBean {
	
	private String serialnumber;
	private String category;
	private Date troubeOccurrenceTime;
	private String troubleOccurrenceSite;
	private String sector;
	private String shiftResponsibility;
	

	public ElectricalComponentBean(int id)  {
		
		super(id);

		
		setSerialnumber(ElectricalComponentDAO.getSerialnumber(id));
		setCategory(ElectricalComponentDAO.getCategory(id));
		setTroubeOccurrenceTime(ElectricalComponentDAO.getTroubeOccurrenceTime(id));
		setTroubleOccurrenceSite(ElectricalComponentDAO.getTroubleOccurrenceSite(id));
		setSector(ElectricalComponentDAO.getSector(id));
		setShiftResponsibility(ElectricalComponentDAO.getShiftResponsibility(id));
	}

	@Override
	protected void initChilds() {
		childs = null;
		
	}

	public String getShiftResponsibility() {
		return shiftResponsibility;
	}

	private void setShiftResponsibility(String shiftResponsibility) {
		this.shiftResponsibility = shiftResponsibility;
	}

	public String getSector() {
		return sector;
	}

	private void setSector(String sector) {
		this.sector = sector;
	}

	public String getTroubleOccurrenceSite() {
		return troubleOccurrenceSite;
	}

	private void setTroubleOccurrenceSite(String troubleOccurrenceSite) {
		this.troubleOccurrenceSite = troubleOccurrenceSite;
	}

	public Date getTroubeOccurrenceTime() {
		return troubeOccurrenceTime;
	}

	private void setTroubeOccurrenceTime(Date troubeOccurrenceTime) {
		this.troubeOccurrenceTime = troubeOccurrenceTime;
	}

	public String getCategory() {
		return category;
	}

	private void setCategory(String category) {
		this.category = category;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	private void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

/*	@Override
	public List<HierarchieElementBean> getChilds() throws HierarchieException{
		throw new HierarchieException("Element has no childs");
	}*/

}
