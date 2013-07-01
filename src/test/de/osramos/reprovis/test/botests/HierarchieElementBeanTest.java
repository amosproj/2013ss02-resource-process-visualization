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

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HierarchieElementBean;
import de.osramos.reprovis.exception.HierarchieException;
import de.osramos.reprovis.handler.Registry;

public class HierarchieElementBeanTest {
	
	@Before
	public void resetGlobal(){
		GlobalBean.resetGlobal();
		Registry.cleanRegistry();
	}

	@Test
	public void getChildsTest() throws HierarchieException {
		HierarchieElementBean hierarchieElementBean = new TestHierarchieElementBean(
				0);

		List<HierarchieElementBean> childs = hierarchieElementBean.getChilds();

		assertNotNull(childs);
		assertTrue(childs.isEmpty());
	}

	@Test
	public void getChildsByClassTest() throws HierarchieException {
		{
			HierarchieElementBean hierarchieElementBean = new TestHierarchieElementBean(
					0);

			List<HierarchieElementBean> childs = hierarchieElementBean
					.getChildsByClass(hierarchieElementBean.getClass());

			assertNotNull(childs);
			assertTrue(childs.isEmpty());
		}
		GlobalBean.resetGlobal();
		Registry.cleanRegistry();

		{
			TestHierarchieElementBean hierarchieElementBean = new TestHierarchieElementBean(
					0);

			List<HierarchieElementBean> c = new ArrayList<HierarchieElementBean>();
			c.add(new TestHierarchieElementBean(1));
			c.add(new TestHierarchieElementBean(2));
			hierarchieElementBean.setChilds(c);
			{
				List<HierarchieElementBean> childs = hierarchieElementBean
						.getChildsByClass(HierarchieElementBean.class);

				assertNotNull(childs);
				assertTrue(childs.size() == 0);
			}
			{
				List<HierarchieElementBean> childs = hierarchieElementBean
						.getChildsByClass(TestHierarchieElementBean.class);

				assertNotNull(childs);
				assertTrue(childs.size() == 2);
			}
		}
	}

	@Test
	public void getNumOfLeafsTest() throws HierarchieException {

		{
			HierarchieElementBean hierarchieElementBean = new TestHierarchieElementBean(
					0);

			int childs = hierarchieElementBean
					.getNumOfLeafs(hierarchieElementBean.getClass());

			assertEquals(0, childs);
		}
		
		GlobalBean.resetGlobal();
		Registry.cleanRegistry();

		{
			TestHierarchieElementBean hierarchieElementBean = new TestHierarchieElementBean(
					0);

			List<HierarchieElementBean> c = new ArrayList<HierarchieElementBean>();
			c.add(new TestHierarchieElementBean(1));
			c.add(new TestHierarchieElementBean(2));
			hierarchieElementBean.setChilds(c);
			{
				int childs = hierarchieElementBean
						.getNumOfLeafs(HierarchieElementBean.class);

				assertTrue(childs == 0);
			}
			{
				int childs = hierarchieElementBean
						.getNumOfLeafs(TestHierarchieElementBean.class);

				assertNotNull(childs);
				assertTrue(childs == 2);
			}
		}
	}

}

class TestHierarchieElementBean extends HierarchieElementBean {

	public TestHierarchieElementBean(int id) throws HierarchieException {
		super(id);
	}

	@Override
	protected void initChilds() {
	}
	
	public void setChilds(List<HierarchieElementBean> childs) {
		this.childs = childs;
	}

}
