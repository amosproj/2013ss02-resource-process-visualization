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

package de.osramos.reprovis.connectivity;

import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

import de.osramos.reprovis.ElectricalComponentDAO;
import de.osramos.reprovis.MasterData;


public class ComponentUpdater implements Processor{

	@Override
	public void process(Exchange exchange) throws Exception {
		
		String body = (String) exchange.getIn().getBody();

		DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		InputSource is = new InputSource(new StringReader(body));
		Document doc = builder.parse(is);
		
		Element device = (Element) doc.getElementsByTagName("component").item(0);
		
		String name = device.getAttribute("name");
		String status = device.getElementsByTagName("status").item(0).getTextContent();
		String value = device.getElementsByTagName("value").item(0).getTextContent();

		int deviceId = (Integer)exchange.getIn().getHeader("id");
		
		int id = ElectricalComponentDAO.getIdByName(name, deviceId);
		
		ElectricalComponentDAO.updateStatus(id, MasterData.stringToTrafficLight(status));
		ElectricalComponentDAO.updateValue(id, value);
		
	}

}
