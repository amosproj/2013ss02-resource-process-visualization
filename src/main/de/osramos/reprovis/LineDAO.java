package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.List;

import de.osramos.reprovis.MasterData.TrafficLight;

public class LineDAO {

	public static List<LineBean> getLines(){
		return null;
		
	}

	public static List<Integer> getLineIds(int id) {
		
		int n = id %3 +2;
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < n; i++)
		{
			l.add(id * 100 +i);
		}

		return l;
	}

	public static String getName(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static TrafficLight getStatus(int id) {
		int r = ((int)(Math.random()*100))%10;
		if (r < 8){
			return TrafficLight.green;
		} else if (r < 9){
			return TrafficLight.yellow;
		} else {
			return TrafficLight.red;
		}
	}
	
}
