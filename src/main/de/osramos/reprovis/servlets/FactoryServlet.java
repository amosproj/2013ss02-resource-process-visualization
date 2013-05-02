package de.osramos.reprovis.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import de.osramos.reprovis.FactoryBean;
import de.osramos.reprovis.GlobalBean;

public class FactoryServlet extends HttpServlet {

	private static final long serialVersionUID = 6222012527441265856L;

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setAttribute("factories", GlobalBean.getGlobal().getFactories());
		getServletContext().getRequestDispatcher("/FactoryList.jsp").forward(req, resp);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("fid");
		if(id == null){
			req.setAttribute("factories", GlobalBean.getGlobal().getFactories());
			getServletContext().getRequestDispatcher("/FactoryList.jsp").forward(req, resp);
		}else{
			req.setAttribute("factory", new FactoryBean(Integer.valueOf(id)));
			getServletContext().getRequestDispatcher("/FactoryView.jsp").forward(req, resp);
		}
	}

	
}
