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

package de.osramos.reprovis.test;

import java.util.List;

import org.junit.*;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.HallBean;
import de.osramos.reprovis.HierarchieElementBean;
import static org.junit.Assert.*;

public class HallBeanTest {

	@Test
	public void HallTest() throws Exception {
		HallBean hall = new HallBean(1);

		assertNotNull(hall.getChilds());
		assertNotNull(hall.getStatus());
		assertNull(hall.getParent());
		assertNotNull(hall.getName());
		assertNotNull(hall.getSizeOfStaff());
		assertNotNull(hall.getProductionCapacity());

	}

	@Test
	public void HallFactoryTest() {
		FactoryBean f = new FactoryBean(1);
		HallBean h = f.getHalls().get(0);

		assertEquals(f.getId(), h.getChilds().get(0).getParent().getId());
	}

	@Test
	public void ChildTest() {
		HallBean hall = new HallBean(1);
		List<HierarchieElementBean> lines = hall.getChilds();
		assertTrue(lines.size() > 0);
		assertNotNull(lines.get(0));
	}
	
	@Test
	public void HallTestPrint() throws Exception {
		HallBean hall = new HallBean(1);

		System.out.println(hall.getChilds().size());
		System.out.println(hall.getStatus());
		System.out.println(hall.getParent());
		System.out.println(hall.getName());
		System.out.println(hall.getSizeOfStaff());
		System.out.println(hall.getProductionCapacity());

	}
	
}
