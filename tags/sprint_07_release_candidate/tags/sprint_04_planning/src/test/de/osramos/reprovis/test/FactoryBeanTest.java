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

import org.junit.*;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.FactoryDAO;
import de.osramos.reprovis.GlobalBean;
import static org.junit.Assert.*;

public class FactoryBeanTest {
	
	@Test
	public void FactoryTest() throws Exception{
		
		int id = FactoryDAO.getFactoryIds().get(0);
		
		FactoryBean f = new FactoryBean(id);
		assertNotNull(f.getCompany());
		assertNotNull(f.getCountry());
		assertNotNull(f.getGlobal());
		assertNotNull(f.getHalls());
		assertNotNull(f.getId());
		assertNotNull(f.getName());
		assertNotNull(f.getCarModels());
		assertNotNull(f.getNumOfVehicles());
		assertNotNull(f.getSizeOfStaff());
	}
	
	@Test
	public void FactoryGlobalTest(){
		GlobalBean g = GlobalBean.getGlobal();
		FactoryBean f = new FactoryBean(1);
		
		assertEquals(g, f.getGlobal());
	}

}
