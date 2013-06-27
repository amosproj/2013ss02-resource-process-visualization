package de.osramos.reprovis.test.daotests;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import de.osramos.reprovis.HallDAO;
import de.osramos.reprovis.TestingDeviceDAO;

public class HallDAOTest {

	
	@Test
	public void initTest(){
		assertTrue( HallDAO.getHallIds(0).size() > 2);
	}
}
