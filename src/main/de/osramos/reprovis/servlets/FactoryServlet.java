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

package de.osramos.reprovis.servlets;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.GlobalBean;
import de.osramos.reprovis.HierarchieException;

public class FactoryServlet extends HttpServlet {

	private static final long serialVersionUID = 6222012527441265856L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// getServletContext().setAttribute("testdata", new
		// TestData(getServletContext().getResourceAsStream("config.json")));
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		/*
		 * TestData global =
		 * (TestData)getServletContext().getAttribute("testdata");
		 * req.setAttribute("factories", global.getFactories());
		 */

		req.setAttribute("factories", GlobalBean.getGlobal().getChilds());

		getServletContext().getRequestDispatcher("/FactoryList.jsp").forward(
				req, resp);

	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("fid");
		// TestData global =
		// (TestData)getServletContext().getAttribute("testdata");

		// Show the overview of all factories available
		if (id == null) {
			/* req.setAttribute("factories", global.getFactories()); */

			req.setAttribute("factories", GlobalBean.getGlobal().getChilds());
			getServletContext().getRequestDispatcher("/FactoryList.jsp")
					.forward(req, resp);

		}

		// Do an operation on a specific factory ID
		else {
			if (req.getParameter("getData") != null) {
				// Call the data handler
				req.setAttribute("factory",
						FactoryBean.getElementById(Integer.valueOf(id)));
				getServletContext().getRequestDispatcher("/FactoryJSON.jsp")
						.forward(req, resp);
			}

			else {
				// Call the view handler
				req.setAttribute("factory",
						FactoryBean.getElementById(Integer.valueOf(id)));
				getServletContext().getRequestDispatcher("/FactoryView.jsp")
						.forward(req, resp);
			}
		}
	}
}
