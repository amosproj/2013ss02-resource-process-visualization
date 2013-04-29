package de.osramos.reprovis.test;

import org.junit.*;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.GlobalBean;
import static org.junit.Assert.*;

public class FactoryBeanTest {
	
	@Test
	public void FactoryTest(){
		FactoryBean f = new FactoryBean(1);
		assertNotNull(f.getCompany());
		assertNotNull(f.getCountry());
		assertNotNull(f.getGlobal());
		assertNotNull(f.getHalls());
		assertNotNull(f.getId());
		assertNotNull(f.getName());
		
	}
	
	@Test
	public void FactoryGlobalTest(){
		GlobalBean g = GlobalBean.getGlobal();
		FactoryBean f = new FactoryBean(1);
		
		assertEquals(g, f.getGlobal());
	}

}
