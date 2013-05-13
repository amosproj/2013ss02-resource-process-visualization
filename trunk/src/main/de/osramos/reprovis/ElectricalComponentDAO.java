package de.osramos.reprovis;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ElectricalComponentDAO {




	public static String getShiftResponsibility(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static String getCategory(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static Date getTroubeOccurrenceTime(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static String getTroubleOccurrenceSite(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static String getSector(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static String getSerialnumber(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public static List<Integer> getElectricalComponentIds(int id) {
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < 3; i++)
		{
			l.add(id * 10 +i);
		}

		return l;
	}


}
