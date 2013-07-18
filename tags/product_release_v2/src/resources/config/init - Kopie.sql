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
/* INSERT INTO hall VALUES (2000, 'I6', 575, 4178, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1); */
/*INSERT INTO line VALUES (2001, 'I6 Assembly', 'Series 7', 58, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2000);*/
INSERT INTO location VALUES (2002, 'GB3', 2001);
INSERT INTO device VALUES (2003, 'A4', 'D', '2874947', '2013-05-28 19:47:27.646', false, 2002);
INSERT INTO component VALUES (2004, 'A', 'G5', '91149204', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 22:45:02.208', 'E', 2003);
INSERT INTO component VALUES (2005, 'G', 'F7', '21574632', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:36:50.328', 'C', 2003);
INSERT INTO device VALUES (2006, 'B3', 'B', '8056501', '2013-05-28 04:32:56.431', false, 2002);
INSERT INTO component VALUES (2007, 'C', 'H1', '84560685', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:37:41.483', 'I', 2006);
INSERT INTO component VALUES (2008, 'A', 'F7', '14097942', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:10:44.004', 'E', 2006);
INSERT INTO location VALUES (2009, 'CE5', 2001);
INSERT INTO device VALUES (2010, 'F8', 'E', '77748546', '2013-05-28 02:56:09.771', false, 2009);
INSERT INTO component VALUES (2011, 'I', 'G9', '92372302', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:02:30.99', 'A', 2031);
INSERT INTO component VALUES (2012, 'D', 'H4', '45469122', 'Howard Joel Wolowitz', '2013-05-28 00:29:46.74', 'C', 2031);
INSERT INTO device VALUES (2013, 'I5', 'D', '99288473', '2013-05-28 06:45:29.295', false, 2009);
INSERT INTO component VALUES (2014, 'I', 'D9', '80488025', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:12:55.682', 'C', 2013);
INSERT INTO component VALUES (2015, 'I', 'D2', '11037239', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 22:42:16.842', 'C', 2013);
/*INSERT INTO line VALUES (2016, 'I6 PreSeries', 'Series 1', 45, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2000);*/
INSERT INTO location VALUES (2017, 'IB4', 2016);
INSERT INTO device VALUES (2018, 'B3', 'G', '97336530', '2013-05-28 12:06:43.234', false, 2017);
INSERT INTO component VALUES (2019, 'D', 'D8', '68819054', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:59:24.592', 'D', 2018);
INSERT INTO component VALUES (2020, 'G', 'F3', '33146976', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:48:42.612', 'C', 2018);
INSERT INTO device VALUES (2021, 'F2', 'A', '47277504', '2013-05-28 16:10:03.609', false, 2017);
INSERT INTO component VALUES (2022, 'E', 'D2', '31313037', 'Howard Joel Wolowitz', '2013-05-28 07:30:15.074', 'H', 2021);
INSERT INTO component VALUES (2023, 'C', 'E5', '23992885', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:21:12.524', 'I', 2021);
INSERT INTO location VALUES (2024, 'FI7', 2016);
INSERT INTO device VALUES (2025, 'F4', 'C', '71587867', '2013-05-28 02:51:50.457', false, 2024);
INSERT INTO component VALUES (2026, 'I', 'D5', '54406049', 'Howard Joel Wolowitz', '2013-05-27 22:23:30.424', 'I', 2025);
INSERT INTO component VALUES (2027, 'A', 'H1', '4005839', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 05:43:20.293', 'A', 2025);
INSERT INTO device VALUES (2028, 'F1', 'F', '29532135', '2013-05-28 06:00:24.24', false, 2024);
INSERT INTO component VALUES (2029, 'H', 'H7', '17861141', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:23:50.093', 'A', 2028);
INSERT INTO component VALUES (2030, 'A', 'G4', '30054627', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:20:49.161', 'B', 2028);
/*INSERT INTO hall VALUES (2031, 'A4', 963, 9486, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1); */
INSERT INTO line VALUES (2032, 'A4 Assembly', 'Series 6', 92, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2031);
INSERT INTO location VALUES (2033, 'CH5', 2032);
INSERT INTO device VALUES (2034, 'H8', 'A', '69749606', '2013-05-28 17:58:01.682', false, 2033);
INSERT INTO component VALUES (2035, 'F', 'G3', '34243985', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 19:01:37.044', 'F', 2034);
INSERT INTO component VALUES (2036, 'F', 'A2', '25934650', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:54:08.166', 'H', 2034);
INSERT INTO device VALUES (2037, 'B1', 'F', '23024342', '2013-05-28 03:03:46.295', false, 2033);
INSERT INTO component VALUES (2038, 'C', 'A5', '41529982', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:13:18.904', 'G', 2037);
INSERT INTO component VALUES (2039, 'H', 'I7', '15905240', 'Howard Joel Wolowitz', '2013-05-27 22:44:09.497', 'A', 2037);
INSERT INTO location VALUES (2040, 'FH3', 2032);
INSERT INTO device VALUES (2041, 'H4', 'C', '23892858', '2013-05-27 22:48:42.584', false, 2040);
INSERT INTO component VALUES (2042, 'G', 'A4', '19323893', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:41:18.181', 'E', 2041);
INSERT INTO component VALUES (2043, 'A', 'E8', '11500371', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:27:59.293', 'I', 2041);
INSERT INTO device VALUES (2044, 'F8', 'I', '27326602', '2013-05-28 12:04:35.566', false, 2040);
INSERT INTO component VALUES (2045, 'E', 'B9', '62158077', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:24:42.341', 'I', 2044);
INSERT INTO component VALUES (2046, 'G', 'I6', '25423120', 'Howard Joel Wolowitz', '2013-05-28 19:22:49.338', 'H', 2044);
INSERT INTO line VALUES (2047, 'A4 PreSeries', 'Series 2', 72, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2031);
INSERT INTO location VALUES (2048, 'BD7', 2047);
INSERT INTO device VALUES (2049, 'H8', 'C', '75903672', '2013-05-28 15:40:28.202', false, 2048);
INSERT INTO component VALUES (2050, 'C', 'I5', '53236141', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:52:40.807', 'F', 2049);
INSERT INTO component VALUES (2051, 'E', 'B7', '40067814', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 23:53:58.218', 'F', 2049);
INSERT INTO device VALUES (2052, 'H4', 'B', '87433255', '2013-05-28 12:41:50.308', false, 2048);
INSERT INTO component VALUES (2053, 'E', 'A2', '62273511', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:10:45.659', 'E', 2052);
INSERT INTO component VALUES (2054, 'G', 'H6', '20492959', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:41:10.527', 'D', 2052);
INSERT INTO location VALUES (2055, 'HE4', 2047);
INSERT INTO device VALUES (2056, 'G6', 'D', '6582010', '2013-05-28 17:05:48.88', false, 2055);
INSERT INTO component VALUES (2057, 'F', 'H5', '61816382', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:10:18.773', 'C', 2056);
INSERT INTO component VALUES (2058, 'E', 'D6', '24036218', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 16:34:04.663', 'D', 2056);
INSERT INTO device VALUES (2059, 'E9', 'G', '31403505', '2013-05-28 10:52:36.148', false, 2055);
INSERT INTO component VALUES (2060, 'E', 'E2', '38616680', 'Howard Joel Wolowitz', '2013-05-28 18:09:08.178', 'D', 2059);
INSERT INTO component VALUES (2061, 'E', 'D3', '74823703', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:32:45.891', 'F', 2059);
/*INSERT INTO hall VALUES (2062, 'I5', 302, 6418, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2);*/
INSERT INTO line VALUES (2063, 'I5 Assembly', 'Series 9', 8, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2062);
INSERT INTO location VALUES (2064, 'CI8', 2063);
INSERT INTO device VALUES (2065, 'H7', 'I', '39453804', '2013-05-27 22:47:23.169', false, 2064);
INSERT INTO component VALUES (2066, 'F', 'F6', '16866537', 'Howard Joel Wolowitz', '2013-05-28 20:43:34.516', 'H', 2065);
INSERT INTO component VALUES (2067, 'G', 'H2', '6224317', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:58:40.198', 'D', 2065);
INSERT INTO device VALUES (2068, 'E1', 'C', '72509897', '2013-05-28 19:00:19.397', false, 2064);
INSERT INTO component VALUES (2069, 'E', 'E3', '82848849', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:44:20.367', 'A', 2068);
INSERT INTO component VALUES (2070, 'B', 'G2', '26054062', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:04:36.679', 'G', 2068);
INSERT INTO location VALUES (2071, 'FG7', 2063);
INSERT INTO device VALUES (2072, 'C9', 'D', '72309370', '2013-05-28 05:54:42.488', false, 2071);
INSERT INTO component VALUES (2073, 'E', 'B3', '25609577', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:57:49.571', 'D', 2072);
INSERT INTO component VALUES (2074, 'E', 'G9', '20266004', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:23:52.457', 'E', 2072);
INSERT INTO device VALUES (2075, 'E5', 'C', '89122271', '2013-05-28 14:46:37.69', true, 2071);
INSERT INTO component VALUES (2076, 'A', 'C7', '32777032', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:42:11.94', 'A', 2075);
INSERT INTO component VALUES (2077, 'A', 'G3', '11785871', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:22:48.64', 'B', 2075);
INSERT INTO line VALUES (2078, 'I5 PreSeries', 'Series 8', 12, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2062);
INSERT INTO location VALUES (2079, 'EG2', 2078);
INSERT INTO device VALUES (2080, 'B8', 'F', '38222059', '2013-05-28 17:56:46.825', false, 2079);
INSERT INTO component VALUES (2081, 'A', 'H7', '44935063', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:10:47.638', 'B', 2080);
INSERT INTO component VALUES (2082, 'G', 'I5', '47018532', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:01:08.064', 'A', 2080);
INSERT INTO device VALUES (2083, 'D9', 'H', '21261497', '2013-05-27 22:34:49.462', false, 2079);
INSERT INTO component VALUES (2084, 'B', 'H5', '84206742', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:29:26.033', 'E', 2083);
INSERT INTO component VALUES (2085, 'C', 'D5', '5366821', 'Howard Joel Wolowitz', '2013-05-28 22:10:06.482', 'A', 2083);
INSERT INTO location VALUES (2086, 'EB1', 2078);
INSERT INTO device VALUES (2087, 'A1', 'F', '30723948', '2013-05-28 18:20:53.947', false, 2086);
INSERT INTO component VALUES (2088, 'C', 'I5', '68927706', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:21:50.71', 'A', 2087);
INSERT INTO component VALUES (2089, 'B', 'E8', '68567069', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:26:26.991', 'H', 2087);
INSERT INTO device VALUES (2090, 'C6', 'D', '38931993', '2013-05-28 11:44:43.772', false, 2086);
INSERT INTO component VALUES (2091, 'D', 'C1', '64220234', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:39:47.605', 'H', 2090);
INSERT INTO component VALUES (2092, 'I', 'G2', '23933407', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:25:27.892', 'G', 2090);
/*INSERT INTO hall VALUES (2093, 'D6', 300, 9367, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2);*/
INSERT INTO line VALUES (2094, 'D6 Assembly', 'Series 8', 3, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2093);
INSERT INTO location VALUES (2095, 'GG2', 2094);
INSERT INTO device VALUES (2096, 'A8', 'F', '52064919', '2013-05-28 20:36:21.314', false, 2095);
INSERT INTO component VALUES (2097, 'H', 'B7', '11847963', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:59:14.019', 'I', 2096);
INSERT INTO component VALUES (2098, 'F', 'E7', '13428555', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:02:40.101', 'G', 2096);
INSERT INTO device VALUES (2099, 'F9', 'D', '8118850', '2013-05-28 21:09:18.306', false, 2095);
INSERT INTO component VALUES (2100, 'F', 'F8', '23945922', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 20:20:11.128', 'G', 2099);
INSERT INTO component VALUES (2101, 'D', 'A2', '21678771', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:52:40.552', 'H', 2099);
INSERT INTO location VALUES (2102, 'CH1', 2094);
INSERT INTO device VALUES (2103, 'B7', 'D', '9415936', '2013-05-28 07:15:02.326', false, 2102);
INSERT INTO component VALUES (2104, 'D', 'G1', '40679810', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 20:36:55.402', 'E', 2103);
INSERT INTO component VALUES (2105, 'A', 'F3', '67794958', 'Howard Joel Wolowitz', '2013-05-28 13:49:20.224', 'D', 2103);
INSERT INTO device VALUES (2106, 'E7', 'A', '72527840', '2013-05-27 22:52:06.684', false, 2102);
INSERT INTO component VALUES (2107, 'G', 'D7', '4686830', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:52:30.817', 'C', 2106);
INSERT INTO component VALUES (2108, 'D', 'A4', '33722577', 'Howard Joel Wolowitz', '2013-05-28 13:40:43.128', 'H', 2106);
INSERT INTO line VALUES (2109, 'D6 PreSeries', 'Series 9', 57, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2093);
INSERT INTO location VALUES (2110, 'HG7', 2109);
INSERT INTO device VALUES (2111, 'I4', 'H', '63153978', '2013-05-28 10:18:19.452', false, 212031;
INSERT INTO component VALUES (2112, 'I', 'E5', '34374850', 'Howard Joel Wolowitz', '2013-05-28 09:40:10.285', 'F', 2111);
INSERT INTO component VALUES (2113, 'F', 'B2', '28337611', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:14:13.14', 'A', 2111);
INSERT INTO device VALUES (2114, 'C3', 'G', '15411241', '2013-05-28 19:46:42.001', false, 212031;
INSERT INTO component VALUES (2115, 'G', 'C4', '17278313', 'Howard Joel Wolowitz', '2013-05-28 03:42:44.959', 'C', 2114);
INSERT INTO component VALUES (2116, 'B', 'E1', '34632754', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:26:45.858', 'E', 2114);
INSERT INTO location VALUES (2117, 'CG9', 2109);
INSERT INTO device VALUES (2118, 'A5', 'E', '17676558', '2013-05-28 02:53:25.701', false, 2117);
INSERT INTO component VALUES (2119, 'I', 'D5', '52334665', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:10:20.801', 'A', 2118);
INSERT INTO component VALUES (2120, 'D', 'A3', '61395318', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:03:56.659', 'H', 2118);
INSERT INTO device VALUES (2121, 'E9', 'A', '1601751', '2013-05-28 07:37:47.912', false, 2117);
INSERT INTO component VALUES (2122, 'G', 'G3', '60392579', 'Howard Joel Wolowitz', '2013-05-28 00:44:01.448', 'I', 2121);
INSERT INTO component VALUES (2123, 'B', 'A7', '35730605', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:52:40.294', 'B', 2121);
INSERT INTO hall VALUES (2124, 'E8', 115, 1204, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO line VALUES (2125, 'E8 Assembly', 'Series 3', 70, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2124);
INSERT INTO location VALUES (2126, 'GD6', 2125);
INSERT INTO device VALUES (2127, 'H3', 'H', '33789423', '2013-05-28 17:34:25.216', false, 2126);
INSERT INTO component VALUES (2128, 'A', 'G8', '23853249', 'Howard Joel Wolowitz', '2013-05-28 02:37:25.642', 'B', 2127);
INSERT INTO component VALUES (2129, 'C', 'G2', '89172667', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:01:29.89', 'H', 2127);
INSERT INTO device VALUES (2130, 'A7', 'B', '56147249', '2013-05-28 15:41:44.194', true, 2126);
INSERT INTO component VALUES (2131, 'D', 'G4', '68596862', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:15:44.182', 'I', 2130);
INSERT INTO component VALUES (2132, 'G', 'H9', '55493399', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:53:58.646', 'A', 2130);
INSERT INTO location VALUES (2133, 'HA9', 2125);
INSERT INTO device VALUES (2134, 'G8', 'A', '28651582', '2013-05-28 20:50:02.744', false, 2133);
INSERT INTO component VALUES (2135, 'A', 'D8', '33300599', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:10:02.124', 'D', 2134);
INSERT INTO component VALUES (2136, 'I', 'C1', '68551390', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:38:13.951', 'C', 2134);
INSERT INTO device VALUES (2137, 'D6', 'I', '90605773', '2013-05-28 17:05:14.87', false, 2133);
INSERT INTO component VALUES (2138, 'H', 'C7', '65602922', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:03:19.847', 'H', 2137);
INSERT INTO component VALUES (2139, 'B', 'H5', '42821920', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:23:30.235', 'E', 2137);
INSERT INTO line VALUES (2140, 'E8 PreSeries', 'Series 2', 24, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2124);
INSERT INTO location VALUES (2141, 'DC8', 2140);
INSERT INTO device VALUES (2142, 'C5', 'C', '57174659', '2013-05-28 16:45:10.041', false, 2141);
INSERT INTO component VALUES (2143, 'F', 'I8', '69326109', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:06:49.913', 'F', 2142);
INSERT INTO component VALUES (2144, 'E', 'I8', '62733099', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:25:24.182', 'E', 2142);
INSERT INTO device VALUES (2145, 'C1', 'H', '48731149', '2013-05-28 05:35:33.24', true, 2141);
INSERT INTO component VALUES (2146, 'I', 'E7', '25265727', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:30:31.756', 'E', 2145);
INSERT INTO component VALUES (2147, 'H', 'F6', '56350256', 'Howard Joel Wolowitz', '2013-05-28 09:21:13.004', 'B', 2145);
INSERT INTO location VALUES (2148, 'GD5', 2140);
INSERT INTO device VALUES (2149, 'C8', 'F', '12807972', '2013-05-28 13:55:36.266', false, 2148);
INSERT INTO component VALUES (2150, 'F', 'D8', '93879949', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:07:27.444', 'F', 2149);
INSERT INTO component VALUES (2151, 'I', 'B2', '5303705', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:05:53.692', 'I', 2149);
INSERT INTO device VALUES (2152, 'E7', 'H', '43832244', '2013-05-28 00:54:45.324', false, 2148);
INSERT INTO component VALUES (2153, 'B', 'F3', '8220767', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:13:43.52', 'A', 2152);
INSERT INTO component VALUES (2154, 'B', 'B2', '38245397', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:38:19.28', 'I', 2152);
INSERT INTO hall VALUES (2155, 'F5', 653, 2689, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO line VALUES (2156, 'F5 Assembly', 'Series 4', 14, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2155);
INSERT INTO location VALUES (2157, 'BF9', 2156);
INSERT INTO device VALUES (2158, 'H4', 'A', '21695206', '2013-05-27 23:22:30.254', false, 2157);
INSERT INTO component VALUES (2159, 'D', 'H3', '2577078', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:09:25.912', 'G', 2158);
INSERT INTO component VALUES (2160, 'A', 'A4', '6597348', 'Howard Joel Wolowitz', '2013-05-28 13:19:04.602', 'A', 2158);
INSERT INTO device VALUES (2161, 'I5', 'D', '36235454', '2013-05-28 17:38:57.499', false, 2157);
INSERT INTO component VALUES (2162, 'B', 'H9', '82393337', 'Howard Joel Wolowitz', '2013-05-28 01:10:15.974', 'D', 2161);
INSERT INTO component VALUES (2163, 'C', 'I6', '50682365', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:58:29.588', 'A', 2161);
INSERT INTO location VALUES (2164, 'BF4', 2156);
INSERT INTO device VALUES (2165, 'I3', 'D', '39526367', '2013-05-28 09:52:21.085', false, 2164);
INSERT INTO component VALUES (2166, 'E', 'B2', '72710158', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:38:25.212', 'D', 2165);
INSERT INTO component VALUES (2167, 'F', 'B9', '93298886', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:34:11.897', 'H', 2165);
INSERT INTO device VALUES (2168, 'D4', 'E', '92354254', '2013-05-28 01:17:17.658', false, 2164);
INSERT INTO component VALUES (2169, 'C', 'A8', '10608842', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:57:56.985', 'C', 2168);
INSERT INTO component VALUES (2170, 'C', 'I3', '42684245', 'Howard Joel Wolowitz', '2013-05-28 17:40:46.397', 'B', 2168);
INSERT INTO line VALUES (2171, 'F5 PreSeries', 'Series 5', 28, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2155);
INSERT INTO location VALUES (2172, 'FA1', 2171);
INSERT INTO device VALUES (2173, 'A2', 'A', '46627464', '2013-05-28 05:59:22.122', false, 2172);
INSERT INTO component VALUES (2174, 'B', 'G3', '36764090', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:28:55.529', 'C', 2173);
INSERT INTO component VALUES (2175, 'I', 'A4', '3775000', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:56:18.327', 'B', 2173);
INSERT INTO device VALUES (2176, 'F7', 'I', '50115484', '2013-05-28 04:53:32.346', false, 2172);
INSERT INTO component VALUES (2177, 'H', 'I4', '69087628', 'Howard Joel Wolowitz', '2013-05-28 02:19:58.227', 'I', 2176);
INSERT INTO component VALUES (2178, 'A', 'I3', '44258796', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:41:38.234', 'E', 2176);
INSERT INTO location VALUES (2179, 'BF8', 2171);
INSERT INTO device VALUES (2180, 'D4', 'H', '76815621', '2013-05-28 06:08:51.74', false, 2179);
INSERT INTO component VALUES (2181, 'D', 'C3', '59117696', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:27:37.954', 'B', 2180);
INSERT INTO component VALUES (2182, 'B', 'H1', '83494346', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:15:12.163', 'I', 2180);
INSERT INTO device VALUES (2183, 'H3', 'G', '37700958', '2013-05-28 06:22:59.441', false, 2179);
INSERT INTO component VALUES (2184, 'D', 'H9', '53296006', 'Howard Joel Wolowitz', '2013-05-28 19:44:39.41', 'I', 2183);
INSERT INTO component VALUES (2185, 'D', 'G9', '15346607', 'Howard Joel Wolowitz', '2013-05-27 22:19:09.924', 'G', 2183);
INSERT INTO hall VALUES (2186, 'G6', 807, 3375, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO line VALUES (2187, 'G6 Assembly', 'Series 3', 58, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2186);
INSERT INTO location VALUES (2188, 'CE2', 2187);
INSERT INTO device VALUES (2189, 'G8', 'I', '49672918', '2013-05-28 16:50:10.209', false, 2188);
INSERT INTO component VALUES (2190, 'F', 'G4', '22062986', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:37:04.453', 'I', 2189);
INSERT INTO component VALUES (2191, 'A', 'E8', '85284695', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:33:27.007', 'D', 2189);
INSERT INTO device VALUES (2192, 'B4', 'H', '3266649', '2013-05-28 11:04:57.627', false, 2188);
INSERT INTO component VALUES (2193, 'F', 'B4', '12289056', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 00:51:25.804', 'G', 2192);
INSERT INTO component VALUES (2194, 'C', 'I1', '11728337', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:05:21.835', 'C', 2192);
INSERT INTO location VALUES (2195, 'AD7', 2187);
INSERT INTO device VALUES (2196, 'B6', 'A', '95775326', '2013-05-28 06:00:45.472', false, 2195);
INSERT INTO component VALUES (2197, 'B', 'A6', '41398406', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:17:52.667', 'G', 2196);
INSERT INTO component VALUES (2198, 'H', 'B8', '48143685', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:06:20.376', 'D', 2196);
INSERT INTO device VALUES (2199, 'E3', 'D', '67406468', '2013-05-28 19:17:38.589', false, 2195);
INSERT INTO component VALUES (2200, 'F', 'F4', '40749420', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:42:20.579', 'C', 2199);
INSERT INTO component VALUES (2201, 'I', 'B4', '15852914', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:10:47.875', 'I', 2199);
INSERT INTO line VALUES (2202, 'G6 PreSeries', 'Series 3', 14, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2186);
INSERT INTO location VALUES (2203, 'IA5', 2202);
INSERT INTO device VALUES (2204, 'E3', 'A', '69661040', '2013-05-28 06:55:04.84', false, 2203);
INSERT INTO component VALUES (2205, 'H', 'A9', '74527176', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:56:09.999', 'I', 2204);
INSERT INTO component VALUES (2206, 'A', 'F8', '49256336', 'Howard Joel Wolowitz', '2013-05-28 08:21:52.8', 'B', 2204);
INSERT INTO device VALUES (2207, 'C3', 'B', '93683531', '2013-05-28 15:51:18.536', false, 2203);
INSERT INTO component VALUES (2208, 'E', 'G4', '13100354', 'Howard Joel Wolowitz', '2013-05-28 07:29:47.171', 'A', 2207);
INSERT INTO component VALUES (2209, 'A', 'H4', '83334718', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:28:45.104', 'C', 2207);
INSERT INTO location VALUES (2210, 'IA7', 2202);
INSERT INTO device VALUES (2211, 'D9', 'H', '16899979', '2013-05-28 17:30:28.091', false, 222031;
INSERT INTO component VALUES (2212, 'D', 'F9', '6093185', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 21:54:14.567', 'C', 2211);
INSERT INTO component VALUES (2213, 'F', 'D2', '46660029', 'Howard Joel Wolowitz', '2013-05-28 09:33:13.507', 'F', 2211);
INSERT INTO device VALUES (2214, 'D8', 'I', '91240893', '2013-05-28 10:40:34.622', false, 222031;
INSERT INTO component VALUES (2215, 'B', 'F8', '40554966', 'Howard Joel Wolowitz', '2013-05-28 02:09:36.193', 'I', 2214);
INSERT INTO component VALUES (2216, 'A', 'G6', '29887691', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:39:59.36', 'D', 2214);
INSERT INTO hall VALUES (2217, 'G9', 518, 3628, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO line VALUES (2218, 'G9 Assembly', 'Series 9', 12, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2217);
INSERT INTO location VALUES (2219, 'CD7', 2218);
INSERT INTO device VALUES (2220, 'A1', 'B', '64507591', '2013-05-28 21:01:20.276', false, 2219);
INSERT INTO component VALUES (2221, 'D', 'F6', '87727179', 'Howard Joel Wolowitz', '2013-05-28 03:25:38.593', 'E', 2220);
INSERT INTO component VALUES (2222, 'G', 'H8', '42915285', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:42:12.716', 'G', 2220);
INSERT INTO device VALUES (2223, 'F8', 'H', '17499575', '2013-05-28 18:43:12.959', false, 2219);
INSERT INTO component VALUES (2224, 'D', 'C9', '11045502', 'Howard Joel Wolowitz', '2013-05-28 03:28:17.152', 'H', 2223);
INSERT INTO component VALUES (2225, 'G', 'A9', '83168804', 'Howard Joel Wolowitz', '2013-05-28 15:35:25.287', 'D', 2223);
INSERT INTO location VALUES (2226, 'FA8', 2218);
INSERT INTO device VALUES (2227, 'H3', 'G', '12425491', '2013-05-28 03:46:35.219', false, 2226);
INSERT INTO component VALUES (2228, 'C', 'F3', '54596623', 'Howard Joel Wolowitz', '2013-05-28 08:13:22.189', 'E', 2227);
INSERT INTO component VALUES (2229, 'B', 'H7', '2895889', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:44:05.292', 'B', 2227);
INSERT INTO device VALUES (2230, 'B6', 'E', '31480218', '2013-05-28 03:48:42.375', false, 2226);
INSERT INTO component VALUES (2231, 'G', 'B3', '14535434', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 20:58:35.072', 'C', 2230);
INSERT INTO component VALUES (2232, 'E', 'C2', '53216933', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 17:07:51.116', 'E', 2230);
INSERT INTO line VALUES (2233, 'G9 PreSeries', 'Series 5', 56, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2217);
INSERT INTO location VALUES (2234, 'AF6', 2233);
INSERT INTO device VALUES (2235, 'G7', 'I', '20982563', '2013-05-28 18:57:48.535', false, 2234);
INSERT INTO component VALUES (2236, 'F', 'D1', '34551694', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:40:36.569', 'G', 2235);
INSERT INTO component VALUES (2237, 'C', 'C8', '496453', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:15:51.459', 'F', 2235);
INSERT INTO device VALUES (2238, 'C6', 'B', '7527238', '2013-05-28 17:28:48.254', false, 2234);
INSERT INTO component VALUES (2239, 'D', 'G5', '34268528', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:02:03.621', 'I', 2238);
INSERT INTO component VALUES (2240, 'I', 'C8', '50268587', 'Howard Joel Wolowitz', '2013-05-28 13:14:44.777', 'D', 2238);
INSERT INTO location VALUES (2241, 'CG4', 2233);
INSERT INTO device VALUES (2242, 'B3', 'A', '48221749', '2013-05-28 03:42:23.946', false, 2241);
INSERT INTO component VALUES (2243, 'I', 'I3', '19052414', 'Howard Joel Wolowitz', '2013-05-28 19:50:41.067', 'D', 2242);
INSERT INTO component VALUES (2244, 'G', 'F3', '67147754', 'Howard Joel Wolowitz', '2013-05-28 20:55:31.564', 'E', 2242);
INSERT INTO device VALUES (2245, 'E5', 'H', '75881479', '2013-05-27 23:32:49.125', false, 2241);
INSERT INTO component VALUES (2246, 'D', 'D6', '13593343', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:15:37.936', 'A', 2245);
INSERT INTO component VALUES (2247, 'A', 'E7', '26210668', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:13:35.684', 'B', 2245);
INSERT INTO hall VALUES (2248, 'C8', 136, 493, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO line VALUES (2249, 'C8 Assembly', 'Series 9', 85, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2248);
INSERT INTO location VALUES (2250, 'EE7', 2249);
INSERT INTO device VALUES (2251, 'F6', 'G', '35570650', '2013-05-28 10:43:41.886', false, 2250);
INSERT INTO component VALUES (2252, 'D', 'H3', '70266191', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:16:18.695', 'G', 2251);
INSERT INTO component VALUES (2253, 'C', 'F7', '83152743', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:34:46.668', 'C', 2251);
INSERT INTO device VALUES (2254, 'I6', 'E', '90210211', '2013-05-28 20:01:03.125', false, 2250);
INSERT INTO component VALUES (2255, 'F', 'G2', '29403906', 'Howard Joel Wolowitz', '2013-05-28 18:57:09.732', 'A', 2254);
INSERT INTO component VALUES (2256, 'C', 'H6', '60245607', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:54:44.128', 'B', 2254);
INSERT INTO location VALUES (2257, 'IA6', 2249);
INSERT INTO device VALUES (2258, 'I2', 'C', '37776323', '2013-05-28 12:22:24.351', false, 2257);
INSERT INTO component VALUES (2259, 'H', 'D5', '68224693', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:45:30.722', 'I', 2258);
INSERT INTO component VALUES (2260, 'E', 'D2', '90266692', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:47:23.531', 'F', 2258);
INSERT INTO device VALUES (2261, 'E5', 'A', '85702325', '2013-05-28 15:03:01.29', false, 2257);
INSERT INTO component VALUES (2262, 'F', 'I8', '94239039', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:56:21.339', 'B', 2261);
INSERT INTO component VALUES (2263, 'I', 'F7', '36479919', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:18:56.923', 'E', 2261);
INSERT INTO line VALUES (2264, 'C8 PreSeries', 'Series 8', 71, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2248);
INSERT INTO location VALUES (2265, 'BE7', 2264);
INSERT INTO device VALUES (2266, 'A1', 'B', '41721407', '2013-05-28 13:46:19.897', false, 2265);
INSERT INTO component VALUES (2267, 'I', 'H6', '45372880', 'Howard Joel Wolowitz', '2013-05-28 22:08:02.803', 'D', 2266);
INSERT INTO component VALUES (2268, 'E', 'F6', '21507875', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:02:45.661', 'F', 2266);
INSERT INTO device VALUES (2269, 'E7', 'C', '20328203', '2013-05-28 19:51:33.258', false, 2265);
INSERT INTO component VALUES (2270, 'F', 'G8', '7851734', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:28:00.607', 'B', 2269);
INSERT INTO component VALUES (2271, 'C', 'I4', '67119197', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:13:15.059', 'D', 2269);
INSERT INTO location VALUES (2272, 'BI8', 2264);
INSERT INTO device VALUES (2273, 'C8', 'F', '81598931', '2013-05-28 01:38:53.754', false, 2272);
INSERT INTO component VALUES (2274, 'H', 'D6', '89136642', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:01:10.465', 'A', 2273);
INSERT INTO component VALUES (2275, 'G', 'C8', '49579124', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:05:46.688', 'B', 2273);
INSERT INTO device VALUES (2276, 'H1', 'I', '61230635', '2013-05-28 17:46:47.682', true, 2272);
INSERT INTO component VALUES (2277, 'F', 'F3', '44818313', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:12:39.732', 'B', 2276);
INSERT INTO component VALUES (2278, 'F', 'H1', '41192025', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:25:03.52', 'B', 2276);
INSERT INTO hall VALUES (2279, 'A6', 472, 4081, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO line VALUES (2280, 'A6 Assembly', 'Series 2', 4, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2279);
INSERT INTO location VALUES (2281, 'EH2', 2280);
INSERT INTO device VALUES (2282, 'G1', 'E', '75646351', '2013-05-28 18:23:05.726', false, 2281);
INSERT INTO component VALUES (2283, 'B', 'C2', '87600038', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:13:52.487', 'D', 2282);
INSERT INTO component VALUES (2284, 'H', 'B7', '65443697', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:30:52.653', 'A', 2282);
INSERT INTO device VALUES (2285, 'B4', 'I', '28777389', '2013-05-28 08:54:26.107', false, 2281);
INSERT INTO component VALUES (2286, 'A', 'C7', '2188874', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:49:01.677', 'H', 2285);
INSERT INTO component VALUES (2287, 'G', 'B6', '11759287', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:18:34.839', 'C', 2285);
INSERT INTO location VALUES (2288, 'DH4', 2280);
INSERT INTO device VALUES (2289, 'H6', 'E', '51860354', '2013-05-28 18:46:40.619', false, 2288);
INSERT INTO component VALUES (2290, 'C', 'F1', '18078513', 'Howard Joel Wolowitz', '2013-05-28 12:49:30.584', 'C', 2289);
INSERT INTO component VALUES (2291, 'I', 'G7', '70173395', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:18:14.243', 'A', 2289);
INSERT INTO device VALUES (2292, 'H7', 'C', '33654829', '2013-05-28 16:28:20.934', false, 2288);
INSERT INTO component VALUES (2293, 'C', 'F3', '93800592', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:56:34.533', 'D', 2292);
INSERT INTO component VALUES (2294, 'E', 'G9', '69700674', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:41:38.333', 'H', 2292);
INSERT INTO line VALUES (2295, 'A6 PreSeries', 'Series 4', 73, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2279);
INSERT INTO location VALUES (2296, 'DD9', 2295);
INSERT INTO device VALUES (2297, 'G4', 'F', '20232699', '2013-05-28 19:45:37.402', false, 2296);
INSERT INTO component VALUES (2298, 'B', 'A7', '6835715', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:09:09.472', 'D', 2297);
INSERT INTO component VALUES (2299, 'D', 'G6', '11170590', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:52:36.565', 'H', 2297);
INSERT INTO device VALUES (2300, 'D1', 'B', '47586579', '2013-05-28 02:40:15.133', false, 2296);
INSERT INTO component VALUES (2301, 'D', 'I8', '1159374', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:17:26.827', 'A', 2300);
INSERT INTO component VALUES (2302, 'F', 'H8', '1029385', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:01:52.291', 'E', 2300);
INSERT INTO location VALUES (2303, 'EB7', 2295);
INSERT INTO device VALUES (2304, 'B4', 'G', '70997832', '2013-05-28 16:41:25.43', false, 2303);
INSERT INTO component VALUES (2305, 'G', 'A9', '933343', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 05:33:14.667', 'F', 2304);
INSERT INTO component VALUES (2306, 'B', 'B3', '29577360', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:13:42.012', 'C', 2304);
INSERT INTO device VALUES (2307, 'F7', 'F', '29399424', '2013-05-28 17:37:40.11', false, 2303);
INSERT INTO component VALUES (2308, 'G', 'I8', '34779090', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:01:38.545', 'H', 2307);
INSERT INTO component VALUES (2309, 'I', 'A6', '49205922', 'Howard Joel Wolowitz', '2013-05-28 15:32:07.956', 'A', 2307);
INSERT INTO hall VALUES (2310, 'B6', 210, 6113, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO line VALUES (2311, 'B6 Assembly', 'Series 2', 72, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 232031;
INSERT INTO location VALUES (2312, 'DH1', 2311);
INSERT INTO device VALUES (2313, 'H9', 'F', '3785604', '2013-05-27 23:15:15.103', false, 2312);
INSERT INTO component VALUES (2314, 'I', 'E5', '62350296', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:31:42.436', 'H', 2313);
INSERT INTO component VALUES (2315, 'I', 'C4', '57987399', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:01:58.076', 'F', 2313);
INSERT INTO device VALUES (2316, 'E4', 'I', '16182396', '2013-05-28 00:20:53.342', false, 2312);
INSERT INTO component VALUES (2317, 'A', 'B1', '77303064', 'Howard Joel Wolowitz', '2013-05-28 01:36:51.955', 'D', 2316);
INSERT INTO component VALUES (2318, 'H', 'H7', '16162843', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:56:19.014', 'B', 2316);
INSERT INTO location VALUES (2319, 'II3', 2311);
INSERT INTO device VALUES (2320, 'B5', 'F', '77892189', '2013-05-28 19:26:28.068', false, 2319);
INSERT INTO component VALUES (2321, 'F', 'B7', '28450346', 'Howard Joel Wolowitz', '2013-05-28 16:50:42.162', 'G', 2320);
INSERT INTO component VALUES (2322, 'E', 'D2', '85553014', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:14:20.713', 'C', 2320);
INSERT INTO device VALUES (2323, 'I1', 'I', '15087687', '2013-05-28 06:38:51.982', false, 2319);
INSERT INTO component VALUES (2324, 'E', 'I1', '9484006', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:08:32.925', 'B', 2323);
INSERT INTO component VALUES (2325, 'G', 'C5', '35695763', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:03:07.734', 'D', 2323);
INSERT INTO line VALUES (2326, 'B6 PreSeries', 'Series 5', 12, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 232031;
INSERT INTO location VALUES (2327, 'AF8', 2326);
INSERT INTO device VALUES (2328, 'A1', 'E', '77580369', '2013-05-28 21:38:58.324', false, 2327);
INSERT INTO component VALUES (2329, 'C', 'B8', '94588268', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:44:22.65', 'G', 2328);
INSERT INTO component VALUES (2330, 'E', 'A7', '89155385', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:10:31.533', 'D', 2328);
INSERT INTO device VALUES (2331, 'F6', 'G', '6020849', '2013-05-28 03:34:57.379', false, 2327);
INSERT INTO component VALUES (2332, 'G', 'C6', '99210960', 'Howard Joel Wolowitz', '2013-05-28 21:30:19.267', 'F', 2331);
INSERT INTO component VALUES (2333, 'I', 'I1', '36892685', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:18:34.872', 'D', 2331);
INSERT INTO location VALUES (2334, 'ID3', 2326);
INSERT INTO device VALUES (2335, 'G2', 'H', '76344749', '2013-05-27 22:47:07.275', false, 2334);
INSERT INTO component VALUES (2336, 'B', 'I6', '29946458', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:46:17.805', 'A', 2335);
INSERT INTO component VALUES (2337, 'B', 'B2', '68910900', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:56:30.495', 'A', 2335);
INSERT INTO device VALUES (2338, 'I4', 'E', '4449818', '2013-05-28 18:31:38.051', false, 2334);
INSERT INTO component VALUES (2339, 'B', 'E6', '75362463', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:16:44.897', 'F', 2338);
INSERT INTO component VALUES (2340, 'I', 'D1', '71946547', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:30:59.019', 'C', 2338);
INSERT INTO hall VALUES (2341, 'C7', 938, 8132, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO line VALUES (2342, 'C7 Assembly', 'Series 4', 16, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2341);
INSERT INTO location VALUES (2343, 'GA2', 2342);
INSERT INTO device VALUES (2344, 'G4', 'G', '53834025', '2013-05-28 03:23:17.344', false, 2343);
INSERT INTO component VALUES (2345, 'A', 'I3', '73075146', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 02:06:55.666', 'G', 2344);
INSERT INTO component VALUES (2346, 'H', 'D2', '40070645', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:34:36.857', 'D', 2344);
INSERT INTO device VALUES (2347, 'I6', 'D', '5302849', '2013-05-28 06:28:06.624', false, 2343);
INSERT INTO component VALUES (2348, 'F', 'I4', '18701119', 'Howard Joel Wolowitz', '2013-05-28 20:16:23.666', 'F', 2347);
INSERT INTO component VALUES (2349, 'E', 'E8', '37027059', 'Howard Joel Wolowitz', '2013-05-28 16:13:46.128', 'F', 2347);
INSERT INTO location VALUES (2350, 'DE8', 2342);
INSERT INTO device VALUES (2351, 'H3', 'E', '17530487', '2013-05-28 13:13:56.781', false, 2350);
INSERT INTO component VALUES (2352, 'F', 'H6', '58159985', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:29:28.618', 'G', 2351);
INSERT INTO component VALUES (2353, 'B', 'F6', '27589139', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:05:44.099', 'G', 2351);
INSERT INTO device VALUES (2354, 'D5', 'C', '74715350', '2013-05-28 07:27:55.132', false, 2350);
INSERT INTO component VALUES (2355, 'I', 'B3', '98109087', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:34:21.862', 'G', 2354);
INSERT INTO component VALUES (2356, 'E', 'H1', '67254637', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:14:34.371', 'C', 2354);
INSERT INTO line VALUES (2357, 'C7 PreSeries', 'Series 7', 85, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2341);
INSERT INTO location VALUES (2358, 'DH4', 2357);
INSERT INTO device VALUES (2359, 'B8', 'F', '53724509', '2013-05-28 09:32:19.231', false, 2358);
INSERT INTO component VALUES (2360, 'I', 'E5', '55934071', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:36:17.718', 'A', 2359);
INSERT INTO component VALUES (2361, 'C', 'H1', '68310421', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:34:33.026', 'H', 2359);
INSERT INTO device VALUES (2362, 'I3', 'D', '40888850', '2013-05-28 06:13:51.85', false, 2358);
INSERT INTO component VALUES (2363, 'A', 'D3', '12799334', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:42:19.383', 'C', 2362);
INSERT INTO component VALUES (2364, 'D', 'C1', '63238767', 'Howard Joel Wolowitz', '2013-05-28 07:58:07.894', 'G', 2362);
INSERT INTO location VALUES (2365, 'AG3', 2357);
INSERT INTO device VALUES (2366, 'F7', 'I', '3532751', '2013-05-28 04:39:09.483', false, 2365);
INSERT INTO component VALUES (2367, 'E', 'C7', '11615199', 'Howard Joel Wolowitz', '2013-05-28 11:27:55.435', 'H', 2366);
INSERT INTO component VALUES (2368, 'F', 'I6', '66398638', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 05:21:56.998', 'A', 2366);
INSERT INTO device VALUES (2369, 'D7', 'A', '55299890', '2013-05-28 11:26:27.578', false, 2365);
INSERT INTO component VALUES (2370, 'H', 'I9', '12262895', 'Howard Joel Wolowitz', '2013-05-28 06:07:04.945', 'H', 2369);
INSERT INTO component VALUES (2371, 'H', 'H9', '98992705', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:18:49.606', 'C', 2369);
INSERT INTO hall VALUES (2372, 'D9', 34, 3666, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO line VALUES (2373, 'D9 Assembly', 'Series 2', 23, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2372);
INSERT INTO location VALUES (2374, 'IA3', 2373);
INSERT INTO device VALUES (2375, 'H9', 'E', '64409979', '2013-05-28 20:10:36.559', true, 2374);
INSERT INTO component VALUES (2376, 'H', 'A9', '92581075', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 12:54:51.705', 'B', 2375);
INSERT INTO component VALUES (2377, 'E', 'H4', '94280141', 'Howard Joel Wolowitz', '2013-05-28 04:02:13.964', 'C', 2375);
INSERT INTO device VALUES (2378, 'E8', 'F', '88166213', '2013-05-28 20:30:41.278', false, 2374);
INSERT INTO component VALUES (2379, 'F', 'E5', '55935072', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:13:19.553', 'H', 2378);
INSERT INTO component VALUES (2380, 'C', 'E4', '73482270', 'Howard Joel Wolowitz', '2013-05-28 01:50:47.179', 'I', 2378);
INSERT INTO location VALUES (2381, 'CG3', 2373);
INSERT INTO device VALUES (2382, 'G9', 'I', '54468889', '2013-05-28 19:10:59.102', false, 2381);
INSERT INTO component VALUES (2383, 'C', 'G9', '16134826', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:41:53.843', 'I', 2382);
INSERT INTO component VALUES (2384, 'D', 'G5', '79135583', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:19:41.047', 'H', 2382);
INSERT INTO device VALUES (2385, 'H7', 'I', '28362217', '2013-05-28 20:00:07.21', false, 2381);
INSERT INTO component VALUES (2386, 'B', 'F7', '60755782', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:31:37.626', 'E', 2385);
INSERT INTO component VALUES (2387, 'F', 'G7', '71653069', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:32:59.04', 'H', 2385);
INSERT INTO line VALUES (2388, 'D9 PreSeries', 'Series 3', 27, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2372);
INSERT INTO location VALUES (2389, 'DI6', 2388);
INSERT INTO device VALUES (2390, 'C7', 'F', '87097941', '2013-05-28 08:13:42.612', false, 2389);
INSERT INTO component VALUES (2391, 'E', 'G1', '41999007', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 23:08:14.843', 'I', 2390);
INSERT INTO component VALUES (2392, 'I', 'E7', '42572972', 'Howard Joel Wolowitz', '2013-05-28 20:21:03.953', 'H', 2390);
INSERT INTO device VALUES (2393, 'F9', 'I', '56546778', '2013-05-28 13:10:11.974', false, 2389);
INSERT INTO component VALUES (2394, 'G', 'H4', '80489362', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:15:07.227', 'D', 2393);
INSERT INTO component VALUES (2395, 'B', 'B6', '84359515', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 21:04:28.937', 'A', 2393);
INSERT INTO location VALUES (2396, 'FF6', 2388);
INSERT INTO device VALUES (2397, 'A5', 'I', '74220551', '2013-05-28 00:54:46.252', false, 2396);
INSERT INTO component VALUES (2398, 'B', 'A1', '7452073', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:22:02.479', 'C', 2397);
INSERT INTO component VALUES (2399, 'G', 'B1', '49332095', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:34:35.347', 'A', 2397);
INSERT INTO device VALUES (2400, 'H1', 'G', '12549677', '2013-05-28 07:31:40.956', false, 2396);
INSERT INTO component VALUES (2401, 'E', 'A3', '67234344', 'Howard Joel Wolowitz', '2013-05-28 09:19:28.145', 'I', 2400);
INSERT INTO component VALUES (2402, 'G', 'A4', '89314316', 'Howard Joel Wolowitz', '2013-05-28 17:32:20.345', 'B', 2400);
INSERT INTO hall VALUES (2403, 'E1', 929, 6414, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO line VALUES (2404, 'E1 Assembly', 'Series 7', 5, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2403);
INSERT INTO location VALUES (2405, 'IA7', 2404);
INSERT INTO device VALUES (2406, 'G8', 'F', '77612253', '2013-05-27 23:24:46.746', false, 2405);
INSERT INTO component VALUES (2407, 'F', 'H4', '66103610', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:52:58.854', 'D', 2406);
INSERT INTO component VALUES (2408, 'I', 'G4', '12795753', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 06:23:55.664', 'D', 2406);
INSERT INTO device VALUES (2409, 'C9', 'G', '14488549', '2013-05-28 13:57:10.593', false, 2405);
INSERT INTO component VALUES (2410, 'H', 'E5', '53742241', 'Howard Joel Wolowitz', '2013-05-28 19:35:11.614', 'F', 2409);
INSERT INTO component VALUES (2411, 'E', 'F8', '15089104', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:37:45.565', 'A', 2409);
INSERT INTO location VALUES (2412, 'ID2', 2404);
INSERT INTO device VALUES (2413, 'I5', 'F', '13938290', '2013-05-28 21:19:47.187', false, 2412);
INSERT INTO component VALUES (2414, 'A', 'I8', '77212045', 'Howard Joel Wolowitz', '2013-05-27 22:21:00.327', 'A', 2413);
INSERT INTO component VALUES (2415, 'H', 'C8', '15374342', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 05:09:27.602', 'C', 2413);
INSERT INTO device VALUES (2416, 'F8', 'B', '16944636', '2013-05-28 08:07:56.79', false, 2412);
INSERT INTO component VALUES (2417, 'B', 'D6', '92276624', 'Howard Joel Wolowitz', '2013-05-28 19:07:56.47', 'G', 2416);
INSERT INTO component VALUES (2418, 'A', 'E5', '29860721', 'Howard Joel Wolowitz', '2013-05-28 01:26:48.306', 'B', 2416);
INSERT INTO line VALUES (2419, 'E1 PreSeries', 'Series 2', 36, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2403);
INSERT INTO location VALUES (2420, 'DC4', 2419);
INSERT INTO device VALUES (2421, 'B8', 'A', '91292102', '2013-05-28 11:25:32.678', true, 2420);
INSERT INTO component VALUES (2422, 'A', 'E3', '43921997', 'Howard Joel Wolowitz', '2013-05-28 06:37:35.827', 'C', 2421);
INSERT INTO component VALUES (2423, 'E', 'F8', '60190851', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:08:18.974', 'G', 2421);
INSERT INTO device VALUES (2424, 'A9', 'G', '55504420', '2013-05-28 12:39:20.722', false, 2420);
INSERT INTO component VALUES (2425, 'F', 'I2', '71494862', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:45:23.247', 'D', 2424);
INSERT INTO component VALUES (2426, 'H', 'E7', '3826478', 'Howard Joel Wolowitz', '2013-05-28 13:10:05.63', 'G', 2424);
INSERT INTO location VALUES (2427, 'AD6', 2419);
INSERT INTO device VALUES (2428, 'F3', 'D', '53118211', '2013-05-28 02:39:05.176', false, 2427);
INSERT INTO component VALUES (2429, 'C', 'H5', '68187263', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:20:13.471', 'B', 2428);
INSERT INTO component VALUES (2430, 'D', 'G6', '89954889', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:15:35.911', 'C', 2428);
INSERT INTO device VALUES (2431, 'H3', 'A', '81194914', '2013-05-28 04:56:36.624', false, 2427);
INSERT INTO component VALUES (2432, 'E', 'C5', '90103700', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:25:01.447', 'B', 2431);
INSERT INTO component VALUES (2433, 'G', 'C9', '57611746', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:33:05.548', 'F', 2431);
INSERT INTO hall VALUES (2434, 'B1', 904, 5162, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO line VALUES (2435, 'B1 Assembly', 'Series 3', 66, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2434);
INSERT INTO location VALUES (2436, 'DA7', 2435);
INSERT INTO device VALUES (2437, 'H5', 'D', '24615967', '2013-05-28 02:39:09.874', false, 2436);
INSERT INTO component VALUES (2438, 'H', 'A2', '25997074', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:10:35.715', 'E', 2437);
INSERT INTO component VALUES (2439, 'I', 'A1', '35034573', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:06:30.336', 'B', 2437);
INSERT INTO device VALUES (2440, 'F8', 'I', '82359204', '2013-05-28 13:04:37.32', false, 2436);
INSERT INTO component VALUES (2441, 'A', 'B7', '35400643', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:55:37.489', 'C', 2440);
INSERT INTO component VALUES (2442, 'C', 'A6', '8813348', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:45:57.446', 'G', 2440);
INSERT INTO location VALUES (2443, 'GD4', 2435);
INSERT INTO device VALUES (2444, 'H4', 'F', '18144273', '2013-05-28 17:26:02.532', false, 2443);
INSERT INTO component VALUES (2445, 'D', 'G2', '61746256', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:47:19.501', 'H', 2444);
INSERT INTO component VALUES (2446, 'F', 'I5', '10374206', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:17:02.79', 'B', 2444);
INSERT INTO device VALUES (2447, 'D9', 'C', '51374789', '2013-05-28 00:30:18.62', false, 2443);
INSERT INTO component VALUES (2448, 'I', 'G9', '68770071', 'Howard Joel Wolowitz', '2013-05-28 04:47:54.971', 'F', 2447);
INSERT INTO component VALUES (2449, 'G', 'G7', '9123914', 'Howard Joel Wolowitz', '2013-05-28 20:29:46.385', 'A', 2447);
INSERT INTO line VALUES (2450, 'B1 PreSeries', 'Series 7', 44, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2434);
INSERT INTO location VALUES (2451, 'HB3', 2450);
INSERT INTO device VALUES (2452, 'F6', 'H', '77982509', '2013-05-28 05:07:14.302', false, 2451);
INSERT INTO component VALUES (2453, 'G', 'H1', '82907828', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:27:03.203', 'I', 2452);
INSERT INTO component VALUES (2454, 'C', 'F7', '77135739', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 06:24:37.155', 'H', 2452);
INSERT INTO device VALUES (2455, 'D5', 'I', '15551129', '2013-05-28 03:21:57.056', false, 2451);
INSERT INTO component VALUES (2456, 'G', 'E5', '26161688', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:35:23.49', 'C', 2455);
INSERT INTO component VALUES (2457, 'E', 'H6', '16054408', 'Howard Joel Wolowitz', '2013-05-28 14:32:46.456', 'F', 2455);
INSERT INTO location VALUES (2458, 'IG3', 2450);
INSERT INTO device VALUES (2459, 'C1', 'I', '19927034', '2013-05-28 19:10:11.065', false, 2458);
INSERT INTO component VALUES (2460, 'C', 'H4', '77497773', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:19:59.124', 'B', 2459);
INSERT INTO component VALUES (2461, 'F', 'F8', '5700098', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 02:39:54.76', 'I', 2459);
INSERT INTO device VALUES (2462, 'H3', 'B', '32074689', '2013-05-28 21:25:21.853', false, 2458);
INSERT INTO component VALUES (2463, 'B', 'F7', '4373314', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:58:16.333', 'D', 2462);
INSERT INTO component VALUES (2464, 'B', 'B8', '92445403', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:28:34.932', 'H', 2462);
INSERT INTO hall VALUES (2465, 'D3', 585, 5806, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO line VALUES (2466, 'D3 Assembly', 'Series 9', 81, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2465);
INSERT INTO location VALUES (2467, 'FE6', 2466);
INSERT INTO device VALUES (2468, 'F2', 'C', '86569168', '2013-05-28 00:15:09.052', false, 2467);
INSERT INTO component VALUES (2469, 'I', 'H5', '67796065', 'Howard Joel Wolowitz', '2013-05-28 08:31:39.85', 'B', 2468);
INSERT INTO component VALUES (2470, 'B', 'H3', '36357084', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:48:05.067', 'C', 2468);
INSERT INTO device VALUES (2471, 'A2', 'I', '6842305', '2013-05-28 19:57:28.378', false, 2467);
INSERT INTO component VALUES (2472, 'D', 'B7', '13205746', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 17:53:46.626', 'H', 2471);
INSERT INTO component VALUES (2473, 'B', 'I9', '8377757', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:02:39.094', 'A', 2471);
INSERT INTO location VALUES (2474, 'EC1', 2466);
INSERT INTO device VALUES (2475, 'E1', 'H', '39479901', '2013-05-28 02:34:43.454', false, 2474);
INSERT INTO component VALUES (2476, 'G', 'G5', '9891196', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 06:45:42.414', 'I', 2475);
INSERT INTO component VALUES (2477, 'C', 'H2', '27220337', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:39:55.487', 'H', 2475);
INSERT INTO device VALUES (2478, 'F7', 'H', '48444442', '2013-05-28 09:47:56.439', false, 2474);
INSERT INTO component VALUES (2479, 'D', 'F1', '66358910', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:45:48.175', 'I', 2478);
INSERT INTO component VALUES (2480, 'A', 'B3', '79264758', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 05:21:18.225', 'A', 2478);
INSERT INTO line VALUES (2481, 'D3 PreSeries', 'Series 4', 12, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2465);
INSERT INTO location VALUES (2482, 'CG8', 2481);
INSERT INTO device VALUES (2483, 'D9', 'F', '55009185', '2013-05-28 17:50:39.406', false, 2482);
INSERT INTO component VALUES (2484, 'G', 'I4', '45484198', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:37:12.698', 'E', 2483);
INSERT INTO component VALUES (2485, 'H', 'G5', '95063277', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 17:28:56.602', 'G', 2483);
INSERT INTO device VALUES (2486, 'I4', 'E', '68218581', '2013-05-28 04:07:20.062', false, 2482);
INSERT INTO component VALUES (2487, 'B', 'E8', '34945010', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:21:29.183', 'F', 2486);
INSERT INTO component VALUES (2488, 'G', 'D3', '93444390', 'Howard Joel Wolowitz', '2013-05-28 17:25:36.535', 'I', 2486);
INSERT INTO location VALUES (2489, 'FA6', 2481);
INSERT INTO device VALUES (2490, 'B8', 'B', '16948628', '2013-05-28 09:43:12.131', false, 2489);
INSERT INTO component VALUES (2491, 'F', 'I1', '52966335', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:31:04.021', 'I', 2490);
INSERT INTO component VALUES (2492, 'G', 'D9', '50421203', 'Howard Joel Wolowitz', '2013-05-28 04:53:11.276', 'G', 2490);
INSERT INTO device VALUES (2493, 'H1', 'F', '15152968', '2013-05-28 09:54:18.398', true, 2489);
INSERT INTO component VALUES (2494, 'I', 'G1', '88462861', 'Howard Joel Wolowitz', '2013-05-28 14:08:40.894', 'H', 2493);
INSERT INTO component VALUES (2495, 'I', 'A2', '5554400', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:39:46.522', 'G', 2493);
INSERT INTO hall VALUES (2496, 'G1', 603, 1364, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO line VALUES (2497, 'G1 Assembly', 'Series 9', 75, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2496);
INSERT INTO location VALUES (2498, 'GE7', 2497);
INSERT INTO device VALUES (2499, 'E7', 'F', '88831500', '2013-05-28 14:48:52.713', false, 2498);
INSERT INTO component VALUES (2500, 'C', 'F8', '25108959', 'Howard Joel Wolowitz', '2013-05-28 12:34:11.391', 'F', 2499);
INSERT INTO component VALUES (2501, 'H', 'C1', '99363149', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:49:04.164', 'F', 2499);
INSERT INTO device VALUES (2502, 'B3', 'A', '89551093', '2013-05-28 07:12:39.851', false, 2498);
INSERT INTO component VALUES (2503, 'C', 'H2', '58426411', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:51:30.211', 'B', 2502);
INSERT INTO component VALUES (2504, 'C', 'H7', '23236326', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:23:04.753', 'I', 2502);
INSERT INTO location VALUES (2505, 'BB8', 2497);
INSERT INTO device VALUES (2506, 'I4', 'B', '24545491', '2013-05-28 00:37:12.458', false, 2505);
INSERT INTO component VALUES (2507, 'G', 'G1', '83084102', 'Howard Joel Wolowitz', '2013-05-28 14:39:14.506', 'E', 2506);
INSERT INTO component VALUES (2508, 'F', 'B3', '57763992', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:56:49.147', 'H', 2506);
INSERT INTO device VALUES (2509, 'B2', 'H', '39094179', '2013-05-27 22:12:44.664', false, 2505);
INSERT INTO component VALUES (2510, 'A', 'I2', '35184167', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 18:14:12.874', 'A', 2509);
INSERT INTO component VALUES (2511, 'E', 'F1', '9073019', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:50:13.131', 'A', 2509);
INSERT INTO line VALUES (2512, 'G1 PreSeries', 'Series 7', 86, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2496);
INSERT INTO location VALUES (2513, 'GB6', 2512);
INSERT INTO device VALUES (2514, 'I4', 'G', '42687628', '2013-05-28 06:40:35.912', true, 2513);
INSERT INTO component VALUES (2515, 'D', 'G5', '56184114', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:28:21.122', 'B', 2514);
INSERT INTO component VALUES (2516, 'H', 'F3', '82022410', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 15:57:37.698', 'B', 2514);
INSERT INTO device VALUES (2517, 'C7', 'A', '84912695', '2013-05-28 06:25:05.715', false, 2513);
INSERT INTO component VALUES (2518, 'H', 'C5', '55304024', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:15:27.585', 'B', 2517);
INSERT INTO component VALUES (2519, 'H', 'D1', '66894091', 'Howard Joel Wolowitz', '2013-05-28 05:05:21.093', 'E', 2517);
INSERT INTO location VALUES (2520, 'II3', 2512);
INSERT INTO device VALUES (2521, 'D9', 'B', '31600853', '2013-05-28 00:48:37.022', false, 2520);
INSERT INTO component VALUES (2522, 'A', 'C2', '83356284', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:53:10.819', 'E', 2521);
INSERT INTO component VALUES (2523, 'H', 'F3', '86762503', 'Howard Joel Wolowitz', '2013-05-28 01:14:36.597', 'B', 2521);
INSERT INTO device VALUES (2524, 'F6', 'I', '57362945', '2013-05-27 23:48:16.947', true, 2520);
INSERT INTO component VALUES (2525, 'E', 'F3', '97238245', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 22:00:34.644', 'I', 2524);
INSERT INTO component VALUES (2526, 'A', 'B9', '73579474', 'Howard Joel Wolowitz', '2013-05-28 03:53:26.757', 'H', 2524);
INSERT INTO hall VALUES (2527, 'H6', 581, 2393, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO line VALUES (2528, 'H6 Assembly', 'Series 6', 70, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2527);
INSERT INTO location VALUES (2529, 'CF8', 2528);
INSERT INTO device VALUES (2530, 'E2', 'F', '15600243', '2013-05-28 16:52:31.247', false, 2529);
INSERT INTO component VALUES (2531, 'H', 'G4', '77776437', 'Howard Joel Wolowitz', '2013-05-28 20:10:44.897', 'D', 2530);
INSERT INTO component VALUES (2532, 'H', 'C6', '20496927', 'Howard Joel Wolowitz', '2013-05-28 09:28:36.12', 'B', 2530);
INSERT INTO device VALUES (2533, 'C9', 'C', '63911308', '2013-05-28 06:02:29.75', true, 2529);
INSERT INTO component VALUES (2534, 'C', 'G1', '81476671', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:55:39.177', 'B', 2533);
INSERT INTO component VALUES (2535, 'B', 'H8', '15764125', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:57:23.888', 'B', 2533);
INSERT INTO location VALUES (2536, 'IE5', 2528);
INSERT INTO device VALUES (2537, 'H1', 'G', '42573395', '2013-05-28 14:12:00.81', true, 2536);
INSERT INTO component VALUES (2538, 'E', 'E7', '61296628', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:49:33.715', 'H', 2537);
INSERT INTO component VALUES (2539, 'A', 'B9', '25795511', 'Howard Joel Wolowitz', '2013-05-28 11:17:09.365', 'F', 2537);
INSERT INTO device VALUES (2540, 'A2', 'C', '96196465', '2013-05-28 09:55:39.892', false, 2536);
INSERT INTO component VALUES (2541, 'G', 'H5', '92466524', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:41:43.846', 'C', 2540);
INSERT INTO component VALUES (2542, 'I', 'F6', '39577170', 'Howard Joel Wolowitz', '2013-05-28 15:42:13.826', 'C', 2540);
INSERT INTO line VALUES (2543, 'H6 PreSeries', 'Series 6', 53, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2527);
INSERT INTO location VALUES (2544, 'GF7', 2543);
INSERT INTO device VALUES (2545, 'E2', 'I', '99961010', '2013-05-28 00:47:24.937', false, 2544);
INSERT INTO component VALUES (2546, 'C', 'F8', '40128579', 'Howard Joel Wolowitz', '2013-05-28 18:29:22.204', 'F', 2545);
INSERT INTO component VALUES (2547, 'H', 'H1', '52339202', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 17:22:06.949', 'A', 2545);
INSERT INTO device VALUES (2548, 'B6', 'H', '29488507', '2013-05-28 06:01:26.78', false, 2544);
INSERT INTO component VALUES (2549, 'B', 'I6', '98847457', 'Howard Joel Wolowitz', '2013-05-28 03:57:16.457', 'E', 2548);
INSERT INTO component VALUES (2550, 'C', 'B8', '67091490', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:59:29.733', 'C', 2548);
INSERT INTO location VALUES (2551, 'BA3', 2543);
INSERT INTO device VALUES (2552, 'C7', 'E', '85675952', '2013-05-28 19:12:11.82', false, 2551);
INSERT INTO component VALUES (2553, 'E', 'H3', '93105180', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 09:35:56.931', 'A', 2552);
INSERT INTO component VALUES (2554, 'H', 'D4', '47100051', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:00:10.881', 'F', 2552);
INSERT INTO device VALUES (2555, 'E9', 'F', '86746912', '2013-05-28 03:38:11.825', true, 2551);
INSERT INTO component VALUES (2556, 'E', 'H9', '75448175', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:38:29.383', 'A', 2555);
INSERT INTO component VALUES (2557, 'I', 'H5', '4596799', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:09:54.355', 'C', 2555);


/* 
 *
	Factory Plan: Ingolstadt
 *
 */

INSERT INTO hall VALUES (2031, 'H0', 0, 0, 'm 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z', 1);
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
INSERT INTO hall VALUES (2000, 'H60', 0, 0, 'm 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z', 1);
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


INSERT INTO line VALUES (100, 'B5 Assembly', 'Test Series', 0, 'm 241.5,67.21875 0,0.5 0,30.5 0,0.5 0.5,0 213.5,0 0.5,0 0,-0.5 0,-30.5 0,-0.5 -0.5,0 -213.5,0 -0.5,0 z m 1,1 212.5,0 0,29.5 -212.5,0 0,-29.5 z', 2001);;
INSERT INTO line VALUES (101, 'B5 Assembly', 'Test Series', 0, 'm 26,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 59.5,0 0.5,0 0,-0.5 0,-16 12,0 0.5,0 0,-0.5 0,-25 0,-0.5 -0.5,0 -72,0 -0.5,0 z m 1,1 71,0 0,24 -12,0 -0.5,0 0,0.5 0,16 -58.5,0 0,-40.5 z', 2001);;
INSERT INTO line VALUES (102, 'B5 Assembly', 'Test Series', 0, 'm 98,105.46875 0,0.5 0,24.5 -12,0 -0.5,0 0,0.5 0,16.5 0,0.5 0.5,0 322.5,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -310,0 -0.5,0 z m 1,1 309,0 0,40.5 -321.5,0 0,-15.5 12,0 0.5,0 0,-0.5 0,-24.5 z', 2001);;
INSERT INTO line VALUES (2001, 'B5 Assembly', 'Test Series', 0, 'm 407.625,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 36.25,0 0.5,0 0,-0.5 0,-16.375 0,-0.5 -0.5,0 -12,0 0,-24.625 0,-0.5 -0.5,0 -23.75,0 -0.5,0 z m 1,1 22.75,0 0,24.625 0,0.5 0.5,0 12,0 0,15.375 -35.25,0 0,-40.5 z', 2001););
INSERT INTO line VALUES (104, 'B5 Assembly', 'Test Series', 0, 'm 431.375,105.46875 0,0.5 0,25.125 0,0.5 0.5,0 12,0 0,15.875 0,0.5 0.5,0 12.75,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -25.25,0 -0.5,0 z m 1,1 24.25,0 0,40.5 -11.75,0 0,-15.875 0,-0.5 -0.5,0 -12,0 0,-24.125 z', 2001);;
INSERT INTO line VALUES (105, 'B5 Assembly', 'Test Series', 0, 'm 26,67.21875 0,0.5 0,30.5 0,0.5 0.5,0 207.25,0 0.5,0 0,-0.5 0,-30.5 0,-0.5 -0.5,0 -207.25,0 -0.5,0 z m 1,1 206.25,0 0,29.5 -206.25,0 0,-29.5 z', 2001);;
INSERT INTO line VALUES (106, 'B5 Assembly', 'Test Series', 0, 'm 303.5,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 174.78125,0 0.46875,0 0,-0.5 0,-25.65625 0,-0.5 -0.46875,0 -174.78125,0 -0.5,0 z m 1,1 173.78125,0 0,24.6875 -173.78125,0 0,-24.6875 z', 2001);;
INSERT INTO line VALUES (107, 'B5 Assembly', 'Test Series', 0, 'm 268.78125,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 32.0625,0 0.5,0 0,-0.5 0,-25.65625 0,-0.5 -0.5,0 -32.0625,0 -0.5,0 z m 1,1 31.0625,0 0,24.65625 -31.0625,0 0,-24.65625 z', 2001);;
INSERT INTO line VALUES (108, 'B5 Assembly', 'Test Series', 0, 'm 119.5,34.625 0,0.5 0,25.65625 0,0.5 0.5,0 146.28125,0 0.5,0 0,-0.5 0,-25.65625 0,-0.5 -0.5,0 -146.28125,0 -0.5,0 z m 1,1 145.28125,0 0,24.6875 -145.28125,0 0,-24.6875 z', 2001);;
INSERT INTO line VALUES (109, 'B5 Assembly', 'Test Series', 0, 'm 28.860346,16.3125 0,0.5 0,17.8125 -20.51689,0 -0.4863263,0 0,0.5 0,25.65625 0,0.5 0.4863263,0 108.602744,0 0.48632,0 0,-0.5 0,-25.65625 0,-0.5 -0.48632,0 -31.793586,0 0,-17.8125 0,-0.5 -0.486326,0 -55.319615,0 -0.486327,0 z m 0.972653,1 54.346963,0 0,17.8125 0,0.5 0.486326,0 31.793582,0 0,24.65625 -107.6300877,0 0,-24.65625 20.5168907,0 0.486326,0 0,-0.5 0,-17.8125 z', 2001);;
INSERT INTO line VALUES (2016, 'B5 Assembly', 'Test Series', 0, 'm 481.21875,34.65625 0,0.46875 0,37.34375 0,0.46875 0.46875,0 20.65625,0 0.46875,0 0,-0.46875 0,-37.34375 0,-0.46875 -0.46875,0 -20.65625,0 -0.46875,0 z m 0.9375,0.9375 19.71875,0 0,36.40625 -19.71875,0 0,-36.40625 z', 2001););
INSERT INTO line VALUES (111, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,79.0625 0,0.46875 0,65.9375 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-65.9375 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z M 482.125,80 l 19.75,0 0,65 -19.75,0 0,-65 z', 2001);;
INSERT INTO line VALUES (112, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,79.03125 0,0.5 0,10.1875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-10.1875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,9.1875 -15.03125,0 0,-9.1875 z', 2001);;
INSERT INTO line VALUES (113, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,92.625 0,0.5 0,73.21875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-73.21875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,72.21875 -15.03125,0 0,-72.21875 z', 2001);;
INSERT INTO line VALUES (114, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,165.84375 0,0.5 0,44.3125 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-44.3125 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,43.3125 -15.03125,0 0,-43.3125 z', 2001);;
INSERT INTO line VALUES (115, 'B5 Assembly', 'Test Series', 0, 'm 462.3125,210.15625 0,0.5 0,29.46875 0,0.5 0.5,0 16.03125,0 0.5,0 0,-0.5 0,-29.46875 0,-0.5 -0.5,0 -16.03125,0 -0.5,0 z m 1,1 15.03125,0 0,28.46875 -15.03125,0 0,-28.46875 z', 2001);;
INSERT INTO line VALUES (116, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,151.40625 0,0.46875 0,88.25 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-88.25 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z m 0.96875,0.9375 19.75,0 0,87.3125 -19.75,0 0,-87.3125 z', 2001);;
INSERT INTO line VALUES (117, 'B5 Assembly', 'Test Series', 0, 'm 481.15625,245.65625 0,0.46875 0,29.65625 0,0.46875 0.5,0 20.6875,0 0.46875,0 0,-0.46875 0,-29.65625 0,-0.46875 -0.46875,0 -20.6875,0 -0.5,0 z m 0.96875,0.9375 19.75,0 0,28.71875 -19.75,0 0,-28.71875 z', 2001);;
INSERT INTO line VALUES (118, 'B5 Assembly', 'Test Series', 0, 'm 463.84375,245.625 0,0.5 0,29.65625 0,0.5 0.5,0 14.5,0 0.5,0 0,-0.5 0,-29.65625 0,-0.5 -0.5,0 -14.5,0 -0.5,0 z m 1,1 13.5,0 0,28.65625 -13.5,0 0,-28.65625 z', 2001);;
INSERT INTO line VALUES (119, 'B5 Assembly', 'Test Series', 0, 'm 26,151.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2001);;
INSERT INTO line VALUES (120, 'B5 Assembly', 'Test Series', 0, 'm 26,175.875 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2001);;
INSERT INTO line VALUES (121, 'B5 Assembly', 'Test Series', 0, 'm 26,200.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2001);;
INSERT INTO line VALUES (122, 'B5 Assembly', 'Test Series', 0, 'm 26,224.875 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2001);;
INSERT INTO line VALUES (123, 'B5 Assembly', 'Test Series', 0, 'm 26,249.375 0,0.5 0,19.59375 0,0.5 0.5,0 430.625,0 0.5,0 0,-0.5 0,-19.59375 0,-0.5 -0.5,0 -430.625,0 -0.5,0 z m 1,1 429.625,0 0,18.59375 -429.625,0 0,-18.59375 z', 2001);;
INSERT INTO line VALUES (124, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,67.21875 0,0.5 0,34.75 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-34.75 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,33.75 -10.65625,0 0,-33.75 z', 2001);;
INSERT INTO line VALUES (125, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,105.46875 0,0.5 0,41.5 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-41.5 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,40.5 -10.65625,0 0,-40.5 z', 2001);;
INSERT INTO line VALUES (126, 'B5 Assembly', 'Test Series', 0, 'm 7.84375,151.375 0,0.5 0,99.59375 0,0.5 0.5,0 11.65625,0 0.5,0 0,-0.5 0,-99.59375 0,-0.5 -0.5,0 -11.65625,0 -0.5,0 z m 1,1 10.65625,0 0,98.59375 -10.65625,0 0,-98.59375 z', 2001);;
