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

package de.osramos.reprovis.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;

import de.osramos.reprovis.MasterData;
import de.osramos.reprovis.MasterData.TrafficLight;

public class TestDataGenerator {

	private static int nextId;

	private static String numbers = "123456789";
	private static String chars = "ABCDEFGHI";

	private static int[] factoryIds;

	private static OutputStreamWriter out;

	private static int id() {
		return nextId++;
	}

	private static int numOfHalls = 2;
	private static int numOfLines = 2;
	private static int numOfLocations = 2;
	private static int numOfDevices = 2;
	private static int numOfComponents = 2;

	private static String path = "./src/resources/config/init.sql";

	public static void main(String[] args) {

		if (args == null) {
			System.out.println("starting with default setting:");
		} else {
			try {

				if (args[0].equals("--help")) {
					System.out
							.println("usage: TestDataGenerator -p <Path> -n <numOfHalls> <numOfLines> <numOfLocation> <numOfDevices> <numOfComponents>");
				}
				for (int i = 0; i < args.length; i++) {
					if (args[i].equals("-p")) {
						path = args[i + 1];
					}
					if (args[i].equals("-n")) {
						numOfHalls = Integer.parseInt(args[i + 1]);
						numOfLines = Integer.parseInt(args[i + 2]);
						numOfLocations = Integer.parseInt(args[i + 3]);
						numOfDevices = Integer.parseInt(args[i + 4]);
						numOfComponents = Integer.parseInt(args[i + 5]);
					}
				}
			} catch (Exception e) {
			}
		}
		generateTestData();

	}

	public TestDataGenerator() {

	}

	public static void generateTestData() {

		try {

			String canonicalPath = new File(".", path).getCanonicalPath();

			System.out.println("	Output path: " + canonicalPath);

			FileOutputStream fos = new FileOutputStream(canonicalPath);
			out = new OutputStreamWriter(fos, "UTF-8");

			System.out.println("generating file: " + canonicalPath);

			initTables();
			initFactories();

			FileReader fr = new FileReader(new File(".",
					"./src/resources/config/oldData.sql").getCanonicalPath());
			BufferedReader br = new BufferedReader(fr);

			while (true) {
				String line = br.readLine();
				if (line == null) {
					break;
				}
				out.write(line + "\n");
			}

			br.close();

			out.close();

			System.out.println("finsihed");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void initTables() throws IOException {

		String s = "drop table if exists component; \n"
				+ "drop table if exists device;\n"
				+ "drop table if exists line;\n"
				+ "drop table if exists location;\n"
				+ "drop table if exists hall;\n"
				+ "drop table if exists factory;\n" +

				"create table factory(\n" + "	id int ,\n"
				+ "	name char varying(50), \n"
				+ "	company char varying(50), \n"
				+ "	city char varying(50), \n"
				+ "	country char varying(50), 	\n"
				+ "	gpslatitude double precision , \n"
				+ "	gpslongitude double precision, \n"
				+ "	carmodels char varying(512), \n" + "	sizeofstaff int, \n"
				+ "	sizeofstaffdate timestamp,\n" + "	numofvehicles int, \n"
				+ "	upsservers int, \n" + "	upsprovider char varying(128), \n"
				+ " parent integer\n" + ");\n" +

				"CREATE TABLE hall (\n" + "    id integer ,\n"
				+ "    name character varying(50),\n" + "    staff integer,\n"
				+ "    capacity integer,\n"
				+ "    path character varying(5000),\n"
				+ "    parent integer\n" + ");\n" +

				"CREATE TABLE line (\n" + "    id integer ,\n"
				+ "    name character varying(50),\n"
				+ "    series character varying(50),\n"
				+ "    capacity integer,\n"
				+ "    path character varying(5000),\n" + "    parent integer\n"
				+ ");\n" +

				"CREATE TABLE location (\n" + "    id integer ,\n"
				+ "    name character varying(50),\n"
				+ "    description character varying(100),\n"
				+ "    personincharge character varying(100),\n"
				+ "    parent integer\n" + ");\n" +

				"CREATE TABLE device (\n" + "	    id integer ,\n"
				+ "	    category character varying(50),\n"
				+ "	    sector character varying(50),\n"
				+ "	    serialnumber character varying(50),\n"
				+ "	    troubleperiod timestamp,\n"
				+ "	    testfailure boolean,\n" + "	    parent integer\n"
				+ "	);\n" +

				"	CREATE TABLE component (\n" + "	    id integer ,\n"
				+ "	    sector character varying(50),\n"
				+ "	    category character varying(50),\n"
				+ "	    serialnumber character varying(50),\n"
				+ "	    shiftresponsibility character varying(50),\n"
				+ "	    troubleoccurrencetime timestamp,\n"
				+ "	    troubleoccurrencesite character varying(50),\n"
				+ "	    status character varying(20),\n"
				+ "	    parent integer\n" + "	);\n";

		out.write(s);

	}

	public static void initFactories() throws IOException {

		factoryIds = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 };

		new Timestamp(new GregorianCalendar(2012, 11, 31).getTime().getTime())
				.toString();

		String s =

		"insert into factory values (1, \'Ingolstadt\', \'Audi\' ,\'Ingolstadt\', \'Germany\', 48.762201, 11.425374, \n"
				+ "		\'Audi A3, Audi A3 Sportback, Audi S3, Audi S3 Sportback, Audi A4, Audi A4 Avant, Audi S4, Audi S4 Avant, Audi A4 allroad quattro, Audi RS4 Avant, Audi A5 Sportback, Audi A5 Coupe, Audi S5 Sportback, Audi S5 Coupe, Audi RS 5 Coupe, Audi Q5, Audi Q5 hybrid quattro, Audi SQ5 TDI, Karosseriebau/Lackiererei des Audi TT Coupe, Audi TT Roadster, Audi TTS Coupe, Audi TTS Roadster, Audi TT RS Coupe, Audi TT RS Roadster, Audi A3 Cabriolet\',\n"
				+ "		35386, \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 551889, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (2, \'Neckarsulm\', \'Audi\' , \'Neckarsulm\', \'Germany\', 49.194213, 9.221771,\n"
				+ "		\'Audi A4, Audi A5 Cabriolet, Audi S5 Cabriolet, Audi RS 5 Cabriolet, Audi A6, Audi A6 hybrid, Audi A6 Avant, Audi S6, Audi A6 allroad quattro, Audi RS 6 Avant, Audi A7, Audi S7, Audi RS7, Audi A8, Audi A8 L, Audi A8 hybrid, Audi S8, Audi R8, Audi R8 Spyder, Audi R8 GT, Audi R8 GT Spyder\',\n"
				+ "			14764,  \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 262965, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (3, \'Gyor\', \'Audi\' ,\'Gyor\', \'Hungary\', 47.68746, 17.65040,\n"
				+ "		\'Audi TT Coupe, Audi TT Roadster,Audi A3 Cabriolet\',\n"
				+ "		8663, \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 33553, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (4, \'Changchun\', \'Volkswagen\' , \'Changchun\', \'China\', 43.81708, 125.32354,\n"
				+ "		\'Audi A6L, Audi A4L, Audi Q5\',\n"
				+ "			9700, \'"
				+ new Timestamp(new GregorianCalendar(2011, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 333467, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (5, \'Bruessel\', \'Audi\' ,\'Bruessel\', \'Belgium\', 50.85034, 4.35171,\n"
				+ "		\'Audi A1, Audi A1 Sportback, Audi A1 quattro\',\n"
				+ "		2503, \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 123111, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (6, \'Aurangabad\', \'Skoda\' , \'Aurangabad\', \'India\', 19.87617, 75.34331,\n"
				+ "		\'Audi A4 Limousine, Audi A6 Limousine,Audi Q5, Audi Q7\',\n"
				+ "			140, \'"
				+ new Timestamp(new GregorianCalendar(2011, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 6786, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (7, \'Bratislava\', \'Volkswagen\' , \'Bratislava\', \'Slovakia\', 48.14589, 17.10714,\n"
				+ "		\'Audi Q7\',\n"
				+ "			2200, \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 54562, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (8, \'Martorell\', \'Seat\' ,\'Martorell\', \'Spain\', 41.48040, 1.91481,\n"
				+ "		\'Audi Q3\',\n"
				+ "		1500, \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 106829, 3, \'DSA GmbH\', 0\n"
				+ "	);\n"
				+ "	insert into factory values (9, \'Jakarta\', \'Audi\' , \'Jakarta\', \'Indonesia\', -6.21154, 106.84517,\n"
				+ "		\'Audi A4, Audi A6\',\n"
				+ "			0, \'"
				+ new Timestamp(new GregorianCalendar(2012, 11, 31).getTime()
						.getTime()).toString()
				+ "\', 443, 3, \'DSA GmbH\', 0\n" + "	);\n";

		nextId = 2000;

		out.write(s);

		for (int f : factoryIds) {
			initHalls(f);
		}

	}

	public static void initHalls(int factoryId) throws IOException {

		String[] paths = new String[3];
		paths[0] = "m 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z";
		paths[1] = "m 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z";
		paths[2] = "m 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z";

		for (int i = 0; i < numOfHalls; i++) {
			int id = id();

			StringBuilder st = new StringBuilder();

			Random r = new Random();

			// Example:
			// "INSERT INTO hall VALUES (10, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);"

			st.append("INSERT INTO hall VALUES (");
			// id
			st.append(id);

			// name
			String name = "" + chars.charAt(r.nextInt(chars.length()))
					+ numbers.charAt(r.nextInt(numbers.length()));
			st.append(", \'");
			st.append(name);
			st.append("\'");

			// staff
			st.append(", ");
			st.append((int) (Math.random() * 1000 + 1));

			// capacity
			st.append(", ");
			st.append((int) (Math.random() * 10000 + 1));

			// path
			st.append(", ");
			st.append("\'");
			st.append(paths[i]);

			// factoryid
			st.append("\', ");
			st.append(factoryId);
			st.append(");\n");

			out.write(st.toString());

			initLines(id, name);
		}

	}

	private static void initLines(int hallId, String name) throws IOException {

		String[] paths = new String[3];
		paths[0] = "m 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z";
		paths[1] = "m 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z";
		paths[2] = "m 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z";

		String[] names = new String[3];
		names[0] = "Assembly";
		names[1] = "PreSeries";
		names[2] = "Finish";

		for (int i = 0; i < numOfLines; i++) {
			int id = id();

			StringBuilder st = new StringBuilder();

			Random r = new Random();

			st.append("INSERT INTO line VALUES (");
			// id
			st.append(id);

			// name
			st.append(", \'");
			st.append(name + " " + names[i]);
			st.append("\'");

			// series
			st.append(", \'");
			st.append("Series " + numbers.charAt(r.nextInt(numbers.length())));
			st.append("\'");

			// staff
			st.append(", ");
			st.append((int) (Math.random() * 100 + 1));

			// path
			st.append(", \'");
			st.append(paths[i]);
			st.append("\'");

			// Hallid
			st.append(", ");
			st.append(hallId);
			st.append(");\n");

			out.write(st.toString());

			// INSERT INTO line VALUES (100, 'B5 Assembly', 'Test Series', 0, 'm
			// 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 10);
			// INSERT INTO line VALUES (101, 'B5 Finish', 'Test Series', 0, 'm
			// 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0
			// 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 10);

			initLocations(id);
		}

	}

	private static void initLocations(int lineId) throws IOException {

		String[] description = { "motor", "ABS", "multimedia", "security",
				"transmission" };

		String[] firstname = { "Hans", "Peter", "Robert", "Sarah", "Franziska" };
		String[] lastname = { "Mueller", "Schmitt", "Meier", "Schulze",
				"Merkel" };

		for (int i = 0; i < numOfLocations; i++) {
			int id = id();

			// INSERT INTO location VALUES (1010, 'BZD', 101);

			StringBuilder st = new StringBuilder();

			Random r = new Random();

			st.append("INSERT INTO location VALUES (");
			// id
			st.append(id);

			// name
			st.append(", \'");
			st.append("" + chars.charAt(r.nextInt(numbers.length()))
					+ chars.charAt(r.nextInt(numbers.length()))
					+ numbers.charAt(r.nextInt(numbers.length())));
			st.append("\'");

			// decription
			int c = (int) (Math.random() * description.length);
			st.append(", \'");
			st.append(description[c] + " test");
			st.append("\'");

			// personincharge
			int f = (int) (Math.random() * firstname.length);
			int l = (int) (Math.random() * lastname.length);
			st.append(", \'");
			st.append(firstname[f] + " " + lastname[l]);
			st.append("\'");

			// Lineid
			st.append(", ");
			st.append(lineId);
			st.append(");\n");

			out.write(st.toString());

			initDevices(id);
		}

	}

	private static void initDevices(int locationId) throws IOException {

		String[] categories = { "handheld", "mobile station",
				"flashing station", "printer" };

		for (int i = 0; i < numOfDevices; i++) {

			int id = id();

			// insert into device values (10000, 'TestCategory', 'TestSector',
			// '12345', '2013-05-28 07:37:16-08', false, 1000);

			StringBuilder st = new StringBuilder();

			Random r = new Random();

			st.append("INSERT INTO device VALUES (");
			// id
			st.append(id);

			// category
			int c = (int) (Math.random() * categories.length);
			st.append(", \'");
			st.append(categories[c]);
			st.append("\'");

			// sector
			st.append(", \'");
			st.append("" + chars.charAt(r.nextInt(numbers.length())));
			st.append("\'");

			// serialnumber
			st.append(", \'");
			st.append((int) (Math.random() * 100000000 + 1));
			st.append("\'");

			// time
			Date d = new Date();
			long l = d.getTime();
			l -= (Math.random() * 1000 * 60 * 60 * 24);
			st.append(", \'");
			st.append(new Timestamp(l));
			st.append("\'");

			// trouble
			int a = (int) (Math.random() * 10);
			String b = "false";
			if (a > 8) {
				b = "true";
			}
			st.append(", ");
			st.append(b);

			// locationid
			st.append(", ");
			st.append(locationId);
			st.append(");\n");

			out.write(st.toString());

			initComponents(id);
		}

	}

	private static void initComponents(int deviceId) throws IOException {

		String[] names = { "Dr. Dr. Sheldon Lee Cooper",
				"Dr. Leonard Leakey Hofstadter", "Howard Joel Wolowitz",
				"Dr. Rajesh Ramayan Koothrappali" };

		for (int i = 0; i < numOfComponents; i++) {
			int id = id();

			StringBuilder st = new StringBuilder();

			Random r = new Random();

			st.append("INSERT INTO component VALUES (");
			// id
			st.append(id);

			// sector
			st.append(", \'");
			st.append("" + chars.charAt(r.nextInt(numbers.length())));
			st.append("\'");

			// sector
			st.append(", \'");
			st.append("" + chars.charAt(r.nextInt(numbers.length())));
			st.append("\'");

			// serialnumber
			st.append(", \'");
			st.append((int) (Math.random() * 100000000 + 1));
			st.append("\'");

			// name
			int a = (int) (Math.random() * names.length);
			st.append(", \'");
			st.append(names[a]);
			st.append("\'");

			// time
			Date d = new Date();
			long l = d.getTime();
			l -= (Math.random() * 1000 * 60 * 60 * 24);
			st.append(", \'");
			st.append(new Timestamp(l));
			st.append("\'");

			//
			st.append(", \'");
			st.append("" + chars.charAt(r.nextInt(chars.length()))
					+ numbers.charAt(r.nextInt(numbers.length())));
			st.append("\'");

			// status
			String status = MasterData.TrafficLight.red.name();
			double rand = Math.random();
			if (rand > 0.1d) {
				status = MasterData.TrafficLight.green.name();
			} else if (rand > 0.05d) {
				status = MasterData.TrafficLight.yellow.name();
			}
			st.append(", \'");
			st.append(status);
			st.append("\'");

			// deviceid
			st.append(", ");
			st.append(deviceId);
			st.append(");\n");

			out.write(st.toString());

			// insert into component values(100000, 'TestSector',
			// 'TestCategory','123ab45c', 'Sheldon Cooper', '2013-05-28
			// 17:50:00-08', 'aa', 10000);

		}

	}

}
