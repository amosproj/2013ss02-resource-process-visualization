package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestingDeviceBean extends HierarchieElementBean {

	private String serialnumber;
	private String componentCategory;
	private Date troublePeriod;
	private boolean testFailure;
	private String sector;

	public TestingDeviceBean(int id) {
		super(id);

		this.setSerialnumber(TestingDeviceDAO.getSerialnumber(id));
		this.setComponentCategory(TestingDeviceDAO.getComponentCategory(id));
		this.setTroublePeriod(TestingDeviceDAO.getTroublePeriod(id));
		this.setTestFailure(TestingDeviceDAO.getTestFailure(id));
		this.setSector(TestingDeviceDAO.getSector(id));
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = ElectricalComponentDAO
					.getElectricalComponentIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				ElectricalComponentBean childBean = new ElectricalComponentBean(
						id);

				childBean.setParent(this);

				childs.add(childBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String getSector() {
		return sector;
	}

	private void setSector(String sector) {
		this.sector = sector;
	}

	public boolean isTestFailure() {
		return testFailure;
	}

	private void setTestFailure(boolean testFailure) {
		this.testFailure = testFailure;
	}

	public Date getTroublePeriod() {
		return troublePeriod;
	}

	private void setTroublePeriod(Date troublePeriod) {
		this.troublePeriod = troublePeriod;
	}

	public String getComponentCategory() {
		return componentCategory;
	}

	private void setComponentCategory(String componentCategory) {
		this.componentCategory = componentCategory;
	}

	public String getSerialnumber() {
		return serialnumber;
	}

	private void setSerialnumber(String serialnumber) {
		this.serialnumber = serialnumber;
	}

}
