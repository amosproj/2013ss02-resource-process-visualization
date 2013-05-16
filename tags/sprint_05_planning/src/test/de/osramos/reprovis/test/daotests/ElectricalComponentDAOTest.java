package de.osramos.reprovis.test.daotests;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import de.osramos.reprovis.ElectricalComponentDAO;


public class ElectricalComponentDAOTest {

	
	@Test
	public void initTest(){
		assertTrue( ElectricalComponentDAO.getElectricalComponentIds(0).size() > 2);
	}
}
