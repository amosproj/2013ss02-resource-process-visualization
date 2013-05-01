<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="de.osramos.reprovis.Factory" %>
<%@ page import="de.osramos.reprovis.ProductionHall" %>
<%@ page import="de.osramos.reprovis.Line" %>
<%@ page import="de.osramos.reprovis.Location" %>
<%@ page import="de.osramos.reprovis.Component" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<ul>
	<%! @SuppressWarnings("unchecked") %>
	<% for(Factory f: (ArrayList<Factory>)session.getAttribute("factories")){ %>
	<li>
		<%= f.getName() %>
		<ul>
			<% for(ProductionHall h: f.getHalls()){ %>
				<li><%= h.getName() %>
					<ul>
						<% for(Line l: h.getLines()){ %>
							<li><%= l.getName() %>
								<ul>
									<% for(Location loc: l.getLocations()){ %>
										<li><%= loc.getName() %>
											<ul>
												<% for(Component c: loc.getComponents()){ %>
													<li><%= c.getType() %></li>
												<% } %>
											</ul>
										</li>
									<% } %>
								</ul>
							</li>
						<% } %>
					</ul>
				</li>
			<% } %>
		</ul>
	</li>
	<% } %>
</ul>

</body>
</html>