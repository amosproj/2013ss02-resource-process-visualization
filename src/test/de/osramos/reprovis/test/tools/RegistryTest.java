package de.osramos.reprovis.test.tools;

import java.io.File;
import java.util.Collection;

import org.junit.Test;


import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.MasterData;
import de.osramos.reprovis.Registry;
import static org.junit.Assert.*;

public class RegistryTest {
	
	@Test
	public void RegistyTest(){
		GlobalBean global = GlobalBean.getGlobal();
		Registry r = Registry.getRegistry();
		Collection<Object> all = r.reg.values();
		assertTrue(all.size() > 3);
	}
	
	@Test
	public void ConfigTest(){
		String c = MasterData.getConfigFile();
		assertNotNull(c);

		
	}

}
