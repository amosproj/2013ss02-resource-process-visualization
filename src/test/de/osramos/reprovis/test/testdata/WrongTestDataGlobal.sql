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

