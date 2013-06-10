drop table if exists component; 
drop table if exists device;
drop table if exists line;
drop table if exists location;
drop table if exists hall;
drop table if exists factory;
create table factory(
	id int ,
	name char varying(50), 
	company char varying(50), 
	city char varying(50), 
	country char varying(50), 	
	gpslatitude double precision , 
	gpslongitude double precision, 
	carmodels char varying(512), 
	sizeofstaff int, 
	sizeofstaffdate timestamp,
	numofvehicles int, 
	upsservers int, 
	upsprovider char varying(128), 
 parent integer
);
CREATE TABLE hall (
    id integer ,
    name character varying(50),
    staff integer,
    capacity integer,
	   carmodels char varying(512), 
	   upsservers int, 
    path character varying(5000),
    parent integer
);
CREATE TABLE line (
    id integer ,
    name character varying(50),
    series character varying(50),
    capacity integer,
    path character varying(5000),
    parent integer
);
CREATE TABLE location (
    id integer ,
    name character varying(50),
    description character varying(100),
    personincharge character varying(100),
    parent integer
);
CREATE TABLE device (
	    id integer ,
	    type character varying(50),
	    description character varying(50),
	    name character varying(50),
	    networkstatus character varying(50),
	    ipaddress character varying(50),
	    maintainanceinfo character varying(50),
	    sector character varying(50),
	    serialnumber character varying(50),
	    troubleperiod timestamp,
	    testfailure boolean,
	    parent integer
	);
	CREATE TABLE component (
	    id integer ,
	    sector character varying(50),
	    category character varying(50),
	    serialnumber character varying(50),
	    shiftresponsibility character varying(50),
	    troubleoccurrencetime timestamp,
	    troubleoccurrencesite character varying(50),
	    status character varying(20),
	    parent integer
	);
insert into factory values (1, 'Ingolstadt', 'Audi' ,'Ingolstadt', 'Germany', 48.762201, 11.425374, 
		'Audi A3, Audi A3 Sportback, Audi S3, Audi S3 Sportback, Audi A4, Audi A4 Avant, Audi S4, Audi S4 Avant, Audi A4 allroad quattro, Audi RS4 Avant, Audi A5 Sportback, Audi A5 Coupe, Audi S5 Sportback, Audi S5 Coupe, Audi RS 5 Coupe, Audi Q5, Audi Q5 hybrid quattro, Audi SQ5 TDI, Karosseriebau/Lackiererei des Audi TT Coupe, Audi TT Roadster, Audi TTS Coupe, Audi TTS Roadster, Audi TT RS Coupe, Audi TT RS Roadster, Audi A3 Cabriolet',
		35386, '2012-12-31 00:00:00.0', 551889, 3, 'DSA GmbH', 0
	);
	insert into factory values (2, 'Neckarsulm', 'Audi' , 'Neckarsulm', 'Germany', 49.194213, 9.221771,
		'Audi A4, Audi A5 Cabriolet, Audi S5 Cabriolet, Audi RS 5 Cabriolet, Audi A6, Audi A6 hybrid, Audi A6 Avant, Audi S6, Audi A6 allroad quattro, Audi RS 6 Avant, Audi A7, Audi S7, Audi RS7, Audi A8, Audi A8 L, Audi A8 hybrid, Audi S8, Audi R8, Audi R8 Spyder, Audi R8 GT, Audi R8 GT Spyder',
			14764,  '2012-12-31 00:00:00.0', 262965, 3, 'DSA GmbH', 0
	);
	insert into factory values (3, 'Gyor', 'Audi' ,'Gyor', 'Hungary', 47.68746, 17.65040,
		'Audi TT Coupe, Audi TT Roadster,Audi A3 Cabriolet',
		8663, '2012-12-31 00:00:00.0', 33553, 3, 'DSA GmbH', 0
	);
	insert into factory values (4, 'Changchun', 'Volkswagen' , 'Changchun', 'China', 43.81708, 125.32354,
		'Audi A6L, Audi A4L, Audi Q5',
			9700, '2011-12-31 00:00:00.0', 333467, 3, 'DSA GmbH', 0
	);
	insert into factory values (5, 'Bruessel', 'Audi' ,'Bruessel', 'Belgium', 50.85034, 4.35171,
		'Audi A1, Audi A1 Sportback, Audi A1 quattro',
		2503, '2012-12-31 00:00:00.0', 123111, 3, 'DSA GmbH', 0
	);
	insert into factory values (6, 'Aurangabad', 'Skoda' , 'Aurangabad', 'India', 19.87617, 75.34331,
		'Audi A4 Limousine, Audi A6 Limousine,Audi Q5, Audi Q7',
			140, '2011-12-31 00:00:00.0', 6786, 3, 'DSA GmbH', 0
	);
	insert into factory values (7, 'Bratislava', 'Volkswagen' , 'Bratislava', 'Slovakia', 48.14589, 17.10714,
		'Audi Q7',
			2200, '2012-12-31 00:00:00.0', 54562, 3, 'DSA GmbH', 0
	);
	insert into factory values (8, 'Martorell', 'Seat' ,'Martorell', 'Spain', 41.48040, 1.91481,
		'Audi Q3',
		1500, '2012-12-31 00:00:00.0', 106829, 3, 'DSA GmbH', 0
	);
	insert into factory values (9, 'Jakarta', 'Audi' , 'Jakarta', 'Indonesia', -6.21154, 106.84517,
		'Audi A4, Audi A6',
			0, '2012-12-31 00:00:00.0', 443, 3, 'DSA GmbH', 0
	);
INSERT INTO hall VALUES (2000, 'I3', 727, 6014, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);
INSERT INTO line VALUES (2001, 'I3 Assembly', 'Series 7', 65, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2000);
INSERT INTO location VALUES (2002, 'DA8', 'transmission test', 'Sarah Meier', 2001);
INSERT INTO device VALUES (2003, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '64253596', '2013-06-09 21:38:08.158', false, 2002);
INSERT INTO component VALUES (2004, 'G', 'D', '63496390', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 13:03:17.786', 'B8', 'green', 2003);
INSERT INTO component VALUES (2005, 'G', 'A', '80690546', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 16:00:47.865', 'H9', 'green', 2003);
INSERT INTO device VALUES (2006, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '53817157', '2013-06-10 04:11:20.15', true, 2002);
INSERT INTO component VALUES (2007, 'G', 'G', '28659408', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 03:35:47.916', 'C3', 'green', 2006);
INSERT INTO component VALUES (2008, 'F', 'G', '43840261', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 16:07:07.447', 'F8', 'green', 2006);
INSERT INTO location VALUES (2009, 'DA7', 'multimedia test', 'Franziska Merkel', 2001);
INSERT INTO device VALUES (2010, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '55724299', '2013-06-09 21:03:53.982', false, 2009);
INSERT INTO component VALUES (2011, 'B', 'E', '80466091', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:26:51.086', 'A3', 'green', 2010);
INSERT INTO component VALUES (2012, 'H', 'I', '79733610', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:25:22.626', 'H7', 'green', 2010);
INSERT INTO device VALUES (2013, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '20056434', '2013-06-10 13:17:17.426', false, 2009);
INSERT INTO component VALUES (2014, 'G', 'C', '35164948', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:37:29.932', 'F3', 'green', 2013);
INSERT INTO component VALUES (2015, 'C', 'G', '474790', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 19:16:03.558', 'A4', 'green', 2013);
INSERT INTO line VALUES (2016, 'I3 PreSeries', 'Series 5', 49, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2000);
INSERT INTO location VALUES (2017, 'HA6', 'ABS test', 'Franziska Mueller', 2016);
INSERT INTO device VALUES (2018, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '22374115', '2013-06-10 13:58:31.559', true, 2017);
INSERT INTO component VALUES (2019, 'A', 'G', '75285217', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:59:19.123', 'C9', 'green', 2018);
INSERT INTO component VALUES (2020, 'A', 'H', '55086934', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:25:57.091', 'G7', 'green', 2018);
INSERT INTO device VALUES (2021, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '73911336', '2013-06-10 06:48:32.781', false, 2017);
INSERT INTO component VALUES (2022, 'A', 'I', '48051375', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:58:08.887', 'B6', 'green', 2021);
INSERT INTO component VALUES (2023, 'A', 'B', '57738668', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 10:55:40.609', 'C1', 'green', 2021);
INSERT INTO location VALUES (2024, 'DH5', 'security test', 'Peter Merkel', 2016);
INSERT INTO device VALUES (2025, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '94962531', '2013-06-10 00:45:31.092', false, 2024);
INSERT INTO component VALUES (2026, 'D', 'G', '22670934', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 08:17:08.011', 'H9', 'green', 2025);
INSERT INTO component VALUES (2027, 'F', 'E', '50222254', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 20:42:24.291', 'G8', 'yellow', 2025);
INSERT INTO device VALUES (2028, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '96475690', '2013-06-10 12:13:53.011', false, 2024);
INSERT INTO component VALUES (2029, 'D', 'G', '68550075', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 05:47:37.066', 'G5', 'green', 2028);
INSERT INTO component VALUES (2030, 'D', 'F', '5798397', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 07:54:13.414', 'I5', 'green', 2028);
INSERT INTO hall VALUES (2031, 'D5', 68, 523, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1);
INSERT INTO line VALUES (2032, 'D5 Assembly', 'Series 8', 49, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2031);
INSERT INTO location VALUES (2033, 'GA1', 'multimedia test', 'Franziska Schmitt', 2032);
INSERT INTO device VALUES (2034, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '19683372', '2013-06-10 05:03:39.246', false, 2033);
INSERT INTO component VALUES (2035, 'B', 'A', '63389435', 'Howard Joel Wolowitz', '2013-06-10 02:32:04.211', 'H4', 'green', 2034);
INSERT INTO component VALUES (2036, 'B', 'A', '35681549', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 18:48:45.391', 'C8', 'green', 2034);
INSERT INTO device VALUES (2037, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '35667207', '2013-06-10 09:23:35.103', false, 2033);
INSERT INTO component VALUES (2038, 'B', 'E', '35429248', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:35:24.176', 'E2', 'green', 2037);
INSERT INTO component VALUES (2039, 'D', 'I', '8491690', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:01:11.487', 'E8', 'green', 2037);
INSERT INTO location VALUES (2040, 'CB3', 'motor test', 'Peter Schmitt', 2032);
INSERT INTO device VALUES (2041, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '65571041', '2013-06-10 06:41:29.302', false, 2040);
INSERT INTO component VALUES (2042, 'B', 'F', '31333464', 'Howard Joel Wolowitz', '2013-06-09 23:28:57.468', 'D2', 'yellow', 2041);
INSERT INTO component VALUES (2043, 'A', 'I', '25243618', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:05:35.24', 'A3', 'red', 2041);
INSERT INTO device VALUES (2044, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '30111416', '2013-06-10 11:48:32.081', false, 2040);
INSERT INTO component VALUES (2045, 'B', 'G', '26349064', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:24:11.045', 'D3', 'green', 2044);
INSERT INTO component VALUES (2046, 'I', 'B', '21339680', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 02:37:33.913', 'E8', 'green', 2044);
INSERT INTO line VALUES (2047, 'D5 PreSeries', 'Series 1', 37, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2031);
INSERT INTO location VALUES (2048, 'DE8', 'security test', 'Franziska Meier', 2047);
INSERT INTO device VALUES (2049, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '79487945', '2013-06-10 02:06:00.367', false, 2048);
INSERT INTO component VALUES (2050, 'I', 'A', '18560395', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:12:52.345', 'H2', 'green', 2049);
INSERT INTO component VALUES (2051, 'C', 'E', '27210409', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:00:32.622', 'H2', 'green', 2049);
INSERT INTO device VALUES (2052, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '14868819', '2013-06-10 03:39:05.701', false, 2048);
INSERT INTO component VALUES (2053, 'G', 'I', '25953444', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:58:35.692', 'C8', 'green', 2052);
INSERT INTO component VALUES (2054, 'G', 'C', '1165389', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:04:19.522', 'B8', 'green', 2052);
INSERT INTO location VALUES (2055, 'BA7', 'multimedia test', 'Peter Meier', 2047);
INSERT INTO device VALUES (2056, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '79168220', '2013-06-10 09:30:37.863', false, 2055);
INSERT INTO component VALUES (2057, 'F', 'A', '39165567', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:39:12.755', 'E6', 'green', 2056);
INSERT INTO component VALUES (2058, 'F', 'F', '13892239', 'Howard Joel Wolowitz', '2013-06-10 03:45:14.14', 'I6', 'green', 2056);
INSERT INTO device VALUES (2059, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '56140401', '2013-06-10 01:15:56.536', false, 2055);
INSERT INTO component VALUES (2060, 'H', 'A', '63870795', 'Howard Joel Wolowitz', '2013-06-09 23:16:39.786', 'G4', 'green', 2059);
INSERT INTO component VALUES (2061, 'G', 'E', '63923030', 'Howard Joel Wolowitz', '2013-06-10 15:59:17.227', 'B3', 'green', 2059);
INSERT INTO hall VALUES (2062, 'D3', 364, 9201, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2);
INSERT INTO line VALUES (2063, 'D3 Assembly', 'Series 3', 81, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2062);
INSERT INTO location VALUES (2064, 'BI6', 'multimedia test', 'Peter Schulze', 2063);
INSERT INTO device VALUES (2065, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '87791487', '2013-06-10 05:21:10.386', false, 2064);
INSERT INTO component VALUES (2066, 'A', 'C', '74465097', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 17:37:09.454', 'D3', 'green', 2065);
INSERT INTO component VALUES (2067, 'F', 'F', '16403447', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 17:43:50.667', 'G3', 'red', 2065);
INSERT INTO device VALUES (2068, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '92811144', '2013-06-10 01:21:57.563', false, 2064);
INSERT INTO component VALUES (2069, 'G', 'A', '66243278', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 17:58:11.017', 'I5', 'red', 2068);
INSERT INTO component VALUES (2070, 'E', 'F', '56279780', 'Howard Joel Wolowitz', '2013-06-10 05:36:23.492', 'F8', 'green', 2068);
INSERT INTO location VALUES (2071, 'HE3', 'motor test', 'Peter Schulze', 2063);
INSERT INTO device VALUES (2072, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '2826860', '2013-06-10 05:40:19.874', false, 2071);
INSERT INTO component VALUES (2073, 'F', 'A', '21794628', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:33:38.391', 'F9', 'green', 2072);
INSERT INTO component VALUES (2074, 'C', 'I', '76924105', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 09:17:09.328', 'B7', 'green', 2072);
INSERT INTO device VALUES (2075, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '76891009', '2013-06-10 18:26:27.125', false, 2071);
INSERT INTO component VALUES (2076, 'G', 'H', '21185436', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 19:01:14.294', 'H7', 'green', 2075);
INSERT INTO component VALUES (2077, 'I', 'D', '30816800', 'Howard Joel Wolowitz', '2013-06-10 19:22:19.738', 'G4', 'green', 2075);
INSERT INTO line VALUES (2078, 'D3 PreSeries', 'Series 2', 47, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2062);
INSERT INTO location VALUES (2079, 'BI2', 'multimedia test', 'Robert Schmitt', 2078);
INSERT INTO device VALUES (2080, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '39674965', '2013-06-10 02:08:20.105', false, 2079);
INSERT INTO component VALUES (2081, 'G', 'H', '41947257', 'Howard Joel Wolowitz', '2013-06-09 22:57:29.352', 'G5', 'red', 2080);
INSERT INTO component VALUES (2082, 'G', 'A', '34801293', 'Howard Joel Wolowitz', '2013-06-10 11:28:45.515', 'B1', 'green', 2080);
INSERT INTO device VALUES (2083, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '98464258', '2013-06-10 19:17:43.235', false, 2079);
INSERT INTO component VALUES (2084, 'I', 'G', '22880675', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:01:39.081', 'D4', 'green', 2083);
INSERT INTO component VALUES (2085, 'C', 'C', '47842534', 'Howard Joel Wolowitz', '2013-06-10 11:11:04.929', 'F8', 'green', 2083);
INSERT INTO location VALUES (2086, 'AG4', 'security test', 'Franziska Merkel', 2078);
INSERT INTO device VALUES (2087, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '59644669', '2013-06-10 07:47:40.465', false, 2086);
INSERT INTO component VALUES (2088, 'G', 'D', '98916310', 'Howard Joel Wolowitz', '2013-06-10 03:44:50.682', 'I4', 'yellow', 2087);
INSERT INTO component VALUES (2089, 'F', 'G', '42927645', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:05:36.602', 'I1', 'green', 2087);
INSERT INTO device VALUES (2090, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '62820543', '2013-06-10 20:07:40.414', false, 2086);
INSERT INTO component VALUES (2091, 'E', 'F', '42959084', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:44:28.107', 'A1', 'green', 2090);
INSERT INTO component VALUES (2092, 'F', 'I', '83841874', 'Howard Joel Wolowitz', '2013-06-10 18:25:37.455', 'F6', 'green', 2090);
INSERT INTO hall VALUES (2093, 'C8', 757, 5434, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2);
INSERT INTO line VALUES (2094, 'C8 Assembly', 'Series 3', 40, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2093);
INSERT INTO location VALUES (2095, 'BA4', 'multimedia test', 'Peter Meier', 2094);
INSERT INTO device VALUES (2096, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '64083560', '2013-06-09 21:02:41.603', true, 2095);
INSERT INTO component VALUES (2097, 'A', 'A', '58824806', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 07:27:28.995', 'E4', 'green', 2096);
INSERT INTO component VALUES (2098, 'E', 'F', '90608697', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 07:45:40.073', 'H8', 'green', 2096);
INSERT INTO device VALUES (2099, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '96590997', '2013-06-10 12:49:35.124', false, 2095);
INSERT INTO component VALUES (2100, 'B', 'D', '55277328', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:01:29.857', 'H5', 'green', 2099);
INSERT INTO component VALUES (2101, 'F', 'I', '35366427', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:41:32.707', 'F3', 'green', 2099);
INSERT INTO location VALUES (2102, 'IB7', 'multimedia test', 'Franziska Mueller', 2094);
INSERT INTO device VALUES (2103, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '79984198', '2013-06-10 09:25:20.717', false, 2102);
INSERT INTO component VALUES (2104, 'E', 'F', '82976193', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 17:55:15.859', 'F5', 'green', 2103);
INSERT INTO component VALUES (2105, 'C', 'A', '66599918', 'Howard Joel Wolowitz', '2013-06-10 17:23:15.895', 'I9', 'green', 2103);
INSERT INTO device VALUES (2106, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '9979760', '2013-06-10 10:53:52.825', false, 2102);
INSERT INTO component VALUES (2107, 'G', 'D', '46108593', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 03:35:57.818', 'I1', 'green', 2106);
INSERT INTO component VALUES (2108, 'I', 'H', '96871119', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 13:23:52.705', 'B2', 'green', 2106);
INSERT INTO line VALUES (2109, 'C8 PreSeries', 'Series 1', 73, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2093);
INSERT INTO location VALUES (2110, 'HC3', 'security test', 'Robert Meier', 2109);
INSERT INTO device VALUES (2111, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '5900299', '2013-06-10 16:51:54.828', false, 2110);
INSERT INTO component VALUES (2112, 'B', 'H', '67629617', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 08:36:36.343', 'I9', 'green', 2111);
INSERT INTO component VALUES (2113, 'I', 'B', '90699213', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:41:01.39', 'F1', 'green', 2111);
INSERT INTO device VALUES (2114, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '22938806', '2013-06-10 05:52:30.105', false, 2110);
INSERT INTO component VALUES (2115, 'G', 'H', '10127423', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:54:35.438', 'C1', 'yellow', 2114);
INSERT INTO component VALUES (2116, 'E', 'A', '79453096', 'Howard Joel Wolowitz', '2013-06-10 13:03:15.285', 'A7', 'red', 2114);
INSERT INTO location VALUES (2117, 'HD7', 'transmission test', 'Sarah Schulze', 2109);
INSERT INTO device VALUES (2118, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '8984974', '2013-06-10 18:44:41.662', false, 2117);
INSERT INTO component VALUES (2119, 'A', 'I', '26868929', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:12:01.832', 'C7', 'green', 2118);
INSERT INTO component VALUES (2120, 'D', 'D', '30503134', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 07:23:19.444', 'I4', 'green', 2118);
INSERT INTO device VALUES (2121, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '14338433', '2013-06-10 04:29:52.179', false, 2117);
INSERT INTO component VALUES (2122, 'B', 'C', '56230971', 'Howard Joel Wolowitz', '2013-06-10 16:55:25.444', 'D7', 'green', 2121);
INSERT INTO component VALUES (2123, 'B', 'H', '5007798', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 07:51:59.346', 'D2', 'green', 2121);
INSERT INTO hall VALUES (2124, 'F2', 199, 1999, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO line VALUES (2125, 'F2 Assembly', 'Series 1', 11, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2124);
INSERT INTO location VALUES (2126, 'HD5', 'security test', 'Sarah Merkel', 2125);
INSERT INTO device VALUES (2127, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '71041021', '2013-06-10 11:41:13.484', false, 2126);
INSERT INTO component VALUES (2128, 'G', 'C', '6832158', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:36:06.348', 'H6', 'green', 2127);
INSERT INTO component VALUES (2129, 'I', 'I', '30434069', 'Howard Joel Wolowitz', '2013-06-10 07:00:33.131', 'C8', 'green', 2127);
INSERT INTO device VALUES (2130, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '78791589', '2013-06-09 22:02:07.378', false, 2126);
INSERT INTO component VALUES (2131, 'A', 'A', '50842204', 'Howard Joel Wolowitz', '2013-06-10 19:26:50.292', 'B8', 'red', 2130);
INSERT INTO component VALUES (2132, 'I', 'I', '24541207', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 00:36:30.735', 'F1', 'green', 2130);
INSERT INTO location VALUES (2133, 'CC6', 'security test', 'Sarah Mueller', 2125);
INSERT INTO device VALUES (2134, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '55082088', '2013-06-10 02:30:37.933', false, 2133);
INSERT INTO component VALUES (2135, 'B', 'I', '71053779', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 22:36:35.583', 'H8', 'green', 2134);
INSERT INTO component VALUES (2136, 'I', 'G', '74455240', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:45:56.54', 'B9', 'green', 2134);
INSERT INTO device VALUES (2137, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '45402240', '2013-06-10 18:36:05.259', false, 2133);
INSERT INTO component VALUES (2138, 'F', 'I', '95434889', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:28:52.927', 'A3', 'green', 2137);
INSERT INTO component VALUES (2139, 'B', 'A', '98269206', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:32:17.807', 'C3', 'green', 2137);
INSERT INTO line VALUES (2140, 'F2 PreSeries', 'Series 9', 93, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2124);
INSERT INTO location VALUES (2141, 'GI4', 'multimedia test', 'Peter Schmitt', 2140);
INSERT INTO device VALUES (2142, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '57045493', '2013-06-09 21:39:43.591', false, 2141);
INSERT INTO component VALUES (2143, 'B', 'E', '30593285', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 13:12:25.044', 'B8', 'green', 2142);
INSERT INTO component VALUES (2144, 'G', 'H', '97929465', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:25:45.418', 'E6', 'yellow', 2142);
INSERT INTO device VALUES (2145, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '32834401', '2013-06-10 20:17:28.09', false, 2141);
INSERT INTO component VALUES (2146, 'C', 'H', '11545724', 'Howard Joel Wolowitz', '2013-06-10 17:35:32.041', 'D3', 'green', 2145);
INSERT INTO component VALUES (2147, 'B', 'F', '64944500', 'Howard Joel Wolowitz', '2013-06-09 22:46:19.511', 'D3', 'green', 2145);
INSERT INTO location VALUES (2148, 'GB7', 'ABS test', 'Hans Schulze', 2140);
INSERT INTO device VALUES (2149, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '6936015', '2013-06-10 08:40:47.351', false, 2148);
INSERT INTO component VALUES (2150, 'E', 'C', '3071474', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:09:35.574', 'F3', 'yellow', 2149);
INSERT INTO component VALUES (2151, 'G', 'F', '28675876', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:59:37.98', 'I8', 'green', 2149);
INSERT INTO device VALUES (2152, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '9292635', '2013-06-10 06:18:55.644', false, 2148);
INSERT INTO component VALUES (2153, 'H', 'B', '91176655', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:49:22.497', 'G4', 'green', 2152);
INSERT INTO component VALUES (2154, 'I', 'E', '90652352', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:40:23.833', 'E1', 'green', 2152);
INSERT INTO hall VALUES (2155, 'D8', 969, 4713, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO line VALUES (2156, 'D8 Assembly', 'Series 7', 19, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2155);
INSERT INTO location VALUES (2157, 'FC6', 'transmission test', 'Robert Meier', 2156);
INSERT INTO device VALUES (2158, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '32832259', '2013-06-10 16:36:22.961', false, 2157);
INSERT INTO component VALUES (2159, 'H', 'G', '9252184', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:13:27.344', 'H5', 'green', 2158);
INSERT INTO component VALUES (2160, 'C', 'G', '43313707', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 19:10:42.149', 'G9', 'green', 2158);
INSERT INTO device VALUES (2161, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '55365179', '2013-06-10 18:30:32.721', false, 2157);
INSERT INTO component VALUES (2162, 'A', 'B', '67865818', 'Howard Joel Wolowitz', '2013-06-10 01:31:04.629', 'B7', 'red', 2161);
INSERT INTO component VALUES (2163, 'E', 'F', '41425540', 'Howard Joel Wolowitz', '2013-06-10 12:36:25.689', 'E6', 'green', 2161);
INSERT INTO location VALUES (2164, 'HE1', 'motor test', 'Hans Mueller', 2156);
INSERT INTO device VALUES (2165, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '6151008', '2013-06-10 11:43:17.614', false, 2164);
INSERT INTO component VALUES (2166, 'C', 'H', '39692655', 'Howard Joel Wolowitz', '2013-06-10 03:29:11.103', 'A2', 'green', 2165);
INSERT INTO component VALUES (2167, 'D', 'F', '86493149', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:27:34.686', 'C1', 'green', 2165);
INSERT INTO device VALUES (2168, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '37000141', '2013-06-09 21:53:41.702', false, 2164);
INSERT INTO component VALUES (2169, 'E', 'I', '36215094', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 10:53:07.676', 'A2', 'green', 2168);
INSERT INTO component VALUES (2170, 'G', 'B', '97922431', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 01:50:51.982', 'B1', 'green', 2168);
INSERT INTO line VALUES (2171, 'D8 PreSeries', 'Series 5', 48, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2155);
INSERT INTO location VALUES (2172, 'EG4', 'security test', 'Sarah Meier', 2171);
INSERT INTO device VALUES (2173, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '35166184', '2013-06-10 02:30:56.697', false, 2172);
INSERT INTO component VALUES (2174, 'I', 'C', '14502061', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 14:05:25.735', 'C5', 'green', 2173);
INSERT INTO component VALUES (2175, 'G', 'E', '73576421', 'Howard Joel Wolowitz', '2013-06-10 09:40:53.991', 'B5', 'yellow', 2173);
INSERT INTO device VALUES (2176, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '50900952', '2013-06-10 00:22:46.636', false, 2172);
INSERT INTO component VALUES (2177, 'I', 'B', '62812268', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 07:05:19.897', 'D9', 'green', 2176);
INSERT INTO component VALUES (2178, 'A', 'B', '11967784', 'Howard Joel Wolowitz', '2013-06-10 11:35:48.962', 'G9', 'yellow', 2176);
INSERT INTO location VALUES (2179, 'BE2', 'security test', 'Sarah Schulze', 2171);
INSERT INTO device VALUES (2180, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '14920395', '2013-06-10 06:52:47.38', false, 2179);
INSERT INTO component VALUES (2181, 'I', 'D', '98638002', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 22:28:41.191', 'H9', 'yellow', 2180);
INSERT INTO component VALUES (2182, 'A', 'I', '96443386', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:51:52.261', 'G2', 'green', 2180);
INSERT INTO device VALUES (2183, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '35876608', '2013-06-10 01:22:30.567', false, 2179);
INSERT INTO component VALUES (2184, 'A', 'C', '31684695', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 15:20:25.887', 'E2', 'green', 2183);
INSERT INTO component VALUES (2185, 'B', 'A', '60214780', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:52:37.006', 'A9', 'green', 2183);
INSERT INTO hall VALUES (2186, 'F7', 728, 7086, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO line VALUES (2187, 'F7 Assembly', 'Series 4', 53, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2186);
INSERT INTO location VALUES (2188, 'GH9', 'transmission test', 'Hans Schulze', 2187);
INSERT INTO device VALUES (2189, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '61626521', '2013-06-10 04:31:34.597', false, 2188);
INSERT INTO component VALUES (2190, 'F', 'I', '60671130', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:35:36.172', 'E1', 'green', 2189);
INSERT INTO component VALUES (2191, 'G', 'E', '77336780', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:11:49.898', 'H3', 'green', 2189);
INSERT INTO device VALUES (2192, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '22940545', '2013-06-10 03:48:52.253', false, 2188);
INSERT INTO component VALUES (2193, 'D', 'A', '43384341', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:53:35.726', 'H9', 'green', 2192);
INSERT INTO component VALUES (2194, 'G', 'I', '29662464', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:52:45.858', 'I1', 'green', 2192);
INSERT INTO location VALUES (2195, 'GA5', 'multimedia test', 'Peter Merkel', 2187);
INSERT INTO device VALUES (2196, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '51098438', '2013-06-10 11:15:56.853', false, 2195);
INSERT INTO component VALUES (2197, 'H', 'I', '6903628', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 22:53:26.27', 'H6', 'green', 2196);
INSERT INTO component VALUES (2198, 'G', 'G', '47386995', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 23:33:01.382', 'C2', 'green', 2196);
INSERT INTO device VALUES (2199, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '47009792', '2013-06-10 02:39:32.138', false, 2195);
INSERT INTO component VALUES (2200, 'H', 'I', '31183891', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 19:36:12.818', 'I3', 'green', 2199);
INSERT INTO component VALUES (2201, 'I', 'I', '30616114', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 22:03:31.389', 'F4', 'yellow', 2199);
INSERT INTO line VALUES (2202, 'F7 PreSeries', 'Series 6', 59, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2186);
INSERT INTO location VALUES (2203, 'HC8', 'transmission test', 'Sarah Mueller', 2202);
INSERT INTO device VALUES (2204, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '12077156', '2013-06-10 16:12:30.88', false, 2203);
INSERT INTO component VALUES (2205, 'F', 'I', '44781972', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 04:01:55.472', 'F4', 'green', 2204);
INSERT INTO component VALUES (2206, 'I', 'G', '65216789', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:59:17.848', 'B2', 'yellow', 2204);
INSERT INTO device VALUES (2207, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '70434415', '2013-06-10 09:28:21.452', false, 2203);
INSERT INTO component VALUES (2208, 'B', 'E', '60178965', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 09:06:20.843', 'A4', 'green', 2207);
INSERT INTO component VALUES (2209, 'A', 'H', '13464501', 'Howard Joel Wolowitz', '2013-06-10 12:29:29.885', 'D9', 'green', 2207);
INSERT INTO location VALUES (2210, 'GE5', 'multimedia test', 'Franziska Meier', 2202);
INSERT INTO device VALUES (2211, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '52395513', '2013-06-10 10:19:09.39', false, 2210);
INSERT INTO component VALUES (2212, 'A', 'A', '11352207', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:14:57.705', 'I6', 'green', 2211);
INSERT INTO component VALUES (2213, 'H', 'F', '78105327', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:42:09.783', 'D4', 'green', 2211);
INSERT INTO device VALUES (2214, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '70591157', '2013-06-10 16:50:46.901', false, 2210);
INSERT INTO component VALUES (2215, 'D', 'A', '60609569', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 18:22:17.603', 'C2', 'green', 2214);
INSERT INTO component VALUES (2216, 'A', 'A', '28491024', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 19:34:06.655', 'E9', 'green', 2214);
INSERT INTO hall VALUES (2217, 'C6', 77, 5476, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO line VALUES (2218, 'C6 Assembly', 'Series 2', 32, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2217);
INSERT INTO location VALUES (2219, 'GE8', 'transmission test', 'Peter Schmitt', 2218);
INSERT INTO device VALUES (2220, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '28557495', '2013-06-10 13:15:54.908', false, 2219);
INSERT INTO component VALUES (2221, 'B', 'F', '82868623', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:00:40.679', 'F2', 'green', 2220);
INSERT INTO component VALUES (2222, 'I', 'A', '27221586', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:12:22.766', 'A4', 'green', 2220);
INSERT INTO device VALUES (2223, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '10538348', '2013-06-10 10:24:58.232', false, 2219);
INSERT INTO component VALUES (2224, 'G', 'F', '18089282', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:57:25.683', 'H3', 'green', 2223);
INSERT INTO component VALUES (2225, 'D', 'C', '85638883', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 05:09:20.49', 'D7', 'yellow', 2223);
INSERT INTO location VALUES (2226, 'CH5', 'security test', 'Franziska Meier', 2218);
INSERT INTO device VALUES (2227, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '45456936', '2013-06-10 19:06:04.307', false, 2226);
INSERT INTO component VALUES (2228, 'D', 'A', '89361117', 'Howard Joel Wolowitz', '2013-06-10 07:56:23.517', 'B4', 'green', 2227);
INSERT INTO component VALUES (2229, 'E', 'G', '19270520', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:10:23.175', 'C2', 'green', 2227);
INSERT INTO device VALUES (2230, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '32637011', '2013-06-10 11:02:34.422', false, 2226);
INSERT INTO component VALUES (2231, 'B', 'H', '62228184', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 19:27:17.635', 'D5', 'red', 2230);
INSERT INTO component VALUES (2232, 'I', 'F', '25046568', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 15:56:14.784', 'F7', 'green', 2230);
INSERT INTO line VALUES (2233, 'C6 PreSeries', 'Series 1', 40, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2217);
INSERT INTO location VALUES (2234, 'AC9', 'security test', 'Sarah Meier', 2233);
INSERT INTO device VALUES (2235, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '48936677', '2013-06-10 00:10:50.939', false, 2234);
INSERT INTO component VALUES (2236, 'D', 'A', '43210643', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:17:28.986', 'C5', 'green', 2235);
INSERT INTO component VALUES (2237, 'D', 'F', '1709516', 'Howard Joel Wolowitz', '2013-06-10 11:36:04.125', 'C7', 'green', 2235);
INSERT INTO device VALUES (2238, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '56092664', '2013-06-10 02:34:08.607', false, 2234);
INSERT INTO component VALUES (2239, 'E', 'B', '62379064', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:41:16.393', 'H6', 'yellow', 2238);
INSERT INTO component VALUES (2240, 'C', 'E', '90573186', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 14:33:03.905', 'I3', 'green', 2238);
INSERT INTO location VALUES (2241, 'EF4', 'transmission test', 'Robert Mueller', 2233);
INSERT INTO device VALUES (2242, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '73096676', '2013-06-10 10:34:13.154', false, 2241);
INSERT INTO component VALUES (2243, 'E', 'A', '14582791', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 13:54:30.463', 'I9', 'green', 2242);
INSERT INTO component VALUES (2244, 'F', 'E', '63101137', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:33:21.19', 'F1', 'yellow', 2242);
INSERT INTO device VALUES (2245, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '94272539', '2013-06-10 07:41:21.094', false, 2241);
INSERT INTO component VALUES (2246, 'I', 'I', '53629541', 'Howard Joel Wolowitz', '2013-06-10 00:18:12.788', 'B5', 'green', 2245);
INSERT INTO component VALUES (2247, 'D', 'I', '37049572', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 04:43:33.385', 'I8', 'green', 2245);
INSERT INTO hall VALUES (2248, 'B2', 873, 6736, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO line VALUES (2249, 'B2 Assembly', 'Series 6', 33, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2248);
INSERT INTO location VALUES (2250, 'FD6', 'motor test', 'Franziska Merkel', 2249);
INSERT INTO device VALUES (2251, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '17383420', '2013-06-10 04:43:57.157', false, 2250);
INSERT INTO component VALUES (2252, 'G', 'I', '81814127', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 17:26:34.429', 'H8', 'green', 2251);
INSERT INTO component VALUES (2253, 'D', 'E', '92077977', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 06:07:26.957', 'A2', 'green', 2251);
INSERT INTO device VALUES (2254, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '93914694', '2013-06-09 23:32:34.606', false, 2250);
INSERT INTO component VALUES (2255, 'B', 'E', '91977335', 'Howard Joel Wolowitz', '2013-06-10 15:42:32.826', 'A2', 'green', 2254);
INSERT INTO component VALUES (2256, 'I', 'D', '10287143', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:51:25.116', 'E2', 'green', 2254);
INSERT INTO location VALUES (2257, 'HH8', 'security test', 'Robert Mueller', 2249);
INSERT INTO device VALUES (2258, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '15416650', '2013-06-10 17:20:17.84', false, 2257);
INSERT INTO component VALUES (2259, 'C', 'E', '2230254', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 10:25:25.465', 'B5', 'red', 2258);
INSERT INTO component VALUES (2260, 'E', 'E', '82013562', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:08:39.555', 'B8', 'green', 2258);
INSERT INTO device VALUES (2261, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '90426120', '2013-06-10 11:02:00.567', false, 2257);
INSERT INTO component VALUES (2262, 'D', 'B', '61796074', 'Howard Joel Wolowitz', '2013-06-10 08:13:03.172', 'B5', 'green', 2261);
INSERT INTO component VALUES (2263, 'D', 'E', '5087858', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 19:15:30.573', 'H9', 'red', 2261);
INSERT INTO line VALUES (2264, 'B2 PreSeries', 'Series 6', 99, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2248);
INSERT INTO location VALUES (2265, 'HA2', 'security test', 'Hans Schmitt', 2264);
INSERT INTO device VALUES (2266, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '87501976', '2013-06-10 13:31:45.323', false, 2265);
INSERT INTO component VALUES (2267, 'I', 'D', '73308662', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:04:39.789', 'G2', 'green', 2266);
INSERT INTO component VALUES (2268, 'I', 'A', '45139310', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:46:04.874', 'D3', 'green', 2266);
INSERT INTO device VALUES (2269, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '26236019', '2013-06-10 09:20:01.663', false, 2265);
INSERT INTO component VALUES (2270, 'D', 'D', '34360661', 'Howard Joel Wolowitz', '2013-06-09 21:05:05.866', 'C3', 'yellow', 2269);
INSERT INTO component VALUES (2271, 'A', 'C', '58027290', 'Howard Joel Wolowitz', '2013-06-10 07:32:23.994', 'C2', 'green', 2269);
INSERT INTO location VALUES (2272, 'CC3', 'ABS test', 'Hans Mueller', 2264);
INSERT INTO device VALUES (2273, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '64211126', '2013-06-10 18:05:52.928', false, 2272);
INSERT INTO component VALUES (2274, 'E', 'I', '58182504', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 11:06:41.995', 'E3', 'green', 2273);
INSERT INTO component VALUES (2275, 'H', 'E', '3495358', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:05:16.499', 'G2', 'yellow', 2273);
INSERT INTO device VALUES (2276, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '57858143', '2013-06-10 08:56:01.98', false, 2272);
INSERT INTO component VALUES (2277, 'D', 'B', '37441689', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:53:43.33', 'E6', 'green', 2276);
INSERT INTO component VALUES (2278, 'F', 'B', '88461017', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 22:26:03.807', 'H6', 'green', 2276);
INSERT INTO hall VALUES (2279, 'F3', 759, 2848, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO line VALUES (2280, 'F3 Assembly', 'Series 9', 70, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2279);
INSERT INTO location VALUES (2281, 'BI1', 'ABS test', 'Robert Meier', 2280);
INSERT INTO device VALUES (2282, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '83890586', '2013-06-10 06:26:24.186', false, 2281);
INSERT INTO component VALUES (2283, 'F', 'D', '76959510', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:03:03.02', 'H7', 'green', 2282);
INSERT INTO component VALUES (2284, 'B', 'D', '61130008', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 20:00:35.151', 'I4', 'green', 2282);
INSERT INTO device VALUES (2285, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '4954719', '2013-06-09 21:02:37.104', false, 2281);
INSERT INTO component VALUES (2286, 'G', 'C', '27149892', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 00:09:24.515', 'D7', 'green', 2285);
INSERT INTO component VALUES (2287, 'H', 'D', '96512840', 'Howard Joel Wolowitz', '2013-06-10 16:45:58.955', 'D7', 'green', 2285);
INSERT INTO location VALUES (2288, 'CI3', 'motor test', 'Hans Schulze', 2280);
INSERT INTO device VALUES (2289, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '8564144', '2013-06-10 19:41:46.717', false, 2288);
INSERT INTO component VALUES (2290, 'F', 'D', '47549891', 'Howard Joel Wolowitz', '2013-06-10 14:15:57.347', 'B6', 'green', 2289);
INSERT INTO component VALUES (2291, 'C', 'H', '35530233', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 17:10:17.459', 'G4', 'green', 2289);
INSERT INTO device VALUES (2292, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '25220057', '2013-06-10 05:34:41.652', false, 2288);
INSERT INTO component VALUES (2293, 'D', 'A', '84668385', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 14:45:20.319', 'F8', 'green', 2292);
INSERT INTO component VALUES (2294, 'D', 'A', '40210176', 'Howard Joel Wolowitz', '2013-06-10 15:06:54.943', 'C9', 'green', 2292);
INSERT INTO line VALUES (2295, 'F3 PreSeries', 'Series 8', 24, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2279);
INSERT INTO location VALUES (2296, 'DG4', 'ABS test', 'Franziska Meier', 2295);
INSERT INTO device VALUES (2297, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '36727731', '2013-06-10 00:36:43.139', false, 2296);
INSERT INTO component VALUES (2298, 'A', 'C', '30829824', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 05:52:58.983', 'E3', 'green', 2297);
INSERT INTO component VALUES (2299, 'C', 'F', '35710549', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:39:39.511', 'F9', 'red', 2297);
INSERT INTO device VALUES (2300, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '14839306', '2013-06-10 15:08:39.287', false, 2296);
INSERT INTO component VALUES (2301, 'H', 'B', '46519456', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 15:03:21.23', 'I5', 'green', 2300);
INSERT INTO component VALUES (2302, 'C', 'F', '63216443', 'Howard Joel Wolowitz', '2013-06-10 15:45:33.478', 'F1', 'green', 2300);
INSERT INTO location VALUES (2303, 'IG9', 'transmission test', 'Robert Schmitt', 2295);
INSERT INTO device VALUES (2304, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '16529847', '2013-06-10 01:09:55.305', false, 2303);
INSERT INTO component VALUES (2305, 'B', 'A', '85042682', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:37:04.598', 'A2', 'green', 2304);
INSERT INTO component VALUES (2306, 'A', 'D', '90282547', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:44:29.314', 'F7', 'green', 2304);
INSERT INTO device VALUES (2307, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '55311565', '2013-06-10 04:47:33.713', false, 2303);
INSERT INTO component VALUES (2308, 'C', 'C', '10340942', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 14:30:14.771', 'F7', 'red', 2307);
INSERT INTO component VALUES (2309, 'B', 'H', '18888219', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:28:13.281', 'E6', 'green', 2307);
INSERT INTO hall VALUES (2310, 'I1', 661, 9535, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO line VALUES (2311, 'I1 Assembly', 'Series 1', 83, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2310);
INSERT INTO location VALUES (2312, 'DE9', 'security test', 'Robert Schulze', 2311);
INSERT INTO device VALUES (2313, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '69087147', '2013-06-10 00:44:56.733', false, 2312);
INSERT INTO component VALUES (2314, 'D', 'A', '66499652', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 18:51:22.144', 'D8', 'green', 2313);
INSERT INTO component VALUES (2315, 'E', 'D', '28570637', 'Howard Joel Wolowitz', '2013-06-10 10:26:31.225', 'I6', 'yellow', 2313);
INSERT INTO device VALUES (2316, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '93538115', '2013-06-10 04:12:00.417', false, 2312);
INSERT INTO component VALUES (2317, 'H', 'H', '95809085', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:10:53.298', 'F5', 'green', 2316);
INSERT INTO component VALUES (2318, 'B', 'A', '87795733', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:11:21.893', 'C2', 'green', 2316);
INSERT INTO location VALUES (2319, 'GC3', 'multimedia test', 'Peter Meier', 2311);
INSERT INTO device VALUES (2320, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '69749367', '2013-06-10 02:58:45.908', false, 2319);
INSERT INTO component VALUES (2321, 'E', 'B', '39218384', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:31:17.757', 'F5', 'green', 2320);
INSERT INTO component VALUES (2322, 'D', 'G', '89666443', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:36:50.377', 'C4', 'green', 2320);
INSERT INTO device VALUES (2323, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '35508397', '2013-06-09 23:58:58.886', false, 2319);
INSERT INTO component VALUES (2324, 'E', 'E', '77514613', 'Howard Joel Wolowitz', '2013-06-10 01:03:40.312', 'D2', 'green', 2323);
INSERT INTO component VALUES (2325, 'F', 'I', '39971709', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:17:08.679', 'C5', 'green', 2323);
INSERT INTO line VALUES (2326, 'I1 PreSeries', 'Series 4', 91, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2310);
INSERT INTO location VALUES (2327, 'FA1', 'multimedia test', 'Peter Schmitt', 2326);
INSERT INTO device VALUES (2328, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '43379451', '2013-06-10 10:43:40.137', false, 2327);
INSERT INTO component VALUES (2329, 'E', 'D', '58647138', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:09:19.248', 'G2', 'green', 2328);
INSERT INTO component VALUES (2330, 'C', 'H', '46388543', 'Howard Joel Wolowitz', '2013-06-10 12:24:38.714', 'I1', 'green', 2328);
INSERT INTO device VALUES (2331, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '36022324', '2013-06-10 15:24:10.887', false, 2327);
INSERT INTO component VALUES (2332, 'C', 'H', '68102674', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:49:46.259', 'I1', 'green', 2331);
INSERT INTO component VALUES (2333, 'A', 'H', '75082916', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 02:27:35.525', 'C7', 'green', 2331);
INSERT INTO location VALUES (2334, 'HE4', 'ABS test', 'Peter Schulze', 2326);
INSERT INTO device VALUES (2335, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '38624029', '2013-06-10 10:34:00.097', false, 2334);
INSERT INTO component VALUES (2336, 'E', 'B', '51975193', 'Howard Joel Wolowitz', '2013-06-10 09:23:22.224', 'F8', 'green', 2335);
INSERT INTO component VALUES (2337, 'E', 'A', '14683654', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:00:36.578', 'H8', 'green', 2335);
INSERT INTO device VALUES (2338, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '86129018', '2013-06-10 05:34:23.315', false, 2334);
INSERT INTO component VALUES (2339, 'I', 'G', '48230049', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:37:44.059', 'G4', 'green', 2338);
INSERT INTO component VALUES (2340, 'D', 'B', '69583941', 'Howard Joel Wolowitz', '2013-06-10 03:13:05.757', 'E3', 'green', 2338);
INSERT INTO hall VALUES (2341, 'C7', 210, 8341, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO line VALUES (2342, 'C7 Assembly', 'Series 2', 95, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2341);
INSERT INTO location VALUES (2343, 'CC6', 'motor test', 'Peter Schmitt', 2342);
INSERT INTO device VALUES (2344, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '39234071', '2013-06-10 01:04:14.773', false, 2343);
INSERT INTO component VALUES (2345, 'G', 'A', '17272946', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:44:34.94', 'I1', 'green', 2344);
INSERT INTO component VALUES (2346, 'C', 'B', '63720416', 'Howard Joel Wolowitz', '2013-06-10 00:08:00.437', 'I1', 'green', 2344);
INSERT INTO device VALUES (2347, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '24298442', '2013-06-10 06:27:59.93', false, 2343);
INSERT INTO component VALUES (2348, 'I', 'C', '96497239', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:50:43.848', 'D8', 'green', 2347);
INSERT INTO component VALUES (2349, 'B', 'F', '68510598', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 17:34:18.522', 'I7', 'green', 2347);
INSERT INTO location VALUES (2350, 'EA2', 'ABS test', 'Hans Schulze', 2342);
INSERT INTO device VALUES (2351, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '74502689', '2013-06-10 13:32:29.917', false, 2350);
INSERT INTO component VALUES (2352, 'D', 'E', '37629043', 'Howard Joel Wolowitz', '2013-06-10 13:52:45.207', 'B8', 'green', 2351);
INSERT INTO component VALUES (2353, 'G', 'I', '52213648', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 14:45:49.483', 'F4', 'red', 2351);
INSERT INTO device VALUES (2354, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '31960202', '2013-06-10 04:18:08.287', false, 2350);
INSERT INTO component VALUES (2355, 'I', 'D', '28655183', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:55:45.1', 'I3', 'green', 2354);
INSERT INTO component VALUES (2356, 'E', 'H', '12505866', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 14:22:20.09', 'C3', 'green', 2354);
INSERT INTO line VALUES (2357, 'C7 PreSeries', 'Series 3', 54, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2341);
INSERT INTO location VALUES (2358, 'GB5', 'motor test', 'Franziska Mueller', 2357);
INSERT INTO device VALUES (2359, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '60333633', '2013-06-10 01:20:21.11', false, 2358);
INSERT INTO component VALUES (2360, 'E', 'H', '90331437', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 20:46:51.541', 'I3', 'green', 2359);
INSERT INTO component VALUES (2361, 'D', 'C', '89084954', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 20:42:57.268', 'I6', 'green', 2359);
INSERT INTO device VALUES (2362, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '99245596', '2013-06-10 16:20:07.753', false, 2358);
INSERT INTO component VALUES (2363, 'C', 'C', '18455987', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:56:27.404', 'F8', 'red', 2362);
INSERT INTO component VALUES (2364, 'D', 'C', '24025164', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:01:20.662', 'C7', 'yellow', 2362);
INSERT INTO location VALUES (2365, 'AD7', 'multimedia test', 'Peter Merkel', 2357);
INSERT INTO device VALUES (2366, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '13093056', '2013-06-10 11:24:31.693', false, 2365);
INSERT INTO component VALUES (2367, 'F', 'G', '68593643', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:07:49.09', 'C9', 'green', 2366);
INSERT INTO component VALUES (2368, 'F', 'E', '65605704', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:02:21.303', 'E6', 'green', 2366);
INSERT INTO device VALUES (2369, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '14848878', '2013-06-10 01:21:40.251', false, 2365);
INSERT INTO component VALUES (2370, 'G', 'E', '44107318', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 02:44:25.598', 'B5', 'green', 2369);
INSERT INTO component VALUES (2371, 'E', 'C', '42842809', 'Howard Joel Wolowitz', '2013-06-10 16:53:18.175', 'G1', 'green', 2369);
INSERT INTO hall VALUES (2372, 'C9', 339, 4174, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO line VALUES (2373, 'C9 Assembly', 'Series 2', 38, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2372);
INSERT INTO location VALUES (2374, 'AB2', 'motor test', 'Peter Schulze', 2373);
INSERT INTO device VALUES (2375, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '50760127', '2013-06-10 04:14:19.368', false, 2374);
INSERT INTO component VALUES (2376, 'H', 'D', '92973544', 'Howard Joel Wolowitz', '2013-06-10 06:01:36.074', 'I5', 'green', 2375);
INSERT INTO component VALUES (2377, 'E', 'H', '87661979', 'Howard Joel Wolowitz', '2013-06-10 02:59:52.65', 'I2', 'green', 2375);
INSERT INTO device VALUES (2378, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '15698134', '2013-06-10 13:06:15.547', false, 2374);
INSERT INTO component VALUES (2379, 'F', 'H', '86626616', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:06:38.256', 'F5', 'green', 2378);
INSERT INTO component VALUES (2380, 'E', 'F', '71514969', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:32:36.77', 'B4', 'green', 2378);
INSERT INTO location VALUES (2381, 'II8', 'motor test', 'Franziska Merkel', 2373);
INSERT INTO device VALUES (2382, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '77423876', '2013-06-10 09:42:33.718', false, 2381);
INSERT INTO component VALUES (2383, 'H', 'G', '92002122', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:38:08.022', 'F3', 'green', 2382);
INSERT INTO component VALUES (2384, 'C', 'D', '50595681', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 19:36:54.383', 'F8', 'green', 2382);
INSERT INTO device VALUES (2385, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '30938569', '2013-06-10 05:26:26.51', false, 2381);
INSERT INTO component VALUES (2386, 'E', 'E', '5451856', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 16:59:05.096', 'H6', 'green', 2385);
INSERT INTO component VALUES (2387, 'G', 'I', '31925731', 'Howard Joel Wolowitz', '2013-06-10 08:26:01.564', 'C5', 'green', 2385);
INSERT INTO line VALUES (2388, 'C9 PreSeries', 'Series 9', 93, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2372);
INSERT INTO location VALUES (2389, 'GC2', 'transmission test', 'Robert Merkel', 2388);
INSERT INTO device VALUES (2390, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '51236555', '2013-06-10 02:18:26.275', false, 2389);
INSERT INTO component VALUES (2391, 'B', 'C', '51719519', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 10:50:41.978', 'I1', 'green', 2390);
INSERT INTO component VALUES (2392, 'F', 'A', '39184319', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 20:29:43.359', 'D2', 'green', 2390);
INSERT INTO device VALUES (2393, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '48218276', '2013-06-10 13:29:27.211', false, 2389);
INSERT INTO component VALUES (2394, 'I', 'G', '64785344', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:09:43.916', 'I5', 'green', 2393);
INSERT INTO component VALUES (2395, 'A', 'E', '18980336', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:07:19.757', 'A7', 'green', 2393);
INSERT INTO location VALUES (2396, 'FB7', 'security test', 'Robert Meier', 2388);
INSERT INTO device VALUES (2397, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '17930929', '2013-06-10 17:09:28.43', false, 2396);
INSERT INTO component VALUES (2398, 'A', 'C', '92865719', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 15:28:52.524', 'B6', 'yellow', 2397);
INSERT INTO component VALUES (2399, 'I', 'C', '39436716', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:46:25.797', 'I7', 'green', 2397);
INSERT INTO device VALUES (2400, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '59986304', '2013-06-10 07:26:35.569', false, 2396);
INSERT INTO component VALUES (2401, 'H', 'E', '54079024', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 17:21:53.1', 'D4', 'green', 2400);
INSERT INTO component VALUES (2402, 'H', 'B', '52954538', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 20:00:16.891', 'B3', 'green', 2400);
INSERT INTO hall VALUES (2403, 'D2', 524, 2804, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO line VALUES (2404, 'D2 Assembly', 'Series 3', 55, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2403);
INSERT INTO location VALUES (2405, 'BH8', 'motor test', 'Franziska Schulze', 2404);
INSERT INTO device VALUES (2406, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '63107792', '2013-06-10 06:16:22.487', false, 2405);
INSERT INTO component VALUES (2407, 'H', 'E', '59347272', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 11:48:10.057', 'C7', 'yellow', 2406);
INSERT INTO component VALUES (2408, 'B', 'F', '32522257', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:53:26.023', 'E9', 'green', 2406);
INSERT INTO device VALUES (2409, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '53841031', '2013-06-10 06:40:45.034', false, 2405);
INSERT INTO component VALUES (2410, 'F', 'A', '4346294', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 12:56:07.091', 'E2', 'green', 2409);
INSERT INTO component VALUES (2411, 'F', 'B', '13550562', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 01:21:28.544', 'H5', 'green', 2409);
INSERT INTO location VALUES (2412, 'HH4', 'transmission test', 'Robert Schulze', 2404);
INSERT INTO device VALUES (2413, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '57964822', '2013-06-10 03:07:48.211', false, 2412);
INSERT INTO component VALUES (2414, 'F', 'E', '13460197', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 06:06:45.015', 'E7', 'green', 2413);
INSERT INTO component VALUES (2415, 'B', 'E', '47775575', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:05:30.867', 'E8', 'green', 2413);
INSERT INTO device VALUES (2416, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '89793714', '2013-06-10 01:41:05.256', false, 2412);
INSERT INTO component VALUES (2417, 'G', 'E', '11748218', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:46:51.785', 'H9', 'yellow', 2416);
INSERT INTO component VALUES (2418, 'A', 'A', '84567639', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:49:47.23', 'F7', 'green', 2416);
INSERT INTO line VALUES (2419, 'D2 PreSeries', 'Series 1', 30, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2403);
INSERT INTO location VALUES (2420, 'GG8', 'motor test', 'Franziska Mueller', 2419);
INSERT INTO device VALUES (2421, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '95193583', '2013-06-10 20:36:29.032', false, 2420);
INSERT INTO component VALUES (2422, 'F', 'D', '74768644', 'Howard Joel Wolowitz', '2013-06-10 18:08:16.4', 'E5', 'green', 2421);
INSERT INTO component VALUES (2423, 'A', 'C', '70208466', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 07:03:11.779', 'I1', 'green', 2421);
INSERT INTO device VALUES (2424, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '21565100', '2013-06-09 21:09:57.241', false, 2420);
INSERT INTO component VALUES (2425, 'D', 'A', '80105550', 'Howard Joel Wolowitz', '2013-06-10 00:44:44.793', 'D1', 'green', 2424);
INSERT INTO component VALUES (2426, 'I', 'F', '92857593', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:05:50.098', 'B1', 'green', 2424);
INSERT INTO location VALUES (2427, 'BA9', 'ABS test', 'Peter Merkel', 2419);
INSERT INTO device VALUES (2428, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '61057936', '2013-06-10 11:10:17.519', false, 2427);
INSERT INTO component VALUES (2429, 'C', 'F', '47008558', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:05:27.663', 'I3', 'green', 2428);
INSERT INTO component VALUES (2430, 'B', 'H', '63347675', 'Howard Joel Wolowitz', '2013-06-10 10:52:22.968', 'C8', 'green', 2428);
INSERT INTO device VALUES (2431, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '69814771', '2013-06-10 02:26:08.183', false, 2427);
INSERT INTO component VALUES (2432, 'G', 'A', '47943339', 'Howard Joel Wolowitz', '2013-06-10 01:23:24.825', 'C3', 'green', 2431);
INSERT INTO component VALUES (2433, 'F', 'G', '7705196', 'Howard Joel Wolowitz', '2013-06-10 06:07:53.771', 'F5', 'green', 2431);
INSERT INTO hall VALUES (2434, 'B4', 405, 5306, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO line VALUES (2435, 'B4 Assembly', 'Series 9', 22, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2434);
INSERT INTO location VALUES (2436, 'AC2', 'ABS test', 'Hans Meier', 2435);
INSERT INTO device VALUES (2437, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '47556918', '2013-06-09 22:45:12.404', false, 2436);
INSERT INTO component VALUES (2438, 'D', 'G', '30043050', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:17:51.403', 'C5', 'green', 2437);
INSERT INTO component VALUES (2439, 'E', 'D', '84574264', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 18:14:18.772', 'E7', 'green', 2437);
INSERT INTO device VALUES (2440, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '38444346', '2013-06-10 11:23:34.52', false, 2436);
INSERT INTO component VALUES (2441, 'A', 'G', '77793103', 'Howard Joel Wolowitz', '2013-06-10 10:43:13.861', 'A1', 'green', 2440);
INSERT INTO component VALUES (2442, 'E', 'F', '94005313', 'Howard Joel Wolowitz', '2013-06-10 09:41:40.047', 'C6', 'green', 2440);
INSERT INTO location VALUES (2443, 'CB4', 'ABS test', 'Franziska Schulze', 2435);
INSERT INTO device VALUES (2444, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '71028000', '2013-06-10 00:00:57.837', true, 2443);
INSERT INTO component VALUES (2445, 'A', 'B', '26893854', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:29:04.561', 'H5', 'green', 2444);
INSERT INTO component VALUES (2446, 'F', 'H', '37929207', 'Howard Joel Wolowitz', '2013-06-10 16:42:03.329', 'D7', 'green', 2444);
INSERT INTO device VALUES (2447, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '75731535', '2013-06-10 18:23:01.914', false, 2443);
INSERT INTO component VALUES (2448, 'G', 'G', '22782064', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 02:41:12.785', 'A2', 'green', 2447);
INSERT INTO component VALUES (2449, 'I', 'A', '88995737', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 17:59:39.344', 'H2', 'green', 2447);
INSERT INTO line VALUES (2450, 'B4 PreSeries', 'Series 5', 55, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2434);
INSERT INTO location VALUES (2451, 'GG3', 'security test', 'Hans Schulze', 2450);
INSERT INTO device VALUES (2452, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '80160882', '2013-06-10 18:59:52.775', false, 2451);
INSERT INTO component VALUES (2453, 'E', 'B', '2994289', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:52:40.183', 'B7', 'green', 2452);
INSERT INTO component VALUES (2454, 'A', 'G', '15415788', 'Howard Joel Wolowitz', '2013-06-10 08:13:28.66', 'E4', 'green', 2452);
INSERT INTO device VALUES (2455, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '58299228', '2013-06-10 03:58:09.198', false, 2451);
INSERT INTO component VALUES (2456, 'A', 'H', '47509', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:11:59.9', 'F9', 'green', 2455);
INSERT INTO component VALUES (2457, 'B', 'I', '52494152', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 23:44:21.875', 'G2', 'green', 2455);
INSERT INTO location VALUES (2458, 'EB8', 'motor test', 'Franziska Mueller', 2450);
INSERT INTO device VALUES (2459, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '1064509', '2013-06-09 22:56:02.912', false, 2458);
INSERT INTO component VALUES (2460, 'B', 'F', '42399016', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:46:51.293', 'B1', 'green', 2459);
INSERT INTO component VALUES (2461, 'H', 'G', '58273473', 'Howard Joel Wolowitz', '2013-06-10 09:36:33.053', 'C3', 'yellow', 2459);
INSERT INTO device VALUES (2462, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '67416411', '2013-06-10 10:05:25.638', true, 2458);
INSERT INTO component VALUES (2463, 'B', 'B', '87392672', 'Howard Joel Wolowitz', '2013-06-09 23:33:59.577', 'E1', 'green', 2462);
INSERT INTO component VALUES (2464, 'C', 'D', '80973486', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 11:48:29.265', 'E4', 'green', 2462);
INSERT INTO hall VALUES (2465, 'D1', 760, 8943, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO line VALUES (2466, 'D1 Assembly', 'Series 7', 61, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2465);
INSERT INTO location VALUES (2467, 'CD3', 'security test', 'Hans Mueller', 2466);
INSERT INTO device VALUES (2468, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '65073083', '2013-06-10 01:01:22.045', false, 2467);
INSERT INTO component VALUES (2469, 'I', 'G', '41791701', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:26:13.953', 'G1', 'green', 2468);
INSERT INTO component VALUES (2470, 'H', 'H', '37330342', 'Howard Joel Wolowitz', '2013-06-10 10:46:56.382', 'H8', 'green', 2468);
INSERT INTO device VALUES (2471, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '43391934', '2013-06-10 03:12:53.49', false, 2467);
INSERT INTO component VALUES (2472, 'D', 'B', '44773461', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:04:20.228', 'E2', 'red', 2471);
INSERT INTO component VALUES (2473, 'C', 'C', '17582895', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:47:39.063', 'F9', 'green', 2471);
INSERT INTO location VALUES (2474, 'GI2', 'transmission test', 'Peter Schmitt', 2466);
INSERT INTO device VALUES (2475, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '34802426', '2013-06-10 05:15:07.662', false, 2474);
INSERT INTO component VALUES (2476, 'C', 'I', '74664498', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:59:09.401', 'D5', 'green', 2475);
INSERT INTO component VALUES (2477, 'D', 'A', '32432684', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:34:49.166', 'H8', 'green', 2475);
INSERT INTO device VALUES (2478, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '85054448', '2013-06-10 17:29:53.742', false, 2474);
INSERT INTO component VALUES (2479, 'H', 'I', '79991594', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 16:16:56.714', 'D6', 'green', 2478);
INSERT INTO component VALUES (2480, 'B', 'F', '9689398', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 11:51:30.698', 'C8', 'green', 2478);
INSERT INTO line VALUES (2481, 'D1 PreSeries', 'Series 7', 94, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2465);
INSERT INTO location VALUES (2482, 'II6', 'multimedia test', 'Hans Merkel', 2481);
INSERT INTO device VALUES (2483, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '98711386', '2013-06-10 08:05:54.04', false, 2482);
INSERT INTO component VALUES (2484, 'I', 'D', '92788036', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:07:00.693', 'E5', 'green', 2483);
INSERT INTO component VALUES (2485, 'H', 'A', '98132180', 'Howard Joel Wolowitz', '2013-06-10 14:58:15.047', 'E5', 'green', 2483);
INSERT INTO device VALUES (2486, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '96147879', '2013-06-10 11:44:45.94', false, 2482);
INSERT INTO component VALUES (2487, 'F', 'B', '42195963', 'Howard Joel Wolowitz', '2013-06-09 20:48:52.914', 'A5', 'green', 2486);
INSERT INTO component VALUES (2488, 'H', 'H', '34305901', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 16:43:32.745', 'B7', 'green', 2486);
INSERT INTO location VALUES (2489, 'IF7', 'security test', 'Franziska Mueller', 2481);
INSERT INTO device VALUES (2490, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '52214106', '2013-06-10 00:12:53.718', true, 2489);
INSERT INTO component VALUES (2491, 'G', 'E', '27170675', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:01:22.53', 'E3', 'green', 2490);
INSERT INTO component VALUES (2492, 'C', 'B', '92744676', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 05:58:13.402', 'C6', 'green', 2490);
INSERT INTO device VALUES (2493, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '72423012', '2013-06-10 17:44:46.995', false, 2489);
INSERT INTO component VALUES (2494, 'I', 'I', '79881299', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 16:09:51.034', 'D8', 'green', 2493);
INSERT INTO component VALUES (2495, 'E', 'D', '61968852', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:39:30.09', 'G5', 'yellow', 2493);
INSERT INTO hall VALUES (2496, 'A3', 73, 6479, 'Audi A4', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO line VALUES (2497, 'A3 Assembly', 'Series 6', 39, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2496);
INSERT INTO location VALUES (2498, 'FB7', 'transmission test', 'Sarah Mueller', 2497);
INSERT INTO device VALUES (2499, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '11227460', '2013-06-10 09:26:07.854', false, 2498);
INSERT INTO component VALUES (2500, 'D', 'F', '72584037', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:51:17.004', 'A6', 'green', 2499);
INSERT INTO component VALUES (2501, 'G', 'G', '5798724', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 14:38:41.85', 'B9', 'yellow', 2499);
INSERT INTO device VALUES (2502, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '99290728', '2013-06-10 02:47:01.874', false, 2498);
INSERT INTO component VALUES (2503, 'H', 'E', '30922984', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 22:50:59.556', 'H3', 'green', 2502);
INSERT INTO component VALUES (2504, 'H', 'G', '26426552', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 15:53:46.861', 'D7', 'green', 2502);
INSERT INTO location VALUES (2505, 'EI5', 'security test', 'Franziska Meier', 2497);
INSERT INTO device VALUES (2506, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '13259077', '2013-06-10 10:20:07.604', false, 2505);
INSERT INTO component VALUES (2507, 'I', 'F', '70191243', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:27:54.833', 'B8', 'green', 2506);
INSERT INTO component VALUES (2508, 'E', 'B', '71710314', 'Howard Joel Wolowitz', '2013-06-10 07:54:42.801', 'I2', 'green', 2506);
INSERT INTO device VALUES (2509, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '54571449', '2013-06-10 15:44:03.218', false, 2505);
INSERT INTO component VALUES (2510, 'A', 'I', '53137285', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:58:55.485', 'I3', 'yellow', 2509);
INSERT INTO component VALUES (2511, 'A', 'G', '9335384', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:38:30.734', 'F1', 'green', 2509);
INSERT INTO line VALUES (2512, 'A3 PreSeries', 'Series 5', 40, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2496);
INSERT INTO location VALUES (2513, 'BH2', 'security test', 'Franziska Merkel', 2512);
INSERT INTO device VALUES (2514, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '84846913', '2013-06-09 21:21:59.672', false, 2513);
INSERT INTO component VALUES (2515, 'A', 'B', '39912442', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 17:17:59.945', 'G4', 'green', 2514);
INSERT INTO component VALUES (2516, 'C', 'H', '97610539', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 17:53:37.001', 'D6', 'yellow', 2514);
INSERT INTO device VALUES (2517, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '35777626', '2013-06-09 21:04:53.026', false, 2513);
INSERT INTO component VALUES (2518, 'D', 'C', '76629640', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 18:09:23.47', 'I3', 'green', 2517);
INSERT INTO component VALUES (2519, 'D', 'B', '91804461', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:54:37.854', 'E8', 'green', 2517);
INSERT INTO location VALUES (2520, 'DD2', 'transmission test', 'Sarah Merkel', 2512);
INSERT INTO device VALUES (2521, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '96751996', '2013-06-10 00:22:00.612', false, 2520);
INSERT INTO component VALUES (2522, 'I', 'D', '95169534', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:56:57.714', 'D9', 'green', 2521);
INSERT INTO component VALUES (2523, 'E', 'A', '3742004', 'Howard Joel Wolowitz', '2013-06-10 05:11:08.756', 'C1', 'green', 2521);
INSERT INTO device VALUES (2524, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '31869587', '2013-06-10 18:23:35.271', false, 2520);
INSERT INTO component VALUES (2525, 'F', 'C', '81205155', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 12:45:47.921', 'G7', 'green', 2524);
INSERT INTO component VALUES (2526, 'B', 'E', '91658301', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:38:48.983', 'E3', 'green', 2524);
INSERT INTO hall VALUES (2527, 'A4', 171, 8415, 'Audi A4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO line VALUES (2528, 'A4 Assembly', 'Series 6', 52, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2527);
INSERT INTO location VALUES (2529, 'HA7', 'multimedia test', 'Sarah Mueller', 2528);
INSERT INTO device VALUES (2530, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '51235093', '2013-06-10 02:52:26.696', false, 2529);
INSERT INTO component VALUES (2531, 'F', 'I', '41520085', 'Howard Joel Wolowitz', '2013-06-10 06:33:15.691', 'E4', 'green', 2530);
INSERT INTO component VALUES (2532, 'F', 'A', '78075327', 'Howard Joel Wolowitz', '2013-06-09 21:56:56.442', 'B2', 'green', 2530);
INSERT INTO device VALUES (2533, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '30452218', '2013-06-10 14:02:56.725', false, 2529);
INSERT INTO component VALUES (2534, 'B', 'D', '59390779', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:28:06.306', 'C2', 'green', 2533);
INSERT INTO component VALUES (2535, 'E', 'A', '52244186', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 21:56:42.171', 'C3', 'green', 2533);
INSERT INTO location VALUES (2536, 'II2', 'transmission test', 'Sarah Schmitt', 2528);
INSERT INTO device VALUES (2537, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '75727582', '2013-06-10 00:07:01.189', false, 2536);
INSERT INTO component VALUES (2538, 'A', 'D', '24468664', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:15:27.682', 'H5', 'green', 2537);
INSERT INTO component VALUES (2539, 'A', 'I', '23490046', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:39:56.744', 'B8', 'green', 2537);
INSERT INTO device VALUES (2540, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '31974212', '2013-06-09 23:59:02.028', false, 2536);
INSERT INTO component VALUES (2541, 'G', 'G', '2161311', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 22:36:11.47', 'D9', 'green', 2540);
INSERT INTO component VALUES (2542, 'D', 'F', '9646613', 'Howard Joel Wolowitz', '2013-06-09 23:43:42.76', 'G7', 'green', 2540);
INSERT INTO line VALUES (2543, 'A4 PreSeries', 'Series 7', 10, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2527);
INSERT INTO location VALUES (2544, 'AD3', 'ABS test', 'Franziska Schulze', 2543);
INSERT INTO device VALUES (2545, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '55528295', '2013-06-10 00:25:25.39', false, 2544);
INSERT INTO component VALUES (2546, 'E', 'G', '85469824', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 21:26:44.988', 'A6', 'green', 2545);
INSERT INTO component VALUES (2547, 'C', 'H', '42215727', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 15:08:09.598', 'G9', 'green', 2545);
INSERT INTO device VALUES (2548, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '68966228', '2013-06-10 12:36:00.394', false, 2544);
INSERT INTO component VALUES (2549, 'G', 'H', '61335668', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:45:06.119', 'I5', 'green', 2548);
INSERT INTO component VALUES (2550, 'I', 'E', '66152606', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 17:41:42.922', 'G5', 'green', 2548);
INSERT INTO location VALUES (2551, 'FH2', 'transmission test', 'Sarah Schulze', 2543);
INSERT INTO device VALUES (2552, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '52566824', '2013-06-10 17:59:07.764', false, 2551);
INSERT INTO component VALUES (2553, 'E', 'F', '19940179', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:06:47.083', 'E7', 'green', 2552);
INSERT INTO component VALUES (2554, 'E', 'G', '85745373', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:53:29.539', 'I7', 'green', 2552);
INSERT INTO device VALUES (2555, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '17582343', '2013-06-10 01:19:06.955', true, 2551);
INSERT INTO component VALUES (2556, 'G', 'A', '44840634', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:08:27.478', 'C7', 'green', 2555);
INSERT INTO component VALUES (2557, 'A', 'C', '21928845', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:26:54.004', 'I4', 'green', 2555);
