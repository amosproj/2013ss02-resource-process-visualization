drop table if exists component; 
drop table if exists device;
drop table if exists line;
drop table if exists location;
drop table if exists hall;
drop table if exists factory;
create table factory(
	id int ,
	name char(25), 
	company char(25), 
	city char(25), 
	country char(25), 	
	gpslatitude double precision , 
	gpslongitude double precision, 
	carmodels char(512), 
	sizeofstaff int, 
	numofvehicles int 
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
    path character varying(250),
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
		35386, 551889
	);
	insert into factory values (2, 'Neckarsulm', 'Audi' , 'Neckarsulm', 'Germany', 49.194213, 9.221771,
		'Audi A4, Audi A5 Cabriolet, Audi S5 Cabriolet, Audi RS 5 Cabriolet, Audi A6, Audi A6 hybrid, Audi A6 Avant, Audi S6, Audi A6 allroad quattro, Audi RS 6 Avant, Audi A7, Audi S7, Audi RS7, Audi A8, Audi A8 L, Audi A8 hybrid, Audi S8, Audi R8, Audi R8 Spyder, Audi R8 GT, Audi R8 GT Spyder',
			14764, 262965
	);
	insert into factory values (3, 'Gyor', 'Audi' ,'Gyor', 'Hungary', 47.68746, 17.65040,
		'Audi TT Coupe, Audi TT Roadster,Audi A3 Cabriolet',
		8663, 33553
	);
	insert into factory values (4, 'Changchun', 'Volkswagen' , 'Changchun', 'China', 43.81708, 125.32354,
		'Audi A6L, Audi A4L, Audi Q5',
			9700, 333467
	);
	insert into factory values (5, 'Bruessel', 'Audi' ,'Bruessel', 'Belgium', 50.85034, 4.35171,
		'Audi A1, Audi A1 Sportback, Audi A1 quattro',
		2503, 123111
	);
	insert into factory values (6, 'Aurangabad', 'Skoda' , 'Aurangabad', 'India', 19.87617, 75.34331,
		'Audi A4 Limousine, Audi A6 Limousine,Audi Q5, Audi Q7',
			140, 6786
	);
	insert into factory values (7, 'Bratislava', 'Volkswagen' , 'Bratislava', 'Slovakia', 48.14589, 17.10714,
		'Audi Q7',
			2200, 54562
	);
	insert into factory values (8, 'Martorell', 'Seat' ,'Martorell', 'Spain', 41.48040, 1.91481,
		'Audi Q3',
		1500, 106829
	);
	insert into factory values (9, 'Jakarta', 'Audi' , 'Jakarta', 'Indonesia', -6.21154, 106.84517,
		'Audi A4, Audi A6',
			0, 443
	);
INSERT INTO hall VALUES (2000, 'A7', 764, 4338, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);
INSERT INTO line VALUES (2001, 'A7 Assembly', 'Series 2', 8, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2000);
INSERT INTO location VALUES (2002, 'BF3', 'transmission test', 'Sarah Meier', 2001);
INSERT INTO device VALUES (2003, 'handheld', 'G', '68878671', '2013-06-02 02:40:18.095', false, 2002);
INSERT INTO component VALUES (2004, 'D', 'B', '72284306', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 11:10:03.203', 'E4', 'green', 2003);
INSERT INTO component VALUES (2005, 'F', 'F', '37960087', 'Howard Joel Wolowitz', '2013-06-01 18:09:34.188', 'C7', 'green', 2003);
INSERT INTO device VALUES (2006, 'mobile station', 'I', '81126321', '2013-06-02 14:35:00.295', true, 2002);
INSERT INTO component VALUES (2007, 'G', 'E', '77044450', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 02:02:32.98', 'D7', 'red', 2006);
INSERT INTO component VALUES (2008, 'F', 'D', '39245121', 'Howard Joel Wolowitz', '2013-06-02 06:35:17.99', 'I2', 'green', 2006);
INSERT INTO location VALUES (2009, 'AA3', 'security test', 'Robert Schmitt', 2001);
INSERT INTO device VALUES (2010, 'printer', 'D', '56539395', '2013-06-02 11:30:01.718', false, 2009);
INSERT INTO component VALUES (2011, 'E', 'C', '49045596', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 05:13:42.902', 'H1', 'green', 2010);
INSERT INTO component VALUES (2012, 'B', 'H', '34245904', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 11:49:30.474', 'F1', 'green', 2010);
INSERT INTO device VALUES (2013, 'mobile station', 'A', '37930177', '2013-06-02 04:11:02.122', false, 2009);
INSERT INTO component VALUES (2014, 'G', 'F', '35519132', 'Howard Joel Wolowitz', '2013-06-01 19:13:16.72', 'H6', 'green', 2013);
INSERT INTO component VALUES (2015, 'F', 'F', '47799066', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 08:09:46.505', 'G2', 'green', 2013);
INSERT INTO line VALUES (2016, 'A7 PreSeries', 'Series 6', 14, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2000);
INSERT INTO location VALUES (2017, 'HF8', 'multimedia test', 'Franziska Meier', 2016);
INSERT INTO device VALUES (2018, 'flashing station', 'D', '47010345', '2013-06-02 00:30:32.923', false, 2017);
INSERT INTO component VALUES (2019, 'B', 'E', '1239141', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 21:12:21.569', 'A6', 'green', 2018);
INSERT INTO component VALUES (2020, 'E', 'G', '7541538', 'Howard Joel Wolowitz', '2013-06-01 17:46:00.667', 'E5', 'green', 2018);
INSERT INTO device VALUES (2021, 'handheld', 'F', '84023768', '2013-06-01 20:57:39.659', false, 2017);
INSERT INTO component VALUES (2022, 'E', 'I', '11661086', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 06:47:58.96', 'B1', 'green', 2021);
INSERT INTO component VALUES (2023, 'B', 'A', '17741881', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 21:35:04.85', 'H1', 'green', 2021);
INSERT INTO location VALUES (2024, 'AF8', 'security test', 'Robert Schmitt', 2016);
INSERT INTO device VALUES (2025, 'printer', 'I', '64818021', '2013-06-01 20:30:28.433', false, 2024);
INSERT INTO component VALUES (2026, 'C', 'E', '92724714', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 11:00:45.359', 'I2', 'green', 2025);
INSERT INTO component VALUES (2027, 'I', 'D', '89093704', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 09:35:00.3', 'I7', 'green', 2025);
INSERT INTO device VALUES (2028, 'flashing station', 'F', '21444301', '2013-06-02 03:19:24.663', false, 2024);
INSERT INTO component VALUES (2029, 'E', 'H', '5591453', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 11:54:36.166', 'E4', 'red', 2028);
INSERT INTO component VALUES (2030, 'F', 'A', '98603621', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 11:27:55.162', 'G2', 'green', 2028);
INSERT INTO hall VALUES (2031, 'F6', 553, 1590, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1);
INSERT INTO line VALUES (2032, 'F6 Assembly', 'Series 7', 36, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2031);
INSERT INTO location VALUES (2033, 'IA3', 'motor test', 'Sarah Mueller', 2032);
INSERT INTO device VALUES (2034, 'mobile station', 'B', '18848631', '2013-06-02 05:38:37.01', false, 2033);
INSERT INTO component VALUES (2035, 'A', 'F', '80712202', 'Howard Joel Wolowitz', '2013-06-02 02:48:01.434', 'I3', 'green', 2034);
INSERT INTO component VALUES (2036, 'D', 'G', '77940814', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 00:47:22.976', 'B5', 'green', 2034);
INSERT INTO device VALUES (2037, 'printer', 'C', '37259048', '2013-06-01 23:06:48.24', false, 2033);
INSERT INTO component VALUES (2038, 'A', 'D', '35213374', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 06:06:17.287', 'H2', 'green', 2037);
INSERT INTO component VALUES (2039, 'D', 'C', '82657433', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 04:51:04.913', 'B3', 'green', 2037);
INSERT INTO location VALUES (2040, 'DF6', 'ABS test', 'Robert Schmitt', 2032);
INSERT INTO device VALUES (2041, 'mobile station', 'B', '15189226', '2013-06-01 21:24:31.339', false, 2040);
INSERT INTO component VALUES (2042, 'E', 'F', '45791985', 'Howard Joel Wolowitz', '2013-06-02 00:31:14.926', 'I5', 'green', 2041);
INSERT INTO component VALUES (2043, 'A', 'H', '41647789', 'Howard Joel Wolowitz', '2013-06-02 10:35:17.393', 'A7', 'green', 2041);
INSERT INTO device VALUES (2044, 'printer', 'C', '94812769', '2013-06-01 17:00:58.228', false, 2040);
INSERT INTO component VALUES (2045, 'I', 'B', '98366106', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 20:48:05.391', 'G2', 'green', 2044);
INSERT INTO component VALUES (2046, 'B', 'C', '95385247', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 21:25:27.508', 'F2', 'green', 2044);
INSERT INTO line VALUES (2047, 'F6 PreSeries', 'Series 2', 11, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2031);
INSERT INTO location VALUES (2048, 'AG9', 'motor test', 'Peter Schmitt', 2047);
INSERT INTO device VALUES (2049, 'mobile station', 'C', '67366851', '2013-06-01 18:46:50.764', false, 2048);
INSERT INTO component VALUES (2050, 'F', 'F', '20792295', 'Howard Joel Wolowitz', '2013-06-02 07:39:44.764', 'C2', 'green', 2049);
INSERT INTO component VALUES (2051, 'C', 'B', '31630268', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 21:20:21.417', 'G5', 'green', 2049);
INSERT INTO device VALUES (2052, 'handheld', 'I', '55874377', '2013-06-02 06:13:41.838', true, 2048);
INSERT INTO component VALUES (2053, 'C', 'C', '32789055', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 23:46:17.625', 'H2', 'green', 2052);
INSERT INTO component VALUES (2054, 'D', 'C', '7581086', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 04:17:26.484', 'G2', 'green', 2052);
INSERT INTO location VALUES (2055, 'IE7', 'motor test', 'Sarah Mueller', 2047);
INSERT INTO device VALUES (2056, 'printer', 'A', '4889779', '2013-06-02 05:25:55.262', false, 2055);
INSERT INTO component VALUES (2057, 'I', 'G', '79366233', 'Howard Joel Wolowitz', '2013-06-02 08:44:43.213', 'D6', 'green', 2056);
INSERT INTO component VALUES (2058, 'D', 'C', '99678883', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 13:43:27.87', 'C1', 'green', 2056);
INSERT INTO device VALUES (2059, 'printer', 'D', '5712757', '2013-06-02 03:12:44.372', false, 2055);
INSERT INTO component VALUES (2060, 'D', 'H', '92013329', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 22:24:23.481', 'B1', 'green', 2059);
INSERT INTO component VALUES (2061, 'I', 'H', '15122304', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 00:43:56.165', 'D3', 'green', 2059);
INSERT INTO hall VALUES (2062, 'C2', 288, 436, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2);
INSERT INTO line VALUES (2063, 'C2 Assembly', 'Series 9', 9, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2062);
INSERT INTO location VALUES (2064, 'CC3', 'transmission test', 'Franziska Merkel', 2063);
INSERT INTO device VALUES (2065, 'mobile station', 'G', '67947325', '2013-06-02 09:18:37.559', false, 2064);
INSERT INTO component VALUES (2066, 'D', 'I', '52516055', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 23:28:19.938', 'F4', 'green', 2065);
INSERT INTO component VALUES (2067, 'E', 'D', '53501118', 'Howard Joel Wolowitz', '2013-06-02 01:32:20.218', 'H8', 'green', 2065);
INSERT INTO device VALUES (2068, 'flashing station', 'H', '59332740', '2013-06-02 09:16:24.9', false, 2064);
INSERT INTO component VALUES (2069, 'A', 'G', '99640772', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 23:15:09.953', 'C4', 'green', 2068);
INSERT INTO component VALUES (2070, 'E', 'B', '5152803', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 18:42:01.629', 'E6', 'green', 2068);
INSERT INTO location VALUES (2071, 'FI2', 'ABS test', 'Franziska Schulze', 2063);
INSERT INTO device VALUES (2072, 'flashing station', 'D', '30812992', '2013-06-02 07:27:25.313', false, 2071);
INSERT INTO component VALUES (2073, 'B', 'H', '74853391', 'Howard Joel Wolowitz', '2013-06-02 00:30:59.737', 'B6', 'green', 2072);
INSERT INTO component VALUES (2074, 'B', 'C', '35362740', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 04:57:04.861', 'G1', 'green', 2072);
INSERT INTO device VALUES (2075, 'handheld', 'D', '82559797', '2013-06-02 06:51:03.983', false, 2071);
INSERT INTO component VALUES (2076, 'E', 'E', '67924290', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 22:02:39.598', 'H1', 'green', 2075);
INSERT INTO component VALUES (2077, 'D', 'H', '38868783', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 18:57:33.437', 'H5', 'green', 2075);
INSERT INTO line VALUES (2078, 'C2 PreSeries', 'Series 7', 30, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2062);
INSERT INTO location VALUES (2079, 'CD9', 'transmission test', 'Hans Mueller', 2078);
INSERT INTO device VALUES (2080, 'mobile station', 'A', '24219570', '2013-06-02 03:26:22.823', false, 2079);
INSERT INTO component VALUES (2081, 'F', 'H', '4825462', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 20:07:32.12', 'F5', 'green', 2080);
INSERT INTO component VALUES (2082, 'E', 'G', '20853049', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 05:49:25.467', 'E1', 'green', 2080);
INSERT INTO device VALUES (2083, 'printer', 'G', '99956866', '2013-06-02 15:19:35.847', false, 2079);
INSERT INTO component VALUES (2084, 'H', 'H', '66838122', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 21:28:54.376', 'E6', 'green', 2083);
INSERT INTO component VALUES (2085, 'E', 'A', '34261304', 'Howard Joel Wolowitz', '2013-06-02 03:35:24.461', 'B3', 'green', 2083);
INSERT INTO location VALUES (2086, 'AH3', 'multimedia test', 'Franziska Schulze', 2078);
INSERT INTO device VALUES (2087, 'printer', 'I', '14526633', '2013-06-02 02:32:38.735', false, 2086);
INSERT INTO component VALUES (2088, 'I', 'C', '3903730', 'Howard Joel Wolowitz', '2013-06-01 23:10:30.822', 'B5', 'green', 2087);
INSERT INTO component VALUES (2089, 'B', 'F', '8654386', 'Howard Joel Wolowitz', '2013-06-02 11:49:49.077', 'D1', 'green', 2087);
INSERT INTO device VALUES (2090, 'printer', 'F', '85368628', '2013-06-02 00:59:57.13', false, 2086);
INSERT INTO component VALUES (2091, 'H', 'D', '12950662', 'Howard Joel Wolowitz', '2013-06-02 08:11:48.491', 'F7', 'green', 2090);
INSERT INTO component VALUES (2092, 'G', 'F', '26465209', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 21:25:14.676', 'F3', 'green', 2090);
INSERT INTO hall VALUES (2093, 'F5', 409, 5352, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2);
INSERT INTO line VALUES (2094, 'F5 Assembly', 'Series 1', 60, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2093);
INSERT INTO location VALUES (2095, 'IC3', 'security test', 'Franziska Schmitt', 2094);
INSERT INTO device VALUES (2096, 'handheld', 'G', '67583364', '2013-06-02 00:15:20.782', false, 2095);
INSERT INTO component VALUES (2097, 'G', 'D', '38078431', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 13:02:17.638', 'C4', 'green', 2096);
INSERT INTO component VALUES (2098, 'G', 'B', '61291308', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 23:03:32.535', 'B6', 'green', 2096);
INSERT INTO device VALUES (2099, 'printer', 'G', '96553577', '2013-06-02 03:19:26.241', false, 2095);
INSERT INTO component VALUES (2100, 'D', 'E', '90825951', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 07:14:58.529', 'A1', 'green', 2099);
INSERT INTO component VALUES (2101, 'E', 'C', '65053497', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 09:40:38.838', 'H9', 'green', 2099);
INSERT INTO location VALUES (2102, 'EG9', 'multimedia test', 'Robert Schmitt', 2094);
INSERT INTO device VALUES (2103, 'printer', 'F', '60190186', '2013-06-02 10:45:49.7', true, 2102);
INSERT INTO component VALUES (2104, 'H', 'D', '95418191', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 21:05:36.631', 'C4', 'green', 2103);
INSERT INTO component VALUES (2105, 'C', 'B', '26335510', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 22:08:08.364', 'A2', 'green', 2103);
INSERT INTO device VALUES (2106, 'printer', 'I', '19848728', '2013-06-02 03:51:43.653', false, 2102);
INSERT INTO component VALUES (2107, 'C', 'E', '14542037', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 09:07:53.386', 'D6', 'green', 2106);
INSERT INTO component VALUES (2108, 'E', 'G', '75959605', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 09:22:56.251', 'D2', 'green', 2106);
INSERT INTO line VALUES (2109, 'F5 PreSeries', 'Series 9', 28, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2093);
INSERT INTO location VALUES (2110, 'CB5', 'transmission test', 'Franziska Meier', 2109);
INSERT INTO device VALUES (2111, 'mobile station', 'D', '38246182', '2013-06-02 13:19:23.683', false, 2110);
INSERT INTO component VALUES (2112, 'E', 'I', '8269494', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 17:04:10.962', 'I9', 'green', 2111);
INSERT INTO component VALUES (2113, 'E', 'F', '52234208', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 02:26:57.116', 'H8', 'red', 2111);
INSERT INTO device VALUES (2114, 'handheld', 'G', '67632558', '2013-06-01 20:50:08.098', false, 2110);
INSERT INTO component VALUES (2115, 'D', 'C', '69883813', 'Howard Joel Wolowitz', '2013-06-01 22:51:22.525', 'B1', 'green', 2114);
INSERT INTO component VALUES (2116, 'H', 'F', '55920758', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 04:34:22.178', 'G9', 'green', 2114);
INSERT INTO location VALUES (2117, 'BD9', 'security test', 'Hans Schulze', 2109);
INSERT INTO device VALUES (2118, 'mobile station', 'A', '41582752', '2013-06-01 20:20:57.069', false, 2117);
INSERT INTO component VALUES (2119, 'C', 'D', '14128943', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 10:25:28.902', 'C2', 'green', 2118);
INSERT INTO component VALUES (2120, 'C', 'H', '2021432', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 20:09:38.488', 'C7', 'green', 2118);
INSERT INTO device VALUES (2121, 'printer', 'E', '91881075', '2013-06-02 00:02:08.928', true, 2117);
INSERT INTO component VALUES (2122, 'A', 'G', '2972715', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 23:39:41.131', 'G3', 'green', 2121);
INSERT INTO component VALUES (2123, 'H', 'E', '96981557', 'Howard Joel Wolowitz', '2013-06-01 19:54:20.826', 'G1', 'red', 2121);
INSERT INTO hall VALUES (2124, 'F1', 843, 726, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO line VALUES (2125, 'F1 Assembly', 'Series 7', 98, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2124);
INSERT INTO location VALUES (2126, 'CH2', 'ABS test', 'Franziska Meier', 2125);
INSERT INTO device VALUES (2127, 'printer', 'E', '54105914', '2013-06-02 09:05:08.668', false, 2126);
INSERT INTO component VALUES (2128, 'D', 'C', '93051546', 'Howard Joel Wolowitz', '2013-06-02 03:28:48.157', 'B5', 'green', 2127);
INSERT INTO component VALUES (2129, 'B', 'G', '75369553', 'Howard Joel Wolowitz', '2013-06-02 09:28:33.908', 'I9', 'green', 2127);
INSERT INTO device VALUES (2130, 'handheld', 'C', '41371358', '2013-06-02 12:54:12.158', true, 2126);
INSERT INTO component VALUES (2131, 'A', 'I', '74853873', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 11:00:39.964', 'G3', 'green', 2130);
INSERT INTO component VALUES (2132, 'I', 'G', '1369512', 'Howard Joel Wolowitz', '2013-06-01 19:25:56.029', 'F1', 'green', 2130);
INSERT INTO location VALUES (2133, 'AA9', 'ABS test', 'Sarah Schulze', 2125);
INSERT INTO device VALUES (2134, 'printer', 'C', '98174820', '2013-06-01 19:59:10.116', false, 2133);
INSERT INTO component VALUES (2135, 'I', 'I', '73053537', 'Howard Joel Wolowitz', '2013-06-01 15:59:59.115', 'I4', 'green', 2134);
INSERT INTO component VALUES (2136, 'B', 'I', '22771736', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 03:43:49.9', 'G1', 'red', 2134);
INSERT INTO device VALUES (2137, 'flashing station', 'I', '22937009', '2013-06-02 14:04:02.992', false, 2133);
INSERT INTO component VALUES (2138, 'H', 'G', '59345734', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 15:21:24.908', 'C5', 'green', 2137);
INSERT INTO component VALUES (2139, 'E', 'I', '44343213', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 00:17:27.31', 'F2', 'green', 2137);
INSERT INTO line VALUES (2140, 'F1 PreSeries', 'Series 8', 89, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2124);
INSERT INTO location VALUES (2141, 'CD2', 'security test', 'Robert Schulze', 2140);
INSERT INTO device VALUES (2142, 'flashing station', 'B', '97751343', '2013-06-01 17:03:15.839', false, 2141);
INSERT INTO component VALUES (2143, 'F', 'B', '27754288', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 17:18:39.772', 'D7', 'green', 2142);
INSERT INTO component VALUES (2144, 'F', 'F', '92386076', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 13:11:47.735', 'B8', 'yellow', 2142);
INSERT INTO device VALUES (2145, 'flashing station', 'C', '82048533', '2013-06-02 05:09:45.637', false, 2141);
INSERT INTO component VALUES (2146, 'C', 'B', '21526731', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 15:12:12.228', 'E4', 'green', 2145);
INSERT INTO component VALUES (2147, 'D', 'C', '16833369', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 15:33:23.744', 'D3', 'green', 2145);
INSERT INTO location VALUES (2148, 'BI3', 'multimedia test', 'Franziska Merkel', 2140);
INSERT INTO device VALUES (2149, 'handheld', 'C', '65459683', '2013-06-02 13:38:54.352', false, 2148);
INSERT INTO component VALUES (2150, 'G', 'I', '28261723', 'Howard Joel Wolowitz', '2013-06-02 03:58:54.747', 'G7', 'green', 2149);
INSERT INTO component VALUES (2151, 'H', 'H', '28476961', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 08:18:39.371', 'B8', 'green', 2149);
INSERT INTO device VALUES (2152, 'flashing station', 'F', '93579001', '2013-06-02 08:11:32.973', false, 2148);
INSERT INTO component VALUES (2153, 'F', 'A', '53327936', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 10:24:28.49', 'C4', 'green', 2152);
INSERT INTO component VALUES (2154, 'H', 'E', '13478092', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 10:20:08.218', 'F7', 'green', 2152);
INSERT INTO hall VALUES (2155, 'A8', 369, 4498, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO line VALUES (2156, 'A8 Assembly', 'Series 9', 38, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2155);
INSERT INTO location VALUES (2157, 'FB6', 'multimedia test', 'Peter Mueller', 2156);
INSERT INTO device VALUES (2158, 'handheld', 'D', '72214721', '2013-06-01 17:22:15.844', false, 2157);
INSERT INTO component VALUES (2159, 'D', 'A', '33237020', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 20:48:30.901', 'B1', 'green', 2158);
INSERT INTO component VALUES (2160, 'F', 'E', '84015237', 'Howard Joel Wolowitz', '2013-06-02 08:00:16.137', 'A7', 'green', 2158);
INSERT INTO device VALUES (2161, 'mobile station', 'G', '11971573', '2013-06-02 13:06:16.305', false, 2157);
INSERT INTO component VALUES (2162, 'F', 'F', '4700702', 'Howard Joel Wolowitz', '2013-06-02 05:53:29.82', 'F6', 'green', 2161);
INSERT INTO component VALUES (2163, 'D', 'E', '97662723', 'Howard Joel Wolowitz', '2013-06-02 10:58:10.047', 'D9', 'green', 2161);
INSERT INTO location VALUES (2164, 'CA3', 'ABS test', 'Sarah Schmitt', 2156);
INSERT INTO device VALUES (2165, 'handheld', 'B', '27301736', '2013-06-01 19:06:56.093', false, 2164);
INSERT INTO component VALUES (2166, 'A', 'I', '1211084', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 00:25:23.645', 'H1', 'green', 2165);
INSERT INTO component VALUES (2167, 'H', 'I', '9358514', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 23:47:11.112', 'D8', 'green', 2165);
INSERT INTO device VALUES (2168, 'mobile station', 'B', '85444171', '2013-06-02 14:41:46.723', false, 2164);
INSERT INTO component VALUES (2169, 'C', 'D', '84515065', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 08:30:58.285', 'A5', 'yellow', 2168);
INSERT INTO component VALUES (2170, 'G', 'H', '5295799', 'Howard Joel Wolowitz', '2013-06-02 12:25:43.585', 'E9', 'green', 2168);
INSERT INTO line VALUES (2171, 'A8 PreSeries', 'Series 8', 60, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2155);
INSERT INTO location VALUES (2172, 'AB6', 'ABS test', 'Peter Schulze', 2171);
INSERT INTO device VALUES (2173, 'printer', 'H', '34933166', '2013-06-02 01:00:04.683', false, 2172);
INSERT INTO component VALUES (2174, 'C', 'D', '36493445', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 06:59:27.557', 'I9', 'green', 2173);
INSERT INTO component VALUES (2175, 'B', 'B', '93233466', 'Howard Joel Wolowitz', '2013-06-01 23:33:19.484', 'E7', 'green', 2173);
INSERT INTO device VALUES (2176, 'handheld', 'F', '28954894', '2013-06-02 01:49:24.235', false, 2172);
INSERT INTO component VALUES (2177, 'C', 'G', '57921714', 'Howard Joel Wolowitz', '2013-06-02 14:46:02.962', 'E7', 'red', 2176);
INSERT INTO component VALUES (2178, 'H', 'H', '56902772', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 06:39:50.835', 'B9', 'green', 2176);
INSERT INTO location VALUES (2179, 'FD2', 'ABS test', 'Franziska Schulze', 2171);
INSERT INTO device VALUES (2180, 'flashing station', 'B', '75155060', '2013-06-02 03:35:11.937', false, 2179);
INSERT INTO component VALUES (2181, 'E', 'E', '7359084', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 14:05:03.0', 'D2', 'green', 2180);
INSERT INTO component VALUES (2182, 'I', 'D', '27193780', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 22:40:53.819', 'D4', 'green', 2180);
INSERT INTO device VALUES (2183, 'mobile station', 'G', '65594257', '2013-06-02 14:09:49.198', false, 2179);
INSERT INTO component VALUES (2184, 'B', 'I', '41091282', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 23:09:43.675', 'G5', 'green', 2183);
INSERT INTO component VALUES (2185, 'B', 'C', '60362525', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:51:32.194', 'C6', 'green', 2183);
INSERT INTO hall VALUES (2186, 'G5', 796, 9038, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO line VALUES (2187, 'G5 Assembly', 'Series 8', 21, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2186);
INSERT INTO location VALUES (2188, 'HI7', 'motor test', 'Robert Mueller', 2187);
INSERT INTO device VALUES (2189, 'mobile station', 'B', '39385784', '2013-06-02 06:59:43.798', false, 2188);
INSERT INTO component VALUES (2190, 'C', 'E', '2356264', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 06:22:24.622', 'C3', 'green', 2189);
INSERT INTO component VALUES (2191, 'G', 'B', '51932938', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 10:58:01.782', 'D6', 'green', 2189);
INSERT INTO device VALUES (2192, 'flashing station', 'C', '13283088', '2013-06-01 21:57:18.419', false, 2188);
INSERT INTO component VALUES (2193, 'E', 'E', '11929960', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 23:22:33.959', 'A5', 'green', 2192);
INSERT INTO component VALUES (2194, 'E', 'D', '8801636', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 05:18:06.17', 'E1', 'green', 2192);
INSERT INTO location VALUES (2195, 'HI7', 'security test', 'Franziska Meier', 2187);
INSERT INTO device VALUES (2196, 'printer', 'G', '55283579', '2013-06-02 04:25:47.937', false, 2195);
INSERT INTO component VALUES (2197, 'D', 'A', '7498358', 'Howard Joel Wolowitz', '2013-06-01 20:43:00.847', 'F7', 'green', 2196);
INSERT INTO component VALUES (2198, 'E', 'G', '23750609', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 14:03:48.864', 'I3', 'red', 2196);
INSERT INTO device VALUES (2199, 'printer', 'G', '83524560', '2013-06-02 05:42:38.524', false, 2195);
INSERT INTO component VALUES (2200, 'G', 'I', '65823906', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 23:27:07.964', 'I8', 'green', 2199);
INSERT INTO component VALUES (2201, 'G', 'A', '62064963', 'Howard Joel Wolowitz', '2013-06-02 00:00:16.406', 'H8', 'green', 2199);
INSERT INTO line VALUES (2202, 'G5 PreSeries', 'Series 9', 18, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2186);
INSERT INTO location VALUES (2203, 'DF5', 'transmission test', 'Franziska Meier', 2202);
INSERT INTO device VALUES (2204, 'mobile station', 'I', '77540324', '2013-06-02 01:23:35.986', false, 2203);
INSERT INTO component VALUES (2205, 'C', 'C', '91434525', 'Howard Joel Wolowitz', '2013-06-02 07:42:55.689', 'D3', 'green', 2204);
INSERT INTO component VALUES (2206, 'E', 'I', '72503792', 'Howard Joel Wolowitz', '2013-06-02 05:26:11.558', 'B2', 'green', 2204);
INSERT INTO device VALUES (2207, 'handheld', 'G', '60412654', '2013-06-02 03:52:39.001', false, 2203);
INSERT INTO component VALUES (2208, 'A', 'A', '14572657', 'Howard Joel Wolowitz', '2013-06-01 19:26:18.51', 'H5', 'green', 2207);
INSERT INTO component VALUES (2209, 'G', 'D', '43421963', 'Howard Joel Wolowitz', '2013-06-01 21:33:22.056', 'A5', 'green', 2207);
INSERT INTO location VALUES (2210, 'BG3', 'motor test', 'Hans Mueller', 2202);
INSERT INTO device VALUES (2211, 'handheld', 'B', '94576934', '2013-06-02 14:36:22.316', false, 2210);
INSERT INTO component VALUES (2212, 'E', 'A', '96864894', 'Howard Joel Wolowitz', '2013-06-02 05:00:28.9', 'I2', 'green', 2211);
INSERT INTO component VALUES (2213, 'E', 'D', '37241341', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 00:51:15.399', 'G9', 'green', 2211);
INSERT INTO device VALUES (2214, 'printer', 'A', '44570534', '2013-06-02 11:40:46.275', false, 2210);
INSERT INTO component VALUES (2215, 'E', 'G', '64952194', 'Howard Joel Wolowitz', '2013-06-01 20:33:57.216', 'G9', 'green', 2214);
INSERT INTO component VALUES (2216, 'A', 'C', '13927580', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 21:45:30.594', 'D7', 'green', 2214);
INSERT INTO hall VALUES (2217, 'A2', 463, 4240, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO line VALUES (2218, 'A2 Assembly', 'Series 2', 71, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2217);
INSERT INTO location VALUES (2219, 'EC5', 'ABS test', 'Robert Schmitt', 2218);
INSERT INTO device VALUES (2220, 'mobile station', 'F', '1312635', '2013-06-01 19:54:37.553', false, 2219);
INSERT INTO component VALUES (2221, 'G', 'H', '2711497', 'Howard Joel Wolowitz', '2013-06-02 09:34:43.502', 'G5', 'green', 2220);
INSERT INTO component VALUES (2222, 'E', 'A', '57847037', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 18:13:19.615', 'G8', 'green', 2220);
INSERT INTO device VALUES (2223, 'flashing station', 'B', '26501467', '2013-06-02 09:18:19.136', false, 2219);
INSERT INTO component VALUES (2224, 'I', 'C', '98779334', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 07:10:42.745', 'H2', 'green', 2223);
INSERT INTO component VALUES (2225, 'A', 'A', '606778', 'Howard Joel Wolowitz', '2013-06-01 21:30:31.689', 'B6', 'green', 2223);
INSERT INTO location VALUES (2226, 'CB1', 'transmission test', 'Peter Merkel', 2218);
INSERT INTO device VALUES (2227, 'printer', 'E', '90398345', '2013-06-02 06:36:06.08', false, 2226);
INSERT INTO component VALUES (2228, 'A', 'H', '94715741', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 06:16:49.257', 'H2', 'yellow', 2227);
INSERT INTO component VALUES (2229, 'H', 'C', '80322287', 'Howard Joel Wolowitz', '2013-06-01 16:26:13.364', 'E6', 'green', 2227);
INSERT INTO device VALUES (2230, 'flashing station', 'H', '56430690', '2013-06-02 09:29:03.497', false, 2226);
INSERT INTO component VALUES (2231, 'E', 'E', '77446851', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 23:45:25.565', 'A4', 'green', 2230);
INSERT INTO component VALUES (2232, 'B', 'F', '63016104', 'Howard Joel Wolowitz', '2013-06-02 01:10:02.674', 'H6', 'green', 2230);
INSERT INTO line VALUES (2233, 'A2 PreSeries', 'Series 4', 54, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2217);
INSERT INTO location VALUES (2234, 'GF2', 'ABS test', 'Sarah Schulze', 2233);
INSERT INTO device VALUES (2235, 'flashing station', 'B', '25919783', '2013-06-02 00:35:35.868', false, 2234);
INSERT INTO component VALUES (2236, 'I', 'I', '62674942', 'Howard Joel Wolowitz', '2013-06-02 05:51:02.277', 'F7', 'green', 2235);
INSERT INTO component VALUES (2237, 'A', 'F', '28982796', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 18:14:28.9', 'C3', 'green', 2235);
INSERT INTO device VALUES (2238, 'handheld', 'H', '61392236', '2013-06-02 15:31:17.485', false, 2234);
INSERT INTO component VALUES (2239, 'H', 'B', '28892913', 'Howard Joel Wolowitz', '2013-06-02 05:37:04.43', 'F9', 'green', 2238);
INSERT INTO component VALUES (2240, 'I', 'D', '75098565', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 18:19:14.785', 'F5', 'green', 2238);
INSERT INTO location VALUES (2241, 'GD7', 'ABS test', 'Sarah Meier', 2233);
INSERT INTO device VALUES (2242, 'mobile station', 'I', '5123725', '2013-06-02 08:18:25.521', false, 2241);
INSERT INTO component VALUES (2243, 'D', 'B', '87300172', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:15:54.059', 'E6', 'green', 2242);
INSERT INTO component VALUES (2244, 'A', 'A', '38647144', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 08:52:24.281', 'I4', 'green', 2242);
INSERT INTO device VALUES (2245, 'handheld', 'E', '18137829', '2013-06-02 11:37:26.131', false, 2241);
INSERT INTO component VALUES (2246, 'F', 'A', '37643178', 'Howard Joel Wolowitz', '2013-06-02 00:52:50.943', 'A1', 'green', 2245);
INSERT INTO component VALUES (2247, 'C', 'E', '5775686', 'Howard Joel Wolowitz', '2013-06-02 09:29:27.02', 'I1', 'green', 2245);
INSERT INTO hall VALUES (2248, 'H9', 548, 7846, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO line VALUES (2249, 'H9 Assembly', 'Series 5', 42, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2248);
INSERT INTO location VALUES (2250, 'IA8', 'ABS test', 'Robert Merkel', 2249);
INSERT INTO device VALUES (2251, 'handheld', 'F', '28363231', '2013-06-02 00:17:44.88', true, 2250);
INSERT INTO component VALUES (2252, 'E', 'I', '38737375', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 16:00:15.721', 'E9', 'green', 2251);
INSERT INTO component VALUES (2253, 'I', 'G', '57486938', 'Howard Joel Wolowitz', '2013-06-01 19:59:42.569', 'I3', 'green', 2251);
INSERT INTO device VALUES (2254, 'printer', 'G', '77127903', '2013-06-02 11:07:17.327', false, 2250);
INSERT INTO component VALUES (2255, 'C', 'F', '80638081', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 11:44:47.748', 'F2', 'green', 2254);
INSERT INTO component VALUES (2256, 'I', 'G', '52386707', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 00:12:11.975', 'A5', 'green', 2254);
INSERT INTO location VALUES (2257, 'GG4', 'motor test', 'Franziska Meier', 2249);
INSERT INTO device VALUES (2258, 'printer', 'F', '4767598', '2013-06-02 09:57:42.936', false, 2257);
INSERT INTO component VALUES (2259, 'C', 'G', '66659085', 'Howard Joel Wolowitz', '2013-06-01 19:35:51.545', 'I7', 'green', 2258);
INSERT INTO component VALUES (2260, 'B', 'D', '91184761', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 14:27:28.771', 'B8', 'green', 2258);
INSERT INTO device VALUES (2261, 'handheld', 'D', '12467221', '2013-06-02 06:38:13.161', false, 2257);
INSERT INTO component VALUES (2262, 'E', 'E', '19031344', 'Howard Joel Wolowitz', '2013-06-02 08:37:49.242', 'B2', 'green', 2261);
INSERT INTO component VALUES (2263, 'E', 'H', '39544382', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 02:38:18.612', 'D6', 'green', 2261);
INSERT INTO line VALUES (2264, 'H9 PreSeries', 'Series 1', 83, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2248);
INSERT INTO location VALUES (2265, 'EF8', 'security test', 'Peter Meier', 2264);
INSERT INTO device VALUES (2266, 'printer', 'B', '5455153', '2013-06-02 11:31:33.294', false, 2265);
INSERT INTO component VALUES (2267, 'C', 'E', '35143495', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 18:58:29.011', 'I7', 'green', 2266);
INSERT INTO component VALUES (2268, 'E', 'B', '42535930', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 12:05:13.448', 'I9', 'green', 2266);
INSERT INTO device VALUES (2269, 'flashing station', 'I', '29262620', '2013-06-01 18:50:15.284', true, 2265);
INSERT INTO component VALUES (2270, 'H', 'A', '52531367', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 05:14:28.048', 'E8', 'green', 2269);
INSERT INTO component VALUES (2271, 'F', 'A', '8345724', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 03:31:09.539', 'F6', 'green', 2269);
INSERT INTO location VALUES (2272, 'EI8', 'transmission test', 'Franziska Merkel', 2264);
INSERT INTO device VALUES (2273, 'flashing station', 'B', '15529811', '2013-06-01 18:12:47.999', false, 2272);
INSERT INTO component VALUES (2274, 'E', 'D', '44094035', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 13:42:14.715', 'B9', 'green', 2273);
INSERT INTO component VALUES (2275, 'G', 'H', '75098761', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 01:26:04.878', 'G5', 'green', 2273);
INSERT INTO device VALUES (2276, 'flashing station', 'C', '99152565', '2013-06-02 06:03:30.951', false, 2272);
INSERT INTO component VALUES (2277, 'A', 'D', '85009027', 'Howard Joel Wolowitz', '2013-06-02 14:35:54.378', 'E8', 'red', 2276);
INSERT INTO component VALUES (2278, 'A', 'E', '5384279', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 04:37:56.595', 'E5', 'green', 2276);
INSERT INTO hall VALUES (2279, 'C3', 700, 7999, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO line VALUES (2280, 'C3 Assembly', 'Series 3', 97, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2279);
INSERT INTO location VALUES (2281, 'DF9', 'multimedia test', 'Hans Merkel', 2280);
INSERT INTO device VALUES (2282, 'flashing station', 'H', '3052519', '2013-06-02 07:07:37.996', false, 2281);
INSERT INTO component VALUES (2283, 'E', 'C', '23443254', 'Howard Joel Wolowitz', '2013-06-01 22:56:04.535', 'D8', 'green', 2282);
INSERT INTO component VALUES (2284, 'A', 'D', '21962931', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 08:07:08.191', 'I4', 'green', 2282);
INSERT INTO device VALUES (2285, 'handheld', 'E', '31523793', '2013-06-02 05:11:09.913', false, 2281);
INSERT INTO component VALUES (2286, 'C', 'C', '28915072', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 15:10:20.939', 'G8', 'red', 2285);
INSERT INTO component VALUES (2287, 'H', 'C', '72364645', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:24:09.053', 'I1', 'green', 2285);
INSERT INTO location VALUES (2288, 'II1', 'security test', 'Hans Merkel', 2280);
INSERT INTO device VALUES (2289, 'mobile station', 'E', '35525279', '2013-06-01 20:55:17.259', false, 2288);
INSERT INTO component VALUES (2290, 'F', 'C', '88687949', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 04:25:53.247', 'D8', 'green', 2289);
INSERT INTO component VALUES (2291, 'D', 'B', '34469289', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 04:04:16.288', 'I3', 'green', 2289);
INSERT INTO device VALUES (2292, 'handheld', 'E', '10335566', '2013-06-02 12:01:32.928', false, 2288);
INSERT INTO component VALUES (2293, 'B', 'F', '15035455', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 16:53:35.548', 'F2', 'green', 2292);
INSERT INTO component VALUES (2294, 'E', 'I', '28752341', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:29:55.983', 'E6', 'green', 2292);
INSERT INTO line VALUES (2295, 'C3 PreSeries', 'Series 7', 72, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2279);
INSERT INTO location VALUES (2296, 'GE7', 'security test', 'Peter Mueller', 2295);
INSERT INTO device VALUES (2297, 'mobile station', 'G', '44395664', '2013-06-02 02:15:45.048', false, 2296);
INSERT INTO component VALUES (2298, 'A', 'E', '32547495', 'Howard Joel Wolowitz', '2013-06-01 23:29:10.521', 'A8', 'green', 2297);
INSERT INTO component VALUES (2299, 'D', 'H', '8895320', 'Howard Joel Wolowitz', '2013-06-01 17:11:17.86', 'H7', 'green', 2297);
INSERT INTO device VALUES (2300, 'printer', 'E', '16171098', '2013-06-02 11:41:54.155', false, 2296);
INSERT INTO component VALUES (2301, 'H', 'D', '23464094', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:57:20.94', 'G3', 'green', 2300);
INSERT INTO component VALUES (2302, 'G', 'B', '55838625', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 15:23:16.831', 'F6', 'green', 2300);
INSERT INTO location VALUES (2303, 'EF6', 'security test', 'Peter Meier', 2295);
INSERT INTO device VALUES (2304, 'flashing station', 'B', '28976730', '2013-06-01 17:26:44.011', false, 2303);
INSERT INTO component VALUES (2305, 'A', 'C', '56555238', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 16:31:12.496', 'B3', 'green', 2304);
INSERT INTO component VALUES (2306, 'B', 'G', '8286490', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 04:58:45.986', 'F5', 'green', 2304);
INSERT INTO device VALUES (2307, 'handheld', 'A', '34703333', '2013-06-01 16:09:12.7', false, 2303);
INSERT INTO component VALUES (2308, 'F', 'G', '1716655', 'Howard Joel Wolowitz', '2013-06-01 17:57:23.621', 'D7', 'green', 2307);
INSERT INTO component VALUES (2309, 'G', 'B', '71811732', 'Howard Joel Wolowitz', '2013-06-02 13:43:54.231', 'I3', 'green', 2307);
INSERT INTO hall VALUES (2310, 'D6', 486, 3020, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO line VALUES (2311, 'D6 Assembly', 'Series 8', 85, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2310);
INSERT INTO location VALUES (2312, 'EA6', 'security test', 'Peter Mueller', 2311);
INSERT INTO device VALUES (2313, 'mobile station', 'E', '48530569', '2013-06-01 17:08:57.77', false, 2312);
INSERT INTO component VALUES (2314, 'A', 'B', '97746081', 'Howard Joel Wolowitz', '2013-06-02 14:17:31.852', 'H9', 'green', 2313);
INSERT INTO component VALUES (2315, 'F', 'G', '1532672', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 03:40:41.592', 'B6', 'green', 2313);
INSERT INTO device VALUES (2316, 'handheld', 'D', '71980922', '2013-06-01 16:12:14.197', false, 2312);
INSERT INTO component VALUES (2317, 'B', 'G', '64297464', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 06:30:36.392', 'D6', 'green', 2316);
INSERT INTO component VALUES (2318, 'C', 'B', '75995747', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 07:48:22.688', 'C7', 'green', 2316);
INSERT INTO location VALUES (2319, 'CE5', 'transmission test', 'Hans Mueller', 2311);
INSERT INTO device VALUES (2320, 'flashing station', 'G', '73877162', '2013-06-02 09:32:51.0', false, 2319);
INSERT INTO component VALUES (2321, 'C', 'B', '33059456', 'Howard Joel Wolowitz', '2013-06-02 04:10:24.001', 'D8', 'green', 2320);
INSERT INTO component VALUES (2322, 'F', 'I', '19875866', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 03:29:19.783', 'B8', 'green', 2320);
INSERT INTO device VALUES (2323, 'flashing station', 'E', '65869122', '2013-06-02 14:53:32.073', false, 2319);
INSERT INTO component VALUES (2324, 'C', 'D', '36331271', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 16:09:33.759', 'H7', 'green', 2323);
INSERT INTO component VALUES (2325, 'G', 'B', '30893151', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 03:08:00.812', 'G4', 'green', 2323);
INSERT INTO line VALUES (2326, 'D6 PreSeries', 'Series 7', 95, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2310);
INSERT INTO location VALUES (2327, 'CC4', 'motor test', 'Sarah Meier', 2326);
INSERT INTO device VALUES (2328, 'flashing station', 'B', '27075783', '2013-06-02 08:45:43.197', false, 2327);
INSERT INTO component VALUES (2329, 'D', 'H', '13585544', 'Howard Joel Wolowitz', '2013-06-01 19:22:06.222', 'A3', 'green', 2328);
INSERT INTO component VALUES (2330, 'D', 'E', '59212392', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 11:23:41.724', 'A6', 'green', 2328);
INSERT INTO device VALUES (2331, 'printer', 'H', '84313665', '2013-06-02 08:49:42.591', false, 2327);
INSERT INTO component VALUES (2332, 'B', 'E', '47851663', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 09:27:23.882', 'C8', 'red', 2331);
INSERT INTO component VALUES (2333, 'B', 'H', '7336636', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 16:11:46.498', 'A1', 'green', 2331);
INSERT INTO location VALUES (2334, 'CA6', 'motor test', 'Sarah Meier', 2326);
INSERT INTO device VALUES (2335, 'flashing station', 'A', '57470008', '2013-06-02 11:17:59.494', true, 2334);
INSERT INTO component VALUES (2336, 'H', 'B', '55984374', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 14:10:07.671', 'F9', 'green', 2335);
INSERT INTO component VALUES (2337, 'C', 'G', '53886627', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 15:41:43.399', 'B4', 'green', 2335);
INSERT INTO device VALUES (2338, 'flashing station', 'E', '99882248', '2013-06-01 20:01:25.115', false, 2334);
INSERT INTO component VALUES (2339, 'D', 'G', '13605559', 'Howard Joel Wolowitz', '2013-06-02 11:21:42.717', 'G4', 'green', 2338);
INSERT INTO component VALUES (2340, 'E', 'H', '24543926', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 21:04:05.373', 'G7', 'green', 2338);
INSERT INTO hall VALUES (2341, 'C5', 149, 3411, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO line VALUES (2342, 'C5 Assembly', 'Series 6', 45, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2341);
INSERT INTO location VALUES (2343, 'II3', 'motor test', 'Franziska Schmitt', 2342);
INSERT INTO device VALUES (2344, 'mobile station', 'E', '48086374', '2013-06-02 02:15:20.392', false, 2343);
INSERT INTO component VALUES (2345, 'E', 'D', '12693894', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 14:58:44.294', 'B4', 'green', 2344);
INSERT INTO component VALUES (2346, 'C', 'D', '64758277', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 17:03:40.874', 'F4', 'yellow', 2344);
INSERT INTO device VALUES (2347, 'flashing station', 'E', '307286', '2013-06-02 06:18:52.67', false, 2343);
INSERT INTO component VALUES (2348, 'H', 'A', '50399993', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 23:29:54.467', 'F9', 'green', 2347);
INSERT INTO component VALUES (2349, 'H', 'F', '77174970', 'Howard Joel Wolowitz', '2013-06-01 20:28:53.935', 'E1', 'green', 2347);
INSERT INTO location VALUES (2350, 'IA9', 'transmission test', 'Franziska Mueller', 2342);
INSERT INTO device VALUES (2351, 'flashing station', 'A', '92050934', '2013-06-02 00:17:48.642', false, 2350);
INSERT INTO component VALUES (2352, 'G', 'C', '59027793', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 22:21:01.257', 'B3', 'green', 2351);
INSERT INTO component VALUES (2353, 'H', 'I', '1487559', 'Howard Joel Wolowitz', '2013-06-02 14:13:13.867', 'A4', 'green', 2351);
INSERT INTO device VALUES (2354, 'flashing station', 'B', '34159120', '2013-06-02 11:09:56.229', true, 2350);
INSERT INTO component VALUES (2355, 'D', 'E', '94073915', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 01:09:42.768', 'C1', 'green', 2354);
INSERT INTO component VALUES (2356, 'I', 'F', '51579458', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 18:19:54.637', 'D9', 'green', 2354);
INSERT INTO line VALUES (2357, 'C5 PreSeries', 'Series 2', 5, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2341);
INSERT INTO location VALUES (2358, 'EG2', 'motor test', 'Franziska Merkel', 2357);
INSERT INTO device VALUES (2359, 'mobile station', 'G', '72525429', '2013-06-01 15:46:05.101', false, 2358);
INSERT INTO component VALUES (2360, 'A', 'E', '90425925', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 04:06:34.692', 'C7', 'green', 2359);
INSERT INTO component VALUES (2361, 'A', 'I', '14376113', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 05:53:10.326', 'B2', 'green', 2359);
INSERT INTO device VALUES (2362, 'handheld', 'C', '24096023', '2013-06-01 18:01:18.972', false, 2358);
INSERT INTO component VALUES (2363, 'D', 'D', '41662065', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 10:58:34.381', 'B4', 'red', 2362);
INSERT INTO component VALUES (2364, 'H', 'B', '22771080', 'Howard Joel Wolowitz', '2013-06-01 17:45:39.605', 'C7', 'green', 2362);
INSERT INTO location VALUES (2365, 'FH9', 'multimedia test', 'Peter Mueller', 2357);
INSERT INTO device VALUES (2366, 'printer', 'A', '33481619', '2013-06-02 06:43:58.486', false, 2365);
INSERT INTO component VALUES (2367, 'C', 'D', '52926666', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 15:11:14.935', 'A6', 'green', 2366);
INSERT INTO component VALUES (2368, 'F', 'F', '49185381', 'Howard Joel Wolowitz', '2013-06-02 08:25:25.087', 'F4', 'green', 2366);
INSERT INTO device VALUES (2369, 'handheld', 'F', '26321936', '2013-06-02 12:28:18.248', false, 2365);
INSERT INTO component VALUES (2370, 'H', 'F', '96678912', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 18:43:07.585', 'A9', 'green', 2369);
INSERT INTO component VALUES (2371, 'A', 'F', '83481415', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 20:18:59.287', 'E4', 'green', 2369);
INSERT INTO hall VALUES (2372, 'G2', 190, 1086, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO line VALUES (2373, 'G2 Assembly', 'Series 6', 7, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2372);
INSERT INTO location VALUES (2374, 'IE9', 'transmission test', 'Franziska Merkel', 2373);
INSERT INTO device VALUES (2375, 'handheld', 'G', '5667245', '2013-06-02 05:16:26.614', false, 2374);
INSERT INTO component VALUES (2376, 'D', 'H', '24579966', 'Howard Joel Wolowitz', '2013-06-01 20:37:21.784', 'E1', 'green', 2375);
INSERT INTO component VALUES (2377, 'B', 'H', '63054067', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 00:25:05.115', 'G1', 'red', 2375);
INSERT INTO device VALUES (2378, 'flashing station', 'I', '19928518', '2013-06-01 19:00:40.362', false, 2374);
INSERT INTO component VALUES (2379, 'D', 'B', '37804879', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 08:41:28.543', 'I8', 'green', 2378);
INSERT INTO component VALUES (2380, 'H', 'H', '42335604', 'Howard Joel Wolowitz', '2013-06-02 05:57:11.238', 'F4', 'green', 2378);
INSERT INTO location VALUES (2381, 'GB7', 'transmission test', 'Hans Schulze', 2373);
INSERT INTO device VALUES (2382, 'flashing station', 'B', '58136873', '2013-06-02 11:54:19.093', false, 2381);
INSERT INTO component VALUES (2383, 'E', 'C', '77709308', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 17:17:16.541', 'F4', 'green', 2382);
INSERT INTO component VALUES (2384, 'G', 'C', '87850466', 'Howard Joel Wolowitz', '2013-06-01 17:15:34.54', 'D1', 'green', 2382);
INSERT INTO device VALUES (2385, 'flashing station', 'D', '17071108', '2013-06-01 19:55:22.369', false, 2381);
INSERT INTO component VALUES (2386, 'B', 'F', '55836192', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 01:14:10.421', 'G3', 'green', 2385);
INSERT INTO component VALUES (2387, 'F', 'I', '78757879', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 02:32:38.234', 'I8', 'green', 2385);
INSERT INTO line VALUES (2388, 'G2 PreSeries', 'Series 6', 36, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2372);
INSERT INTO location VALUES (2389, 'HF2', 'motor test', 'Hans Schmitt', 2388);
INSERT INTO device VALUES (2390, 'printer', 'G', '88470836', '2013-06-02 01:51:45.877', false, 2389);
INSERT INTO component VALUES (2391, 'F', 'H', '19450622', 'Howard Joel Wolowitz', '2013-06-02 11:46:50.519', 'G6', 'green', 2390);
INSERT INTO component VALUES (2392, 'B', 'F', '24096835', 'Howard Joel Wolowitz', '2013-06-02 01:01:15.86', 'C2', 'red', 2390);
INSERT INTO device VALUES (2393, 'mobile station', 'I', '85185216', '2013-06-02 03:30:57.139', false, 2389);
INSERT INTO component VALUES (2394, 'B', 'F', '82059262', 'Howard Joel Wolowitz', '2013-06-02 14:55:56.617', 'B7', 'green', 2393);
INSERT INTO component VALUES (2395, 'E', 'F', '47598622', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 20:07:02.761', 'D5', 'green', 2393);
INSERT INTO location VALUES (2396, 'GA8', 'security test', 'Robert Schmitt', 2388);
INSERT INTO device VALUES (2397, 'printer', 'A', '68858064', '2013-06-02 14:45:11.982', false, 2396);
INSERT INTO component VALUES (2398, 'B', 'D', '43565413', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 17:55:21.66', 'E5', 'green', 2397);
INSERT INTO component VALUES (2399, 'E', 'H', '2343373', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 20:28:18.799', 'E7', 'green', 2397);
INSERT INTO device VALUES (2400, 'flashing station', 'I', '15498149', '2013-06-01 16:38:15.456', false, 2396);
INSERT INTO component VALUES (2401, 'G', 'D', '2735277', 'Howard Joel Wolowitz', '2013-06-01 15:39:52.371', 'B7', 'green', 2400);
INSERT INTO component VALUES (2402, 'I', 'A', '28067246', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 16:07:04.809', 'G7', 'green', 2400);
INSERT INTO hall VALUES (2403, 'B1', 261, 829, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO line VALUES (2404, 'B1 Assembly', 'Series 3', 20, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2403);
INSERT INTO location VALUES (2405, 'AC9', 'multimedia test', 'Peter Merkel', 2404);
INSERT INTO device VALUES (2406, 'flashing station', 'F', '97413860', '2013-06-02 10:09:33.434', false, 2405);
INSERT INTO component VALUES (2407, 'F', 'H', '52947563', 'Howard Joel Wolowitz', '2013-06-02 06:43:48.629', 'H7', 'green', 2406);
INSERT INTO component VALUES (2408, 'H', 'B', '70624905', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 20:31:24.804', 'E6', 'green', 2406);
INSERT INTO device VALUES (2409, 'printer', 'C', '46504969', '2013-06-02 12:27:54.655', false, 2405);
INSERT INTO component VALUES (2410, 'I', 'E', '8492379', 'Howard Joel Wolowitz', '2013-06-01 23:59:34.195', 'G9', 'green', 2409);
INSERT INTO component VALUES (2411, 'D', 'E', '57438393', 'Howard Joel Wolowitz', '2013-06-01 15:41:59.001', 'G2', 'green', 2409);
INSERT INTO location VALUES (2412, 'HF7', 'transmission test', 'Franziska Schmitt', 2404);
INSERT INTO device VALUES (2413, 'printer', 'H', '88819190', '2013-06-02 02:26:00.016', false, 2412);
INSERT INTO component VALUES (2414, 'I', 'C', '51713259', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 18:55:44.162', 'D3', 'green', 2413);
INSERT INTO component VALUES (2415, 'B', 'I', '99319295', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 16:25:32.271', 'G8', 'red', 2413);
INSERT INTO device VALUES (2416, 'handheld', 'I', '46152055', '2013-06-02 00:00:16.274', false, 2412);
INSERT INTO component VALUES (2417, 'I', 'A', '34008856', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 08:57:35.375', 'A6', 'green', 2416);
INSERT INTO component VALUES (2418, 'F', 'B', '44449119', 'Howard Joel Wolowitz', '2013-06-02 10:17:37.836', 'E9', 'green', 2416);
INSERT INTO line VALUES (2419, 'B1 PreSeries', 'Series 9', 16, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2403);
INSERT INTO location VALUES (2420, 'GE7', 'motor test', 'Robert Meier', 2419);
INSERT INTO device VALUES (2421, 'handheld', 'C', '50726031', '2013-06-01 16:40:33.385', false, 2420);
INSERT INTO component VALUES (2422, 'H', 'A', '14264966', 'Howard Joel Wolowitz', '2013-06-02 13:16:03.639', 'G5', 'yellow', 2421);
INSERT INTO component VALUES (2423, 'E', 'I', '40755804', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 16:20:41.155', 'G3', 'green', 2421);
INSERT INTO device VALUES (2424, 'mobile station', 'B', '70451903', '2013-06-01 16:31:14.507', false, 2420);
INSERT INTO component VALUES (2425, 'F', 'A', '18557356', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 19:43:53.938', 'A3', 'green', 2424);
INSERT INTO component VALUES (2426, 'I', 'H', '420296', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 15:20:44.99', 'H1', 'green', 2424);
INSERT INTO location VALUES (2427, 'FB9', 'ABS test', 'Sarah Schmitt', 2419);
INSERT INTO device VALUES (2428, 'flashing station', 'E', '10994079', '2013-06-02 01:43:09.329', false, 2427);
INSERT INTO component VALUES (2429, 'A', 'F', '35256040', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 05:09:48.643', 'I5', 'green', 2428);
INSERT INTO component VALUES (2430, 'F', 'B', '73300817', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:20:02.206', 'F1', 'green', 2428);
INSERT INTO device VALUES (2431, 'mobile station', 'A', '86798005', '2013-06-02 11:33:12.911', false, 2427);
INSERT INTO component VALUES (2432, 'B', 'H', '41640938', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 10:42:38.34', 'C8', 'green', 2431);
INSERT INTO component VALUES (2433, 'C', 'F', '25555387', 'Howard Joel Wolowitz', '2013-06-02 07:33:28.588', 'E7', 'green', 2431);
INSERT INTO hall VALUES (2434, 'G2', 879, 8977, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO line VALUES (2435, 'G2 Assembly', 'Series 8', 85, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2434);
INSERT INTO location VALUES (2436, 'BE6', 'motor test', 'Sarah Mueller', 2435);
INSERT INTO device VALUES (2437, 'mobile station', 'G', '64210917', '2013-06-02 02:35:28.264', false, 2436);
INSERT INTO component VALUES (2438, 'I', 'A', '51485332', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 05:14:47.059', 'I1', 'green', 2437);
INSERT INTO component VALUES (2439, 'C', 'G', '49795194', 'Howard Joel Wolowitz', '2013-06-01 16:02:54.764', 'G3', 'green', 2437);
INSERT INTO device VALUES (2440, 'handheld', 'B', '97064394', '2013-06-01 18:15:27.588', false, 2436);
INSERT INTO component VALUES (2441, 'A', 'I', '70661958', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 19:36:00.876', 'B8', 'green', 2440);
INSERT INTO component VALUES (2442, 'I', 'F', '57851304', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 07:03:28.636', 'D7', 'yellow', 2440);
INSERT INTO location VALUES (2443, 'GE1', 'motor test', 'Sarah Meier', 2435);
INSERT INTO device VALUES (2444, 'mobile station', 'G', '89997972', '2013-06-01 23:28:04.673', false, 2443);
INSERT INTO component VALUES (2445, 'B', 'B', '79538172', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 19:48:32.433', 'I9', 'green', 2444);
INSERT INTO component VALUES (2446, 'D', 'B', '22668569', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 20:51:47.59', 'C2', 'green', 2444);
INSERT INTO device VALUES (2447, 'flashing station', 'G', '90928078', '2013-06-02 14:47:12.511', false, 2443);
INSERT INTO component VALUES (2448, 'F', 'F', '96466496', 'Howard Joel Wolowitz', '2013-06-02 09:56:51.442', 'C3', 'green', 2447);
INSERT INTO component VALUES (2449, 'F', 'E', '21253697', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 21:44:53.865', 'H6', 'green', 2447);
INSERT INTO line VALUES (2450, 'G2 PreSeries', 'Series 6', 16, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2434);
INSERT INTO location VALUES (2451, 'BI8', 'multimedia test', 'Hans Schmitt', 2450);
INSERT INTO device VALUES (2452, 'handheld', 'C', '57974935', '2013-06-02 14:15:05.686', false, 2451);
INSERT INTO component VALUES (2453, 'C', 'I', '30972892', 'Howard Joel Wolowitz', '2013-06-02 01:39:41.209', 'E4', 'green', 2452);
INSERT INTO component VALUES (2454, 'C', 'I', '78020259', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 14:45:05.9', 'C9', 'green', 2452);
INSERT INTO device VALUES (2455, 'printer', 'D', '42803230', '2013-06-02 00:54:22.66', false, 2451);
INSERT INTO component VALUES (2456, 'H', 'A', '93940395', 'Howard Joel Wolowitz', '2013-06-01 16:43:43.824', 'H9', 'green', 2455);
INSERT INTO component VALUES (2457, 'B', 'C', '82866139', 'Howard Joel Wolowitz', '2013-06-01 20:33:17.072', 'A2', 'green', 2455);
INSERT INTO location VALUES (2458, 'II5', 'motor test', 'Robert Schulze', 2450);
INSERT INTO device VALUES (2459, 'handheld', 'I', '46271968', '2013-06-01 17:32:32.11', false, 2458);
INSERT INTO component VALUES (2460, 'D', 'B', '41200780', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 16:40:53.379', 'B7', 'green', 2459);
INSERT INTO component VALUES (2461, 'I', 'A', '36323279', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 07:18:55.538', 'H4', 'green', 2459);
INSERT INTO device VALUES (2462, 'flashing station', 'B', '10353841', '2013-06-02 03:36:21.616', false, 2458);
INSERT INTO component VALUES (2463, 'I', 'D', '70242878', 'Howard Joel Wolowitz', '2013-06-02 03:17:25.263', 'I8', 'green', 2462);
INSERT INTO component VALUES (2464, 'H', 'H', '78419786', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 13:32:55.882', 'F7', 'green', 2462);
INSERT INTO hall VALUES (2465, 'F1', 450, 4332, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO line VALUES (2466, 'F1 Assembly', 'Series 6', 4, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2465);
INSERT INTO location VALUES (2467, 'GE2', 'motor test', 'Robert Schulze', 2466);
INSERT INTO device VALUES (2468, 'mobile station', 'G', '95253414', '2013-06-01 16:58:45.681', false, 2467);
INSERT INTO component VALUES (2469, 'C', 'G', '41813303', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 20:31:13.34', 'B7', 'green', 2468);
INSERT INTO component VALUES (2470, 'A', 'B', '91728465', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 15:14:09.644', 'F7', 'yellow', 2468);
INSERT INTO device VALUES (2471, 'flashing station', 'C', '7650261', '2013-06-02 13:31:00.715', false, 2467);
INSERT INTO component VALUES (2472, 'D', 'A', '53944062', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 09:21:06.158', 'C4', 'green', 2471);
INSERT INTO component VALUES (2473, 'G', 'C', '71119908', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 10:31:52.175', 'I9', 'green', 2471);
INSERT INTO location VALUES (2474, 'EC8', 'transmission test', 'Franziska Schmitt', 2466);
INSERT INTO device VALUES (2475, 'printer', 'H', '35301748', '2013-06-01 19:28:51.317', false, 2474);
INSERT INTO component VALUES (2476, 'G', 'I', '14733823', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 12:11:17.436', 'A7', 'green', 2475);
INSERT INTO component VALUES (2477, 'H', 'D', '12969458', 'Howard Joel Wolowitz', '2013-06-02 02:41:49.227', 'G6', 'green', 2475);
INSERT INTO device VALUES (2478, 'mobile station', 'I', '42592798', '2013-06-02 09:06:36.93', false, 2474);
INSERT INTO component VALUES (2479, 'B', 'I', '49499071', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 05:48:14.466', 'G1', 'green', 2478);
INSERT INTO component VALUES (2480, 'C', 'A', '3623317', 'Howard Joel Wolowitz', '2013-06-02 14:26:32.175', 'A8', 'green', 2478);
INSERT INTO line VALUES (2481, 'F1 PreSeries', 'Series 8', 5, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2465);
INSERT INTO location VALUES (2482, 'CC2', 'motor test', 'Robert Schulze', 2481);
INSERT INTO device VALUES (2483, 'flashing station', 'A', '11944103', '2013-06-02 06:34:11.059', false, 2482);
INSERT INTO component VALUES (2484, 'H', 'D', '75717848', 'Howard Joel Wolowitz', '2013-06-02 10:48:11.96', 'H5', 'green', 2483);
INSERT INTO component VALUES (2485, 'F', 'F', '4224172', 'Howard Joel Wolowitz', '2013-06-01 20:48:15.401', 'D5', 'green', 2483);
INSERT INTO device VALUES (2486, 'handheld', 'C', '94906346', '2013-06-02 06:02:40.487', false, 2482);
INSERT INTO component VALUES (2487, 'C', 'E', '24947796', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 04:20:35.4', 'D8', 'green', 2486);
INSERT INTO component VALUES (2488, 'A', 'D', '61745470', 'Howard Joel Wolowitz', '2013-06-02 08:01:13.428', 'H7', 'green', 2486);
INSERT INTO location VALUES (2489, 'DF9', 'multimedia test', 'Sarah Meier', 2481);
INSERT INTO device VALUES (2490, 'printer', 'A', '766550', '2013-06-02 08:47:50.547', false, 2489);
INSERT INTO component VALUES (2491, 'A', 'C', '94263987', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 23:40:35.834', 'F9', 'green', 2490);
INSERT INTO component VALUES (2492, 'E', 'E', '74188082', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 12:03:56.736', 'A7', 'green', 2490);
INSERT INTO device VALUES (2493, 'flashing station', 'B', '74642711', '2013-06-02 13:54:11.929', false, 2489);
INSERT INTO component VALUES (2494, 'H', 'C', '37922355', 'Howard Joel Wolowitz', '2013-06-01 22:42:45.319', 'C9', 'green', 2493);
INSERT INTO component VALUES (2495, 'F', 'E', '40904050', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 08:07:13.802', 'D3', 'green', 2493);
INSERT INTO hall VALUES (2496, 'I5', 116, 6295, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO line VALUES (2497, 'I5 Assembly', 'Series 4', 40, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2496);
INSERT INTO location VALUES (2498, 'HE5', 'ABS test', 'Peter Merkel', 2497);
INSERT INTO device VALUES (2499, 'handheld', 'B', '52628562', '2013-06-02 13:52:26.591', false, 2498);
INSERT INTO component VALUES (2500, 'D', 'A', '60159541', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 12:40:36.327', 'F7', 'green', 2499);
INSERT INTO component VALUES (2501, 'G', 'D', '82537617', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 09:59:01.841', 'G1', 'green', 2499);
INSERT INTO device VALUES (2502, 'flashing station', 'C', '29485694', '2013-06-01 22:27:42.407', false, 2498);
INSERT INTO component VALUES (2503, 'A', 'I', '55002558', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 16:28:52.4', 'C5', 'green', 2502);
INSERT INTO component VALUES (2504, 'A', 'H', '22628390', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 16:30:18.319', 'I2', 'green', 2502);
INSERT INTO location VALUES (2505, 'AC4', 'security test', 'Franziska Schulze', 2497);
INSERT INTO device VALUES (2506, 'mobile station', 'G', '32490702', '2013-06-02 04:20:35.02', false, 2505);
INSERT INTO component VALUES (2507, 'G', 'D', '69828863', 'Howard Joel Wolowitz', '2013-06-02 15:20:19.225', 'D3', 'green', 2506);
INSERT INTO component VALUES (2508, 'B', 'B', '92732237', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 09:50:34.698', 'G5', 'green', 2506);
INSERT INTO device VALUES (2509, 'flashing station', 'G', '23086323', '2013-06-02 02:21:51.638', false, 2505);
INSERT INTO component VALUES (2510, 'I', 'C', '43009036', 'Dr. Leonard Leakey Hofstadter', '2013-06-01 18:13:51.666', 'A3', 'green', 2509);
INSERT INTO component VALUES (2511, 'I', 'F', '23897850', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 13:09:37.778', 'F9', 'red', 2509);
INSERT INTO line VALUES (2512, 'I5 PreSeries', 'Series 1', 48, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2496);
INSERT INTO location VALUES (2513, 'FA8', 'motor test', 'Sarah Merkel', 2512);
INSERT INTO device VALUES (2514, 'flashing station', 'E', '72966059', '2013-06-01 21:13:30.462', false, 2513);
INSERT INTO component VALUES (2515, 'H', 'D', '84489307', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 06:59:13.054', 'D7', 'green', 2514);
INSERT INTO component VALUES (2516, 'F', 'D', '20514613', 'Howard Joel Wolowitz', '2013-06-02 13:12:31.791', 'F7', 'green', 2514);
INSERT INTO device VALUES (2517, 'mobile station', 'G', '31802544', '2013-06-02 02:48:29.754', false, 2513);
INSERT INTO component VALUES (2518, 'A', 'B', '92725398', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 10:19:49.395', 'I5', 'green', 2517);
INSERT INTO component VALUES (2519, 'G', 'B', '73462769', 'Howard Joel Wolowitz', '2013-06-02 08:28:56.451', 'H4', 'green', 2517);
INSERT INTO location VALUES (2520, 'GD4', 'transmission test', 'Franziska Mueller', 2512);
INSERT INTO device VALUES (2521, 'mobile station', 'D', '88215748', '2013-06-02 00:44:22.368', false, 2520);
INSERT INTO component VALUES (2522, 'D', 'C', '29928066', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 01:07:46.687', 'B7', 'red', 2521);
INSERT INTO component VALUES (2523, 'F', 'C', '54011335', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 20:00:59.073', 'A8', 'green', 2521);
INSERT INTO device VALUES (2524, 'handheld', 'C', '38851491', '2013-06-01 17:33:00.558', false, 2520);
INSERT INTO component VALUES (2525, 'B', 'C', '38789119', 'Howard Joel Wolowitz', '2013-06-01 20:01:19.464', 'E1', 'green', 2524);
INSERT INTO component VALUES (2526, 'I', 'I', '54711760', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 17:36:57.071', 'E1', 'green', 2524);
INSERT INTO hall VALUES (2527, 'A5', 915, 5232, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO line VALUES (2528, 'A5 Assembly', 'Series 3', 92, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2527);
INSERT INTO location VALUES (2529, 'ID4', 'ABS test', 'Peter Schmitt', 2528);
INSERT INTO device VALUES (2530, 'printer', 'G', '86913322', '2013-06-02 07:46:59.942', false, 2529);
INSERT INTO component VALUES (2531, 'B', 'F', '66927392', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 08:23:38.548', 'H4', 'green', 2530);
INSERT INTO component VALUES (2532, 'C', 'A', '44785769', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 02:20:01.959', 'H1', 'green', 2530);
INSERT INTO device VALUES (2533, 'mobile station', 'C', '53653049', '2013-06-02 03:21:07.682', false, 2529);
INSERT INTO component VALUES (2534, 'D', 'D', '83527758', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-01 17:46:45.958', 'C3', 'green', 2533);
INSERT INTO component VALUES (2535, 'I', 'F', '54151192', 'Dr. Leonard Leakey Hofstadter', '2013-06-02 01:22:11.02', 'G1', 'green', 2533);
INSERT INTO location VALUES (2536, 'HA1', 'multimedia test', 'Hans Schmitt', 2528);
INSERT INTO device VALUES (2537, 'mobile station', 'G', '27750477', '2013-06-02 02:59:42.037', false, 2536);
INSERT INTO component VALUES (2538, 'E', 'G', '55024043', 'Howard Joel Wolowitz', '2013-06-02 08:59:20.565', 'E2', 'green', 2537);
INSERT INTO component VALUES (2539, 'H', 'G', '98314360', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 13:58:33.413', 'D9', 'green', 2537);
INSERT INTO device VALUES (2540, 'mobile station', 'F', '69564846', '2013-06-02 13:43:42.477', false, 2536);
INSERT INTO component VALUES (2541, 'H', 'G', '47974122', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 14:17:33.498', 'E7', 'green', 2540);
INSERT INTO component VALUES (2542, 'F', 'E', '53107950', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-02 09:58:31.067', 'D5', 'green', 2540);
INSERT INTO line VALUES (2543, 'A5 PreSeries', 'Series 4', 1, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2527);
INSERT INTO location VALUES (2544, 'IH6', 'ABS test', 'Robert Meier', 2543);
INSERT INTO device VALUES (2545, 'flashing station', 'F', '40933300', '2013-06-01 19:15:42.509', true, 2544);
INSERT INTO component VALUES (2546, 'G', 'A', '25194903', 'Howard Joel Wolowitz', '2013-06-02 01:48:59.431', 'G4', 'green', 2545);
INSERT INTO component VALUES (2547, 'C', 'C', '73763733', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 11:26:47.761', 'D9', 'green', 2545);
INSERT INTO device VALUES (2548, 'handheld', 'A', '16412009', '2013-06-02 10:43:33.231', false, 2544);
INSERT INTO component VALUES (2549, 'F', 'B', '93042131', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 14:12:40.614', 'B8', 'green', 2548);
INSERT INTO component VALUES (2550, 'C', 'F', '699218', 'Howard Joel Wolowitz', '2013-06-02 15:35:43.364', 'C9', 'green', 2548);
INSERT INTO location VALUES (2551, 'AA2', 'transmission test', 'Franziska Schulze', 2543);
INSERT INTO device VALUES (2552, 'mobile station', 'G', '55256799', '2013-06-02 12:13:34.202', false, 2551);
INSERT INTO component VALUES (2553, 'C', 'G', '88390025', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-01 18:03:38.105', 'B4', 'green', 2552);
INSERT INTO component VALUES (2554, 'H', 'B', '34715581', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 11:43:31.289', 'E5', 'green', 2552);
INSERT INTO device VALUES (2555, 'mobile station', 'I', '20007625', '2013-06-02 14:49:40.082', false, 2551);
INSERT INTO component VALUES (2556, 'F', 'F', '20516260', 'Howard Joel Wolowitz', '2013-06-02 08:45:56.326', 'D2', 'red', 2555);
INSERT INTO component VALUES (2557, 'I', 'G', '53837395', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-02 07:47:36.293', 'F7', 'green', 2555);
