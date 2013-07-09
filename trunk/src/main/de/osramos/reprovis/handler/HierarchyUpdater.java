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

package de.osramos.reprovis.handler;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import de.osramos.reprovis.GlobalBean;


public class HierarchyUpdater extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2828661200619431891L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		new Thread(new Updater()).start();

	}

	private class Updater implements Runnable {

		@Override
		public void run() {

			while (true) {

				try {
					System.out.println("Computing new Global");
					
					GlobalBean global = GlobalBean.createInstance();
					
					GlobalBean.setInstance(global);
					
					Thread.sleep(5000);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}

		}
	}
}
