package de.osramos.reprovis.test.daotests;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import de.osramos.reprovis.LocationDAO;
import de.osramos.reprovis.TestingDeviceDAO;

public class LocationDAOTest {

	
	@Test
	public void initTest(){
		assertTrue( LocationDAO.getLocationIds(0).size() > 2);
	}
}
