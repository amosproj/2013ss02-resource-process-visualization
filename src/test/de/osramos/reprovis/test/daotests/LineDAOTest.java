package de.osramos.reprovis.test.daotests;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import de.osramos.reprovis.LineDAO;
import de.osramos.reprovis.TestingDeviceDAO;

public class LineDAOTest {

	
	@Test
	public void initTest(){
		assertTrue( LineDAO.getLineIds(0).size() > 2);
	}
}
