package de.osramos.reprovis.test;

import static org.junit.Assert.*;

import org.junit.Test;

import de.osramos.reprovis.GlobalBean;

public class GlobalBeanTest {
	
	@Test
	public void GlobalBeanTest(){
		GlobalBean global = GlobalBean.getGlobal();
		assertNotNull(global.getFactories());
	}

}
