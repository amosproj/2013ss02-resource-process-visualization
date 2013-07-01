/*
 * Copyright (c) 2013 by Martin Gumbrecht, Christian Muehlroth, 
 *						Jan-Philipp Stauffert, Kathrin Koenig, Yao Guo 
 *
 * This file is part of the Resource Process Visualization application.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public
 * License along with this program. If not, see
 * <http://www.gnu.org/licenses/>.
 */

package de.osramos.reprovis.test.botests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HallBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;
import de.osramos.reprovis.test.testhelper.Setup;

public class HallBeanTest {
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}
	
	@Before
	public void resetGlobal(){
		GlobalBean.resetGlobal();
		Registry.cleanRegistry();
	}
	
	@Test
	public void notExistingHallTest() throws Exception {
		HallBean hall = new HallBean(1);

		assertNotNull(hall.getChilds());
		// TODO doesn't have a status without children.
		// how to handle?
		// assertNotNull(hall.getStatus());
		assertNull(hall.getParent());
		assertNotNull(hall.getName());
		assertNotNull(hall.getSizeOfStaff());
		assertNotNull(hall.getProductionCapacity());
	}

	@Test
	public void HallFactoryTest() throws Exception {
		FactoryBean f = new FactoryBean(1);
		assertEquals(2, f.getChilds().get(0).getId());
	}

	@Test
	public void childTest() throws Exception {
		HallBean hall = new HallBean(2);
		List<HierarchieElementBean> lines = hall.getChilds();
		assertTrue(lines.size() > 0);
		assertNotNull(lines.get(0));
	}
	
	/*@Test
	public void HallTestPrint() throws Exception {
		HallBean hall = new HallBean(1);

		System.out.println(hall.getChilds().size());
		System.out.println(hall.getStatus());
		System.out.println(hall.getParent());
		System.out.println(hall.getName());
		System.out.println(hall.getSizeOfStaff());
		System.out.println(hall.getProductionCapacity());

	}*/
	
	@Test
	public void getterTest() throws HierarchieException{
		HallBean hall = new HallBean(2);
		assertEquals("H1", hall.getName());
		assertEquals("Assembly+Finish", hall.getType());
		assertEquals(351, hall.getSizeOfStaff());
		assertEquals(1914, hall.getProductionCapacity());
		assertEquals("Audi A4", hall.getVehicles());
		assertEquals(2, hall.getUpsServer());
		assertEquals("polygon249", hall.getPath());
		assertEquals("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>", hall.getMap());
	}
	
}
