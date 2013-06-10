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
	    category character varying(50),
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
INSERT INTO hall VALUES (2000, 'A8', 597, 7507, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);
INSERT INTO line VALUES (2001, 'A8 Assembly', 'Series 3', 80, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2000);
INSERT INTO location VALUES (2002, 'CH5', 'motor test', 'Sarah Schulze', 2001);
INSERT INTO device VALUES (2003, 'mobile station', 'C', '40340195', '2013-06-10 02:41:46.482', false, 2002);
INSERT INTO component VALUES (2004, 'G', 'B', '81630778', 'Howard Joel Wolowitz', '2013-06-09 20:42:46.134', 'I4', 'green', 2003);
INSERT INTO component VALUES (2005, 'H', 'D', '11784489', 'Howard Joel Wolowitz', '2013-06-10 00:32:20.327', 'I3', 'green', 2003);
INSERT INTO device VALUES (2006, 'flashing station', 'F', '99262013', '2013-06-09 19:21:00.657', false, 2002);
INSERT INTO component VALUES (2007, 'I', 'I', '62583929', 'Howard Joel Wolowitz', '2013-06-09 22:55:47.715', 'C6', 'green', 2006);
INSERT INTO component VALUES (2008, 'I', 'D', '68131497', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 03:09:55.3', 'B1', 'green', 2006);
INSERT INTO location VALUES (2009, 'HG6', 'ABS test', 'Sarah Schmitt', 2001);
INSERT INTO device VALUES (2010, 'mobile station', 'I', '16160167', '2013-06-09 23:56:14.41', false, 2009);
INSERT INTO component VALUES (2011, 'B', 'D', '23270340', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:17:56.188', 'I5', 'green', 2010);
INSERT INTO component VALUES (2012, 'H', 'G', '15733706', 'Howard Joel Wolowitz', '2013-06-09 16:25:41.75', 'H8', 'green', 2010);
INSERT INTO device VALUES (2013, 'flashing station', 'C', '53901661', '2013-06-10 11:08:06.943', true, 2009);
INSERT INTO component VALUES (2014, 'F', 'B', '45514488', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 15:52:18.488', 'D3', 'green', 2013);
INSERT INTO component VALUES (2015, 'E', 'E', '35127683', 'Howard Joel Wolowitz', '2013-06-10 09:01:34.539', 'A4', 'green', 2013);
INSERT INTO line VALUES (2016, 'A8 PreSeries', 'Series 4', 2, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2000);
INSERT INTO location VALUES (2017, 'IG5', 'security test', 'Peter Schulze', 2016);
INSERT INTO device VALUES (2018, 'flashing station', 'E', '83580452', '2013-06-10 11:26:56.15', false, 2017);
INSERT INTO component VALUES (2019, 'F', 'B', '70493458', 'Howard Joel Wolowitz', '2013-06-10 10:07:24.766', 'D7', 'green', 2018);
INSERT INTO component VALUES (2020, 'B', 'D', '80496937', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 00:30:27.497', 'D9', 'green', 2018);
INSERT INTO device VALUES (2021, 'flashing station', 'C', '18774990', '2013-06-09 21:46:21.979', false, 2017);
INSERT INTO component VALUES (2022, 'H', 'C', '39935979', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:49:56.695', 'I2', 'green', 2021);
INSERT INTO component VALUES (2023, 'G', 'B', '39655363', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 17:19:47.273', 'D4', 'green', 2021);
INSERT INTO location VALUES (2024, 'IG7', 'multimedia test', 'Franziska Mueller', 2016);
INSERT INTO device VALUES (2025, 'printer', 'H', '3247040', '2013-06-10 11:27:23.653', false, 2024);
INSERT INTO component VALUES (2026, 'F', 'A', '730225', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 20:59:44.576', 'D5', 'green', 2025);
INSERT INTO component VALUES (2027, 'E', 'H', '67178255', 'Howard Joel Wolowitz', '2013-06-10 09:31:58.763', 'H2', 'green', 2025);
INSERT INTO device VALUES (2028, 'printer', 'F', '71837711', '2013-06-10 02:02:12.561', false, 2024);
INSERT INTO component VALUES (2029, 'B', 'G', '44913005', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:08:50.331', 'E8', 'green', 2028);
INSERT INTO component VALUES (2030, 'B', 'D', '11056613', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 21:31:00.939', 'C1', 'green', 2028);
INSERT INTO hall VALUES (2031, 'G3', 376, 6957, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1);
INSERT INTO line VALUES (2032, 'G3 Assembly', 'Series 1', 26, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2031);
INSERT INTO location VALUES (2033, 'BA3', 'ABS test', 'Sarah Meier', 2032);
INSERT INTO device VALUES (2034, 'handheld', 'C', '90985300', '2013-06-09 22:19:09.229', false, 2033);
INSERT INTO component VALUES (2035, 'E', 'A', '45735191', 'Howard Joel Wolowitz', '2013-06-10 03:13:36.386', 'G9', 'green', 2034);
INSERT INTO component VALUES (2036, 'G', 'A', '5510944', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 20:13:33.399', 'F7', 'green', 2034);
INSERT INTO device VALUES (2037, 'printer', 'A', '75901791', '2013-06-09 20:49:18.445', false, 2033);
INSERT INTO component VALUES (2038, 'H', 'I', '91732678', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:52:40.072', 'A9', 'yellow', 2037);
INSERT INTO component VALUES (2039, 'E', 'C', '57612249', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 10:42:18.373', 'D4', 'green', 2037);
INSERT INTO location VALUES (2040, 'FC7', 'multimedia test', 'Sarah Schulze', 2032);
INSERT INTO device VALUES (2041, 'handheld', 'E', '29070588', '2013-06-10 12:29:06.167', false, 2040);
INSERT INTO component VALUES (2042, 'H', 'E', '80851688', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:00:07.937', 'F6', 'green', 2041);
INSERT INTO component VALUES (2043, 'E', 'C', '83716122', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:32:21.391', 'A8', 'green', 2041);
INSERT INTO device VALUES (2044, 'mobile station', 'C', '62292972', '2013-06-10 10:52:28.857', false, 2040);
INSERT INTO component VALUES (2045, 'D', 'C', '48035682', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:37:22.467', 'G9', 'green', 2044);
INSERT INTO component VALUES (2046, 'H', 'B', '29998223', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 01:46:55.595', 'C9', 'green', 2044);
INSERT INTO line VALUES (2047, 'G3 PreSeries', 'Series 3', 42, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2031);
INSERT INTO location VALUES (2048, 'GB9', 'motor test', 'Franziska Merkel', 2047);
INSERT INTO device VALUES (2049, 'mobile station', 'A', '39704177', '2013-06-09 19:29:34.797', false, 2048);
INSERT INTO component VALUES (2050, 'H', 'F', '11352128', 'Howard Joel Wolowitz', '2013-06-09 22:46:17.709', 'I4', 'green', 2049);
INSERT INTO component VALUES (2051, 'A', 'D', '41196823', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:45:22.276', 'D1', 'green', 2049);
INSERT INTO device VALUES (2052, 'mobile station', 'C', '49822994', '2013-06-10 14:36:14.564', false, 2048);
INSERT INTO component VALUES (2053, 'I', 'G', '46143459', 'Howard Joel Wolowitz', '2013-06-10 01:29:56.167', 'G4', 'green', 2052);
INSERT INTO component VALUES (2054, 'H', 'E', '51167429', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 00:52:24.576', 'H8', 'green', 2052);
INSERT INTO location VALUES (2055, 'FB8', 'multimedia test', 'Sarah Mueller', 2047);
INSERT INTO device VALUES (2056, 'handheld', 'H', '24593114', '2013-06-09 16:07:09.855', false, 2055);
INSERT INTO component VALUES (2057, 'G', 'I', '79585333', 'Howard Joel Wolowitz', '2013-06-10 11:45:14.864', 'D1', 'green', 2056);
INSERT INTO component VALUES (2058, 'I', 'H', '70013641', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 19:46:17.204', 'A5', 'yellow', 2056);
INSERT INTO device VALUES (2059, 'flashing station', 'E', '53693901', '2013-06-10 10:06:03.62', false, 2055);
INSERT INTO component VALUES (2060, 'C', 'F', '96936497', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:34:38.449', 'D8', 'red', 2059);
INSERT INTO component VALUES (2061, 'F', 'E', '16734194', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:35:39.843', 'F9', 'green', 2059);
INSERT INTO hall VALUES (2062, 'B9', 212, 4325, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2);
INSERT INTO line VALUES (2063, 'B9 Assembly', 'Series 9', 88, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2062);
INSERT INTO location VALUES (2064, 'EC1', 'transmission test', 'Peter Schmitt', 2063);
INSERT INTO device VALUES (2065, 'handheld', 'A', '10964775', '2013-06-10 00:45:37.482', false, 2064);
INSERT INTO component VALUES (2066, 'E', 'E', '27239001', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:46:01.579', 'D2', 'green', 2065);
INSERT INTO component VALUES (2067, 'E', 'F', '77528914', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:28:33.183', 'A4', 'green', 2065);
INSERT INTO device VALUES (2068, 'printer', 'G', '84859111', '2013-06-10 03:21:57.209', false, 2064);
INSERT INTO component VALUES (2069, 'B', 'G', '22819692', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:11:26.665', 'H4', 'green', 2068);
INSERT INTO component VALUES (2070, 'A', 'E', '98113345', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 17:33:21.087', 'A4', 'green', 2068);
INSERT INTO location VALUES (2071, 'BI4', 'motor test', 'Franziska Meier', 2063);
INSERT INTO device VALUES (2072, 'mobile station', 'F', '96332368', '2013-06-10 11:32:04.138', false, 2071);
INSERT INTO component VALUES (2073, 'I', 'F', '71030630', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:36:18.257', 'I5', 'green', 2072);
INSERT INTO component VALUES (2074, 'G', 'D', '11319190', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 17:44:02.996', 'H4', 'green', 2072);
INSERT INTO device VALUES (2075, 'flashing station', 'A', '85138629', '2013-06-10 10:43:10.153', false, 2071);
INSERT INTO component VALUES (2076, 'H', 'G', '95600707', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 15:17:02.771', 'G1', 'green', 2075);
INSERT INTO component VALUES (2077, 'H', 'E', '23306407', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 12:21:55.272', 'I2', 'green', 2075);
INSERT INTO line VALUES (2078, 'B9 PreSeries', 'Series 7', 20, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2062);
INSERT INTO location VALUES (2079, 'GH6', 'ABS test', 'Franziska Meier', 2078);
INSERT INTO device VALUES (2080, 'handheld', 'D', '73001191', '2013-06-10 11:04:34.479', false, 2079);
INSERT INTO component VALUES (2081, 'G', 'A', '65288764', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 05:28:25.382', 'D6', 'green', 2080);
INSERT INTO component VALUES (2082, 'A', 'G', '55060111', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 20:28:43.591', 'D9', 'yellow', 2080);
INSERT INTO device VALUES (2083, 'flashing station', 'D', '73079499', '2013-06-09 18:40:48.229', false, 2079);
INSERT INTO component VALUES (2084, 'C', 'A', '66423941', 'Howard Joel Wolowitz', '2013-06-10 04:24:55.815', 'F3', 'green', 2083);
INSERT INTO component VALUES (2085, 'G', 'F', '3114168', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:05:32.539', 'I3', 'green', 2083);
INSERT INTO location VALUES (2086, 'DH2', 'ABS test', 'Hans Schulze', 2078);
INSERT INTO device VALUES (2087, 'mobile station', 'H', '14059389', '2013-06-10 06:08:53.558', false, 2086);
INSERT INTO component VALUES (2088, 'F', 'C', '31114318', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:44:35.866', 'E8', 'green', 2087);
INSERT INTO component VALUES (2089, 'G', 'E', '51122382', 'Howard Joel Wolowitz', '2013-06-10 04:41:41.163', 'H2', 'green', 2087);
INSERT INTO device VALUES (2090, 'handheld', 'I', '94717171', '2013-06-09 15:51:39.76', false, 2086);
INSERT INTO component VALUES (2091, 'C', 'F', '20821421', 'Howard Joel Wolowitz', '2013-06-10 13:32:20.64', 'C1', 'green', 2090);
INSERT INTO component VALUES (2092, 'A', 'C', '92052704', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:08:22.728', 'I6', 'green', 2090);
INSERT INTO hall VALUES (2093, 'B9', 626, 6799, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2);
INSERT INTO line VALUES (2094, 'B9 Assembly', 'Series 4', 17, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2093);
INSERT INTO location VALUES (2095, 'FD1', 'security test', 'Sarah Mueller', 2094);
INSERT INTO device VALUES (2096, 'mobile station', 'I', '80679664', '2013-06-10 02:02:37.232', true, 2095);
INSERT INTO component VALUES (2097, 'H', 'C', '87530384', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:21:55.437', 'A7', 'green', 2096);
INSERT INTO component VALUES (2098, 'B', 'G', '15891927', 'Howard Joel Wolowitz', '2013-06-10 08:20:55.128', 'B2', 'green', 2096);
INSERT INTO device VALUES (2099, 'handheld', 'A', '93152655', '2013-06-10 01:21:43.703', false, 2095);
INSERT INTO component VALUES (2100, 'C', 'B', '51937477', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 13:25:39.464', 'F1', 'green', 2099);
INSERT INTO component VALUES (2101, 'F', 'B', '6639510', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 19:40:47.629', 'A8', 'green', 2099);
INSERT INTO location VALUES (2102, 'CF7', 'transmission test', 'Hans Mueller', 2094);
INSERT INTO device VALUES (2103, 'mobile station', 'C', '20441683', '2013-06-10 02:48:44.029', false, 2102);
INSERT INTO component VALUES (2104, 'H', 'D', '89216544', 'Howard Joel Wolowitz', '2013-06-10 12:06:35.367', 'B8', 'green', 2103);
INSERT INTO component VALUES (2105, 'B', 'E', '78250124', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:33:43.484', 'C8', 'red', 2103);
INSERT INTO device VALUES (2106, 'flashing station', 'B', '98624972', '2013-06-09 23:10:16.041', false, 2102);
INSERT INTO component VALUES (2107, 'D', 'F', '82936760', 'Howard Joel Wolowitz', '2013-06-10 04:46:14.641', 'E5', 'green', 2106);
INSERT INTO component VALUES (2108, 'F', 'G', '30137794', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:02:41.47', 'G3', 'green', 2106);
INSERT INTO line VALUES (2109, 'B9 PreSeries', 'Series 5', 5, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2093);
INSERT INTO location VALUES (2110, 'FE9', 'transmission test', 'Hans Schmitt', 2109);
INSERT INTO device VALUES (2111, 'mobile station', 'I', '45931573', '2013-06-10 06:00:53.674', false, 2110);
INSERT INTO component VALUES (2112, 'H', 'H', '7635855', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:48:19.716', 'F5', 'green', 2111);
INSERT INTO component VALUES (2113, 'A', 'G', '47153111', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 22:04:50.563', 'E2', 'green', 2111);
INSERT INTO device VALUES (2114, 'mobile station', 'D', '40251647', '2013-06-09 22:23:37.659', false, 2110);
INSERT INTO component VALUES (2115, 'I', 'H', '75513752', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:37:47.669', 'I1', 'green', 2114);
INSERT INTO component VALUES (2116, 'G', 'G', '47694959', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 16:47:14.456', 'F7', 'green', 2114);
INSERT INTO location VALUES (2117, 'AI9', 'security test', 'Franziska Schmitt', 2109);
INSERT INTO device VALUES (2118, 'printer', 'B', '41223464', '2013-06-10 12:44:28.891', false, 2117);
INSERT INTO component VALUES (2119, 'E', 'G', '8552225', 'Howard Joel Wolowitz', '2013-06-10 13:01:14.271', 'I8', 'green', 2118);
INSERT INTO component VALUES (2120, 'B', 'I', '40021783', 'Howard Joel Wolowitz', '2013-06-09 21:58:37.297', 'H6', 'green', 2118);
INSERT INTO device VALUES (2121, 'flashing station', 'D', '34286527', '2013-06-10 00:32:04.984', true, 2117);
INSERT INTO component VALUES (2122, 'C', 'I', '70853611', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 10:56:14.341', 'F3', 'yellow', 2121);
INSERT INTO component VALUES (2123, 'G', 'D', '57252515', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:39:03.991', 'I3', 'green', 2121);
INSERT INTO hall VALUES (2124, 'D9', 420, 1194, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO line VALUES (2125, 'D9 Assembly', 'Series 5', 66, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2124);
INSERT INTO location VALUES (2126, 'CG3', 'motor test', 'Robert Schmitt', 2125);
INSERT INTO device VALUES (2127, 'printer', 'H', '79415809', '2013-06-09 23:28:36.071', false, 2126);
INSERT INTO component VALUES (2128, 'A', 'H', '59719954', 'Howard Joel Wolowitz', '2013-06-09 20:24:41.567', 'F3', 'green', 2127);
INSERT INTO component VALUES (2129, 'I', 'H', '23339349', 'Howard Joel Wolowitz', '2013-06-09 20:08:36.758', 'F3', 'green', 2127);
INSERT INTO device VALUES (2130, 'flashing station', 'B', '97425500', '2013-06-10 01:25:47.851', false, 2126);
INSERT INTO component VALUES (2131, 'E', 'G', '30161326', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:49:08.619', 'E9', 'green', 2130);
INSERT INTO component VALUES (2132, 'C', 'C', '41574273', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 11:53:14.279', 'E6', 'green', 2130);
INSERT INTO location VALUES (2133, 'IB1', 'multimedia test', 'Hans Meier', 2125);
INSERT INTO device VALUES (2134, 'mobile station', 'I', '60716937', '2013-06-09 20:32:51.258', false, 2133);
INSERT INTO component VALUES (2135, 'B', 'H', '57526094', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:56:00.129', 'G6', 'yellow', 2134);
INSERT INTO component VALUES (2136, 'A', 'E', '34466682', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 08:07:38.011', 'G4', 'green', 2134);
INSERT INTO device VALUES (2137, 'printer', 'F', '46022861', '2013-06-10 05:28:03.208', false, 2133);
INSERT INTO component VALUES (2138, 'H', 'H', '70579734', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:46:10.689', 'C5', 'green', 2137);
INSERT INTO component VALUES (2139, 'F', 'I', '59964071', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 17:33:43.023', 'F2', 'green', 2137);
INSERT INTO line VALUES (2140, 'D9 PreSeries', 'Series 4', 72, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2124);
INSERT INTO location VALUES (2141, 'DD1', 'security test', 'Robert Schmitt', 2140);
INSERT INTO device VALUES (2142, 'handheld', 'G', '67950206', '2013-06-10 02:14:51.875', false, 2141);
INSERT INTO component VALUES (2143, 'C', 'G', '1412643', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 11:02:20.195', 'C2', 'green', 2142);
INSERT INTO component VALUES (2144, 'B', 'E', '83122723', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 17:09:14.045', 'H2', 'green', 2142);
INSERT INTO device VALUES (2145, 'mobile station', 'C', '93238256', '2013-06-10 11:32:36.113', false, 2141);
INSERT INTO component VALUES (2146, 'E', 'D', '94395391', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 10:21:16.827', 'H9', 'green', 2145);
INSERT INTO component VALUES (2147, 'A', 'D', '62689610', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 00:02:13.85', 'H2', 'green', 2145);
INSERT INTO location VALUES (2148, 'FH1', 'motor test', 'Franziska Meier', 2140);
INSERT INTO device VALUES (2149, 'printer', 'C', '66821069', '2013-06-09 22:21:31.273', true, 2148);
INSERT INTO component VALUES (2150, 'A', 'D', '7349471', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 16:13:35.797', 'C1', 'green', 2149);
INSERT INTO component VALUES (2151, 'E', 'H', '76615443', 'Howard Joel Wolowitz', '2013-06-09 23:39:35.441', 'D2', 'green', 2149);
INSERT INTO device VALUES (2152, 'mobile station', 'H', '80297355', '2013-06-10 06:16:02.019', false, 2148);
INSERT INTO component VALUES (2153, 'H', 'C', '75464053', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 17:15:07.66', 'C3', 'green', 2152);
INSERT INTO component VALUES (2154, 'G', 'D', '16369563', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 20:15:02.078', 'A6', 'green', 2152);
INSERT INTO hall VALUES (2155, 'B2', 24, 9267, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO line VALUES (2156, 'B2 Assembly', 'Series 4', 32, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2155);
INSERT INTO location VALUES (2157, 'IA1', 'security test', 'Franziska Meier', 2156);
INSERT INTO device VALUES (2158, 'handheld', 'C', '27015598', '2013-06-10 06:23:51.758', false, 2157);
INSERT INTO component VALUES (2159, 'E', 'D', '75688488', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 00:06:41.414', 'B6', 'green', 2158);
INSERT INTO component VALUES (2160, 'I', 'F', '60652720', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 02:19:04.996', 'F1', 'green', 2158);
INSERT INTO device VALUES (2161, 'mobile station', 'H', '52823902', '2013-06-09 23:33:29.456', false, 2157);
INSERT INTO component VALUES (2162, 'D', 'A', '80147822', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 15:21:28.535', 'A6', 'green', 2161);
INSERT INTO component VALUES (2163, 'G', 'H', '76212079', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 23:38:14.86', 'C8', 'green', 2161);
INSERT INTO location VALUES (2164, 'HC4', 'security test', 'Sarah Schmitt', 2156);
INSERT INTO device VALUES (2165, 'printer', 'C', '61323058', '2013-06-10 11:08:07.175', false, 2164);
INSERT INTO component VALUES (2166, 'E', 'I', '97363204', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:05:36.643', 'F3', 'green', 2165);
INSERT INTO component VALUES (2167, 'D', 'D', '89846951', 'Howard Joel Wolowitz', '2013-06-09 15:32:54.928', 'B7', 'green', 2165);
INSERT INTO device VALUES (2168, 'printer', 'G', '99012758', '2013-06-09 20:03:59.17', false, 2164);
INSERT INTO component VALUES (2169, 'A', 'H', '24348718', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 01:59:44.639', 'D3', 'green', 2168);
INSERT INTO component VALUES (2170, 'A', 'G', '88832379', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 11:54:37.812', 'A9', 'green', 2168);
INSERT INTO line VALUES (2171, 'B2 PreSeries', 'Series 4', 74, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2155);
INSERT INTO location VALUES (2172, 'DG7', 'multimedia test', 'Robert Mueller', 2171);
INSERT INTO device VALUES (2173, 'printer', 'H', '90816222', '2013-06-09 23:54:46.463', false, 2172);
INSERT INTO component VALUES (2174, 'F', 'A', '98908983', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 20:59:35.087', 'H2', 'green', 2173);
INSERT INTO component VALUES (2175, 'H', 'I', '90995124', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 22:51:02.239', 'D7', 'yellow', 2173);
INSERT INTO device VALUES (2176, 'printer', 'I', '77115047', '2013-06-09 15:58:45.417', false, 2172);
INSERT INTO component VALUES (2177, 'C', 'C', '68150925', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:38:15.825', 'F4', 'green', 2176);
INSERT INTO component VALUES (2178, 'A', 'I', '65151594', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 05:38:33.195', 'B3', 'green', 2176);
INSERT INTO location VALUES (2179, 'HD4', 'ABS test', 'Hans Schmitt', 2171);
INSERT INTO device VALUES (2180, 'flashing station', 'E', '43743984', '2013-06-10 10:26:55.673', false, 2179);
INSERT INTO component VALUES (2181, 'D', 'E', '76936372', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 11:23:52.828', 'F4', 'yellow', 2180);
INSERT INTO component VALUES (2182, 'I', 'H', '62703884', 'Howard Joel Wolowitz', '2013-06-09 20:48:05.618', 'H9', 'green', 2180);
INSERT INTO device VALUES (2183, 'handheld', 'G', '80178866', '2013-06-10 01:21:58.711', false, 2179);
INSERT INTO component VALUES (2184, 'F', 'F', '58856685', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 02:06:35.157', 'F6', 'green', 2183);
INSERT INTO component VALUES (2185, 'C', 'I', '9234267', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:20:24.625', 'B3', 'green', 2183);
INSERT INTO hall VALUES (2186, 'H6', 292, 6508, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO line VALUES (2187, 'H6 Assembly', 'Series 5', 34, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2186);
INSERT INTO location VALUES (2188, 'GE7', 'motor test', 'Hans Merkel', 2187);
INSERT INTO device VALUES (2189, 'handheld', 'E', '29065350', '2013-06-09 22:19:43.304', false, 2188);
INSERT INTO component VALUES (2190, 'H', 'I', '68525281', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:21:04.7', 'D8', 'green', 2189);
INSERT INTO component VALUES (2191, 'B', 'C', '77902696', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 17:48:45.998', 'F4', 'green', 2189);
INSERT INTO device VALUES (2192, 'printer', 'C', '42891691', '2013-06-10 08:38:27.394', false, 2188);
INSERT INTO component VALUES (2193, 'E', 'A', '25623977', 'Howard Joel Wolowitz', '2013-06-10 14:17:46.446', 'A3', 'green', 2192);
INSERT INTO component VALUES (2194, 'H', 'I', '97681010', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:14:48.681', 'E1', 'green', 2192);
INSERT INTO location VALUES (2195, 'DC8', 'security test', 'Hans Mueller', 2187);
INSERT INTO device VALUES (2196, 'flashing station', 'H', '29686410', '2013-06-10 06:57:17.786', false, 2195);
INSERT INTO component VALUES (2197, 'G', 'D', '49264613', 'Howard Joel Wolowitz', '2013-06-10 05:33:05.357', 'A3', 'green', 2196);
INSERT INTO component VALUES (2198, 'H', 'H', '63624776', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:34:33.286', 'H9', 'green', 2196);
INSERT INTO device VALUES (2199, 'mobile station', 'D', '6900424', '2013-06-10 04:17:04.128', false, 2195);
INSERT INTO component VALUES (2200, 'G', 'H', '39586097', 'Howard Joel Wolowitz', '2013-06-10 00:36:17.557', 'D4', 'green', 2199);
INSERT INTO component VALUES (2201, 'F', 'D', '28820270', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:16:23.366', 'F4', 'red', 2199);
INSERT INTO line VALUES (2202, 'H6 PreSeries', 'Series 6', 29, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2186);
INSERT INTO location VALUES (2203, 'BD4', 'security test', 'Hans Schmitt', 2202);
INSERT INTO device VALUES (2204, 'mobile station', 'G', '41793086', '2013-06-10 06:34:52.051', false, 2203);
INSERT INTO component VALUES (2205, 'A', 'B', '78034836', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:02:25.176', 'A4', 'green', 2204);
INSERT INTO component VALUES (2206, 'G', 'A', '30240119', 'Howard Joel Wolowitz', '2013-06-09 17:24:48.796', 'F3', 'green', 2204);
INSERT INTO device VALUES (2207, 'printer', 'F', '28510498', '2013-06-10 08:24:28.435', false, 2203);
INSERT INTO component VALUES (2208, 'A', 'E', '16081000', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 20:11:21.482', 'C5', 'green', 2207);
INSERT INTO component VALUES (2209, 'G', 'A', '9866915', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 15:43:35.169', 'A8', 'green', 2207);
INSERT INTO location VALUES (2210, 'HE6', 'ABS test', 'Peter Merkel', 2202);
INSERT INTO device VALUES (2211, 'flashing station', 'C', '27803589', '2013-06-09 17:04:57.369', true, 2210);
INSERT INTO component VALUES (2212, 'D', 'C', '64128285', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 09:41:14.545', 'I9', 'green', 2211);
INSERT INTO component VALUES (2213, 'C', 'F', '57635795', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 20:01:57.539', 'E8', 'green', 2211);
INSERT INTO device VALUES (2214, 'handheld', 'F', '39177178', '2013-06-09 18:26:36.896', false, 2210);
INSERT INTO component VALUES (2215, 'D', 'E', '31776840', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:45:36.095', 'I3', 'green', 2214);
INSERT INTO component VALUES (2216, 'C', 'D', '45111034', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:09:56.078', 'F4', 'green', 2214);
INSERT INTO hall VALUES (2217, 'B4', 235, 9408, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO line VALUES (2218, 'B4 Assembly', 'Series 5', 5, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2217);
INSERT INTO location VALUES (2219, 'FH8', 'transmission test', 'Peter Schmitt', 2218);
INSERT INTO device VALUES (2220, 'flashing station', 'H', '75598317', '2013-06-09 22:32:04.536', false, 2219);
INSERT INTO component VALUES (2221, 'H', 'A', '357134', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:58:02.376', 'D5', 'green', 2220);
INSERT INTO component VALUES (2222, 'F', 'E', '83586621', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:46:57.46', 'I8', 'green', 2220);
INSERT INTO device VALUES (2223, 'printer', 'I', '40480324', '2013-06-10 04:25:11.312', false, 2219);
INSERT INTO component VALUES (2224, 'C', 'G', '83766992', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 11:02:53.486', 'E3', 'green', 2223);
INSERT INTO component VALUES (2225, 'B', 'H', '81256148', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:30:10.992', 'A5', 'red', 2223);
INSERT INTO location VALUES (2226, 'FF8', 'security test', 'Hans Mueller', 2218);
INSERT INTO device VALUES (2227, 'flashing station', 'F', '15300332', '2013-06-10 02:20:44.996', false, 2226);
INSERT INTO component VALUES (2228, 'F', 'A', '90011100', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 15:42:38.678', 'G1', 'green', 2227);
INSERT INTO component VALUES (2229, 'D', 'H', '43590816', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 20:21:42.802', 'I8', 'green', 2227);
INSERT INTO device VALUES (2230, 'handheld', 'H', '83723241', '2013-06-10 01:05:35.328', true, 2226);
INSERT INTO component VALUES (2231, 'E', 'F', '163298', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:45:46.571', 'I6', 'green', 2230);
INSERT INTO component VALUES (2232, 'C', 'C', '44756294', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:06:49.965', 'F8', 'green', 2230);
INSERT INTO line VALUES (2233, 'B4 PreSeries', 'Series 3', 70, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2217);
INSERT INTO location VALUES (2234, 'DF8', 'transmission test', 'Sarah Meier', 2233);
INSERT INTO device VALUES (2235, 'mobile station', 'I', '44739284', '2013-06-10 11:38:42.345', false, 2234);
INSERT INTO component VALUES (2236, 'F', 'A', '63435376', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 23:16:09.991', 'F8', 'green', 2235);
INSERT INTO component VALUES (2237, 'B', 'D', '58101082', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 18:51:43.419', 'H6', 'green', 2235);
INSERT INTO device VALUES (2238, 'printer', 'D', '89372323', '2013-06-10 03:21:04.045', false, 2234);
INSERT INTO component VALUES (2239, 'I', 'B', '4089485', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 18:21:54.261', 'C9', 'yellow', 2238);
INSERT INTO component VALUES (2240, 'G', 'C', '22578593', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:29:26.363', 'G9', 'green', 2238);
INSERT INTO location VALUES (2241, 'FC2', 'multimedia test', 'Peter Merkel', 2233);
INSERT INTO device VALUES (2242, 'printer', 'E', '48260047', '2013-06-10 12:29:35.214', false, 2241);
INSERT INTO component VALUES (2243, 'A', 'F', '38171401', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:59:19.567', 'B6', 'green', 2242);
INSERT INTO component VALUES (2244, 'H', 'E', '68099896', 'Howard Joel Wolowitz', '2013-06-10 08:01:02.63', 'D8', 'green', 2242);
INSERT INTO device VALUES (2245, 'mobile station', 'D', '35904033', '2013-06-10 01:27:43.798', false, 2241);
INSERT INTO component VALUES (2246, 'E', 'E', '1420299', 'Howard Joel Wolowitz', '2013-06-10 04:27:35.204', 'D4', 'green', 2245);
INSERT INTO component VALUES (2247, 'D', 'A', '67978433', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 07:17:07.849', 'B8', 'yellow', 2245);
INSERT INTO hall VALUES (2248, 'H9', 193, 6200, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO line VALUES (2249, 'H9 Assembly', 'Series 3', 24, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2248);
INSERT INTO location VALUES (2250, 'GF5', 'security test', 'Peter Schulze', 2249);
INSERT INTO device VALUES (2251, 'mobile station', 'I', '43313304', '2013-06-10 02:59:20.178', false, 2250);
INSERT INTO component VALUES (2252, 'I', 'B', '65567948', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 15:25:22.083', 'A9', 'green', 2251);
INSERT INTO component VALUES (2253, 'I', 'E', '1656727', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:44:03.456', 'H9', 'green', 2251);
INSERT INTO device VALUES (2254, 'flashing station', 'D', '9674530', '2013-06-10 13:49:55.828', false, 2250);
INSERT INTO component VALUES (2255, 'A', 'F', '70474640', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 05:29:58.269', 'I7', 'green', 2254);
INSERT INTO component VALUES (2256, 'B', 'C', '90063549', 'Howard Joel Wolowitz', '2013-06-09 17:41:05.932', 'C7', 'green', 2254);
INSERT INTO location VALUES (2257, 'FC1', 'motor test', 'Hans Mueller', 2249);
INSERT INTO device VALUES (2258, 'flashing station', 'I', '38921314', '2013-06-09 23:44:20.336', false, 2257);
INSERT INTO component VALUES (2259, 'A', 'E', '97004313', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 19:04:19.062', 'A6', 'green', 2258);
INSERT INTO component VALUES (2260, 'E', 'E', '5059215', 'Howard Joel Wolowitz', '2013-06-09 23:23:26.339', 'G3', 'green', 2258);
INSERT INTO device VALUES (2261, 'mobile station', 'I', '83247163', '2013-06-09 23:04:13.907', false, 2257);
INSERT INTO component VALUES (2262, 'A', 'A', '22252148', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:22:16.117', 'H3', 'green', 2261);
INSERT INTO component VALUES (2263, 'F', 'C', '68206193', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:25:36.252', 'D6', 'yellow', 2261);
INSERT INTO line VALUES (2264, 'H9 PreSeries', 'Series 1', 98, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2248);
INSERT INTO location VALUES (2265, 'CH1', 'motor test', 'Sarah Mueller', 2264);
INSERT INTO device VALUES (2266, 'printer', 'D', '79089652', '2013-06-10 13:51:54.503', false, 2265);
INSERT INTO component VALUES (2267, 'H', 'E', '82371729', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 07:48:16.535', 'C5', 'red', 2266);
INSERT INTO component VALUES (2268, 'C', 'D', '43190556', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:50:04.975', 'H5', 'green', 2266);
INSERT INTO device VALUES (2269, 'mobile station', 'H', '96124585', '2013-06-10 08:15:44.636', true, 2265);
INSERT INTO component VALUES (2270, 'H', 'E', '89333754', 'Howard Joel Wolowitz', '2013-06-09 19:18:20.122', 'C7', 'green', 2269);
INSERT INTO component VALUES (2271, 'G', 'G', '17976782', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 20:07:43.517', 'I8', 'green', 2269);
INSERT INTO location VALUES (2272, 'AG7', 'ABS test', 'Robert Merkel', 2264);
INSERT INTO device VALUES (2273, 'flashing station', 'F', '88117091', '2013-06-09 20:31:17.396', false, 2272);
INSERT INTO component VALUES (2274, 'I', 'A', '47429134', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:28:11.089', 'A2', 'green', 2273);
INSERT INTO component VALUES (2275, 'D', 'F', '82057444', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 19:49:18.533', 'G4', 'red', 2273);
INSERT INTO device VALUES (2276, 'printer', 'C', '85151117', '2013-06-09 21:41:25.913', false, 2272);
INSERT INTO component VALUES (2277, 'D', 'G', '50482965', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:45:45.95', 'D9', 'green', 2276);
INSERT INTO component VALUES (2278, 'I', 'F', '3449947', 'Howard Joel Wolowitz', '2013-06-10 06:56:50.935', 'E7', 'green', 2276);
INSERT INTO hall VALUES (2279, 'A8', 955, 6086, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO line VALUES (2280, 'A8 Assembly', 'Series 5', 55, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2279);
INSERT INTO location VALUES (2281, 'BF3', 'motor test', 'Peter Mueller', 2280);
INSERT INTO device VALUES (2282, 'handheld', 'C', '51308933', '2013-06-09 20:44:44.424', true, 2281);
INSERT INTO component VALUES (2283, 'G', 'I', '19408954', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 03:53:26.086', 'H6', 'green', 2282);
INSERT INTO component VALUES (2284, 'E', 'E', '66438962', 'Howard Joel Wolowitz', '2013-06-10 05:04:11.754', 'C6', 'green', 2282);
INSERT INTO device VALUES (2285, 'flashing station', 'B', '98733602', '2013-06-09 21:45:57.237', false, 2281);
INSERT INTO component VALUES (2286, 'E', 'B', '68526283', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 05:43:22.96', 'D4', 'green', 2285);
INSERT INTO component VALUES (2287, 'D', 'F', '50174853', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:59:21.973', 'A1', 'green', 2285);
INSERT INTO location VALUES (2288, 'CD5', 'motor test', 'Hans Merkel', 2280);
INSERT INTO device VALUES (2289, 'handheld', 'F', '22155785', '2013-06-09 21:56:41.184', false, 2288);
INSERT INTO component VALUES (2290, 'D', 'G', '9909217', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 17:02:39.643', 'A2', 'green', 2289);
INSERT INTO component VALUES (2291, 'H', 'H', '39599896', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:33:44.898', 'B6', 'green', 2289);
INSERT INTO device VALUES (2292, 'handheld', 'A', '11854283', '2013-06-09 17:30:34.264', false, 2288);
INSERT INTO component VALUES (2293, 'B', 'B', '32861858', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 16:56:51.662', 'A8', 'green', 2292);
INSERT INTO component VALUES (2294, 'G', 'A', '58724742', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 17:08:27.338', 'C5', 'green', 2292);
INSERT INTO line VALUES (2295, 'A8 PreSeries', 'Series 9', 96, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2279);
INSERT INTO location VALUES (2296, 'EF6', 'multimedia test', 'Peter Mueller', 2295);
INSERT INTO device VALUES (2297, 'handheld', 'C', '26727323', '2013-06-09 18:04:15.983', false, 2296);
INSERT INTO component VALUES (2298, 'C', 'G', '5367341', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:16:50.525', 'H5', 'green', 2297);
INSERT INTO component VALUES (2299, 'D', 'D', '76351433', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:35:17.098', 'C2', 'green', 2297);
INSERT INTO device VALUES (2300, 'mobile station', 'E', '94215409', '2013-06-10 06:47:56.079', false, 2296);
INSERT INTO component VALUES (2301, 'D', 'A', '87140563', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 22:13:54.89', 'I6', 'green', 2300);
INSERT INTO component VALUES (2302, 'I', 'H', '52454494', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:53:42.268', 'C5', 'green', 2300);
INSERT INTO location VALUES (2303, 'FI5', 'multimedia test', 'Hans Schulze', 2295);
INSERT INTO device VALUES (2304, 'printer', 'A', '24182462', '2013-06-10 07:58:09.706', true, 2303);
INSERT INTO component VALUES (2305, 'H', 'G', '57709151', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 23:00:34.525', 'B8', 'green', 2304);
INSERT INTO component VALUES (2306, 'A', 'C', '96815341', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 15:11:16.126', 'G8', 'green', 2304);
INSERT INTO device VALUES (2307, 'handheld', 'C', '97970022', '2013-06-10 10:33:45.398', true, 2303);
INSERT INTO component VALUES (2308, 'C', 'D', '35351196', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:42:56.287', 'D9', 'green', 2307);
INSERT INTO component VALUES (2309, 'G', 'C', '37335397', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 12:22:11.078', 'E1', 'green', 2307);
INSERT INTO hall VALUES (2310, 'E9', 319, 1928, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO line VALUES (2311, 'E9 Assembly', 'Series 6', 33, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2310);
INSERT INTO location VALUES (2312, 'HF6', 'motor test', 'Sarah Meier', 2311);
INSERT INTO device VALUES (2313, 'mobile station', 'G', '20333513', '2013-06-10 01:43:02.013', false, 2312);
INSERT INTO component VALUES (2314, 'F', 'G', '81999580', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:44:31.737', 'B2', 'green', 2313);
INSERT INTO component VALUES (2315, 'A', 'A', '5442431', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:02:13.655', 'E2', 'green', 2313);
INSERT INTO device VALUES (2316, 'printer', 'D', '74048303', '2013-06-09 20:13:12.703', false, 2312);
INSERT INTO component VALUES (2317, 'A', 'E', '8634497', 'Howard Joel Wolowitz', '2013-06-10 15:06:01.851', 'B1', 'green', 2316);
INSERT INTO component VALUES (2318, 'F', 'G', '51092507', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 04:21:49.886', 'D2', 'red', 2316);
INSERT INTO location VALUES (2319, 'DI3', 'security test', 'Hans Meier', 2311);
INSERT INTO device VALUES (2320, 'mobile station', 'H', '67437524', '2013-06-10 06:35:49.521', false, 2319);
INSERT INTO component VALUES (2321, 'A', 'B', '39562183', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 06:54:47.306', 'B7', 'green', 2320);
INSERT INTO component VALUES (2322, 'C', 'H', '43536497', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 21:26:05.078', 'F6', 'red', 2320);
INSERT INTO device VALUES (2323, 'flashing station', 'F', '29321040', '2013-06-09 16:40:55.886', false, 2319);
INSERT INTO component VALUES (2324, 'I', 'A', '33141647', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 10:39:55.919', 'C9', 'red', 2323);
INSERT INTO component VALUES (2325, 'B', 'A', '62373201', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 19:40:55.39', 'C3', 'green', 2323);
INSERT INTO line VALUES (2326, 'E9 PreSeries', 'Series 4', 60, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2310);
INSERT INTO location VALUES (2327, 'BF1', 'ABS test', 'Peter Schulze', 2326);
INSERT INTO device VALUES (2328, 'printer', 'E', '56746300', '2013-06-10 13:01:13.892', false, 2327);
INSERT INTO component VALUES (2329, 'D', 'D', '21619953', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 13:28:30.096', 'E8', 'yellow', 2328);
INSERT INTO component VALUES (2330, 'F', 'D', '28783807', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 22:09:06.279', 'B2', 'green', 2328);
INSERT INTO device VALUES (2331, 'handheld', 'G', '28055356', '2013-06-10 10:15:00.188', false, 2327);
INSERT INTO component VALUES (2332, 'A', 'I', '10187575', 'Howard Joel Wolowitz', '2013-06-10 14:53:51.072', 'F1', 'green', 2331);
INSERT INTO component VALUES (2333, 'A', 'A', '61628978', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 05:19:48.339', 'D3', 'green', 2331);
INSERT INTO location VALUES (2334, 'HI5', 'security test', 'Peter Mueller', 2326);
INSERT INTO device VALUES (2335, 'mobile station', 'A', '76893952', '2013-06-10 07:51:26.272', false, 2334);
INSERT INTO component VALUES (2336, 'G', 'A', '22231025', 'Howard Joel Wolowitz', '2013-06-10 04:32:37.61', 'F7', 'green', 2335);
INSERT INTO component VALUES (2337, 'D', 'D', '91239889', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:42:49.02', 'I3', 'green', 2335);
INSERT INTO device VALUES (2338, 'flashing station', 'H', '89017821', '2013-06-10 05:26:38.94', false, 2334);
INSERT INTO component VALUES (2339, 'H', 'D', '53432705', 'Howard Joel Wolowitz', '2013-06-09 17:57:36.907', 'D2', 'green', 2338);
INSERT INTO component VALUES (2340, 'I', 'C', '75842955', 'Howard Joel Wolowitz', '2013-06-10 10:55:46.364', 'C4', 'green', 2338);
INSERT INTO hall VALUES (2341, 'I4', 586, 1429, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO line VALUES (2342, 'I4 Assembly', 'Series 1', 50, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2341);
INSERT INTO location VALUES (2343, 'CF7', 'multimedia test', 'Robert Merkel', 2342);
INSERT INTO device VALUES (2344, 'handheld', 'D', '85550545', '2013-06-09 23:51:31.792', false, 2343);
INSERT INTO component VALUES (2345, 'A', 'G', '67718911', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:26:34.4', 'A7', 'yellow', 2344);
INSERT INTO component VALUES (2346, 'F', 'B', '60059471', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 12:05:06.288', 'H7', 'green', 2344);
INSERT INTO device VALUES (2347, 'flashing station', 'G', '45113399', '2013-06-09 19:52:21.948', true, 2343);
INSERT INTO component VALUES (2348, 'H', 'F', '13387348', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 02:51:02.42', 'F7', 'green', 2347);
INSERT INTO component VALUES (2349, 'G', 'D', '21625623', 'Howard Joel Wolowitz', '2013-06-10 09:44:43.154', 'E9', 'green', 2347);
INSERT INTO location VALUES (2350, 'EB9', 'transmission test', 'Peter Mueller', 2342);
INSERT INTO device VALUES (2351, 'flashing station', 'F', '38395714', '2013-06-10 02:45:13.115', false, 2350);
INSERT INTO component VALUES (2352, 'I', 'D', '74144692', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 17:57:48.324', 'G5', 'green', 2351);
INSERT INTO component VALUES (2353, 'C', 'A', '16209905', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 17:37:09.078', 'D5', 'green', 2351);
INSERT INTO device VALUES (2354, 'printer', 'B', '87487034', '2013-06-10 05:15:37.743', false, 2350);
INSERT INTO component VALUES (2355, 'I', 'G', '96448963', 'Howard Joel Wolowitz', '2013-06-10 13:32:47.606', 'A6', 'green', 2354);
INSERT INTO component VALUES (2356, 'B', 'A', '17502402', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 00:41:22.767', 'C8', 'green', 2354);
INSERT INTO line VALUES (2357, 'I4 PreSeries', 'Series 4', 81, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2341);
INSERT INTO location VALUES (2358, 'GF1', 'multimedia test', 'Robert Meier', 2357);
INSERT INTO device VALUES (2359, 'mobile station', 'H', '98104650', '2013-06-10 14:24:46.864', false, 2358);
INSERT INTO component VALUES (2360, 'E', 'H', '99179224', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:05:42.068', 'B8', 'green', 2359);
INSERT INTO component VALUES (2361, 'F', 'E', '7437420', 'Howard Joel Wolowitz', '2013-06-10 13:38:22.501', 'A9', 'green', 2359);
INSERT INTO device VALUES (2362, 'printer', 'E', '56346386', '2013-06-09 21:07:19.742', false, 2358);
INSERT INTO component VALUES (2363, 'D', 'H', '29950510', 'Howard Joel Wolowitz', '2013-06-10 12:11:47.267', 'I5', 'green', 2362);
INSERT INTO component VALUES (2364, 'G', 'C', '32628692', 'Howard Joel Wolowitz', '2013-06-10 00:38:31.322', 'C1', 'green', 2362);
INSERT INTO location VALUES (2365, 'HC2', 'transmission test', 'Peter Meier', 2357);
INSERT INTO device VALUES (2366, 'mobile station', 'E', '19911075', '2013-06-10 08:35:22.866', false, 2365);
INSERT INTO component VALUES (2367, 'D', 'H', '33234504', 'Howard Joel Wolowitz', '2013-06-10 03:18:53.092', 'G8', 'green', 2366);
INSERT INTO component VALUES (2368, 'A', 'D', '92111149', 'Howard Joel Wolowitz', '2013-06-09 19:56:25.589', 'I2', 'green', 2366);
INSERT INTO device VALUES (2369, 'handheld', 'A', '81168280', '2013-06-10 08:18:19.174', false, 2365);
INSERT INTO component VALUES (2370, 'H', 'B', '29628141', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 08:44:32.035', 'F2', 'green', 2369);
INSERT INTO component VALUES (2371, 'H', 'F', '37421800', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 19:15:27.401', 'H7', 'green', 2369);
INSERT INTO hall VALUES (2372, 'A2', 504, 1775, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO line VALUES (2373, 'A2 Assembly', 'Series 5', 97, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2372);
INSERT INTO location VALUES (2374, 'HD3', 'multimedia test', 'Peter Mueller', 2373);
INSERT INTO device VALUES (2375, 'printer', 'H', '12819853', '2013-06-10 07:45:32.809', false, 2374);
INSERT INTO component VALUES (2376, 'C', 'E', '89987811', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:51:12.931', 'A5', 'green', 2375);
INSERT INTO component VALUES (2377, 'A', 'B', '94156352', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 15:37:37.465', 'D1', 'green', 2375);
INSERT INTO device VALUES (2378, 'handheld', 'H', '30515827', '2013-06-10 12:03:11.476', false, 2374);
INSERT INTO component VALUES (2379, 'C', 'C', '54081265', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 13:57:48.939', 'C1', 'green', 2378);
INSERT INTO component VALUES (2380, 'F', 'I', '31156457', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:42:20.965', 'E7', 'green', 2378);
INSERT INTO location VALUES (2381, 'CC9', 'multimedia test', 'Hans Schulze', 2373);
INSERT INTO device VALUES (2382, 'mobile station', 'D', '90613600', '2013-06-10 09:39:09.301', false, 2381);
INSERT INTO component VALUES (2383, 'B', 'A', '32622660', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:45:36.45', 'F4', 'green', 2382);
INSERT INTO component VALUES (2384, 'A', 'B', '18007451', 'Howard Joel Wolowitz', '2013-06-10 03:20:07.169', 'C7', 'green', 2382);
INSERT INTO device VALUES (2385, 'printer', 'A', '56814482', '2013-06-09 20:53:35.116', false, 2381);
INSERT INTO component VALUES (2386, 'I', 'I', '51183361', 'Howard Joel Wolowitz', '2013-06-10 11:48:42.664', 'I2', 'green', 2385);
INSERT INTO component VALUES (2387, 'D', 'H', '57801442', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 20:53:27.602', 'B3', 'green', 2385);
INSERT INTO line VALUES (2388, 'A2 PreSeries', 'Series 1', 38, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2372);
INSERT INTO location VALUES (2389, 'GA2', 'motor test', 'Hans Meier', 2388);
INSERT INTO device VALUES (2390, 'handheld', 'B', '50168336', '2013-06-09 17:03:39.396', false, 2389);
INSERT INTO component VALUES (2391, 'B', 'F', '79889967', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 19:43:20.653', 'G4', 'green', 2390);
INSERT INTO component VALUES (2392, 'F', 'D', '57669744', 'Howard Joel Wolowitz', '2013-06-10 09:43:02.327', 'C9', 'green', 2390);
INSERT INTO device VALUES (2393, 'handheld', 'F', '42801473', '2013-06-09 16:52:45.933', false, 2389);
INSERT INTO component VALUES (2394, 'A', 'E', '10415897', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 15:55:39.981', 'H5', 'green', 2393);
INSERT INTO component VALUES (2395, 'A', 'E', '61145930', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 09:14:40.866', 'A9', 'green', 2393);
INSERT INTO location VALUES (2396, 'BI3', 'motor test', 'Hans Merkel', 2388);
INSERT INTO device VALUES (2397, 'flashing station', 'E', '99472374', '2013-06-10 05:01:32.628', false, 2396);
INSERT INTO component VALUES (2398, 'G', 'B', '5228425', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 14:01:43.826', 'A7', 'green', 2397);
INSERT INTO component VALUES (2399, 'F', 'G', '84617952', 'Howard Joel Wolowitz', '2013-06-09 17:20:43.472', 'F7', 'green', 2397);
INSERT INTO device VALUES (2400, 'mobile station', 'G', '57388692', '2013-06-09 21:17:58.548', false, 2396);
INSERT INTO component VALUES (2401, 'D', 'C', '71943264', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 05:49:32.673', 'G6', 'green', 2400);
INSERT INTO component VALUES (2402, 'B', 'F', '26245390', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 20:14:19.935', 'H3', 'green', 2400);
INSERT INTO hall VALUES (2403, 'G7', 151, 2771, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO line VALUES (2404, 'G7 Assembly', 'Series 8', 99, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2403);
INSERT INTO location VALUES (2405, 'FI2', 'ABS test', 'Franziska Mueller', 2404);
INSERT INTO device VALUES (2406, 'flashing station', 'D', '68494335', '2013-06-10 02:38:12.878', false, 2405);
INSERT INTO component VALUES (2407, 'I', 'B', '91441644', 'Howard Joel Wolowitz', '2013-06-10 02:56:17.614', 'I4', 'green', 2406);
INSERT INTO component VALUES (2408, 'C', 'I', '40554596', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 13:12:32.99', 'G9', 'green', 2406);
INSERT INTO device VALUES (2409, 'handheld', 'I', '14938462', '2013-06-10 13:07:21.26', false, 2405);
INSERT INTO component VALUES (2410, 'C', 'G', '70444555', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:32:28.516', 'B6', 'green', 2409);
INSERT INTO component VALUES (2411, 'F', 'D', '66297511', 'Howard Joel Wolowitz', '2013-06-10 10:30:13.637', 'C2', 'green', 2409);
INSERT INTO location VALUES (2412, 'GG2', 'security test', 'Robert Schmitt', 2404);
INSERT INTO device VALUES (2413, 'mobile station', 'E', '2777782', '2013-06-09 21:37:31.189', false, 2412);
INSERT INTO component VALUES (2414, 'D', 'D', '15451405', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:35:03.523', 'G6', 'green', 2413);
INSERT INTO component VALUES (2415, 'I', 'D', '38157693', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 01:07:12.669', 'A2', 'green', 2413);
INSERT INTO device VALUES (2416, 'mobile station', 'E', '90838284', '2013-06-09 19:56:18.958', false, 2412);
INSERT INTO component VALUES (2417, 'I', 'I', '98385980', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 16:23:17.98', 'I4', 'green', 2416);
INSERT INTO component VALUES (2418, 'D', 'I', '62612027', 'Howard Joel Wolowitz', '2013-06-10 05:07:51.917', 'A3', 'green', 2416);
INSERT INTO line VALUES (2419, 'G7 PreSeries', 'Series 4', 59, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2403);
INSERT INTO location VALUES (2420, 'EI9', 'multimedia test', 'Franziska Meier', 2419);
INSERT INTO device VALUES (2421, 'mobile station', 'E', '81145660', '2013-06-10 12:12:58.715', false, 2420);
INSERT INTO component VALUES (2422, 'B', 'D', '59101003', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 02:54:48.693', 'C7', 'green', 2421);
INSERT INTO component VALUES (2423, 'G', 'F', '63169691', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:13:34.507', 'I1', 'green', 2421);
INSERT INTO device VALUES (2424, 'printer', 'H', '72254824', '2013-06-10 13:50:28.36', false, 2420);
INSERT INTO component VALUES (2425, 'G', 'C', '64059492', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:42:58.003', 'G5', 'green', 2424);
INSERT INTO component VALUES (2426, 'H', 'C', '43255044', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 21:27:05.435', 'D6', 'green', 2424);
INSERT INTO location VALUES (2427, 'DI5', 'motor test', 'Robert Schmitt', 2419);
INSERT INTO device VALUES (2428, 'mobile station', 'I', '13518345', '2013-06-10 07:27:24.348', false, 2427);
INSERT INTO component VALUES (2429, 'I', 'C', '39880232', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 19:55:10.429', 'C1', 'green', 2428);
INSERT INTO component VALUES (2430, 'I', 'H', '16993505', 'Howard Joel Wolowitz', '2013-06-10 14:14:26.59', 'B8', 'green', 2428);
INSERT INTO device VALUES (2431, 'flashing station', 'C', '9882319', '2013-06-10 07:14:55.715', false, 2427);
INSERT INTO component VALUES (2432, 'I', 'B', '46241753', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 21:18:52.346', 'C6', 'green', 2431);
INSERT INTO component VALUES (2433, 'E', 'G', '37335372', 'Howard Joel Wolowitz', '2013-06-10 10:55:09.985', 'A8', 'yellow', 2431);
INSERT INTO hall VALUES (2434, 'F2', 258, 3437, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO line VALUES (2435, 'F2 Assembly', 'Series 5', 2, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2434);
INSERT INTO location VALUES (2436, 'II4', 'multimedia test', 'Hans Meier', 2435);
INSERT INTO device VALUES (2437, 'flashing station', 'F', '92732333', '2013-06-09 23:44:39.648', false, 2436);
INSERT INTO component VALUES (2438, 'H', 'A', '49493625', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 17:52:40.604', 'I2', 'green', 2437);
INSERT INTO component VALUES (2439, 'A', 'E', '35402931', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 12:05:06.485', 'C5', 'green', 2437);
INSERT INTO device VALUES (2440, 'mobile station', 'A', '47179544', '2013-06-10 11:15:33.931', false, 2436);
INSERT INTO component VALUES (2441, 'C', 'E', '3251539', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 20:32:39.686', 'B9', 'green', 2440);
INSERT INTO component VALUES (2442, 'C', 'I', '32939273', 'Howard Joel Wolowitz', '2013-06-09 21:32:30.57', 'D6', 'yellow', 2440);
INSERT INTO location VALUES (2443, 'CC9', 'motor test', 'Hans Merkel', 2435);
INSERT INTO device VALUES (2444, 'handheld', 'B', '58218131', '2013-06-10 03:09:56.389', false, 2443);
INSERT INTO component VALUES (2445, 'A', 'E', '2546216', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 06:01:32.568', 'H9', 'green', 2444);
INSERT INTO component VALUES (2446, 'H', 'B', '22290851', 'Howard Joel Wolowitz', '2013-06-09 17:41:39.434', 'C3', 'green', 2444);
INSERT INTO device VALUES (2447, 'handheld', 'G', '78506727', '2013-06-10 00:21:17.756', false, 2443);
INSERT INTO component VALUES (2448, 'F', 'G', '14104659', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 00:34:17.627', 'A8', 'green', 2447);
INSERT INTO component VALUES (2449, 'C', 'D', '4508420', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 17:33:32.227', 'B3', 'green', 2447);
INSERT INTO line VALUES (2450, 'F2 PreSeries', 'Series 4', 79, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2434);
INSERT INTO location VALUES (2451, 'GG6', 'security test', 'Peter Schulze', 2450);
INSERT INTO device VALUES (2452, 'handheld', 'B', '64412334', '2013-06-10 10:03:14.12', true, 2451);
INSERT INTO component VALUES (2453, 'I', 'G', '139660', 'Howard Joel Wolowitz', '2013-06-10 09:27:21.383', 'E5', 'green', 2452);
INSERT INTO component VALUES (2454, 'E', 'A', '93146937', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 13:57:48.077', 'F1', 'green', 2452);
INSERT INTO device VALUES (2455, 'handheld', 'C', '42162751', '2013-06-10 07:14:07.501', false, 2451);
INSERT INTO component VALUES (2456, 'G', 'F', '80090266', 'Howard Joel Wolowitz', '2013-06-10 07:05:19.241', 'E1', 'green', 2455);
INSERT INTO component VALUES (2457, 'I', 'H', '51996322', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:19:33.52', 'I5', 'red', 2455);
INSERT INTO location VALUES (2458, 'BE8', 'transmission test', 'Sarah Schmitt', 2450);
INSERT INTO device VALUES (2459, 'mobile station', 'I', '579982', '2013-06-09 20:29:23.22', false, 2458);
INSERT INTO component VALUES (2460, 'D', 'E', '22546126', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 03:43:01.411', 'F7', 'green', 2459);
INSERT INTO component VALUES (2461, 'A', 'F', '49291641', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:34:44.647', 'F7', 'green', 2459);
INSERT INTO device VALUES (2462, 'flashing station', 'A', '36496489', '2013-06-10 03:02:04.42', true, 2458);
INSERT INTO component VALUES (2463, 'C', 'I', '20138634', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 21:22:45.394', 'I6', 'green', 2462);
INSERT INTO component VALUES (2464, 'F', 'H', '43326097', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:19:11.485', 'E5', 'green', 2462);
INSERT INTO hall VALUES (2465, 'B1', 471, 7095, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO line VALUES (2466, 'B1 Assembly', 'Series 2', 67, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2465);
INSERT INTO location VALUES (2467, 'CI4', 'ABS test', 'Sarah Meier', 2466);
INSERT INTO device VALUES (2468, 'flashing station', 'C', '26325657', '2013-06-10 05:10:34.189', false, 2467);
INSERT INTO component VALUES (2469, 'A', 'I', '7288813', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 21:35:28.88', 'F7', 'green', 2468);
INSERT INTO component VALUES (2470, 'D', 'A', '90439861', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 20:11:51.718', 'C9', 'green', 2468);
INSERT INTO device VALUES (2471, 'printer', 'E', '29187701', '2013-06-09 19:39:06.494', true, 2467);
INSERT INTO component VALUES (2472, 'G', 'B', '89827312', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 17:56:43.476', 'G1', 'green', 2471);
INSERT INTO component VALUES (2473, 'I', 'E', '33688553', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:13:50.694', 'H5', 'green', 2471);
INSERT INTO location VALUES (2474, 'CB5', 'security test', 'Sarah Mueller', 2466);
INSERT INTO device VALUES (2475, 'flashing station', 'B', '26838341', '2013-06-09 22:09:18.253', false, 2474);
INSERT INTO component VALUES (2476, 'H', 'B', '48518571', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 19:43:53.412', 'F6', 'green', 2475);
INSERT INTO component VALUES (2477, 'B', 'H', '9764850', 'Howard Joel Wolowitz', '2013-06-09 18:59:01.827', 'F2', 'green', 2475);
INSERT INTO device VALUES (2478, 'mobile station', 'B', '34412801', '2013-06-10 09:44:41.878', false, 2474);
INSERT INTO component VALUES (2479, 'E', 'G', '86524673', 'Howard Joel Wolowitz', '2013-06-10 07:50:41.588', 'E6', 'red', 2478);
INSERT INTO component VALUES (2480, 'B', 'D', '44143033', 'Howard Joel Wolowitz', '2013-06-10 07:58:12.641', 'I5', 'green', 2478);
INSERT INTO line VALUES (2481, 'B1 PreSeries', 'Series 3', 71, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2465);
INSERT INTO location VALUES (2482, 'DG6', 'security test', 'Sarah Meier', 2481);
INSERT INTO device VALUES (2483, 'handheld', 'F', '2727183', '2013-06-10 07:18:38.853', false, 2482);
INSERT INTO component VALUES (2484, 'C', 'I', '33551875', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 19:46:52.513', 'H7', 'green', 2483);
INSERT INTO component VALUES (2485, 'E', 'C', '46786884', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 22:37:02.983', 'B9', 'green', 2483);
INSERT INTO device VALUES (2486, 'handheld', 'D', '79495129', '2013-06-10 15:24:29.706', false, 2482);
INSERT INTO component VALUES (2487, 'E', 'F', '74960081', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 02:42:30.104', 'I1', 'green', 2486);
INSERT INTO component VALUES (2488, 'G', 'E', '48725462', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 16:41:17.377', 'A6', 'green', 2486);
INSERT INTO location VALUES (2489, 'II8', 'multimedia test', 'Sarah Mueller', 2481);
INSERT INTO device VALUES (2490, 'flashing station', 'F', '88432954', '2013-06-10 03:50:14.101', false, 2489);
INSERT INTO component VALUES (2491, 'H', 'H', '441845', 'Howard Joel Wolowitz', '2013-06-10 09:31:25.813', 'I1', 'green', 2490);
INSERT INTO component VALUES (2492, 'D', 'E', '96303693', 'Howard Joel Wolowitz', '2013-06-09 18:39:55.149', 'E1', 'green', 2490);
INSERT INTO device VALUES (2493, 'printer', 'I', '34396292', '2013-06-10 13:53:44.882', false, 2489);
INSERT INTO component VALUES (2494, 'A', 'E', '26034347', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 07:53:27.705', 'B7', 'green', 2493);
INSERT INTO component VALUES (2495, 'F', 'B', '12869783', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 04:09:16.423', 'H8', 'yellow', 2493);
INSERT INTO hall VALUES (2496, 'E4', 64, 9920, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO line VALUES (2497, 'E4 Assembly', 'Series 9', 5, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2496);
INSERT INTO location VALUES (2498, 'HA2', 'motor test', 'Sarah Schulze', 2497);
INSERT INTO device VALUES (2499, 'handheld', 'C', '41043183', '2013-06-10 00:05:07.054', false, 2498);
INSERT INTO component VALUES (2500, 'D', 'G', '80048701', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 06:39:39.702', 'I9', 'green', 2499);
INSERT INTO component VALUES (2501, 'G', 'I', '53146863', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 10:33:57.419', 'F9', 'red', 2499);
INSERT INTO device VALUES (2502, 'handheld', 'A', '46112614', '2013-06-10 08:05:44.518', false, 2498);
INSERT INTO component VALUES (2503, 'C', 'C', '72443134', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 14:17:16.99', 'H3', 'green', 2502);
INSERT INTO component VALUES (2504, 'F', 'I', '70697480', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 05:15:35.426', 'E5', 'green', 2502);
INSERT INTO location VALUES (2505, 'EI9', 'security test', 'Hans Mueller', 2497);
INSERT INTO device VALUES (2506, 'handheld', 'G', '97437081', '2013-06-10 01:14:39.601', false, 2505);
INSERT INTO component VALUES (2507, 'C', 'D', '25177960', 'Howard Joel Wolowitz', '2013-06-10 14:18:40.784', 'D3', 'green', 2506);
INSERT INTO component VALUES (2508, 'F', 'E', '30756996', 'Howard Joel Wolowitz', '2013-06-09 21:17:57.209', 'D2', 'green', 2506);
INSERT INTO device VALUES (2509, 'flashing station', 'F', '76916156', '2013-06-10 02:33:30.436', false, 2505);
INSERT INTO component VALUES (2510, 'C', 'D', '37865098', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 09:51:16.994', 'A3', 'green', 2509);
INSERT INTO component VALUES (2511, 'H', 'I', '22357614', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-10 01:18:20.474', 'E1', 'green', 2509);
INSERT INTO line VALUES (2512, 'E4 PreSeries', 'Series 6', 72, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2496);
INSERT INTO location VALUES (2513, 'GB7', 'motor test', 'Robert Schmitt', 2512);
INSERT INTO device VALUES (2514, 'printer', 'H', '90338468', '2013-06-10 08:04:54.445', false, 2513);
INSERT INTO component VALUES (2515, 'F', 'F', '91107939', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 10:32:03.189', 'B4', 'green', 2514);
INSERT INTO component VALUES (2516, 'C', 'H', '44971244', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 11:51:43.164', 'B9', 'green', 2514);
INSERT INTO device VALUES (2517, 'mobile station', 'D', '33017519', '2013-06-10 00:11:24.661', false, 2513);
INSERT INTO component VALUES (2518, 'E', 'D', '15138932', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 12:45:47.332', 'C9', 'green', 2517);
INSERT INTO component VALUES (2519, 'H', 'E', '79228690', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 08:16:39.263', 'C9', 'green', 2517);
INSERT INTO location VALUES (2520, 'DB4', 'security test', 'Robert Meier', 2512);
INSERT INTO device VALUES (2521, 'handheld', 'H', '52517407', '2013-06-09 19:00:47.281', false, 2520);
INSERT INTO component VALUES (2522, 'C', 'A', '92454066', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 03:35:48.344', 'D2', 'green', 2521);
INSERT INTO component VALUES (2523, 'H', 'C', '14615978', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 18:46:27.924', 'H1', 'yellow', 2521);
INSERT INTO device VALUES (2524, 'printer', 'D', '41003917', '2013-06-10 12:37:57.694', false, 2520);
INSERT INTO component VALUES (2525, 'A', 'D', '93289419', 'Howard Joel Wolowitz', '2013-06-10 09:57:40.006', 'H2', 'green', 2524);
INSERT INTO component VALUES (2526, 'I', 'D', '10682281', 'Howard Joel Wolowitz', '2013-06-10 15:27:27.468', 'A6', 'green', 2524);
INSERT INTO hall VALUES (2527, 'H9', 580, 7977, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO line VALUES (2528, 'H9 Assembly', 'Series 4', 18, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2527);
INSERT INTO location VALUES (2529, 'EF8', 'motor test', 'Franziska Meier', 2528);
INSERT INTO device VALUES (2530, 'flashing station', 'H', '23490137', '2013-06-09 16:18:16.861', false, 2529);
INSERT INTO component VALUES (2531, 'I', 'I', '86806452', 'Howard Joel Wolowitz', '2013-06-10 05:39:58.548', 'A4', 'green', 2530);
INSERT INTO component VALUES (2532, 'D', 'E', '4792209', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 19:04:44.612', 'D3', 'green', 2530);
INSERT INTO device VALUES (2533, 'flashing station', 'E', '87371297', '2013-06-10 12:59:58.834', false, 2529);
INSERT INTO component VALUES (2534, 'I', 'A', '69602427', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 01:39:09.469', 'E2', 'red', 2533);
INSERT INTO component VALUES (2535, 'A', 'H', '23883097', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 21:16:24.11', 'D2', 'red', 2533);
INSERT INTO location VALUES (2536, 'BI3', 'transmission test', 'Hans Schmitt', 2528);
INSERT INTO device VALUES (2537, 'printer', 'F', '10419800', '2013-06-10 11:23:28.946', true, 2536);
INSERT INTO component VALUES (2538, 'H', 'F', '61299343', 'Howard Joel Wolowitz', '2013-06-10 10:23:54.92', 'D8', 'green', 2537);
INSERT INTO component VALUES (2539, 'G', 'E', '13121285', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:40:10.913', 'D7', 'green', 2537);
INSERT INTO device VALUES (2540, 'flashing station', 'C', '44155672', '2013-06-10 14:27:00.633', false, 2536);
INSERT INTO component VALUES (2541, 'G', 'C', '81040795', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-10 06:32:31.848', 'G9', 'green', 2540);
INSERT INTO component VALUES (2542, 'C', 'H', '99560096', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 22:18:24.352', 'D4', 'green', 2540);
INSERT INTO line VALUES (2543, 'H9 PreSeries', 'Series 2', 86, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2527);
INSERT INTO location VALUES (2544, 'AB9', 'transmission test', 'Robert Merkel', 2543);
INSERT INTO device VALUES (2545, 'handheld', 'A', '62980828', '2013-06-10 13:46:17.57', false, 2544);
INSERT INTO component VALUES (2546, 'G', 'C', '24573858', 'Howard Joel Wolowitz', '2013-06-09 17:17:53.069', 'H7', 'green', 2545);
INSERT INTO component VALUES (2547, 'G', 'H', '19264232', 'Howard Joel Wolowitz', '2013-06-09 15:36:12.178', 'F8', 'green', 2545);
INSERT INTO device VALUES (2548, 'flashing station', 'F', '90963883', '2013-06-10 11:25:05.382', false, 2544);
INSERT INTO component VALUES (2549, 'A', 'B', '62155854', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 18:30:42.365', 'H5', 'green', 2548);
INSERT INTO component VALUES (2550, 'E', 'H', '4603499', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-09 21:04:20.152', 'D5', 'green', 2548);
INSERT INTO location VALUES (2551, 'EH9', 'motor test', 'Franziska Meier', 2543);
INSERT INTO device VALUES (2552, 'printer', 'D', '34123390', '2013-06-09 21:56:06.737', false, 2551);
INSERT INTO component VALUES (2553, 'E', 'B', '80592431', 'Dr. Leonard Leakey Hofstadter', '2013-06-10 02:02:07.016', 'A2', 'green', 2552);
INSERT INTO component VALUES (2554, 'G', 'D', '83807934', 'Howard Joel Wolowitz', '2013-06-09 18:40:32.112', 'D4', 'yellow', 2552);
INSERT INTO device VALUES (2555, 'handheld', 'I', '72203604', '2013-06-10 07:43:00.192', true, 2551);
INSERT INTO component VALUES (2556, 'H', 'C', '99539781', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-09 21:23:13.591', 'A1', 'green', 2555);
INSERT INTO component VALUES (2557, 'H', 'C', '29229486', 'Dr. Leonard Leakey Hofstadter', '2013-06-09 18:06:53.118', 'F3', 'green', 2555);
/*
 *
 * Demonstration HALL 1
 *
 */
 
INSERT INTO line VALUES (100, 'B5 Assembly', 'Test Series', 0, 'm 241.5,67.21875 0,0.5 0,30.5 0,0.5 0.5,0 213.5,0 0.5,0 0,-0.5 0,-30.5 0,-0.5 -0.5,0 -213.5,0 -0.5,0 z m 1,1 212.5,0 0,29.5 -212.5,0 0,-29.5 z', 478);
INSERT INTO line VALUES (101, 'B5 Assembly', 'Test Series', 0, 'm 26,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 59.5,0 0.5,0 0,-0.5 0,-16 12,0 0.5,0 0,-0.5 0,-25 0,-0.5 -0.5,0 -72,0 -0.5,0 z m 1,1 71,0 0,24 -12,0 -0.5,0 0,0.5 0,16 -58.5,0 0,-40.5 z', 478);
INSERT INTO line VALUES (102, 'B5 Assembly', 'Test Series', 0, 'm 98,105.46875 0,0.5 0,24.5 -12,0 -0.5,0 0,0.5 0,16.5 0,0.5 0.5,0 322.5,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -310,0 -0.5,0 z m 1,1 309,0 0,40.5 -321.5,0 0,-15.5 12,0 0.5,0 0,-0.5 0,-24.5 z', 478);
INSERT INTO line VALUES (103, 'B5 Assembly', 'Test Series', 0, 'm 407.625,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 36.25,0 0.5,0 0,-0.5 0,-16.375 0,-0.5 -0.5,0 -12,0 0,-24.625 0,-0.5 -0.5,0 -23.75,0 -0.5,0 z m 1,1 22.75,0 0,24.625 0,0.5 0.5,0 12,0 0,15.375 -35.25,0 0,-40.5 z', 478);
INSERT INTO line VALUES (104, 'B5 Assembly', 'Test Series', 0, 'm 431.375,105.46875 0,0.5 0,25.125 0,0.5 0.5,0 12,0 0,15.875 0,0.5 0.5,0 12.75,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -25.25,0 -0.5,0 z m 1,1 24.25,0 0,40.5 -11.75,0 0,-15.875 0,-0.5 -0.5,0 -12,0 0,-24.125 z', 478);
INSERT INTO line VALUES (105, 'B5 Assembly', 'Test Series', 0, 'm 26,67.21875 0,0.5 0,30.5 0,0.5 0.5,0 207.25,0 0.5,0 0,-0.5 0,-30.5 0,-0.5 -0.5,0 -207.25,0 -0.5,0 z m 1,1 206.25,0 0,29.5 -206.25,0 0,-29.5 z', 478);
INSERT INTO line VALUES (106, 'B5 Assembly', 'Test Series', 0, 'm 303.5,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 174.78125,0 0.46875,0 0,-0.5 0,-25.65625 0,-0.5 -0.46875,0 -174.78125,0 -0.5,0 z m 1,1 173.78125,0 0,24.6875 -173.78125,0 0,-24.6875 z', 478);
INSERT INTO line VALUES (107, 'B5 Assembly', 'Test Series', 0, 'm 268.78125,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 32.0625,0 0.5,0 0,-0.5 0,-25.65625 0,-0.5 -0.5,0 -32.0625,0 -0.5,0 z m 1,1 31.0625,0 0,24.65625 -31.0625,0 0,-24.65625 z', 478);
INSERT INTO line VALUES (108, 'B5 Assembly', 'Test Series', 0, 'm 119.5,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 146.28125,0 0.5,0 0,-0.5 0,-25.65625 0,-0.5 -0.5,0 -146.28125,0 -0.5,0 z m 1,1 145.28125,0 0,24.6875 -145.28125,0 0,-24.6875 z', 478);
INSERT INTO line VALUES (109, 'B5 Assembly', 'Test Series', 0, 'm 28.860346,16.3125 0,0.5 0,17.8125 -20.51689,0 -0.4863263,0 0,0.5 0,25.65625 0,0.5 0.4863263,0 108.602744,0 0.48632,0 0,-0.5 0,-25.65625 0,-0.5 -0.48632,0 -31.793586,0 0,-17.8125 0,-0.5 -0.486326,0 -55.319615,0 -0.486327,0 z m 0.972653,1 54.346963,0 0,17.8125 0,0.5 0.486326,0 31.793582,0 0,24.65625 -107.6300877,0 0,-24.65625 20.5168907,0 0.486326,0 0,-0.5 0,-17.8125 z', 478);
INSERT INTO line VALUES (110, 'B5 Assembly', 'Test Series', 0, 'm 481.21875,34.65625 0,0.46875 0,37.34375 0,0.46875 0.46875,0 20.65625,0 0.46875,0 0,-0.46875 0,-37.34375 0,-0.46875 -0.46875,0 -20.65625,0 -0.46875,0 z m 0.9375,0.9375 19.71875,0 0,36.40625 -19.71875,0 0,-36.40625 z', 478);
INSERT INTO line VALUES (111, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,79.0625 0,0.46875 0,65.9375 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-65.9375 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z M 482.125,80 l 19.75,0 0,65 -19.75,0 0,-65 z', 478);
INSERT INTO line VALUES (112, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,79.03125 0,0.5 0,10.1875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-10.1875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,9.1875 -15.03125,0 0,-9.1875 z', 478);
INSERT INTO line VALUES (113, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,92.625 0,0.5 0,73.21875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-73.21875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,72.21875 -15.03125,0 0,-72.21875 z', 478);
INSERT INTO line VALUES (114, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,165.84375 0,0.5 0,44.3125 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-44.3125 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,43.3125 -15.03125,0 0,-43.3125 z', 478);
INSERT INTO line VALUES (115, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,210.15625 0,0.5 0,29.46875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-29.46875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,28.46875 -15.03125,0 0,-28.46875 z', 478);
INSERT INTO line VALUES (116, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,151.40625 0,0.46875 0,88.25 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-88.25 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z m 0.96875,0.9375 19.75,0 0,87.3125 -19.75,0 0,-87.3125 z', 478);
INSERT INTO line VALUES (117, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,245.65625 0,0.46875 0,29.65625 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-29.65625 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z m 0.96875,0.9375 19.75,0 0,28.71875 -19.75,0 0,-28.71875 z', 478);
INSERT INTO line VALUES (118, 'B5 Assembly', 'Test Series', 0, 'm 463.84375,245.625 0,0.5 0,29.65625 0,0.5 0.5,0 14.5,0 0.5,0 0,-0.5 0,-29.65625 0,-0.5 -0.5,0 -14.5,0 -0.5,0 z m 1,1 13.5,0 0,28.65625 -13.5,0 0,-28.65625 z', 478);
INSERT INTO line VALUES (119, 'B5 Assembly', 'Test Series', 0, 'm 26,151.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 478);
INSERT INTO line VALUES (120, 'B5 Assembly', 'Test Series', 0, 'm 26,175.875 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 478);
INSERT INTO line VALUES (121, 'B5 Assembly', 'Test Series', 0, 'm 26,200.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 478);
INSERT INTO line VALUES (122, 'B5 Assembly', 'Test Series', 0, 'm 26,224.875 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 478);
INSERT INTO line VALUES (123, 'B5 Assembly', 'Test Series', 0, 'm 26,249.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 478);
INSERT INTO line VALUES (124, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,67.21875 0,0.5 0,34.75 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-34.75 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,33.75 -10.65625,0 0,-33.75 z', 478);
INSERT INTO line VALUES (125, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,40.5 -10.65625,0 0,-40.5 z', 478);
INSERT INTO line VALUES (126, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,151.375 0,0.5 0,99.59375 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-99.59375 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,98.59375 -10.65625,0 0,-98.59375 z', 478);


/* 
 *
	Factory Plan: Ingolstadt
 *
 */

INSERT INTO hall VALUES (478, 'H0', 0, 0, 'm 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z', 1);
INSERT INTO hall VALUES (479, 'H1', 0, 0, 'm 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z', 1);
INSERT INTO hall VALUES (480, 'H2', 0, 0, 'm 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z', 1);
INSERT INTO hall VALUES (481, 'H3', 0, 0, 'm 214.34566,67.46933 7,0 0,17.5 -7,0 z', 1);
INSERT INTO hall VALUES (482, 'H4', 0, 0, 'm 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z', 1);
INSERT INTO hall VALUES (483, 'H5', 0, 0, 'm 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z', 1);
INSERT INTO hall VALUES (484, 'H6', 0, 0, 'm 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z', 1);
INSERT INTO hall VALUES (485, 'H7', 0, 0, 'm 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z', 1);
INSERT INTO hall VALUES (486, 'H8', 0, 0, 'm 114.30364,127.18134 2.25,0 0,6 -2.25,0 z', 1);
INSERT INTO hall VALUES (487, 'H9', 0, 0, 'm 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z', 1);
INSERT INTO hall VALUES (488, 'H10', 0, 0, 'm 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z', 1);
INSERT INTO hall VALUES (489, 'H11', 0, 0, 'm 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z', 1);
INSERT INTO hall VALUES (490, 'H12', 0, 0, 'm 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z', 1);
INSERT INTO hall VALUES (491, 'H13', 0, 0, 'm 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z', 1);
INSERT INTO hall VALUES (492, 'H14', 0, 0, 'm 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z', 1);
INSERT INTO hall VALUES (493, 'H15', 0, 0, 'm 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z', 1);
INSERT INTO hall VALUES (494, 'H16', 0, 0, 'm 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z', 1);
INSERT INTO hall VALUES (495, 'H17', 0, 0, 'm 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z', 1);
INSERT INTO hall VALUES (496, 'H18', 0, 0, 'm 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z', 1);
INSERT INTO hall VALUES (497, 'H19', 0, 0, 'm 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z', 1);
INSERT INTO hall VALUES (498, 'H20', 0, 0, 'm 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z', 1);
INSERT INTO hall VALUES (499, 'H21', 0, 0, 'm 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z', 1);
INSERT INTO hall VALUES (500, 'H22', 0, 0, 'm 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z', 1);
INSERT INTO hall VALUES (501, 'H23', 0, 0, 'm 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z', 1);
INSERT INTO hall VALUES (502, 'H24', 0, 0, 'm 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z', 1);
INSERT INTO hall VALUES (503, 'H25', 0, 0, 'm 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z', 1);
INSERT INTO hall VALUES (504, 'H26', 0, 0, 'm 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z', 1);
INSERT INTO hall VALUES (505, 'H27', 0, 0, 'm 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z', 1);
INSERT INTO hall VALUES (506, 'H28', 0, 0, 'm 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z', 1);
INSERT INTO hall VALUES (507, 'H29', 0, 0, 'm 45.971634,111.75833 2,0 0,9.505 -2,0 z', 1);
INSERT INTO hall VALUES (508, 'H30', 0, 0, 'm 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z', 1);
INSERT INTO hall VALUES (509, 'H31', 0, 0, 'm 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z', 1);
INSERT INTO hall VALUES (510, 'H32', 0, 0, 'm 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z', 1);
INSERT INTO hall VALUES (511, 'H33', 0, 0, 'm 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z', 1);
INSERT INTO hall VALUES (512, 'H34', 0, 0, 'm 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z', 1);
INSERT INTO hall VALUES (513, 'H35', 0, 0, 'm 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z', 1);
INSERT INTO hall VALUES (514, 'H36', 0, 0, 'm 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z', 1);
INSERT INTO hall VALUES (515, 'H37', 0, 0, 'm 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z', 1);
INSERT INTO hall VALUES (516, 'H38', 0, 0, 'm 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z', 1);
INSERT INTO hall VALUES (517, 'H39', 0, 0, 'M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z', 1);
INSERT INTO hall VALUES (518, 'H40', 0, 0, 'm 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z', 1);
INSERT INTO hall VALUES (519, 'H41', 0, 0, 'm 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z', 1);
INSERT INTO hall VALUES (520, 'H42', 0, 0, 'm 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z', 1);
INSERT INTO hall VALUES (521, 'H43', 0, 0, 'm 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z', 1);
INSERT INTO hall VALUES (522, 'H44', 0, 0, 'm 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z', 1);
INSERT INTO hall VALUES (523, 'H45', 0, 0, 'm 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z', 1);
INSERT INTO hall VALUES (524, 'H46', 0, 0, 'm 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z', 1);
INSERT INTO hall VALUES (525, 'H47', 0, 0, 'm 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z', 1);
INSERT INTO hall VALUES (526, 'H48', 0, 0, 'm 66.636642,69.246323 5,0 0,2.599 -5,0 z', 1);
INSERT INTO hall VALUES (527, 'H49', 0, 0, 'm 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z', 1);
INSERT INTO hall VALUES (528, 'H50', 0, 0, 'm 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z', 1);
INSERT INTO hall VALUES (529, 'H51', 0, 0, 'm 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z', 1);
INSERT INTO hall VALUES (530, 'H52', 0, 0, 'm 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z', 1);
INSERT INTO hall VALUES (531, 'H53', 0, 0, 'm 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z', 1);
INSERT INTO hall VALUES (532, 'H54', 0, 0, 'M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z', 1);
INSERT INTO hall VALUES (533, 'H55', 0, 0, 'm 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z', 1);
INSERT INTO hall VALUES (534, 'H56', 0, 0, 'm 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z', 1);
INSERT INTO hall VALUES (535, 'H57', 0, 0, 'm 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z', 1);
INSERT INTO hall VALUES (536, 'H58', 0, 0, 'm 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z', 1);
INSERT INTO hall VALUES (537, 'H59', 0, 0, 'm 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z', 1);
INSERT INTO hall VALUES (538, 'H60', 0, 0, 'm 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z', 1);
INSERT INTO hall VALUES (539, 'H61', 0, 0, 'm 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z', 1);
INSERT INTO hall VALUES (540, 'H62', 0, 0, 'm 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z', 1);
INSERT INTO hall VALUES (541, 'H63', 0, 0, 'm 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z', 1);
INSERT INTO hall VALUES (542, 'H64', 0, 0, 'm 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z', 1);
INSERT INTO hall VALUES (543, 'H65', 0, 0, 'm 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z', 1);
INSERT INTO hall VALUES (544, 'H66', 0, 0, 'm 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z', 1);
INSERT INTO hall VALUES (545, 'H67', 0, 0, 'm 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z', 1);
INSERT INTO hall VALUES (546, 'H68', 0, 0, 'm 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z', 1);
INSERT INTO hall VALUES (547, 'H69', 0, 0, 'm 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z', 1);
INSERT INTO hall VALUES (548, 'H70', 0, 0, 'm 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z', 1);
INSERT INTO hall VALUES (549, 'H71', 0, 0, 'm 179.28462,61.21933 4.062,0 0,4 -4.062,0 z', 1);
INSERT INTO hall VALUES (550, 'H72', 0, 0, 'm 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z', 1);
INSERT INTO hall VALUES (551, 'H73', 0, 0, 'm 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z', 1);
INSERT INTO hall VALUES (552, 'H74', 0, 0, 'm 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z', 1);
INSERT INTO hall VALUES (553, 'H75', 0, 0, 'm 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z', 1);
INSERT INTO hall VALUES (554, 'H76', 0, 0, 'm 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z', 1);

/* 
 *
	Factory Plan: DE/Neckarsulm
 *
 */

INSERT INTO hall VALUES (555, 'H0', 0, 0, 'm 208.46477,40.528679 5.5,0 0,8 -5.5,0 z', 2);
INSERT INTO hall VALUES (556, 'H1', 0, 0, 'm 209.04778,24.903675 9,0 0,13.625 -9,0 z', 2);
INSERT INTO hall VALUES (557, 'H2', 0, 0, 'm 35.547788,84.40368 11.75,2.375 1.375,-6 -13.125,-2.625 z', 2);
INSERT INTO hall VALUES (558, 'H3', 0, 0, 'm 29.26068,48.316436 33.753282,6.6392 -1.301978,6.619175 -33.753282,-6.6392 z', 2);
INSERT INTO hall VALUES (559, 'H4', 0, 0, 'm 17.388576,45.68636 9.320419,1.832357 -1.301303,6.619175 -9.320419,-1.832357 z', 2);
INSERT INTO hall VALUES (560, 'H5', 0, 0, 'm 7.642923,45.441464 4.7912,0.942419 -0.669324,3.402802 -4.7912,-0.942419 z', 2);
INSERT INTO hall VALUES (561, 'H6', 0, 0, 'M 13.764784,54.935855 27.054156,57.548493 25.752853,64.167667 12.463481,61.55503 z', 2);
INSERT INTO hall VALUES (562, 'H7', 0, 0, 'm 29.883281,57.311219 11.556574,2.271977 -0.993821,5.055142 -11.556573,-2.271976 z', 2);
INSERT INTO hall VALUES (563, 'H8', 0, 0, 'm 27.995236,67.907615 11.556573,2.271975 -0.539734,2.7454 -11.556573,-2.27198 z', 2);
INSERT INTO hall VALUES (564, 'H9', 0, 0, 'm 30.694468,68.47912 -1.263997,6.43275 -2.745398,-0.53946 1.263997,-6.432744 z', 2);
INSERT INTO hall VALUES (565, 'H10', 0, 0, 'm 46.892157,46.843406 21.181164,4.166291 -0.673956,3.426351 -21.181164,-4.166291 z', 2);
INSERT INTO hall VALUES (566, 'H11', 0, 0, 'm 8.308725,38.824571 35.676433,7.017481 -0.673956,3.42635 -35.676433,-7.01748 z', 2);
INSERT INTO hall VALUES (567, 'H12', 0, 0, 'm 10.047787,68.77666 2.5,0 0,6.25 -2.5,0 z', 2);
INSERT INTO hall VALUES (568, 'H13', 0, 0, 'm 14.047787,68.77666 3.25,0 0,7.75 -3.25,0 z', 2);
INSERT INTO hall VALUES (569, 'H14', 0, 0, 'm 1.214787,54.943687 8.416999,0 0,6.917 -8.416999,0 z', 2);
INSERT INTO hall VALUES (570, 'H15', 0, 0, 'm 1.130787,64.61068 7.25,0 0,5.25 -7.25,0 z', 2);
INSERT INTO hall VALUES (571, 'H16', 0, 0, 'm 2.630787,71.61068 3.667,0 0,3.75 -3.667,0 z', 2);
INSERT INTO hall VALUES (572, 'H17', 0, 0, 'm 36.547791,88.44467 8.416999,0 0,3.25 -8.416999,0 z', 2);
INSERT INTO hall VALUES (573, 'H18', 0, 0, 'm 40.71479,89.77768 4.167,0 0,5.417 -4.167,0 z', 2);
INSERT INTO hall VALUES (574, 'H19', 0, 0, 'm 42.750087,71.3456 14.404326,3.54212 -1.313399,5.34105 -14.404327,-3.54212 z', 2);
INSERT INTO hall VALUES (575, 'H20', 0, 0, 'm 46.714788,67.61068 0.037,-6.024 14.213,2.191 -0.084,7.583 z', 2);
INSERT INTO hall VALUES (576, 'H21', 0, 0, 'm 46.379788,18.86268 -2.084,-0.25 -0.583,2.082 -2.75,-0.082 -3.917,18.999 -7.666,-1.416 0.416,-4.667 -2.5,-0.666 3.75,-22.25 21.667,4.166 -1.5,6.166 -5.083,-0.166 z', 2);
INSERT INTO hall VALUES (577, 'H22', 0, 0, 'm 204.13179,59.028679 14.166,0 0,5.333 -14.166,0 z', 2);
INSERT INTO hall VALUES (578, 'H23', 0, 0, 'm 204.13179,66.195671 12.5,0 0,4.332999 -12.5,0 z', 2);
INSERT INTO hall VALUES (579, 'H24', 0, 0, 'm 208.17279,77.40368 h -5.75 v 8.5 h 5.625 v 1.651 c 0.688,0.378 1.473,0.599 2.312,0.599 2.658,0 4.812,-2.154 4.812,-4.812 0,-0.458 -0.084,-0.893 -0.204,-1.312 h 2.579 v -8.875 h -9.375 v 4.249 z', 2);
INSERT INTO hall VALUES (580, 'H25', 0, 0, 'm 189.67279,99.02868 0,-1.375 8.375,0 0,-42.875 -1.625,0 0,-5.5 -18.75,0 0,5.5 0,0.625 0,42.25 3.125,0 0,1.375 4.25,0 0,0.625 2,0 0,-0.625 z', 2);
INSERT INTO hall VALUES (581, 'H26', 0, 0, 'm 204.67279,49.65368 v -15.75 -6.375 h -6.25 -42.125 v 4.5 h -5.5 v -10.25 h 1.875 v 0.25 h 14.75 v -6.875 h -14.75 v 2.625 h -1.875 v -2.625 h -17 v 26.25 h 17 v -8 h 5.5 v 0.5 h 4.082 v 2.875 h -4.082 v 6.75 h -26.875 v -41.5 h -22.375 v 9.333 h -3.5 v 28.25 h 3.5 v 3.917 h -9.251 v -0.081 h 1.417 v -11.5 h -9.25 v -7.25 h -9.750002 v 16.667 h 3.75 v 1.333 0.75 4 H 97.79679 v -1.544 h 4.416 v 9.208 H 78.880788 v 4.416 h 23.332002 v 4.376 h -1.665 v 2.877 h -2.125 v -3.002 H 79.172788 v 25.875 h 7.000002 v 9 h 12 v -9 h 0.25 v -20.873 h 2.125 v 29.373 h 5.831 v 1.708 h 10.75 v -1.708 h 4.544 v -34.25 h -16.543 v -4.376 h 15.168 v -4.416 h -15.168 v -9.208 h 1.918 v 3.75 h 19.875 v 5 h -2.75 v 44.25 h 2.75 v 0.125 h 47.25 v -49.5 h -14.709 v -1.5 h 11.709 v -2.625 h 27.25 v 4.25 h 6.25 z m -70.959,-0.125 h -4.291 v -3.625 h 4.291 v 3.625 z m 24.584,0 h -14.166 v -3.625 h 12.166 v 2.125 h 2 v 1.5 z m 12.875,-12.75 h -1.188 -8.188 v -2.875 h 36.625 v 2.875 h -27.249 z', 2);
INSERT INTO hall VALUES (582, 'H27', 0, 0, 'm 79.922791,94.90368 3,0 0,3 -3,0 z', 2);
INSERT INTO hall VALUES (583, 'H28', 0, 0, 'm 92.62978,24.864681 6.667,0 0,5.666 -6.667,0 z', 2);
INSERT INTO hall VALUES (584, 'H29', 0, 0, 'm 62.400788,63.78168 0,12.25 9.98,7.752 0,9.164 -9.667,0 0,4.833 10.917,0 0,-0.083 3.583,0 0,-13.916 0.021,0 0.333,-20 z', 2);
INSERT INTO hall VALUES (585, 'H30', 0, 0, 'm 58.995788,82.02868 -2.78,0 0,2.5 2.313,0 -0.732,3.919 13.083,3.583 1.5,-4.167 -13.167,-7 z', 2);
INSERT INTO hall VALUES (586, 'H31', 0, 0, 'm 117.21179,101.19568 4.166,0 0,4.166 -4.166,0 z', 2);
INSERT INTO hall VALUES (587, 'H32', 0, 0, 'm 145.87879,119.94568 0,-1.917 3.667,0 0,-12.833 -5.167,0 0,3.25 -22.917,0 0,11.5 z', 2);
INSERT INTO hall VALUES (588, 'H33', 0, 0, 'm 65.172791,99.77869 7.5,0 0,2.625 -7.5,0 z', 2);
INSERT INTO hall VALUES (589, 'H34', 0, 0, 'm 140.46179,7.610683 3.25,0 0,3 -3.25,0 z', 2);
INSERT INTO hall VALUES (590, 'H35', 0, 0, 'm 172.37779,17.860683 2.75,0 0,5 -2.75,0 z', 2);
INSERT INTO hall VALUES (591, 'H36', 0, 0, 'm 177.21179,17.693676 2.166,0 0,2.167 -2.166,0 z', 2);
INSERT INTO hall VALUES (592, 'H37', 0, 0, 'm 146.0448,7.776684 2,0 0,3.084 -2,0 z', 2);
INSERT INTO hall VALUES (593, 'H38', 0, 0, 'm 149.96379,1.34668 0,0.099 -4.249,0 0,4.25 4.249,0 0,5.349 3.668,0 0,-9.698 z', 2);
INSERT INTO hall VALUES (594, 'H39', 0, 0, 'm 159.21179,5.77668 -0.584,0 -3.666,0 0,5.334 4.25,0 0,-2.417 1.166,0 0,-2.917 z', 2);
INSERT INTO hall VALUES (595, 'H40', 0, 0, 'm 138.13179,0.778683 2.416,0 0,2.917 -2.416,0 z', 2);
INSERT INTO hall VALUES (596, 'H41', 0, 0, 'm 141.7148,0.945675 2.167,0 0,4 -2.167,0 z', 2);
INSERT INTO hall VALUES (597, 'H42', 0, 0, 'm 165.7148,6.695675 5.167,0 0,4.167 -5.167,0 z', 2);
INSERT INTO hall VALUES (598, 'H43', 0, 0, 'm 77.71479,42.696678 3.083,0 0,5.167 -3.083,0 z', 2);
INSERT INTO hall VALUES (599, 'H44', 0, 0, 'm 47.88279,96.61168 4.5,0 0,2.5 -4.5,0 z', 2);

