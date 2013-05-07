package de.osramos.reprovis;


public class MasterData {


	
	public enum Company{Audi, Volkswagen, Skoda, Seat}
	
	public enum TrafficLight{red, yellow, green}
	
	public static String getTrafficIconClass(TrafficLight status){
		switch(status){
		case red:
			return "statusIconCritical";
		case yellow:
			return "statusIconWarning";
		default:
			return "statusIconOk";
		}
	}
}
