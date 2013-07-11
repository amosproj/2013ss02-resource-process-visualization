package de.osramos.reprovis.test.botests;

import static org.junit.Assert.*;

import de.osramos.reprovis.Registry;
import org.junit.Test;

import de.osramos.reprovis.ElectricalComponentBean;

public class ElectricalComponentBeanTest {

	@Test
	public void initTest(){
		ElectricalComponentBean b = new ElectricalComponentBean(0);
		assertNotNull(b);
		assertNull(b.getChilds());
		assertTrue(Registry.getRegistry().reg.size() == 1);
	}
	
}
