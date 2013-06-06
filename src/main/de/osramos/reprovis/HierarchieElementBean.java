package de.osramos.reprovis;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import de.osramos.reprovis.MasterData.TrafficLight;

public abstract class HierarchieElementBean {

	protected int id;
	protected List<HierarchieElementBean> childs;
	protected HierarchieElementBean parent;

	public HierarchieElementBean(int id)  {
		
/*		try {*/
			this.id = id;
		/*	Context ctx = new InitialContext();
			ctx.bind("de.osramos/reprovis/HierarchieElement" +id, this);*/
/*		} catch (NamingException e1) {
			throw new Exception("could not bind to registry");
		}*/
	
			Registry.getRegistry().reg.put(id, this);
		
			initChilds();
	
	
	}
	
	public static HierarchieElementBean getElementById(int id){
		
/*		try {
			Context ctx = new InitialContext();
			return (HierarchieElementBean) ctx.lookup("de.osramos/reprovis/HierarchieElement/"+id);
		} catch (NamingException e) {
			return null;
		}	*/
		return (HierarchieElementBean) Registry.getRegistry().lookup(id);
	}

	protected void setParent(HierarchieElementBean parent) throws Exception {
	/*	if (parent != null) {
			throw new Exception("Element already initialized.");
		}*/

		this.parent = parent;
	}

	public int getId() {
		return id;
	}

	public HierarchieElementBean getParent() throws HierarchieException {
		return parent;
	}

	public List<HierarchieElementBean> getChilds() {
		return childs;
	}

	public TrafficLight getStatus() throws HierarchieException {

		try {
			return computeMinimalStatus();
		} catch (Exception e1) {
		}
		try {
			return getDistinctStatus();
		} catch (Exception e) {
		}
		throw new HierarchieException("Element has no status");
	}

	protected TrafficLight computeMinimalStatus() throws HierarchieException {

		TrafficLight status = TrafficLight.green;
		double rand = Math.random();
		if(rand > 0.5)return TrafficLight.green;
		else if(rand > 0.25)return TrafficLight.yellow;
		else if(rand >= 0)return TrafficLight.red;
		if (childs == null){
			return status;
			//throw new HierarchieException("no child Elements");
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

	protected TrafficLight getDistinctStatus() throws HierarchieException {
		throw new HierarchieException("Element has no distinct status");
	}

	protected abstract void initChilds();

}
