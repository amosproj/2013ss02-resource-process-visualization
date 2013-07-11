package de.osramos.reprovis;

import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class TestingDeviceDAO {



	
	public static List<Integer> getTestingDeviceIds(int id) {
		List<Integer> l = new ArrayList<Integer>();
		
		for (int i = 0; i < 3; i++)
		{
			l.add(id * 10 +i);
		}

		return l;
	}

	public static String getSerialnumber(int id) {
		// TODO Auto-generated method stub
		return "0123456";
	}

	public static String getComponentCategory(int id) {
		// TODO Auto-generated method stub
		return "testCategory";
	}

	public static Date getTroublePeriod(int id) {
		GregorianCalendar.getInstance().getTime();
		return GregorianCalendar.getInstance().getTime();
	}

	public static boolean getTestFailure(int id) {
		double r = Math.random();
		if (r > 0.1d){
			return true;
		}
		return false;
	}

	public static String getSector(int id) {
		// TODO Auto-generated method stub
		return "testSector";
	}

}
