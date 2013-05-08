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

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import de.osramos.reprovis.TestData;

public class LineServlet extends HttpServlet {

	private static final long serialVersionUID = 1574042887470193590L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException{
		String id = req.getParameter("lid");
		if(id == null){
			req.setAttribute("message", "Requesting line without id.");
			getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
		}else{
			TestData global = (TestData)getServletContext().getAttribute("testdata");
			req.setAttribute("line", global.getLine(Integer.valueOf(id)));
			getServletContext().getRequestDispatcher("/LineView.jsp").forward(req, resp);
		}
	}
}
