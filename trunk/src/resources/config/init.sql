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
    path character varying(5000),
    parent integer
);
CREATE TABLE location (
    id integer ,
    name character varying(50),
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

INSERT INTO line VALUES (2001, 'C8 Assembly', 'Series 3', 43, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2000);
INSERT INTO location VALUES (2002, 'HE6', 2001);
INSERT INTO device VALUES (2003, 'D3', 'H', '37556299', '2013-05-28 22:46:52.352', false, 2002);
INSERT INTO component VALUES (2004, 'C', 'E7', '97749262', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:36:24.656', 'D', 2003);
INSERT INTO component VALUES (2005, 'G', 'B8', '72500676', 'Howard Joel Wolowitz', '2013-05-28 15:11:44.603', 'F', 2003);
INSERT INTO device VALUES (2006, 'F7', 'H', '39983079', '2013-05-28 03:23:23.831', true, 2002);
INSERT INTO component VALUES (2007, 'D', 'I3', '93158415', 'Howard Joel Wolowitz', '2013-05-28 16:20:44.104', 'C', 2006);
INSERT INTO component VALUES (2008, 'D', 'A6', '69678806', 'Howard Joel Wolowitz', '2013-05-28 06:10:50.416', 'I', 2006);
INSERT INTO location VALUES (2009, 'IF2', 2001);
INSERT INTO device VALUES (2010, 'H2', 'A', '17059680', '2013-05-28 10:19:17.004', false, 2009);
INSERT INTO component VALUES (2011, 'C', 'I6', '99090218', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:16:14.311', 'F', 2010);
INSERT INTO component VALUES (2012, 'A', 'C2', '99798740', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 19:15:09.258', 'B', 2010);
INSERT INTO device VALUES (2013, 'A7', 'I', '18461475', '2013-05-28 14:38:29.412', false, 2009);
INSERT INTO component VALUES (2014, 'D', 'I8', '67722305', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:54:45.376', 'A', 2013);
INSERT INTO component VALUES (2015, 'D', 'E5', '61661931', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 19:14:36.107', 'I', 2013);
INSERT INTO line VALUES (2016, 'C8 PreSeries', 'Series 2', 30, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2000);
INSERT INTO location VALUES (2017, 'CA1', 2016);
INSERT INTO device VALUES (2018, 'E1', 'C', '79624822', '2013-05-28 02:25:19.605', true, 2017);
INSERT INTO component VALUES (2019, 'A', 'D5', '98389149', 'Howard Joel Wolowitz', '2013-05-28 21:48:03.671', 'H', 2018);
INSERT INTO component VALUES (2020, 'D', 'D9', '283507', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:36:20.132', 'E', 2018);
INSERT INTO device VALUES (2021, 'A6', 'A', '58789133', '2013-05-27 23:41:00.926', true, 2017);
INSERT INTO component VALUES (2022, 'A', 'F8', '26491612', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:11:56.015', 'F', 2021);
INSERT INTO component VALUES (2023, 'F', 'C4', '65456826', 'Howard Joel Wolowitz', '2013-05-28 01:46:51.038', 'B', 2021);
INSERT INTO location VALUES (2024, 'ED1', 2016);
INSERT INTO device VALUES (2025, 'H4', 'F', '39327714', '2013-05-28 21:53:04.569', true, 2024);
INSERT INTO component VALUES (2026, 'C', 'H1', '42859709', 'Howard Joel Wolowitz', '2013-05-28 12:44:39.955', 'E', 2025);
INSERT INTO component VALUES (2027, 'A', 'C5', '99499884', 'Howard Joel Wolowitz', '2013-05-28 11:50:35.92', 'A', 2025);
INSERT INTO device VALUES (2028, 'F5', 'I', '56330643', '2013-05-28 19:36:29.914', false, 2024);
INSERT INTO component VALUES (2029, 'E', 'E4', '90459973', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:48:33.443', 'H', 2028);
INSERT INTO component VALUES (2030, 'G', 'D3', '23457319', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 12:19:07.868', 'A', 2028);


INSERT INTO location VALUES (2033, 'GE4', 2032);
INSERT INTO device VALUES (2034, 'D8', 'E', '87002892', '2013-05-28 04:34:36.989', false, 2033);
INSERT INTO component VALUES (2035, 'E', 'H1', '70686466', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:28:36.109', 'F', 2034);
INSERT INTO component VALUES (2036, 'F', 'G9', '69729821', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:36:55.906', 'I', 2034);
INSERT INTO device VALUES (2037, 'I4', 'C', '30063865', '2013-05-28 07:28:04.197', false, 2033);
INSERT INTO component VALUES (2038, 'B', 'A5', '44417557', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:29:03.34', 'D', 2037);
INSERT INTO component VALUES (2039, 'A', 'G5', '80059868', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:50:05.436', 'E', 2037);
INSERT INTO location VALUES (2040, 'IE1', 2032);
INSERT INTO device VALUES (2041, 'C1', 'F', '68182180', '2013-05-28 08:09:45.24', false, 2040);
INSERT INTO component VALUES (2042, 'I', 'H3', '54114537', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 02:37:13.74', 'C', 2041);
INSERT INTO component VALUES (2043, 'C', 'I5', '63083217', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:54:09.802', 'I', 2041);
INSERT INTO device VALUES (2044, 'D3', 'E', '54347724', '2013-05-28 07:27:56.695', false, 2040);
INSERT INTO component VALUES (2045, 'B', 'A4', '68786726', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:58:56.456', 'A', 2044);
INSERT INTO component VALUES (2046, 'B', 'C4', '91610243', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:31:49.796', 'F', 2044);

INSERT INTO location VALUES (2048, 'EA6', 2047);
INSERT INTO device VALUES (2049, 'C5', 'F', '24382016', '2013-05-28 14:51:50.409', false, 2048);
INSERT INTO component VALUES (2050, 'I', 'C2', '46607926', 'Howard Joel Wolowitz', '2013-05-28 22:12:20.379', 'D', 2049);
INSERT INTO component VALUES (2051, 'G', 'H2', '49804792', 'Howard Joel Wolowitz', '2013-05-28 02:19:31.883', 'E', 2049);
INSERT INTO device VALUES (2052, 'H3', 'G', '31674224', '2013-05-28 04:49:16.938', false, 2048);
INSERT INTO component VALUES (2053, 'B', 'E6', '58265736', 'Howard Joel Wolowitz', '2013-05-28 10:18:39.045', 'G', 2052);
INSERT INTO component VALUES (2054, 'D', 'D7', '81079628', 'Howard Joel Wolowitz', '2013-05-28 11:04:34.003', 'D', 2052);
INSERT INTO location VALUES (2055, 'FF4', 2047);
INSERT INTO device VALUES (2056, 'G2', 'A', '11350014', '2013-05-28 00:16:25.532', true, 2055);
INSERT INTO component VALUES (2057, 'I', 'E6', '91930921', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:44:44.187', 'B', 2056);
INSERT INTO component VALUES (2058, 'I', 'C8', '76791736', 'Howard Joel Wolowitz', '2013-05-28 09:05:44.937', 'E', 2056);
INSERT INTO device VALUES (2059, 'B6', 'H', '90278881', '2013-05-28 14:31:27.372', false, 2055);
INSERT INTO component VALUES (2060, 'B', 'C2', '14858416', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:34:40.826', 'A', 2059);
INSERT INTO component VALUES (2061, 'I', 'A2', '45115878', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 01:44:01.473', 'I', 2059);

INSERT INTO line VALUES (2063, 'H7 Assembly', 'Series 1', 27, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2062);
INSERT INTO location VALUES (2064, 'GE8', 2063);
INSERT INTO device VALUES (2065, 'B6', 'E', '45523337', '2013-05-28 22:18:16.801', false, 2064);
INSERT INTO component VALUES (2066, 'C', 'A8', '71424094', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:08:34.833', 'F', 2065);
INSERT INTO component VALUES (2067, 'F', 'A3', '57594394', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:12:05.603', 'D', 2065);
INSERT INTO device VALUES (2068, 'H1', 'D', '27962501', '2013-05-28 18:57:46.603', false, 2064);
INSERT INTO component VALUES (2069, 'E', 'B9', '1454260', 'Howard Joel Wolowitz', '2013-05-28 19:33:09.657', 'F', 2068);
INSERT INTO component VALUES (2070, 'B', 'F6', '29593651', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 21:56:05.311', 'H', 2068);
INSERT INTO location VALUES (2071, 'BC7', 2063);
INSERT INTO device VALUES (2072, 'B7', 'D', '82680171', '2013-05-28 00:18:04.749', false, 2071);
INSERT INTO component VALUES (2073, 'G', 'D6', '26256660', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 08:50:39.628', 'D', 2072);
INSERT INTO component VALUES (2074, 'C', 'A2', '25219118', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:34:18.644', 'E', 2072);
INSERT INTO device VALUES (2075, 'F5', 'I', '32898398', '2013-05-28 18:55:50.914', false, 2071);
INSERT INTO component VALUES (2076, 'D', 'C2', '62737801', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 02:30:35.375', 'I', 2075);
INSERT INTO component VALUES (2077, 'B', 'C4', '53385721', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:03:49.732', 'A', 2075);
INSERT INTO line VALUES (2078, 'H7 PreSeries', 'Series 9', 86, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2062);
INSERT INTO location VALUES (2079, 'CI5', 2078);
INSERT INTO device VALUES (2080, 'G6', 'B', '28352927', '2013-05-28 21:47:11.575', false, 2079);
INSERT INTO component VALUES (2081, 'D', 'B7', '76899172', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:12:08.468', 'F', 2080);
INSERT INTO component VALUES (2082, 'G', 'F2', '31823187', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:11:50.652', 'F', 2080);
INSERT INTO device VALUES (2083, 'E6', 'G', '38568501', '2013-05-28 06:00:49.879', false, 2079);
INSERT INTO component VALUES (2084, 'F', 'G4', '8070433', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:59:58.334', 'C', 2083);
INSERT INTO component VALUES (2085, 'B', 'C2', '51106516', 'Howard Joel Wolowitz', '2013-05-28 09:10:21.987', 'H', 2083);
INSERT INTO location VALUES (2086, 'AE9', 2078);
INSERT INTO device VALUES (2087, 'A8', 'F', '72897700', '2013-05-28 12:05:09.911', false, 2086);
INSERT INTO component VALUES (2088, 'C', 'G4', '45488940', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:41:41.147', 'G', 2087);
INSERT INTO component VALUES (2089, 'H', 'A3', '74184167', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:42:25.333', 'C', 2087);
INSERT INTO device VALUES (2090, 'C2', 'H', '89253100', '2013-05-28 19:15:37.595', false, 2086);
INSERT INTO component VALUES (2091, 'A', 'B6', '2607703', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:47:50.128', 'F', 2090);
INSERT INTO component VALUES (2092, 'E', 'C2', '24495223', 'Howard Joel Wolowitz', '2013-05-28 01:08:37.409', 'C', 2090);

INSERT INTO line VALUES (2094, 'E5 Assembly', 'Series 5', 9, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2093);
INSERT INTO location VALUES (2095, 'CA2', 2094);
INSERT INTO device VALUES (2096, 'H8', 'B', '6416687', '2013-05-28 00:17:18.267', false, 2095);
INSERT INTO component VALUES (2097, 'B', 'B3', '36089741', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:45:05.718', 'G', 2096);
INSERT INTO component VALUES (2098, 'C', 'B2', '4003746', 'Howard Joel Wolowitz', '2013-05-28 13:11:57.373', 'H', 2096);
INSERT INTO device VALUES (2099, 'I4', 'A', '70252199', '2013-05-28 14:29:10.979', false, 2095);
INSERT INTO component VALUES (2100, 'F', 'F4', '96792000', 'Howard Joel Wolowitz', '2013-05-28 00:49:00.683', 'B', 2099);
INSERT INTO component VALUES (2101, 'F', 'G8', '41115491', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 22:13:15.904', 'C', 2099);
INSERT INTO location VALUES (2102, 'II2', 2094);
INSERT INTO device VALUES (2103, 'C7', 'H', '30448361', '2013-05-28 05:31:24.469', false, 2102);
INSERT INTO component VALUES (2104, 'C', 'A8', '10381156', 'Howard Joel Wolowitz', '2013-05-28 14:00:40.967', 'F', 2103);
INSERT INTO component VALUES (2105, 'I', 'I8', '62009763', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:58:21.054', 'H', 2103);
INSERT INTO device VALUES (2106, 'I7', 'E', '18270386', '2013-05-28 22:43:40.959', false, 2102);
INSERT INTO component VALUES (2107, 'B', 'A8', '95646916', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:48:13.559', 'C', 2106);
INSERT INTO component VALUES (2108, 'D', 'F4', '22888637', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 21:24:29.592', 'G', 2106);
INSERT INTO line VALUES (2109, 'E5 PreSeries', 'Series 6', 50, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2093);
INSERT INTO location VALUES (2110, 'EG7', 2109);
INSERT INTO device VALUES (2111, 'G2', 'A', '453955', '2013-05-28 15:01:10.261', false, 2110);
INSERT INTO component VALUES (2112, 'B', 'E3', '65903037', 'Howard Joel Wolowitz', '2013-05-27 23:46:02.341', 'C', 2111);
INSERT INTO component VALUES (2113, 'E', 'B3', '39927527', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 06:00:42.509', 'G', 2111);
INSERT INTO device VALUES (2114, 'E6', 'C', '64678938', '2013-05-28 21:06:50.631', false, 2110);
INSERT INTO component VALUES (2115, 'G', 'D2', '16430312', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:59:37.113', 'D', 2114);
INSERT INTO component VALUES (2116, 'G', 'F6', '73126924', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:06:54.94', 'I', 2114);
INSERT INTO location VALUES (2117, 'DA9', 2109);
INSERT INTO device VALUES (2118, 'B9', 'C', '66482850', '2013-05-28 17:42:36.497', false, 2117);
INSERT INTO component VALUES (2119, 'F', 'D2', '40190718', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:57:09.088', 'A', 2118);
INSERT INTO component VALUES (2120, 'I', 'G8', '74428675', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:39:26.056', 'I', 2118);
INSERT INTO device VALUES (2121, 'A9', 'H', '20257954', '2013-05-28 05:17:06.534', false, 2117);
INSERT INTO component VALUES (2122, 'H', 'D9', '83805238', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:21:32.758', 'I', 2121);
INSERT INTO component VALUES (2123, 'B', 'I4', '71102609', 'Howard Joel Wolowitz', '2013-05-28 20:23:08.426', 'H', 2121);
INSERT INTO hall VALUES (2124, 'E7', 483, 6082, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO line VALUES (2125, 'E7 Assembly', 'Series 4', 85, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2124);
INSERT INTO location VALUES (2126, 'CC4', 2125);
INSERT INTO device VALUES (2127, 'B4', 'B', '86639765', '2013-05-28 05:19:33.742', false, 2126);
INSERT INTO component VALUES (2128, 'G', 'C3', '63132658', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:21:49.939', 'E', 2127);
INSERT INTO component VALUES (2129, 'C', 'I7', '51773768', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:51:10.523', 'F', 2127);
INSERT INTO device VALUES (2130, 'C1', 'E', '44568837', '2013-05-28 06:19:49.138', false, 2126);
INSERT INTO component VALUES (2131, 'E', 'E8', '3047705', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:42:26.572', 'C', 2130);
INSERT INTO component VALUES (2132, 'G', 'G4', '96347616', 'Howard Joel Wolowitz', '2013-05-28 13:43:54.85', 'A', 2130);
INSERT INTO location VALUES (2133, 'AI8', 2125);
INSERT INTO device VALUES (2134, 'E3', 'I', '36526417', '2013-05-27 23:37:22.462', false, 2133);
INSERT INTO component VALUES (2135, 'F', 'F3', '34880645', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:49:55.952', 'F', 2134);
INSERT INTO component VALUES (2136, 'F', 'B7', '40652501', 'Howard Joel Wolowitz', '2013-05-28 18:14:57.517', 'H', 2134);
INSERT INTO device VALUES (2137, 'E9', 'B', '11994953', '2013-05-28 15:00:33.469', false, 2133);
INSERT INTO component VALUES (2138, 'D', 'A9', '93677224', 'Howard Joel Wolowitz', '2013-05-28 03:25:44.787', 'E', 2137);
INSERT INTO component VALUES (2139, 'C', 'G3', '51905852', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:00:42.477', 'C', 2137);
INSERT INTO line VALUES (2140, 'E7 PreSeries', 'Series 5', 55, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2124);
INSERT INTO location VALUES (2141, 'BF9', 2140);
INSERT INTO device VALUES (2142, 'I3', 'H', '5638667', '2013-05-28 12:52:48.568', true, 2141);
INSERT INTO component VALUES (2143, 'B', 'D7', '59172942', 'Howard Joel Wolowitz', '2013-05-28 05:29:31.067', 'C', 2142);
INSERT INTO component VALUES (2144, 'C', 'B8', '66865292', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:25:30.115', 'F', 2142);
INSERT INTO device VALUES (2145, 'G3', 'D', '61881704', '2013-05-28 14:35:28.207', false, 2141);
INSERT INTO component VALUES (2146, 'C', 'G2', '10242900', 'Howard Joel Wolowitz', '2013-05-28 10:16:04.819', 'G', 2145);
INSERT INTO component VALUES (2147, 'B', 'A7', '19109512', 'Howard Joel Wolowitz', '2013-05-28 03:26:36.04', 'D', 2145);
INSERT INTO location VALUES (2148, 'GD4', 2140);
INSERT INTO device VALUES (2149, 'D5', 'F', '8301432', '2013-05-28 12:55:21.088', false, 2148);
INSERT INTO component VALUES (2150, 'I', 'C2', '5677630', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:17:06.02', 'A', 2149);
INSERT INTO component VALUES (2151, 'C', 'I1', '63999512', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:06:15.409', 'C', 2149);
INSERT INTO device VALUES (2152, 'C7', 'I', '29833605', '2013-05-28 11:08:32.593', false, 2148);
INSERT INTO component VALUES (2153, 'E', 'A5', '77401740', 'Howard Joel Wolowitz', '2013-05-28 03:53:43.216', 'B', 2152);
INSERT INTO component VALUES (2154, 'B', 'A6', '59899807', 'Howard Joel Wolowitz', '2013-05-28 10:20:48.306', 'D', 2152);
INSERT INTO hall VALUES (2155, 'C6', 973, 6229, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO line VALUES (2156, 'C6 Assembly', 'Series 2', 25, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2155);
INSERT INTO location VALUES (2157, 'IA3', 2156);
INSERT INTO device VALUES (2158, 'C8', 'F', '54508454', '2013-05-28 11:26:35.843', false, 2157);
INSERT INTO component VALUES (2159, 'F', 'B3', '70580502', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:34:19.864', 'H', 2158);
INSERT INTO component VALUES (2160, 'A', 'I5', '97169351', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:01:05.562', 'G', 2158);
INSERT INTO device VALUES (2161, 'G8', 'A', '21936389', '2013-05-28 05:36:51.298', false, 2157);
INSERT INTO component VALUES (2162, 'B', 'C9', '69294028', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:56:39.595', 'F', 2161);
INSERT INTO component VALUES (2163, 'H', 'G1', '80380561', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:33:47.789', 'H', 2161);
INSERT INTO location VALUES (2164, 'FI2', 2156);
INSERT INTO device VALUES (2165, 'F6', 'A', '14107818', '2013-05-28 05:27:30.896', false, 2164);
INSERT INTO component VALUES (2166, 'E', 'C9', '57463416', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:03:40.809', 'E', 2165);
INSERT INTO component VALUES (2167, 'I', 'B2', '98779917', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:36:16.33', 'B', 2165);
INSERT INTO device VALUES (2168, 'G4', 'B', '90308210', '2013-05-28 16:19:07.0', false, 2164);
INSERT INTO component VALUES (2169, 'A', 'G5', '4938087', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:16:06.932', 'I', 2168);
INSERT INTO component VALUES (2170, 'G', 'H2', '90455667', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:52:11.607', 'A', 2168);
INSERT INTO line VALUES (2171, 'C6 PreSeries', 'Series 7', 5, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2155);
INSERT INTO location VALUES (2172, 'BC7', 2171);
INSERT INTO device VALUES (2173, 'D9', 'E', '10094513', '2013-05-27 22:51:29.184', false, 2172);
INSERT INTO component VALUES (2174, 'I', 'B1', '66071804', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:54:10.464', 'A', 2173);
INSERT INTO component VALUES (2175, 'F', 'D1', '98856652', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:18:22.753', 'G', 2173);
INSERT INTO device VALUES (2176, 'I8', 'B', '15910391', '2013-05-28 14:26:32.239', true, 2172);
INSERT INTO component VALUES (2177, 'I', 'G5', '78255740', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:37:24.474', 'I', 2176);
INSERT INTO component VALUES (2178, 'E', 'H5', '23999648', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:39:15.651', 'G', 2176);
INSERT INTO location VALUES (2179, 'DA6', 2171);
INSERT INTO device VALUES (2180, 'B5', 'H', '86990050', '2013-05-28 06:35:05.846', false, 2179);
INSERT INTO component VALUES (2181, 'D', 'H6', '78203904', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:34:11.548', 'B', 2180);
INSERT INTO component VALUES (2182, 'H', 'A8', '40715822', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:44:22.169', 'C', 2180);
INSERT INTO device VALUES (2183, 'H2', 'B', '7052114', '2013-05-28 12:27:24.079', false, 2179);
INSERT INTO component VALUES (2184, 'B', 'A7', '73267239', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:27:08.033', 'H', 2183);
INSERT INTO component VALUES (2185, 'B', 'I2', '33055730', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:54:39.352', 'H', 2183);
INSERT INTO hall VALUES (2186, 'C5', 748, 1626, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO line VALUES (2187, 'C5 Assembly', 'Series 2', 42, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2186);
INSERT INTO location VALUES (2188, 'EB4', 2187);
INSERT INTO device VALUES (2189, 'C8', 'F', '97107033', '2013-05-28 19:23:02.3', false, 2188);
INSERT INTO component VALUES (2190, 'H', 'F7', '95066314', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:59:42.11', 'F', 2189);
INSERT INTO component VALUES (2191, 'G', 'B5', '37969067', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 00:00:18.949', 'H', 2189);
INSERT INTO device VALUES (2192, 'A2', 'E', '69038621', '2013-05-28 19:49:17.018', true, 2188);
INSERT INTO component VALUES (2193, 'C', 'H5', '31587065', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:13:45.355', 'F', 2192);
INSERT INTO component VALUES (2194, 'G', 'D1', '70473051', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:40:29.544', 'H', 2192);
INSERT INTO location VALUES (2195, 'CA3', 2187);
INSERT INTO device VALUES (2196, 'G6', 'C', '42983326', '2013-05-28 18:59:57.215', false, 2195);
INSERT INTO component VALUES (2197, 'G', 'I9', '53249926', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:40:32.801', 'A', 2196);
INSERT INTO component VALUES (2198, 'F', 'I7', '4877783', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 19:07:53.178', 'G', 2196);
INSERT INTO device VALUES (2199, 'B2', 'I', '79070933', '2013-05-28 07:22:11.097', true, 2195);
INSERT INTO component VALUES (2200, 'I', 'G2', '27628058', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:31:58.574', 'I', 2199);
INSERT INTO component VALUES (2201, 'A', 'I9', '59214419', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:48:52.939', 'F', 2199);
INSERT INTO line VALUES (2202, 'C5 PreSeries', 'Series 6', 36, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2186);
INSERT INTO location VALUES (2203, 'GI3', 2202);
INSERT INTO device VALUES (2204, 'B6', 'B', '87120003', '2013-05-28 01:03:44.002', false, 2203);
INSERT INTO component VALUES (2205, 'G', 'F5', '82443950', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:25:54.763', 'H', 2204);
INSERT INTO component VALUES (2206, 'B', 'B1', '47705379', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:03:05.655', 'I', 2204);
INSERT INTO device VALUES (2207, 'G7', 'F', '23380146', '2013-05-28 10:03:20.719', false, 2203);
INSERT INTO component VALUES (2208, 'I', 'B9', '56793691', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:09:17.652', 'H', 2207);
INSERT INTO component VALUES (2209, 'A', 'B1', '48854668', 'Howard Joel Wolowitz', '2013-05-28 01:35:18.365', 'H', 2207);
INSERT INTO location VALUES (2210, 'FB3', 2202);
INSERT INTO device VALUES (2211, 'C8', 'G', '16594937', '2013-05-28 04:09:51.798', false, 2210);
INSERT INTO component VALUES (2212, 'G', 'D3', '2943159', 'Howard Joel Wolowitz', '2013-05-28 18:30:51.265', 'E', 2211);
INSERT INTO component VALUES (2213, 'H', 'C1', '23468827', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 23:49:35.139', 'I', 2211);
INSERT INTO device VALUES (2214, 'I9', 'B', '71817590', '2013-05-27 23:39:44.959', false, 2210);
INSERT INTO component VALUES (2215, 'I', 'F2', '56857412', 'Howard Joel Wolowitz', '2013-05-28 11:39:30.646', 'E', 2214);
INSERT INTO component VALUES (2216, 'B', 'F2', '65410706', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:50:34.34', 'I', 2214);
INSERT INTO hall VALUES (2217, 'C1', 951, 8577, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO line VALUES (2218, 'C1 Assembly', 'Series 3', 1, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2217);
INSERT INTO location VALUES (2219, 'EH7', 2218);
INSERT INTO device VALUES (2220, 'G2', 'E', '77146162', '2013-05-28 12:44:54.011', false, 2219);
INSERT INTO component VALUES (2221, 'G', 'H3', '28191598', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:18:23.374', 'C', 2220);
INSERT INTO component VALUES (2222, 'G', 'H6', '15841458', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:34:24.874', 'D', 2220);
INSERT INTO device VALUES (2223, 'A6', 'H', '10660980', '2013-05-28 01:27:19.36', false, 2219);
INSERT INTO component VALUES (2224, 'H', 'A8', '99841518', 'Howard Joel Wolowitz', '2013-05-27 23:39:51.295', 'E', 2223);
INSERT INTO component VALUES (2225, 'I', 'E4', '97646333', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:07:20.433', 'I', 2223);
INSERT INTO location VALUES (2226, 'GH5', 2218);
INSERT INTO device VALUES (2227, 'A7', 'H', '87837473', '2013-05-28 05:23:20.15', false, 2226);
INSERT INTO component VALUES (2228, 'A', 'H1', '77999869', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:28:47.921', 'E', 2227);
INSERT INTO component VALUES (2229, 'F', 'B5', '14078157', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:48:13.999', 'D', 2227);
INSERT INTO device VALUES (2230, 'G1', 'C', '12038871', '2013-05-28 01:51:52.468', false, 2226);
INSERT INTO component VALUES (2231, 'D', 'F2', '97888661', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:13:09.673', 'I', 2230);
INSERT INTO component VALUES (2232, 'A', 'G3', '1819108', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:25:55.807', 'I', 2230);
INSERT INTO line VALUES (2233, 'C1 PreSeries', 'Series 3', 14, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2217);
INSERT INTO location VALUES (2234, 'DE4', 2233);
INSERT INTO device VALUES (2235, 'C4', 'H', '14550928', '2013-05-28 08:55:02.669', false, 2234);
INSERT INTO component VALUES (2236, 'B', 'G9', '18732955', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:12:11.617', 'G', 2235);
INSERT INTO component VALUES (2237, 'F', 'E9', '20764628', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:11:21.955', 'E', 2235);
INSERT INTO device VALUES (2238, 'E5', 'E', '71991830', '2013-05-28 00:07:44.732', false, 2234);
INSERT INTO component VALUES (2239, 'D', 'B1', '16077601', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 20:34:40.702', 'B', 2238);
INSERT INTO component VALUES (2240, 'G', 'E2', '79878573', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:26:37.519', 'D', 2238);
INSERT INTO location VALUES (2241, 'GH9', 2233);
INSERT INTO device VALUES (2242, 'A9', 'D', '57971407', '2013-05-27 23:09:14.85', false, 2241);
INSERT INTO component VALUES (2243, 'E', 'B2', '19196001', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:01:00.923', 'A', 2242);
INSERT INTO component VALUES (2244, 'B', 'H8', '48242871', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 17:59:40.412', 'A', 2242);
INSERT INTO device VALUES (2245, 'A4', 'E', '92898164', '2013-05-27 23:14:41.603', false, 2241);
INSERT INTO component VALUES (2246, 'I', 'C4', '89233574', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:54:56.86', 'C', 2245);
INSERT INTO component VALUES (2247, 'H', 'F3', '98129309', 'Howard Joel Wolowitz', '2013-05-28 10:24:20.841', 'E', 2245);
INSERT INTO hall VALUES (2248, 'G4', 54, 3394, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO line VALUES (2249, 'G4 Assembly', 'Series 1', 90, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2248);
INSERT INTO location VALUES (2250, 'FH6', 2249);
INSERT INTO device VALUES (2251, 'E4', 'B', '86138989', '2013-05-28 13:02:34.624', false, 2250);
INSERT INTO component VALUES (2252, 'D', 'A8', '85888894', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:03:19.189', 'G', 2251);
INSERT INTO component VALUES (2253, 'E', 'H4', '77138774', 'Howard Joel Wolowitz', '2013-05-28 05:47:22.574', 'I', 2251);
INSERT INTO device VALUES (2254, 'G6', 'E', '17311891', '2013-05-28 11:57:41.676', false, 2250);
INSERT INTO component VALUES (2255, 'E', 'B1', '89739207', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:43:18.817', 'E', 2254);
INSERT INTO component VALUES (2256, 'G', 'I8', '44021546', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:26:53.585', 'E', 2254);
INSERT INTO location VALUES (2257, 'DG1', 2249);
INSERT INTO device VALUES (2258, 'D3', 'E', '9507804', '2013-05-28 04:02:34.857', false, 2257);
INSERT INTO component VALUES (2259, 'E', 'B6', '78451610', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 05:00:49.484', 'D', 2258);
INSERT INTO component VALUES (2260, 'A', 'F8', '9204967', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 21:59:08.091', 'D', 2258);
INSERT INTO device VALUES (2261, 'C1', 'I', '87092265', '2013-05-28 08:35:11.217', false, 2257);
INSERT INTO component VALUES (2262, 'B', 'I2', '28857598', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 22:48:26.004', 'D', 2261);
INSERT INTO component VALUES (2263, 'A', 'H9', '20375545', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:35:03.395', 'G', 2261);
INSERT INTO line VALUES (2264, 'G4 PreSeries', 'Series 4', 67, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2248);
INSERT INTO location VALUES (2265, 'CF1', 2264);
INSERT INTO device VALUES (2266, 'H9', 'D', '96264273', '2013-05-28 17:45:48.603', false, 2265);
INSERT INTO component VALUES (2267, 'D', 'I9', '99594667', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:13:14.961', 'A', 2266);
INSERT INTO component VALUES (2268, 'C', 'I4', '10163205', 'Howard Joel Wolowitz', '2013-05-28 10:42:26.233', 'B', 2266);
INSERT INTO device VALUES (2269, 'H9', 'B', '47826739', '2013-05-28 17:28:17.615', false, 2265);
INSERT INTO component VALUES (2270, 'H', 'I1', '23510681', 'Howard Joel Wolowitz', '2013-05-28 22:21:41.501', 'A', 2269);
INSERT INTO component VALUES (2271, 'G', 'C1', '22471777', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:17:32.278', 'F', 2269);
INSERT INTO location VALUES (2272, 'CB7', 2264);
INSERT INTO device VALUES (2273, 'E8', 'B', '38554494', '2013-05-28 22:15:46.344', false, 2272);
INSERT INTO component VALUES (2274, 'B', 'D7', '12663168', 'Howard Joel Wolowitz', '2013-05-28 19:50:48.287', 'A', 2273);
INSERT INTO component VALUES (2275, 'D', 'A5', '5029394', 'Howard Joel Wolowitz', '2013-05-28 11:35:11.265', 'B', 2273);
INSERT INTO device VALUES (2276, 'H3', 'D', '47246844', '2013-05-28 14:37:48.882', false, 2272);
INSERT INTO component VALUES (2277, 'C', 'F3', '5287257', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:44:31.072', 'B', 2276);
INSERT INTO component VALUES (2278, 'A', 'A4', '94335112', 'Howard Joel Wolowitz', '2013-05-28 14:17:56.375', 'D', 2276);
INSERT INTO hall VALUES (2279, 'G8', 310, 7888, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO line VALUES (2280, 'G8 Assembly', 'Series 7', 16, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2279);
INSERT INTO location VALUES (2281, 'FC8', 2280);
INSERT INTO device VALUES (2282, 'E4', 'C', '17268854', '2013-05-28 20:00:25.617', false, 2281);
INSERT INTO component VALUES (2283, 'E', 'I6', '90919972', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:52:51.5', 'F', 2282);
INSERT INTO component VALUES (2284, 'H', 'E3', '84905411', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:59:48.306', 'F', 2282);
INSERT INTO device VALUES (2285, 'I2', 'E', '32192748', '2013-05-28 10:13:17.149', false, 2281);
INSERT INTO component VALUES (2286, 'C', 'A1', '94235782', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:00:15.95', 'F', 2285);
INSERT INTO component VALUES (2287, 'F', 'G6', '57696416', 'Howard Joel Wolowitz', '2013-05-28 11:03:54.699', 'H', 2285);
INSERT INTO location VALUES (2288, 'GC3', 2280);
INSERT INTO device VALUES (2289, 'I5', 'H', '90382988', '2013-05-28 22:30:37.068', false, 2288);
INSERT INTO component VALUES (2290, 'H', 'G8', '45290964', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 00:36:59.313', 'I', 2289);
INSERT INTO component VALUES (2291, 'B', 'G5', '52203287', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:59:09.002', 'C', 2289);
INSERT INTO device VALUES (2292, 'D7', 'D', '88256040', '2013-05-28 09:47:30.513', false, 2288);
INSERT INTO component VALUES (2293, 'B', 'H9', '19851446', 'Howard Joel Wolowitz', '2013-05-28 07:01:07.73', 'A', 2292);
INSERT INTO component VALUES (2294, 'I', 'D2', '5411618', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 05:14:30.446', 'H', 2292);
INSERT INTO line VALUES (2295, 'G8 PreSeries', 'Series 9', 48, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2279);
INSERT INTO location VALUES (2296, 'ED5', 2295);
INSERT INTO device VALUES (2297, 'I4', 'A', '76323660', '2013-05-28 03:55:20.665', true, 2296);
INSERT INTO component VALUES (2298, 'E', 'C1', '48808452', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 05:42:00.7', 'E', 2297);
INSERT INTO component VALUES (2299, 'A', 'C2', '48420658', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:22:34.242', 'I', 2297);
INSERT INTO device VALUES (2300, 'H7', 'C', '33583785', '2013-05-28 18:59:51.557', false, 2296);
INSERT INTO component VALUES (2301, 'E', 'I5', '80719117', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:20:21.637', 'B', 2300);
INSERT INTO component VALUES (2302, 'E', 'A5', '6540419', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:52:52.954', 'D', 2300);
INSERT INTO location VALUES (2303, 'HF1', 2295);
INSERT INTO device VALUES (2304, 'I4', 'A', '539291', '2013-05-28 19:46:39.719', false, 2303);
INSERT INTO component VALUES (2305, 'E', 'F6', '18265039', 'Howard Joel Wolowitz', '2013-05-27 23:05:51.113', 'E', 2304);
INSERT INTO component VALUES (2306, 'C', 'C6', '75017909', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:50:01.183', 'F', 2304);
INSERT INTO device VALUES (2307, 'F3', 'I', '98672113', '2013-05-27 22:57:59.577', false, 2303);
INSERT INTO component VALUES (2308, 'C', 'F7', '27492975', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:44:59.089', 'H', 2307);
INSERT INTO component VALUES (2309, 'C', 'F2', '29212074', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 21:02:23.528', 'C', 2307);
INSERT INTO hall VALUES (2310, 'G8', 781, 4778, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO line VALUES (2311, 'G8 Assembly', 'Series 6', 94, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2310);
INSERT INTO location VALUES (2312, 'FB1', 2311);
INSERT INTO device VALUES (2313, 'I3', 'B', '57200854', '2013-05-28 03:25:56.48', false, 2312);
INSERT INTO component VALUES (2314, 'G', 'D5', '17493438', 'Howard Joel Wolowitz', '2013-05-28 01:50:06.495', 'D', 2313);
INSERT INTO component VALUES (2315, 'A', 'C6', '32964696', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:26:11.714', 'I', 2313);
INSERT INTO device VALUES (2316, 'A8', 'I', '25221080', '2013-05-28 01:50:31.684', false, 2312);
INSERT INTO component VALUES (2317, 'I', 'D7', '74484318', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 17:11:38.109', 'H', 2316);
INSERT INTO component VALUES (2318, 'F', 'F6', '70180155', 'Howard Joel Wolowitz', '2013-05-28 19:19:01.328', 'H', 2316);
INSERT INTO location VALUES (2319, 'IC8', 2311);
INSERT INTO device VALUES (2320, 'F7', 'C', '72557389', '2013-05-28 03:18:51.811', false, 2319);
INSERT INTO component VALUES (2321, 'A', 'G3', '62176429', 'Howard Joel Wolowitz', '2013-05-28 11:13:38.995', 'E', 2320);
INSERT INTO component VALUES (2322, 'B', 'I2', '65712453', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:06:11.397', 'D', 2320);
INSERT INTO device VALUES (2323, 'I1', 'E', '78939702', '2013-05-28 11:27:43.943', false, 2319);
INSERT INTO component VALUES (2324, 'D', 'D5', '91424314', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:15:43.139', 'H', 2323);
INSERT INTO component VALUES (2325, 'I', 'B6', '13800490', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:48:31.212', 'B', 2323);
INSERT INTO line VALUES (2326, 'G8 PreSeries', 'Series 4', 67, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2310);
INSERT INTO location VALUES (2327, 'AD8', 2326);
INSERT INTO device VALUES (2328, 'B7', 'H', '84740359', '2013-05-28 06:27:49.317', false, 2327);
INSERT INTO component VALUES (2329, 'E', 'A6', '80418723', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:12:20.963', 'E', 2328);
INSERT INTO component VALUES (2330, 'C', 'H1', '27677092', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:57:19.04', 'E', 2328);
INSERT INTO device VALUES (2331, 'F2', 'G', '10927505', '2013-05-28 02:26:40.289', false, 2327);
INSERT INTO component VALUES (2332, 'B', 'H8', '85918531', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:57:04.546', 'C', 2331);
INSERT INTO component VALUES (2333, 'G', 'E7', '35813620', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:10:10.87', 'I', 2331);
INSERT INTO location VALUES (2334, 'CH7', 2326);
INSERT INTO device VALUES (2335, 'C5', 'B', '91982051', '2013-05-27 23:47:45.591', false, 2334);
INSERT INTO component VALUES (2336, 'F', 'F8', '65679719', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:25:10.455', 'F', 2335);
INSERT INTO component VALUES (2337, 'E', 'D5', '66608366', 'Howard Joel Wolowitz', '2013-05-28 14:21:46.197', 'D', 2335);
INSERT INTO device VALUES (2338, 'C1', 'C', '99798118', '2013-05-28 03:53:06.697', false, 2334);
INSERT INTO component VALUES (2339, 'C', 'C2', '11360493', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 00:50:39.06', 'G', 2338);
INSERT INTO component VALUES (2340, 'F', 'H1', '95123734', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:12:14.798', 'A', 2338);
INSERT INTO hall VALUES (2341, 'G7', 719, 4210, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO line VALUES (2342, 'G7 Assembly', 'Series 4', 44, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2341);
INSERT INTO location VALUES (2343, 'CE3', 2342);
INSERT INTO device VALUES (2344, 'H5', 'A', '31343524', '2013-05-28 04:17:35.181', false, 2343);
INSERT INTO component VALUES (2345, 'F', 'G6', '208118', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:22:09.792', 'C', 2344);
INSERT INTO component VALUES (2346, 'D', 'B5', '40389057', 'Howard Joel Wolowitz', '2013-05-28 19:05:56.958', 'C', 2344);
INSERT INTO device VALUES (2347, 'I9', 'I', '69721472', '2013-05-28 18:07:41.528', false, 2343);
INSERT INTO component VALUES (2348, 'G', 'G4', '94623461', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:30:35.143', 'E', 2347);
INSERT INTO component VALUES (2349, 'E', 'G3', '89003200', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:30:14.454', 'E', 2347);
INSERT INTO location VALUES (2350, 'CB9', 2342);
INSERT INTO device VALUES (2351, 'D7', 'H', '94176020', '2013-05-28 12:12:47.813', false, 2350);
INSERT INTO component VALUES (2352, 'F', 'E2', '96533153', 'Howard Joel Wolowitz', '2013-05-28 15:58:44.193', 'F', 2351);
INSERT INTO component VALUES (2353, 'I', 'I4', '18547048', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:15:42.694', 'F', 2351);
INSERT INTO device VALUES (2354, 'D3', 'A', '93798736', '2013-05-28 15:16:05.189', true, 2350);
INSERT INTO component VALUES (2355, 'F', 'G5', '48240308', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:54:39.112', 'D', 2354);
INSERT INTO component VALUES (2356, 'B', 'F5', '24838619', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:20:46.307', 'C', 2354);
INSERT INTO line VALUES (2357, 'G7 PreSeries', 'Series 8', 62, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2341);
INSERT INTO location VALUES (2358, 'GH8', 2357);
INSERT INTO device VALUES (2359, 'D6', 'H', '58608972', '2013-05-27 23:18:46.645', false, 2358);
INSERT INTO component VALUES (2360, 'E', 'A5', '83542631', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:55:03.216', 'B', 2359);
INSERT INTO component VALUES (2361, 'G', 'A2', '14236356', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:30:29.336', 'C', 2359);
INSERT INTO device VALUES (2362, 'C1', 'E', '38806609', '2013-05-28 12:19:22.144', true, 2358);
INSERT INTO component VALUES (2363, 'G', 'B2', '62338142', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:29:25.751', 'G', 2362);
INSERT INTO component VALUES (2364, 'C', 'F7', '89796065', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:27:39.7', 'G', 2362);
INSERT INTO location VALUES (2365, 'DF2', 2357);
INSERT INTO device VALUES (2366, 'C4', 'G', '84180844', '2013-05-28 02:03:38.062', false, 2365);
INSERT INTO component VALUES (2367, 'I', 'F4', '77838399', 'Howard Joel Wolowitz', '2013-05-28 11:18:58.947', 'B', 2366);
INSERT INTO component VALUES (2368, 'B', 'F8', '22324307', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:30:38.28', 'I', 2366);
INSERT INTO device VALUES (2369, 'B2', 'F', '6508182', '2013-05-27 23:56:13.903', false, 2365);
INSERT INTO component VALUES (2370, 'A', 'B5', '41980436', 'Howard Joel Wolowitz', '2013-05-28 18:04:27.545', 'C', 2369);
INSERT INTO component VALUES (2371, 'F', 'C6', '79742755', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:58:37.514', 'A', 2369);
INSERT INTO hall VALUES (2372, 'G3', 702, 5669, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO line VALUES (2373, 'G3 Assembly', 'Series 9', 99, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2372);
INSERT INTO location VALUES (2374, 'AE8', 2373);
INSERT INTO device VALUES (2375, 'E5', 'B', '31695749', '2013-05-28 22:21:29.788', false, 2374);
INSERT INTO component VALUES (2376, 'A', 'I1', '47126349', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:09:01.719', 'C', 2375);
INSERT INTO component VALUES (2377, 'D', 'I5', '41475056', 'Howard Joel Wolowitz', '2013-05-28 06:10:09.653', 'G', 2375);
INSERT INTO device VALUES (2378, 'H4', 'D', '79684103', '2013-05-28 20:02:07.533', false, 2374);
INSERT INTO component VALUES (2379, 'D', 'B9', '28881639', 'Howard Joel Wolowitz', '2013-05-28 21:39:13.493', 'F', 2378);
INSERT INTO component VALUES (2380, 'D', 'H5', '10090975', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:30:40.638', 'I', 2378);
INSERT INTO location VALUES (2381, 'DD9', 2373);
INSERT INTO device VALUES (2382, 'E3', 'A', '5595291', '2013-05-28 16:17:34.414', false, 2381);
INSERT INTO component VALUES (2383, 'G', 'B1', '4488101', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:51:50.687', 'B', 2382);
INSERT INTO component VALUES (2384, 'D', 'F2', '2228699', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:45:38.94', 'H', 2382);
INSERT INTO device VALUES (2385, 'C3', 'F', '62966818', '2013-05-28 22:08:05.481', false, 2381);
INSERT INTO component VALUES (2386, 'A', 'F5', '27264080', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:52:10.654', 'D', 2385);
INSERT INTO component VALUES (2387, 'C', 'B8', '15698761', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 08:04:52.787', 'D', 2385);
INSERT INTO line VALUES (2388, 'G3 PreSeries', 'Series 1', 16, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2372);
INSERT INTO location VALUES (2389, 'EI7', 2388);
INSERT INTO device VALUES (2390, 'I3', 'H', '21537152', '2013-05-28 14:30:40.413', false, 2389);
INSERT INTO component VALUES (2391, 'D', 'D3', '14158737', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:45:51.185', 'F', 2390);
INSERT INTO component VALUES (2392, 'I', 'D1', '8968857', 'Howard Joel Wolowitz', '2013-05-28 09:09:51.572', 'H', 2390);
INSERT INTO device VALUES (2393, 'H4', 'H', '47669253', '2013-05-28 10:20:13.416', false, 2389);
INSERT INTO component VALUES (2394, 'C', 'F4', '16969558', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 23:42:37.027', 'D', 2393);
INSERT INTO component VALUES (2395, 'I', 'F5', '22237061', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:09:45.867', 'E', 2393);
INSERT INTO location VALUES (2396, 'II8', 2388);
INSERT INTO device VALUES (2397, 'F9', 'I', '51917167', '2013-05-28 13:55:15.772', false, 2396);
INSERT INTO component VALUES (2398, 'I', 'G2', '60058007', 'Howard Joel Wolowitz', '2013-05-28 11:50:04.491', 'A', 2397);
INSERT INTO component VALUES (2399, 'F', 'B3', '76616495', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:39:07.213', 'B', 2397);
INSERT INTO device VALUES (2400, 'B3', 'B', '38694234', '2013-05-28 07:44:54.861', false, 2396);
INSERT INTO component VALUES (2401, 'F', 'D5', '88654909', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:10:33.444', 'B', 2400);
INSERT INTO component VALUES (2402, 'B', 'I2', '61999759', 'Howard Joel Wolowitz', '2013-05-28 07:15:29.809', 'A', 2400);
INSERT INTO hall VALUES (2403, 'B9', 799, 3531, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO line VALUES (2404, 'B9 Assembly', 'Series 2', 49, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2403);
INSERT INTO location VALUES (2405, 'DB2', 2404);
INSERT INTO device VALUES (2406, 'I2', 'A', '10417961', '2013-05-28 10:33:17.676', false, 2405);
INSERT INTO component VALUES (2407, 'G', 'H2', '18753897', 'Howard Joel Wolowitz', '2013-05-28 03:13:00.929', 'D', 2406);
INSERT INTO component VALUES (2408, 'G', 'B6', '32536152', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:58:31.111', 'F', 2406);
INSERT INTO device VALUES (2409, 'H9', 'I', '22150757', '2013-05-28 14:34:18.559', false, 2405);
INSERT INTO component VALUES (2410, 'C', 'G1', '32827801', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:38:12.821', 'F', 2409);
INSERT INTO component VALUES (2411, 'G', 'C2', '50838587', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:46:48.705', 'G', 2409);
INSERT INTO location VALUES (2412, 'AA3', 2404);
INSERT INTO device VALUES (2413, 'D7', 'I', '52551286', '2013-05-28 04:02:13.308', false, 2412);
INSERT INTO component VALUES (2414, 'B', 'H8', '83353974', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:44:26.365', 'A', 2413);
INSERT INTO component VALUES (2415, 'C', 'H5', '58465557', 'Howard Joel Wolowitz', '2013-05-28 16:49:04.899', 'D', 2413);
INSERT INTO device VALUES (2416, 'E3', 'D', '93130944', '2013-05-28 15:05:24.73', false, 2412);
INSERT INTO component VALUES (2417, 'C', 'I2', '53715161', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:54:12.217', 'I', 2416);
INSERT INTO component VALUES (2418, 'F', 'F3', '42888126', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:18:37.227', 'A', 2416);
INSERT INTO line VALUES (2419, 'B9 PreSeries', 'Series 8', 18, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2403);
INSERT INTO location VALUES (2420, 'FH4', 2419);
INSERT INTO device VALUES (2421, 'C1', 'F', '77823782', '2013-05-28 00:20:52.649', false, 2420);
INSERT INTO component VALUES (2422, 'A', 'I3', '92445425', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:19:35.067', 'A', 2421);
INSERT INTO component VALUES (2423, 'F', 'A1', '7342900', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:30:42.746', 'F', 2421);
INSERT INTO device VALUES (2424, 'B4', 'C', '66942537', '2013-05-28 21:59:17.457', false, 2420);
INSERT INTO component VALUES (2425, 'A', 'G6', '51817368', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:52:11.776', 'A', 2424);
INSERT INTO component VALUES (2426, 'F', 'I5', '94626272', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:06:36.113', 'G', 2424);
INSERT INTO location VALUES (2427, 'GI4', 2419);
INSERT INTO device VALUES (2428, 'C1', 'B', '90737610', '2013-05-28 03:29:01.887', false, 2427);
INSERT INTO component VALUES (2429, 'E', 'B4', '54307613', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:45:50.383', 'G', 2428);
INSERT INTO component VALUES (2430, 'G', 'H1', '86831750', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:13:24.013', 'B', 2428);
INSERT INTO device VALUES (2431, 'H9', 'H', '25138750', '2013-05-28 10:02:28.1', false, 2427);
INSERT INTO component VALUES (2432, 'E', 'H5', '96577274', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:11:38.239', 'G', 2431);
INSERT INTO component VALUES (2433, 'G', 'G7', '66851862', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 22:05:59.368', 'I', 2431);
INSERT INTO hall VALUES (2434, 'E6', 361, 9450, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO line VALUES (2435, 'E6 Assembly', 'Series 2', 93, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2434);
INSERT INTO location VALUES (2436, 'HF6', 2435);
INSERT INTO device VALUES (2437, 'G3', 'D', '35645559', '2013-05-28 19:12:24.491', false, 2436);
INSERT INTO component VALUES (2438, 'I', 'I2', '41050854', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:05:30.501', 'F', 2437);
INSERT INTO component VALUES (2439, 'B', 'H2', '92392437', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:38:02.331', 'A', 2437);
INSERT INTO device VALUES (2440, 'H9', 'A', '30323441', '2013-05-28 21:01:27.356', false, 2436);
INSERT INTO component VALUES (2441, 'D', 'D3', '93353015', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:02:47.319', 'F', 2440);
INSERT INTO component VALUES (2442, 'C', 'A5', '45545999', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 01:12:50.665', 'E', 2440);
INSERT INTO location VALUES (2443, 'CH6', 2435);
INSERT INTO device VALUES (2444, 'A2', 'D', '28468745', '2013-05-28 18:59:33.276', false, 2443);
INSERT INTO component VALUES (2445, 'E', 'C9', '479653', 'Howard Joel Wolowitz', '2013-05-28 01:39:19.214', 'H', 2444);
INSERT INTO component VALUES (2446, 'B', 'B2', '49605164', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 22:30:29.211', 'G', 2444);
INSERT INTO device VALUES (2447, 'H4', 'F', '5019175', '2013-05-28 04:36:43.103', true, 2443);
INSERT INTO component VALUES (2448, 'A', 'C6', '1548121', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 05:00:34.511', 'B', 2447);
INSERT INTO component VALUES (2449, 'F', 'C7', '96127149', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:17:07.527', 'C', 2447);
INSERT INTO line VALUES (2450, 'E6 PreSeries', 'Series 6', 78, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2434);
INSERT INTO location VALUES (2451, 'IA7', 2450);
INSERT INTO device VALUES (2452, 'I3', 'B', '85750258', '2013-05-28 06:45:14.323', true, 2451);
INSERT INTO component VALUES (2453, 'G', 'F2', '48866641', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:19:29.374', 'I', 2452);
INSERT INTO component VALUES (2454, 'G', 'D9', '451175', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:24:26.817', 'G', 2452);
INSERT INTO device VALUES (2455, 'B1', 'D', '89960250', '2013-05-28 19:17:50.82', false, 2451);
INSERT INTO component VALUES (2456, 'D', 'A3', '42113754', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:46:34.825', 'E', 2455);
INSERT INTO component VALUES (2457, 'D', 'G3', '37230112', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:03:41.183', 'D', 2455);
INSERT INTO location VALUES (2458, 'BE8', 2450);
INSERT INTO device VALUES (2459, 'G8', 'I', '67427294', '2013-05-28 11:18:07.622', true, 2458);
INSERT INTO component VALUES (2460, 'B', 'B6', '79296484', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:00:13.392', 'B', 2459);
INSERT INTO component VALUES (2461, 'F', 'I2', '36281949', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:20:54.432', 'I', 2459);
INSERT INTO device VALUES (2462, 'I3', 'E', '33734584', '2013-05-28 01:30:59.278', false, 2458);
INSERT INTO component VALUES (2463, 'H', 'C7', '50873051', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:40:26.31', 'A', 2462);
INSERT INTO component VALUES (2464, 'H', 'H2', '25437640', 'Howard Joel Wolowitz', '2013-05-27 23:32:57.036', 'H', 2462);
INSERT INTO hall VALUES (2465, 'A2', 594, 650, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO line VALUES (2466, 'A2 Assembly', 'Series 5', 61, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2465);
INSERT INTO location VALUES (2467, 'FG1', 2466);
INSERT INTO device VALUES (2468, 'G8', 'B', '78816400', '2013-05-28 07:52:20.454', false, 2467);
INSERT INTO component VALUES (2469, 'H', 'B3', '11320625', 'Howard Joel Wolowitz', '2013-05-28 16:19:05.906', 'E', 2468);
INSERT INTO component VALUES (2470, 'H', 'F6', '58378069', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:37:40.402', 'A', 2468);
INSERT INTO device VALUES (2471, 'G9', 'F', '88400858', '2013-05-28 00:03:12.533', true, 2467);
INSERT INTO component VALUES (2472, 'C', 'H5', '54096197', 'Howard Joel Wolowitz', '2013-05-27 23:13:32.195', 'C', 2471);
INSERT INTO component VALUES (2473, 'G', 'D2', '69970895', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:12:41.892', 'H', 2471);
INSERT INTO location VALUES (2474, 'HG7', 2466);
INSERT INTO device VALUES (2475, 'A5', 'G', '22360385', '2013-05-28 13:52:31.415', false, 2474);
INSERT INTO component VALUES (2476, 'D', 'E4', '57070075', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:57:06.622', 'I', 2475);
INSERT INTO component VALUES (2477, 'I', 'B3', '55590452', 'Howard Joel Wolowitz', '2013-05-28 08:21:15.678', 'I', 2475);
INSERT INTO device VALUES (2478, 'I4', 'F', '86343311', '2013-05-28 04:59:00.124', false, 2474);
INSERT INTO component VALUES (2479, 'A', 'H2', '38912103', 'Howard Joel Wolowitz', '2013-05-28 20:38:30.722', 'I', 2478);
INSERT INTO component VALUES (2480, 'B', 'C5', '5224428', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:53:54.394', 'H', 2478);
INSERT INTO line VALUES (2481, 'A2 PreSeries', 'Series 2', 41, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2465);
INSERT INTO location VALUES (2482, 'HE6', 2481);
INSERT INTO device VALUES (2483, 'C8', 'E', '16634663', '2013-05-28 20:45:17.791', false, 2482);
INSERT INTO component VALUES (2484, 'G', 'C5', '66206530', 'Howard Joel Wolowitz', '2013-05-28 03:10:27.04', 'H', 2483);
INSERT INTO component VALUES (2485, 'F', 'C8', '30371564', 'Howard Joel Wolowitz', '2013-05-28 09:20:32.883', 'F', 2483);
INSERT INTO device VALUES (2486, 'E4', 'C', '76714171', '2013-05-28 19:34:03.056', false, 2482);
INSERT INTO component VALUES (2487, 'F', 'F7', '22619628', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:36:15.111', 'I', 2486);
INSERT INTO component VALUES (2488, 'E', 'D1', '43561792', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:23:04.896', 'E', 2486);
INSERT INTO location VALUES (2489, 'AE8', 2481);
INSERT INTO device VALUES (2490, 'I5', 'B', '6174466', '2013-05-28 21:59:44.81', false, 2489);
INSERT INTO component VALUES (2491, 'F', 'D4', '32638022', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 22:02:22.131', 'G', 2490);
INSERT INTO component VALUES (2492, 'H', 'D9', '19383298', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:57:06.96', 'C', 2490);
INSERT INTO device VALUES (2493, 'G2', 'C', '11002118', '2013-05-28 20:12:08.745', false, 2489);
INSERT INTO component VALUES (2494, 'B', 'E6', '89036430', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:45:55.096', 'F', 2493);
INSERT INTO component VALUES (2495, 'D', 'I8', '2126728', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:00:18.304', 'A', 2493);
INSERT INTO hall VALUES (2496, 'A4', 46, 9975, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO line VALUES (2497, 'A4 Assembly', 'Series 3', 90, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2496);
INSERT INTO location VALUES (2498, 'IC5', 2497);
INSERT INTO device VALUES (2499, 'I1', 'I', '34913107', '2013-05-28 12:51:27.465', false, 2498);
INSERT INTO component VALUES (2500, 'I', 'G4', '30921649', 'Howard Joel Wolowitz', '2013-05-28 12:29:10.201', 'D', 2499);
INSERT INTO component VALUES (2501, 'A', 'G5', '14003446', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 08:20:10.942', 'G', 2499);
INSERT INTO device VALUES (2502, 'D2', 'F', '38933123', '2013-05-28 20:06:51.202', false, 2498);
INSERT INTO component VALUES (2503, 'D', 'C2', '54531139', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:30:06.785', 'D', 2502);
INSERT INTO component VALUES (2504, 'I', 'F5', '71229060', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:22:21.59', 'A', 2502);
INSERT INTO location VALUES (2505, 'EC4', 2497);
INSERT INTO device VALUES (2506, 'H6', 'H', '22457490', '2013-05-28 10:56:20.229', false, 2505);
INSERT INTO component VALUES (2507, 'C', 'I6', '9738581', 'Howard Joel Wolowitz', '2013-05-28 06:51:07.336', 'E', 2506);
INSERT INTO component VALUES (2508, 'C', 'I3', '31827359', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:15:02.859', 'H', 2506);
INSERT INTO device VALUES (2509, 'G8', 'H', '63086569', '2013-05-28 13:12:09.283', false, 2505);
INSERT INTO component VALUES (2510, 'A', 'G9', '32109571', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:53:17.015', 'B', 2509);
INSERT INTO component VALUES (2511, 'H', 'B3', '29058515', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 00:57:09.403', 'E', 2509);
INSERT INTO line VALUES (2512, 'A4 PreSeries', 'Series 1', 87, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2496);
INSERT INTO location VALUES (2513, 'DH5', 2512);
INSERT INTO device VALUES (2514, 'E8', 'F', '82958763', '2013-05-27 22:56:59.747', false, 2513);
INSERT INTO component VALUES (2515, 'G', 'B9', '28133405', 'Howard Joel Wolowitz', '2013-05-28 01:29:49.331', 'B', 2514);
INSERT INTO component VALUES (2516, 'I', 'E9', '69549238', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:36:19.201', 'I', 2514);
INSERT INTO device VALUES (2517, 'C4', 'F', '370743', '2013-05-28 07:49:22.678', true, 2513);
INSERT INTO component VALUES (2518, 'E', 'E3', '84169826', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:15:15.639', 'B', 2517);
INSERT INTO component VALUES (2519, 'A', 'F5', '76931816', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:06:58.776', 'C', 2517);
INSERT INTO location VALUES (2520, 'EE2', 2512);
INSERT INTO device VALUES (2521, 'I2', 'G', '3648321', '2013-05-28 14:58:53.431', false, 2520);
INSERT INTO component VALUES (2522, 'F', 'H8', '96285284', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:30:58.548', 'E', 2521);
INSERT INTO component VALUES (2523, 'B', 'G4', '64246082', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:58:15.124', 'I', 2521);
INSERT INTO device VALUES (2524, 'I6', 'B', '36991894', '2013-05-28 10:12:47.629', false, 2520);
INSERT INTO component VALUES (2525, 'H', 'A4', '62894622', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:10:40.223', 'G', 2524);
INSERT INTO component VALUES (2526, 'F', 'F5', '74288632', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:59:06.076', 'B', 2524);
INSERT INTO hall VALUES (2527, 'A2', 463, 1322, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO line VALUES (2528, 'A2 Assembly', 'Series 1', 3, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2527);
INSERT INTO location VALUES (2529, 'DC9', 2528);
INSERT INTO device VALUES (2530, 'E1', 'G', '68524893', '2013-05-28 00:34:55.897', false, 2529);
INSERT INTO component VALUES (2531, 'F', 'C8', '58219247', 'Howard Joel Wolowitz', '2013-05-28 08:10:07.219', 'G', 2530);
INSERT INTO component VALUES (2532, 'B', 'F5', '28100646', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 09:05:00.663', 'F', 2530);
INSERT INTO device VALUES (2533, 'G4', 'E', '77645310', '2013-05-28 14:49:17.287', false, 2529);
INSERT INTO component VALUES (2534, 'B', 'A1', '21810870', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:00:56.172', 'B', 2533);
INSERT INTO component VALUES (2535, 'F', 'I1', '73119834', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:31:19.886', 'I', 2533);
INSERT INTO location VALUES (2536, 'IE1', 2528);
INSERT INTO device VALUES (2537, 'A5', 'B', '78779208', '2013-05-28 05:09:15.477', false, 2536);
INSERT INTO component VALUES (2538, 'H', 'A2', '71089986', 'Howard Joel Wolowitz', '2013-05-28 15:10:32.748', 'I', 2537);
INSERT INTO component VALUES (2539, 'H', 'G2', '72626598', 'Howard Joel Wolowitz', '2013-05-28 02:33:14.366', 'F', 2537);
INSERT INTO device VALUES (2540, 'B7', 'H', '20248884', '2013-05-28 10:46:56.621', false, 2536);
INSERT INTO component VALUES (2541, 'G', 'I4', '84015616', 'Howard Joel Wolowitz', '2013-05-28 00:44:32.648', 'G', 2540);
INSERT INTO component VALUES (2542, 'I', 'I7', '38687480', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:32:22.003', 'G', 2540);
INSERT INTO line VALUES (2543, 'A2 PreSeries', 'Series 7', 21, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2527);
INSERT INTO location VALUES (2544, 'BH2', 2543);
INSERT INTO device VALUES (2545, 'C2', 'B', '29912883', '2013-05-28 17:53:37.794', false, 2544);
INSERT INTO component VALUES (2546, 'D', 'D1', '7627390', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:39:21.604', 'H', 2545);
INSERT INTO component VALUES (2547, 'H', 'B9', '34609492', 'Howard Joel Wolowitz', '2013-05-28 04:19:52.621', 'G', 2545);
INSERT INTO device VALUES (2548, 'D9', 'F', '58436259', '2013-05-28 06:02:57.278', false, 2544);
INSERT INTO component VALUES (2549, 'F', 'B9', '78030153', 'Howard Joel Wolowitz', '2013-05-28 08:44:10.596', 'I', 2548);
INSERT INTO component VALUES (2550, 'D', 'A8', '99854740', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:29:32.879', 'A', 2548);
INSERT INTO location VALUES (2551, 'DB9', 2543);
INSERT INTO device VALUES (2552, 'I4', 'I', '41309729', '2013-05-28 09:01:50.764', false, 2551);
INSERT INTO component VALUES (2553, 'C', 'A9', '60750173', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:40:46.056', 'G', 2552);
INSERT INTO component VALUES (2554, 'A', 'F2', '27880351', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:45:09.674', 'A', 2552);
INSERT INTO device VALUES (2555, 'C3', 'D', '43164986', '2013-05-28 11:58:31.48', false, 2551);
INSERT INTO component VALUES (2556, 'D', 'A2', '60704907', 'Howard Joel Wolowitz', '2013-05-27 23:17:16.473', 'C', 2555);
INSERT INTO component VALUES (2557, 'G', 'I5', '84296738', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:44:28.892', 'H', 2555);


INSERT INTO hall VALUES (2031, 'H0', 55, 180, 'm 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z', 1);
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
INSERT INTO hall VALUES (2000, 'H60', 11, 99, 'm 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z', 1);
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
INSERT INTO hall VALUES (2062, 'H25', 0, 0, 'm 189.67279,99.02868 0,-1.375 8.375,0 0,-42.875 -1.625,0 0,-5.5 -18.75,0 0,5.5 0,0.625 0,42.25 3.125,0 0,1.375 4.25,0 0,0.625 2,0 0,-0.625 z', 2);
INSERT INTO hall VALUES (2093, 'H26', 0, 0, 'm 204.67279,49.65368 v -15.75 -6.375 h -6.25 -42.125 v 4.5 h -5.5 v -10.25 h 1.875 v 0.25 h 14.75 v -6.875 h -14.75 v 2.625 h -1.875 v -2.625 h -17 v 26.25 h 17 v -8 h 5.5 v 0.5 h 4.082 v 2.875 h -4.082 v 6.75 h -26.875 v -41.5 h -22.375 v 9.333 h -3.5 v 28.25 h 3.5 v 3.917 h -9.251 v -0.081 h 1.417 v -11.5 h -9.25 v -7.25 h -9.750002 v 16.667 h 3.75 v 1.333 0.75 4 H 97.79679 v -1.544 h 4.416 v 9.208 H 78.880788 v 4.416 h 23.332002 v 4.376 h -1.665 v 2.877 h -2.125 v -3.002 H 79.172788 v 25.875 h 7.000002 v 9 h 12 v -9 h 0.25 v -20.873 h 2.125 v 29.373 h 5.831 v 1.708 h 10.75 v -1.708 h 4.544 v -34.25 h -16.543 v -4.376 h 15.168 v -4.416 h -15.168 v -9.208 h 1.918 v 3.75 h 19.875 v 5 h -2.75 v 44.25 h 2.75 v 0.125 h 47.25 v -49.5 h -14.709 v -1.5 h 11.709 v -2.625 h 27.25 v 4.25 h 6.25 z m -70.959,-0.125 h -4.291 v -3.625 h 4.291 v 3.625 z m 24.584,0 h -14.166 v -3.625 h 12.166 v 2.125 h 2 v 1.5 z m 12.875,-12.75 h -1.188 -8.188 v -2.875 h 36.625 v 2.875 h -27.249 z', 2);
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


INSERT INTO line VALUES (100, 'B5 Assembly', 'Test Series', 0, 'm 241.5,67.21875 0,0.5 0,30.5 0,0.5 0.5,0 213.5,0 0.5,0 0,-0.5 0,-30.5 0,-0.5 -0.5,0 -213.5,0 -0.5,0 z m 1,1 212.5,0 0,29.5 -212.5,0 0,-29.5 z', 2031);;
INSERT INTO line VALUES (101, 'B5 Assembly', 'Test Series', 0, 'm 26,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 59.5,0 0.5,0 0,-0.5 0,-16 12,0 0.5,0 0,-0.5 0,-25 0,-0.5 -0.5,0 -72,0 -0.5,0 z m 1,1 71,0 0,24 -12,0 -0.5,0 0,0.5 0,16 -58.5,0 0,-40.5 z', 2031);;
INSERT INTO line VALUES (102, 'B5 Assembly', 'Test Series', 0, 'm 98,105.46875 0,0.5 0,24.5 -12,0 -0.5,0 0,0.5 0,16.5 0,0.5 0.5,0 322.5,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -310,0 -0.5,0 z m 1,1 309,0 0,40.5 -321.5,0 0,-15.5 12,0 0.5,0 0,-0.5 0,-24.5 z', 2031);;
INSERT INTO line VALUES (2032, 'B5 Assembly', 'Test Series', 0, 'm 407.625,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 36.25,0 0.5,0 0,-0.5 0,-16.375 0,-0.5 -0.5,0 -12,0 0,-24.625 0,-0.5 -0.5,0 -23.75,0 -0.5,0 z m 1,1 22.75,0 0,24.625 0,0.5 0.5,0 12,0 0,15.375 -35.25,0 0,-40.5 z', 2031);;
INSERT INTO line VALUES (104, 'B5 Assembly', 'Test Series', 0, 'm 431.375,105.46875 0,0.5 0,25.125 0,0.5 0.5,0 12,0 0,15.875 0,0.5 0.5,0 12.75,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -25.25,0 -0.5,0 z m 1,1 24.25,0 0,40.5 -11.75,0 0,-15.875 0,-0.5 -0.5,0 -12,0 0,-24.125 z', 2031);;
INSERT INTO line VALUES (105, 'B5 Assembly', 'Test Series', 0, 'm 26,67.21875 0,0.5 0,30.5 0,0.5 0.5,0 207.25,0 0.5,0 0,-0.5 0,-30.5 0,-0.5 -0.5,0 -207.25,0 -0.5,0 z m 1,1 206.25,0 0,29.5 -206.25,0 0,-29.5 z', 2031);;
INSERT INTO line VALUES (106, 'B5 Assembly', 'Test Series', 0, 'm 303.5,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 174.78125,0 0.46875,0 0,-0.5 0,-25.65625 0,-0.5 -0.46875,0 -174.78125,0 -0.5,0 z m 1,1 173.78125,0 0,24.6875 -173.78125,0 0,-24.6875 z', 2031);;
INSERT INTO line VALUES (107, 'B5 Assembly', 'Test Series', 0, 'm 268.78125,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 32.0625,0 0.5,0 0,-0.5 0,-25.65625 0,-0.5 -0.5,0 -32.0625,0 -0.5,0 z m 1,1 31.0625,0 0,24.65625 -31.0625,0 0,-24.65625 z', 2031);;
INSERT INTO line VALUES (108, 'B5 Assembly', 'Test Series', 0, 'm 119.5,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 146.28125,0 0.5,0 0,-0.5 0,-25.65625 0,-0.5 -0.5,0 -146.28125,0 -0.5,0 z m 1,1 145.28125,0 0,24.6875 -145.28125,0 0,-24.6875 z', 2031);;
INSERT INTO line VALUES (109, 'B5 Assembly', 'Test Series', 0, 'm 28.860346,16.3125 0,0.5 0,17.8125 -20.51689,0 -0.4863263,0 0,0.5 0,25.65625 0,0.5 0.4863263,0 108.602744,0 0.48632,0 0,-0.5 0,-25.65625 0,-0.5 -0.48632,0 -31.793586,0 0,-17.8125 0,-0.5 -0.486326,0 -55.319615,0 -0.486327,0 z m 0.972653,1 54.346963,0 0,17.8125 0,0.5 0.486326,0 31.793582,0 0,24.65625 -107.6300877,0 0,-24.65625 20.5168907,0 0.486326,0 0,-0.5 0,-17.8125 z', 2031);;
INSERT INTO line VALUES (110, 'B5 Assembly', 'Test Series', 0, 'm 481.21875,34.65625 0,0.46875 0,37.34375 0,0.46875 0.46875,0 20.65625,0 0.46875,0 0,-0.46875 0,-37.34375 0,-0.46875 -0.46875,0 -20.65625,0 -0.46875,0 z m 0.9375,0.9375 19.71875,0 0,36.40625 -19.71875,0 0,-36.40625 z', 2031);;
INSERT INTO line VALUES (111, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,79.0625 0,0.46875 0,65.9375 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-65.9375 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z M 482.125,80 l 19.75,0 0,65 -19.75,0 0,-65 z', 2031);;
INSERT INTO line VALUES (112, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,79.03125 0,0.5 0,10.1875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-10.1875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,9.1875 -15.03125,0 0,-9.1875 z', 2031);;
INSERT INTO line VALUES (113, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,92.625 0,0.5 0,73.21875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-73.21875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,72.21875 -15.03125,0 0,-72.21875 z', 2031);;
INSERT INTO line VALUES (114, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,165.84375 0,0.5 0,44.3125 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-44.3125 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,43.3125 -15.03125,0 0,-43.3125 z', 2031);;
INSERT INTO line VALUES (115, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,210.15625 0,0.5 0,29.46875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-29.46875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,28.46875 -15.03125,0 0,-28.46875 z', 2031);;
INSERT INTO line VALUES (116, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,151.40625 0,0.46875 0,88.25 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-88.25 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z m 0.96875,0.9375 19.75,0 0,87.3125 -19.75,0 0,-87.3125 z', 2031);;
INSERT INTO line VALUES (117, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,245.65625 0,0.46875 0,29.65625 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-29.65625 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z m 0.96875,0.9375 19.75,0 0,28.71875 -19.75,0 0,-28.71875 z', 2031);;
INSERT INTO line VALUES (118, 'B5 Assembly', 'Test Series', 0, 'm 463.84375,245.625 0,0.5 0,29.65625 0,0.5 0.5,0 14.5,0 0.5,0 0,-0.5 0,-29.65625 0,-0.5 -0.5,0 -14.5,0 -0.5,0 z m 1,1 13.5,0 0,28.65625 -13.5,0 0,-28.65625 z', 2031);;
INSERT INTO line VALUES (119, 'B5 Assembly', 'Test Series', 0, 'm 26,151.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2031);;
INSERT INTO line VALUES (120, 'B5 Assembly', 'Test Series', 0, 'm 26,175.875 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2031);;
INSERT INTO line VALUES (121, 'B5 Assembly', 'Test Series', 0, 'm 26,200.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2031);;
INSERT INTO line VALUES (122, 'B5 Assembly', 'Test Series', 0, 'm 26,224.875 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2031);;
INSERT INTO line VALUES (123, 'B5 Assembly', 'Test Series', 0, 'm 26,249.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2031);;
INSERT INTO line VALUES (124, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,67.21875 0,0.5 0,34.75 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-34.75 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,33.75 -10.65625,0 0,-33.75 z', 2031);;
INSERT INTO line VALUES (125, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,40.5 -10.65625,0 0,-40.5 z', 2031);;
INSERT INTO line VALUES (126, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,151.375 0,0.5 0,99.59375 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-99.59375 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,98.59375 -10.65625,0 0,-98.59375 z', 2031);;