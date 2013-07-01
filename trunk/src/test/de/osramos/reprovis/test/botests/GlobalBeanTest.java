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

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;
import de.osramos.reprovis.test.testhelper.Setup;

public class GlobalBeanTest {

	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();

	}

	
	@Before
	public void resetGlobal(){
		GlobalBean.resetGlobal();
		Registry.cleanRegistry();
	}
	
	@Test
	public void singletonTest() throws Exception {

		{
			Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");

			GlobalBean global1 = GlobalBean.getGlobal();
			GlobalBean global2 = GlobalBean.getGlobal();

			assertSame(global1, global2);
		}

	}

	@Test
	public void resetGlobalTest() throws Exception {
		GlobalBean.resetGlobal();
		
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
		GlobalBean global1 = GlobalBean.getGlobal();
		
		GlobalBean.resetGlobal();
		
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/WrongTestDataGlobal.sql");
		GlobalBean global2 = GlobalBean.getGlobal();

		assertNotSame(global1, global2);
	}

	@Test
	public void getParentTest() {
		GlobalBean global = GlobalBean.getGlobal();
		Exception exception = null;

		try {
			global.getParent();
		} catch (HierarchieException e) {
			exception = e;
		}
		assertNotNull(exception);
	}

	@Test
	public void initChildsTest() throws Exception {
		{
			Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");

			GlobalBean.resetGlobal();
			GlobalBean global = GlobalBean.getGlobal();
			List<HierarchieElementBean> childs = global.getChilds();

			assertNotNull(childs);
			assertTrue(childs.size() == 1);
			assertTrue(childs.get(0).getId() == 1);
		}
		

	}

	@Test
	public void initChildsTestNoChilds() throws Exception {

		
		{
			GlobalBean.resetGlobal();
			Setup.loadDBData("./de/osramos/reprovis/test/testdata/WrongTestDataGlobal.sql");

			GlobalBean global = GlobalBean.getGlobal();
			List<HierarchieElementBean> childs = global.getChilds();

			assertNotNull(childs);
			
			assertEquals(0, childs.size());
		}
	}
	
}
