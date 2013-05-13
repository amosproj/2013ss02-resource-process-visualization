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

import static org.junit.Assert.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.junit.Test;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HierarchieException;

public class GlobalBeanTest {
	
	@Test
	public void GlobalBeanTest() throws HierarchieException{
		GlobalBean global = GlobalBean.getGlobal();
		assertNotNull(global.getChilds());
	}

	@Test
	public void GlobalBeanRegTest() throws NamingException{
		
			GlobalBean gl = GlobalBean.getGlobal();
/*			Context ctx = new InitialContext();
			GlobalBean gln = (GlobalBean) ctx.lookup("de.osramos/reprovis/global");*/
			
			GlobalBean gln = (GlobalBean) GlobalBean.getElementById(gl.getId());
			assertEquals(gl, gln);
			System.out.println(gln);
		
	}

}
