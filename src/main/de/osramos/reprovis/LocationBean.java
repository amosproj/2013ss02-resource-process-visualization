package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.List;

public class LocationBean extends HierarchieElementBean {

	public LocationBean(int id) {
		super(id);
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void initChilds() {
		try {
			List<Integer> childIds = TestingDeviceDAO.getTestingDeviceIds(id);
			childs = new ArrayList<HierarchieElementBean>();
			for (int id : childIds) {
				TestingDeviceBean childBean = new TestingDeviceBean(id);
				childBean.setParent(this);
				childs.add(childBean);
			}
		} catch (Exception e) {
		}
	}

}
