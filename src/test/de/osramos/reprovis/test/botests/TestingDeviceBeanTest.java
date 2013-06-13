package de.osramos.reprovis.test.botests;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;

import de.osramos.reprovis.ElectricalComponentBean;
import de.osramos.reprovis.ElectricalComponentDAO;
import de.osramos.reprovis.Registry;
import de.osramos.reprovis.TestingDeviceBean;


public class TestingDeviceBeanTest {

	@Test
	public void initTest(){
		TestingDeviceBean b = new TestingDeviceBean(1);
		List<Integer> childIds = ElectricalComponentDAO
				.getElectricalComponentIds(0);

		
		assertTrue(b.getChilds().size() == childIds.size());
		assertTrue(Registry.getRegistry().reg.size() == childIds.size() + 1);

	}
}
