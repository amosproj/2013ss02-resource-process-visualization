package de.osramos.reprovis.test.daotests;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import de.osramos.reprovis.TestingDeviceDAO;

public class TestingDeviceDAOTest {
	
	@Test
	public void initTest(){
		List<Integer> testingDeviceIds = TestingDeviceDAO.getTestingDeviceIds(0);
		assertTrue( testingDeviceIds.size() == 3);
		assertTrue(testingDeviceIds.get(0) != testingDeviceIds.get(1));
		assertTrue(testingDeviceIds.get(2) != testingDeviceIds.get(1));
	}

}
