package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.List;

import de.osramos.reprovis.MasterData.TrafficLight;

public class HallDAO {

	public static List<Integer> getHallIds(int FactoryId) {
		
		int n = FactoryId %3 +2;
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < n; i++)
		{
			l.add(FactoryId * 10 +i);
		}

		return l;
	}

	public static String getName(int id) {
		return "Hall" + id;
	}
	
	public static TrafficLight getStatus (int id){
		int r = ((int)(Math.random()*100))%10;
		if (r < 6){
			return TrafficLight.green;
		} else if (r < 8){
			return TrafficLight.yellow;
		} else {
			return TrafficLight.red;
		}
	}

	public static FactoryBean getFactory(int id) {

		return new FactoryBean( (int) (id/10) );
	}

	public static int getSizeOfStaff(int id) {
		// TODO Auto-generated method stub
		return 300;
	}

	public static int getProductionCapacity() {
		// TODO Auto-generated method stub
		return 8000;
	}
	


}
