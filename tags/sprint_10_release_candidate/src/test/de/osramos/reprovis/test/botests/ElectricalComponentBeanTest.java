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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import de.osramos.reprovis.ElectricalComponentBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.TestingDeviceBean;
import de.osramos.reprovis.handler.MasterData.TrafficLight;
import de.osramos.reprovis.test.testhelper.Setup;

public class ElectricalComponentBeanTest {
	
	@BeforeClass
	public static void setUpClass() throws Exception {

		Setup.setUpTestDS();
		Setup.loadDBData("./de/osramos/reprovis/test/testdata/TestData.sql");
	}


	@Test
	public void notExistingTest(){
		ElectricalComponentBean b = new ElectricalComponentBean(-1);
		assertNotNull(b);
		assertNotNull(b.getChilds());
		assertNotNull(b.getName());
		assertNotNull(b.getValue());
		assertNotNull(b.getSector());
		assertNotNull(b.getCategory());
		assertNotNull(b.getSerialnumber());
		assertNotNull(b.getShiftResponsibility());
		assertNull(b.getTroubeOccurrenceTime());
		assertNotNull(b.getTroubleOccurrenceSite());
	}
	
	@Test
	public void parentTest(){
		boolean existing[] = {false, false, false};
		List<HierarchieElementBean> children = (new TestingDeviceBean(5)).getChilds();
		for(HierarchieElementBean h : children){
			switch(h.getId()){
			case 6:
				existing[0] = true;
				break;
			case 7:
				existing[1] = true;
				break;
			case 8:
				existing[2] = true;
				break;
			}
		}
		assertTrue(existing[0] && existing[1] && existing[2]);
	}
	
	@Test
	public void getterTest() throws Exception{
		ElectricalComponentBean eb = new ElectricalComponentBean(6);
		assertEquals("Tests", eb.getName());
		assertEquals("Ok", eb.getValue());
		assertEquals("B", eb.getSector());
		assertEquals("F", eb.getCategory());
		assertEquals("70036775", eb.getSerialnumber());
		assertEquals("Howard Joel Wolowitz", eb.getShiftResponsibility());
		Date shouldBe = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS")).parse("2013-06-18 00:44:47.937");
		assertTrue(shouldBe.compareTo(eb.getTroubeOccurrenceTime()) == 0);
		assertEquals("G5", eb.getTroubleOccurrenceSite());
		assertEquals(TrafficLight.green, eb.getStatus());
		
	}
}
