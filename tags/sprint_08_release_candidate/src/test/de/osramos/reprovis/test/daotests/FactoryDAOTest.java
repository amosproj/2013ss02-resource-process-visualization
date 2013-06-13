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


package de.osramos.reprovis.test.daotests;

import java.util.List;

import org.junit.*;

import de.osramos.reprovis.FactoryDAO;
import de.osramos.reprovis.MasterData;
import static org.junit.Assert.*;

public class FactoryDAOTest {

	@Test
	public void testGetFactoryIds() throws Exception{
		List<Integer> ids = FactoryDAO.getFactoryIds(0);
		assertTrue(ids.size() > 0);
		/*assertEquals(ids.get(0), new Integer(1));*/
	}
	
	@Test
	public void testGetFactoryIdsPrint() throws Exception{
		List<Integer> ids = FactoryDAO.getFactoryIds(0);
		for(int id :ids){
			System.out.println(id + ": " + FactoryDAO.getName(id));
		}
	}
	
	@Test
	public void testGetFactoryById() throws Exception{
	/*	List<Integer> ids = FactoryDAO.getFactoryIds(0);
		assertNotNull(FactoryDAO.getFactoryById(ids.get(0)));*/

	}
	
	@Test
	public void testConfig() throws Exception{
		int id = 1;// FactoryDAO.getFactoryIds(0).get(0);
		
		assertNotNull(FactoryDAO.getCarModels(id));
		assertNotNull(FactoryDAO.getCompany(id));
		assertNotNull(FactoryDAO.getCountry(id));
		assertNotNull(FactoryDAO.getGpsLatitude(id));
		assertNotNull(FactoryDAO.getGpsLongitude(id));
		assertNotNull(FactoryDAO.getName(id));
		assertNotSame(new Integer(-1), FactoryDAO.getVehiclesPerYear(id));
		assertNotSame(new Integer(-1), FactoryDAO.getSizeOfStaff(id));
		
	}
	
	@Test
	public void testConfigPrintln() throws Exception{
		int id = FactoryDAO.getFactoryIds(0).get(0);
		
		System.out.println(FactoryDAO.getCarModels(id));
		System.out.println(FactoryDAO.getCompany(id));
		System.out.println(FactoryDAO.getCountry(id));
		System.out.println(FactoryDAO.getGpsLatitude(id));
		System.out.println(FactoryDAO.getGpsLongitude(id));
		System.out.println(FactoryDAO.getName(id));
		System.out.println(FactoryDAO.getVehiclesPerYear(id));
		System.out.println(FactoryDAO.getSizeOfStaff(id));
		
	}
	
}
