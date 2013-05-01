package de.osramos.reprovis.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import de.osramos.reprovis.HallBean;

@WebServlet(name="hallServlet", urlPatterns={"/hall"})
public class HallServlet extends HttpServlet {

	private static final long serialVersionUID = -3606015914647184870L;
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String id = req.getParameter("hid");
		if(id == null){
			req.setAttribute("message", "Requesting production hall without id.");
			getServletContext().getRequestDispatcher("/error.jsp").forward(req, resp);
		}else{
			req.setAttribute("hall", new HallBean(Integer.valueOf(id)));
			getServletContext().getRequestDispatcher("/HallView.jsp").forward(req, resp);
		}
	}

}
