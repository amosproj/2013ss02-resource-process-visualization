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

import static org.junit.Assert.assertTrue;

import org.junit.*;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HallBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.LineBean;
import de.osramos.reprovis.test.testhelper.Setup;


public class LineBeanTest {
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}

	@Test
	public void initTest(){
		LineBean b = new LineBean(1);
		assertTrue(b.getChilds().size() > 1);
	}

	@Test
	public void hierarchieTest(){
		GlobalBean g = GlobalBean.getGlobal();
		HierarchieElementBean l = g.getChilds().get(0).getChilds().get(0).getChilds().get(0);
		assertTrue(l.getClass().equals(LineBean.class));
		assertTrue(!l.getClass().equals(HallBean.class));
	}


}
