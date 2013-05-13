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
		List<Integer> ids = FactoryDAO.getFactoryIds(0);
		assertNotNull(FactoryDAO.getFactoryById(ids.get(0)));

	}
	
	@Test
	public void testConfig() throws Exception{
		int id = FactoryDAO.getFactoryIds(0).get(0);
		
		assertNotNull(FactoryDAO.getCarModels(id));
		assertNotNull(FactoryDAO.getCompany(id));
		assertNotNull(FactoryDAO.getCountry(id));
		assertNotNull(FactoryDAO.getGpsLatitude(id));
		assertNotNull(FactoryDAO.getGpsLongitude(id));
		assertNotNull(FactoryDAO.getName(id));
		assertNotSame(new Integer(-1), FactoryDAO.getNumOfVehicles(id));
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
		System.out.println(FactoryDAO.getNumOfVehicles(id));
		System.out.println(FactoryDAO.getSizeOfStaff(id));
		
	}
	
}
