package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.List;

import de.osramos.reprovis.MasterData.TrafficLight;

public class HallDAO {

	public static List<Integer> getHallIds(int FactoryId) {
		
	
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 1; i < 5; i++)
		{
			l.add(i);
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

	public static String getPath(int id) {
		if (id == 1){
			return "m 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z";
		}
		if (id == 2){
			return "m 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z";
		}
		else{
			return "m 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z";
		}
	}
	
	public static int getProductionCapacity() {
		// TODO Auto-generated method stub
		return 8000;
	}
	


}
