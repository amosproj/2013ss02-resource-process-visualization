package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.List;

public class LocationDAO {

	public static List<Integer> getLocationIds(int id) {
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < 3; i++)
		{
			l.add(id * 10 +i);
		}

		return l;
	}

}
