package de.osramos.reprovis.test.daotests;

import org.junit.runner.*;
import org.junit.runners.*;

@RunWith(Suite.class)
@Suite.SuiteClasses({ 
		de.osramos.reprovis.test.daotests.FactoryDAOTest.class,
		de.osramos.reprovis.test.daotests.HallDAOTest.class,
		de.osramos.reprovis.test.daotests.LineDAOTest.class,
		de.osramos.reprovis.test.daotests.LocationDAOTest.class,
		de.osramos.reprovis.test.daotests.TestingDeviceDAOTest.class,
		de.osramos.reprovis.test.daotests.ElectricalComponentDAOTest.class,
		
 })

public class DAOTests {

}
