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
import static org.junit.Assert.assertTrue;

import org.junit.*;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HallBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.LineBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;
import de.osramos.reprovis.test.testhelper.Setup;


public class LineBeanTest {
	
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
	public void hierarchieTest(){
		GlobalBean g = GlobalBean.getInstance();
		HierarchieElementBean l = g.getChilds().get(0).getChilds().get(0).getChilds().get(0);
		assertTrue(l.getClass().equals(LineBean.class));
		assertTrue(!l.getClass().equals(HallBean.class));
	}

	@Test
	public void notExistingTest() throws HierarchieException{
		LineBean l = new LineBean(-1, null, new Registry());
		assertNotNull(l.getChilds());
		assertNotNull(l.getName());
		assertNotNull(l.getPath());
		assertNotNull(l.getProductionCapacity());
		assertNotNull(l.getProductionSeries());
	}
	
	@Test
	public void parentTest() throws HierarchieException{
		assertEquals(3, (new HallBean(2, null, new Registry())).getChilds().get(0).getId());
	}
	
	@Test
	public void childTest() throws HierarchieException{
		assertEquals(1, (new LineBean(3, null, new Registry())).getChilds().size());
	}
	
	@Test
	public void getterTest() throws HierarchieException{
		LineBean line = new LineBean(3, null, new Registry());
		assertEquals("L1 Assembly", line.getName());
		assertEquals("Series 3", line.getProductionSeries());
		assertEquals(98, line.getProductionCapacity());
		assertEquals("rect217", line.getPath());
	}
}
