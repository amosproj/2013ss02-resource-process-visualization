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

import org.junit.Test;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HierarchieException;
import de.osramos.reprovis.Registry;

public class GlobalBeanTest {
	
	@Test
	public void GlobalBeanTest() throws HierarchieException{
		GlobalBean global = GlobalBean.getGlobal();
		assertNotNull(global.getChilds());
		System.out.println(Registry.getRegistry().reg.size());
		System.out.println(Registry.getRegistry().reg.values());
		assertTrue(global.getChilds().size() > 2);
		assertTrue(global.getChilds().get(0).getId() > 0);
		/*assertTrue(!global.getChilds().get(0).getName().equals(global.getChilds().get(1).getName()));
	*/}

}
