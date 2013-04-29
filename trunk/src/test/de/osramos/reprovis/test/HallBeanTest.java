package de.osramos.reprovis.test;

import org.junit.*;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.HallBean;
import static org.junit.Assert.*;

public class HallBeanTest {
	
	@Test
	public void HallTest(){
		HallBean hall = new HallBean(1);
		assertNotNull(hall.getFactory());
		assertNotNull(hall.getName());
		assertNotNull(hall.getStatus());
	}

	@Test
	public void HallFactoryTest(){
		FactoryBean f = new FactoryBean(1);
		HallBean h = f.getHalls().get(0);
		
		assertEquals(f.getId(), h.getFactory().getId());
	}
}
