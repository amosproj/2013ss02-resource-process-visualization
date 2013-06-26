DROP TABLE IF EXISTS component CASCADE; 
DROP TABLE IF EXISTS device CASCADE;
DROP TABLE IF EXISTS line CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS hall CASCADE;
DROP TABLE IF EXISTS factory CASCADE;
create table factory(
	id int PRIMARY KEY,
	name char varying(128) NOT NULL DEFAULT '', 
	company char varying(128) NOT NULL DEFAULT '', 
	city char varying(128) NOT NULL DEFAULT '', 
	country char varying(128) NOT NULL DEFAULT '', 
	gpslatitude double precision NOT NULL DEFAULT 0, 
	gpslongitude double precision NOT NULL DEFAULT 0, 
	carmodels char varying(512), 
	sizeofstaff int, 
	sizeofstaffdate timestamp,
	vehiclesperyear int, 
	vehiclesperday int, 
	upssystems int, 
	upsservers int, 
	upsprovider char varying(128), 
	parent integer NOT NULL DEFAULT 0, 
	map TEXT NOT NULL DEFAULT ''
);
CREATE TABLE hall (
	id integer PRIMARY KEY,
	name character varying(128) NOT NULL DEFAULT '',
	type character varying(128) NOT NULL DEFAULT '',
	staff integer NOT NULL DEFAULT 0,
	capacity integer NOT NULL DEFAULT 0,
	vehicles char varying(512) NOT NULL DEFAULT '', 
	upsServers int NOT NULL DEFAULT 0, 
	path character varying(50) NOT NULL DEFAULT '',
	parent integer REFERENCES factory(id) ON DELETE CASCADE,
	map TEXT NOT NULL DEFAULT ''
);
CREATE TABLE line (
	id integer PRIMARY KEY,
	name character varying(50) NOT NULL DEFAULT '',
	series character varying(50) NOT NULL DEFAULT '',
	capacity integer NOT NULL DEFAULT 0,
	path character varying(50) NOT NULL DEFAULT '',
	parent integer REFERENCES hall(id) ON DELETE CASCADE,
	map TEXT NOT NULL DEFAULT ''
);
CREATE TABLE location (
	id integer PRIMARY KEY,
	name character varying(50),
	description character varying(100),
	personincharge character varying(100),
	parent integer REFERENCES line(id) ON DELETE CASCADE
);
CREATE TABLE device (
	id integer PRIMARY KEY,
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
	parent integer REFERENCES location(id) ON DELETE CASCADE
);
CREATE TABLE component (
	id integer PRIMARY KEY,
	name character varying(50),
	value character varying(50),
	sector character varying(50),
	category character varying(50),
	serialnumber character varying(50),
	shiftresponsibility character varying(50),
	troubleoccurrencetime timestamp,
	troubleoccurrencesite character varying(50),
	status character varying(20),
	parent integer REFERENCES device(id) ON DELETE CASCADE
);

insert into factory values (1, 'Ingolstadt', 'Audi' ,'Ingolstadt', 'Germany', 48.762201, 11.425374, 
		'Audi A3, Audi A3 Sportback',
		35386, '2012-12-31 00:00:00.0', 551889, 2580, 1, 3, 'DSA GmbH', 0
	);
	
INSERT INTO hall VALUES (2, 'H1', 'Assembly+Finish', 351, 1914, 'Audi A4', 2, 'polygon249', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>');
INSERT INTO line VALUES (3, 'L1 Assembly', 'Series 3', 98, 'rect217', 2);
INSERT INTO location VALUES (4, 'Lo1', 'ABS test', 'Peter Merkel', 3);
INSERT INTO device VALUES (5, 'D1', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '28994613', '2013-06-18 06:00:41.701', false, 4);
INSERT INTO component VALUES (6, 'Tests', 'Ok', 'B', 'F', '70036775', 'Howard Joel Wolowitz', '2013-06-18 00:44:47.937', 'G5', 'green', 5);
INSERT INTO component VALUES (7, 'Network', 'IP: 10.0.0.1', 'B', 'F', '71054617', 'Dr. Leonard Leakey Hofstadter', '2013-06-18 08:06:43.37', 'A3', 'green', 5);
INSERT INTO component VALUES (8, 'Maintainance', 'no scheduled offtime', 'C', 'H', '32935192', 'Dr. Leonard Leakey Hofstadter', '2013-06-18 00:56:28.457', 'B8', 'green', 5);
