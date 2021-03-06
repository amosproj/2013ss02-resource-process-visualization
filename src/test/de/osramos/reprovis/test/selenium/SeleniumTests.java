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


package de.osramos.reprovis.test.selenium;

import org.junit.runner.*;
import org.junit.runners.*;

@RunWith(Suite.class)
@Suite.SuiteClasses({ 
		de.osramos.reprovis.test.selenium.FactorySeleniumTest.class,
		de.osramos.reprovis.test.selenium.HallSeleniumTest.class,
		de.osramos.reprovis.test.selenium.LineSeleniumTest.class,
		de.osramos.reprovis.test.selenium.LocationSeleniumTest.class,
		de.osramos.reprovis.test.selenium.DeviceSeleniumTest.class,
		de.osramos.reprovis.test.selenium.ComponentSeleniumTest.class
 })

public class SeleniumTests {

}
