package de.osramos.reprovis;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

@WebServlet(name="globalServlet", urlPatterns={"/config"})
public class GlobalServlet extends HttpServlet {

	private static final long serialVersionUID = 9060325009906441831L;
	
	public GlobalServlet(){
	}
	
	private ArrayList<Factory> factories;
	
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		InputStream is = getServletContext().getResourceAsStream("config.json");
		ObjectMapper mapper = new ObjectMapper();
		try {
			factories = mapper.readValue(is, new TypeReference<ArrayList<Factory>>(){});
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setAttribute("factories", factories);
		getServletContext().getRequestDispatcher("/config.jsp").forward(req, res);
	}

}
