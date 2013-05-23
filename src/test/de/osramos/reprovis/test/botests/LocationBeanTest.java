package de.osramos.reprovis.test.botests;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import de.osramos.reprovis.LocationBean;
import de.osramos.reprovis.LocationDAO;
import de.osramos.reprovis.TestingDeviceDAO;

public class LocationBeanTest {

	@Test
	public void initTest(){
		LocationBean b = new LocationBean(1);
		assertTrue(b.getChilds().size() == TestingDeviceDAO.getTestingDeviceIds(1).size());
	}
}
