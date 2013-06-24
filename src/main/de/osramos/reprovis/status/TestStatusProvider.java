package de.osramos.reprovis.status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import de.osramos.reprovis.exception.DatabaseException;
import de.osramos.reprovis.handler.DatabaseHandler;

public class TestStatusProvider extends HttpServlet {

	private static final long serialVersionUID = 6523904958703665363L;
	private Thread generator;

	private static class RandomStatusGenerator extends Thread{

		public DataSource dataSource;
		private enum DesiredStatus {
			RANDOM, RED, YELLOW, GREEN
		};
		private Map<Integer, DesiredStatus> factories;
		private long timeElapsedUpdating;
		private boolean printElapsedTime = false; 
		
		RandomStatusGenerator(DataSource dataSource){
			this.setDaemon(true);
			this.setPriority(getPriority() - 1);
			factories = new HashMap<Integer, DesiredStatus>();
			this.dataSource = dataSource;
			readFactories();
			if(!factories.isEmpty() && factories.size() > 1){
				factories.entrySet().iterator().next().setValue(DesiredStatus.GREEN);
			}
		}
		
		private void readFactories(){
			try{
				Set<Integer> factoryIds = new HashSet<Integer>();
				Connection conn = dataSource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet res = stmt.executeQuery("SELECT id FROM factory");
				while(res.next()){
					int factoryId = res.getInt(1);
					factoryIds.add(factoryId);
				}
				res.close();
				stmt.close();
				conn.close();
				
				Set<Integer> existingIds = factories.keySet();
				// remove no longer existing factories
				for(Integer id : existingIds){
					if(!factoryIds.contains(id)){
						factories.remove(id);
					}
				}
				// add new factories
				for(Integer id : factoryIds){
					if(!factories.containsKey(id)){
						factories.put(id, DesiredStatus.RANDOM);
					}
				}
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		
		@Override
		public void run() {
			try {
				while(!isInterrupted()){
				
					long start = System.currentTimeMillis();
					readFactories();
					Connection conn = dataSource.getConnection();
					Set<Map.Entry<Integer, DesiredStatus> > factorySet = factories.entrySet();
					String componentUpdateQuery = "UPDATE component SET status = ? WHERE id = ?";
					PreparedStatement componentUpdateStmt = conn.prepareStatement(componentUpdateQuery);
					String componentQuery = "SELECT component.id FROM component " +
							"INNER JOIN device ON component.parent = device.id " +
							"INNER JOIN location ON device.parent = location.id " +
							"INNER JOIN line ON location.parent = line.id " +
							"INNER JOIN hall ON line.parent = hall.id " +
							"INNER JOIN factory ON hall.parent = factory.id " +
							"WHERE factory.id = ?";
					PreparedStatement componentStmt = conn.prepareStatement(componentQuery);
					for(Map.Entry<Integer, DesiredStatus> factory: factorySet){
						if(isInterrupted()){
							componentUpdateStmt.close();
							componentStmt.close();
							conn.close();
							throw new InterruptedException();
						}
						componentStmt.setInt(1, factory.getKey());
						ResultSet components = componentStmt.executeQuery();
						while(components.next()){
							if(isInterrupted()){
								components.close();
								componentUpdateStmt.close();
								componentStmt.close();
								conn.close();
								throw new InterruptedException();
							}
							componentUpdateStmt.setInt(2, components.getInt(1));
							switch(factory.getValue()){
							case RANDOM:
								double rand = Math.random();
								if(rand > 0.2)componentUpdateStmt.setString(1, "green");
								else if(rand > 0.1)componentUpdateStmt.setString(1, "yellow");
								else if(rand >= 0.05)componentUpdateStmt.setString(1, "red");
								else if(rand >= 0)componentUpdateStmt.setString(1, "grey");
								break;
							case GREEN:
								componentUpdateStmt.setString(1, "green");
								break;
							case YELLOW:
								componentUpdateStmt.setString(1, "yellow");
								break;
							case RED:
								componentUpdateStmt.setString(1, "red");
								break;
							}
							componentUpdateStmt.executeUpdate();
						}
						components.close();
					}
					componentUpdateStmt.close();
					componentStmt.close();
					conn.close();
					timeElapsedUpdating = System.currentTimeMillis() - start;
					if(printElapsedTime){
						System.out.println("Elapsed time updating status information: " + (timeElapsedUpdating / 1000) + "s");
					}
					
					Thread.sleep(5*1000);
				}
			} catch (InterruptedException e){
				interrupt();
			} catch (SQLException e1) {
				e1.printStackTrace();
				interrupt();
			}
		}
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			generator = new Thread(new RandomStatusGenerator(DatabaseHandler.getDB()));
			generator.start();
		} catch (DatabaseException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void destroy() {
		super.destroy();
		generator.interrupt();
	}

}
