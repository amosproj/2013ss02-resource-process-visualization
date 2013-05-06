package de.osramos.reprovis;

import java.util.List;

import de.osramos.reprovis.MasterData.TrafficLight;

public abstract class HierarchieElementBean {

	protected int id;
	protected List<HierarchieElementBean> childs;
	protected HierarchieElementBean parent;

	public HierarchieElementBean(int id) {
		this.id = id;
		try {
			initChilds();
		} catch (Exception e) {
		}
	}

	protected void setParent(HierarchieElementBean parent) throws Exception {
		if (parent != null) {
			throw new Exception("Element already initialized.");
		}

		this.parent = parent;
	}

	public int getId() {
		return id;
	}

	public HierarchieElementBean getParent() {
		return parent;
	}

	public List<HierarchieElementBean> getChilds() {
		return childs;
	}

	public TrafficLight getStatus() throws Exception {

		try {
			return computeMinimalStatus();
		} catch (Exception e1) {
		}
		try {
			return getDistinctStatus();
		} catch (Exception e) {
		}
		throw new Exception("Element has no status");
	}

	protected TrafficLight computeMinimalStatus() throws Exception {

		TrafficLight status = TrafficLight.green;
		if (childs == null){
			throw new Exception("no child Elements");
		}
		for (HierarchieElementBean child : childs) {
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

	protected TrafficLight getDistinctStatus() throws Exception {
		throw new Exception("Element has no distinct status");
	}

	protected abstract void initChilds() throws Exception;

}
