package de.osramos.reprovis;

import de.osramos.reprovis.MasterData.TrafficLight;
import de.osramos.reprovis.TestData.Component;
import de.osramos.reprovis.TestData.Factory;
import de.osramos.reprovis.TestData.Hall;
import de.osramos.reprovis.TestData.Line;
import de.osramos.reprovis.TestData.Location;

public class TestDataUpdater extends Thread {

	private TestData data;
	public TestDataUpdater(TestData data){
		this.data = data;
	}
	
	public void run(){
		/*Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource datasource = (DataSource) ctx.lookup("java:comp/env/jdbc/postgresql");
			//conn = datasource.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}*/
		
		while(true){
			setRandomStatus();
			try {
				sleep(1000);
			} catch (InterruptedException e) {
			}
		}
	}
	
	private void setRandomStatus(){
		for(Factory f: data.getFactories()){
			f.setStatus(generateRandomStatus());
			for(Hall h: f.getHalls()){
				h.setStatus(generateRandomStatus());
				for(Line l: h.getLines()){
					l.setStatus(generateRandomStatus());
					for(Location loc: l.getLocations()){
						loc.setStatus(generateRandomStatus());
						for(Component c: loc.getComponents()){
							c.setStatus(generateRandomStatus());
						}
					}
				}
			}
		}
	}
	
	private TrafficLight generateRandomStatus(){
		double rand = Math.random();
		if(rand > 0.5)return TrafficLight.green;
		if(rand > 0.25)return TrafficLight.yellow;
		return TrafficLight.red;
	}
}
