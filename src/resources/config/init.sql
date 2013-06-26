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
		'Audi A3, Audi A3 Sportback, Audi S3, Audi S3 Sportback, Audi A4, Audi A4 Avant, Audi S4, Audi S4 Avant, Audi A4 allroad quattro, Audi RS4 Avant, Audi A5 Sportback, Audi A5 Coupe, Audi S5 Sportback, Audi S5 Coupe, Audi RS 5 Coupe, Audi Q5, Audi Q5 hybrid quattro, Audi SQ5 TDI, Karosseriebau/Lackiererei des Audi TT Coupe, Audi TT Roadster, Audi TTS Coupe, Audi TTS Roadster, Audi TT RS Coupe, Audi TT RS Roadster, Audi A3 Cabriolet',
		35386, '2012-12-31 00:00:00.0', 551889, 2580, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (2, 'Neckarsulm', 'Audi' , 'Neckarsulm', 'Germany', 49.194213, 9.221771,
		'Audi A4, Audi A5 Cabriolet, Audi S5 Cabriolet, Audi RS 5 Cabriolet, Audi A6, Audi A6 hybrid, Audi A6 Avant, Audi S6, Audi A6 allroad quattro, Audi RS 6 Avant, Audi A7, Audi S7, Audi RS7, Audi A8, Audi A8 L, Audi A8 hybrid, Audi S8, Audi R8, Audi R8 Spyder, Audi R8 GT, Audi R8 GT Spyder',
			14764,  '2012-12-31 00:00:00.0', 262965, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (3, 'Gyor', 'Audi' ,'Gyor', 'Hungary', 47.68746, 17.65040,
		'Audi TT Coupe, Audi TT Roadster,Audi A3 Cabriolet',
		8663, '2012-12-31 00:00:00.0', 33553, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (4, 'Changchun', 'Volkswagen' , 'Changchun', 'China', 43.81708, 125.32354,
		'Audi A6L, Audi A4L, Audi Q5',
			9700, '2011-12-31 00:00:00.0', 333467, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (5, 'Bruessel', 'Audi' ,'Bruessel', 'Belgium', 50.85034, 4.35171,
		'Audi A1, Audi A1 Sportback, Audi A1 quattro',
		2503, '2012-12-31 00:00:00.0', 123111, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (6, 'Aurangabad', 'Skoda' , 'Aurangabad', 'India', 19.87617, 75.34331,
		'Audi A4 Limousine, Audi A6 Limousine,Audi Q5, Audi Q7',
			140, '2011-12-31 00:00:00.0', 6786, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (7, 'Bratislava', 'Volkswagen' , 'Bratislava', 'Slovakia', 48.14589, 17.10714,
		'Audi Q7',
			2200, '2012-12-31 00:00:00.0', 54562, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (8, 'Martorell', 'Seat' ,'Martorell', 'Spain', 41.48040, 1.91481,
		'Audi Q3',
		1500, '2012-12-31 00:00:00.0', 106829, 0, 1, 3, 'DSA GmbH', 0
	);
	insert into factory values (9, 'Jakarta', 'Audi' , 'Jakarta', 'Indonesia', -6.21154, 106.84517,
		'Audi A4, Audi A6',
			0, '2012-12-31 00:00:00.0', 443, 0, 1, 3, 'DSA GmbH', 0
	);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 1;
INSERT INTO hall VALUES (2000, 'C2', 'Assembly+Finish', 953, 9882, 'Audi A4', 2, 'path369', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2001, 'C2 Assembly', 'Series 5', 20, 'rect217', 2000);
INSERT INTO location VALUES (2002, 'AE3', 'multimedia test', 'Peter Schulze', 2001);
INSERT INTO device VALUES (2003, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '34589947', '2013-06-25 05:19:52.373', true, 2002);
INSERT INTO component VALUES (2004, 'Tests', 'Ok', 'H', 'H', '13245947', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:11:51.503', 'A5', 'green', 2003);
INSERT INTO component VALUES (2005, 'Network', 'IP: 10.0.0.1', 'E', 'F', '65191531', 'Howard Joel Wolowitz', '2013-06-25 02:17:22.486', 'D6', 'green', 2003);
INSERT INTO device VALUES (2006, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '75889658', '2013-06-26 00:46:02.598', false, 2002);
INSERT INTO component VALUES (2007, 'Tests', 'Ok', 'E', 'F', '47047025', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 06:42:34.523', 'I6', 'green', 2006);
INSERT INTO component VALUES (2008, 'Network', 'IP: 10.0.0.1', 'H', 'D', '3856275', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 18:26:16.502', 'D9', 'green', 2006);
INSERT INTO location VALUES (2009, 'FA7', 'ABS test', 'Robert Schulze', 2001);
INSERT INTO device VALUES (2010, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '82714820', '2013-06-25 11:12:14.147', false, 2009);
INSERT INTO component VALUES (2011, 'Tests', 'Ok', 'A', 'F', '49523526', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 08:47:10.651', 'I3', 'yellow', 2010);
INSERT INTO component VALUES (2012, 'Network', 'IP: 10.0.0.1', 'H', 'D', '9229361', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:53:25.626', 'I6', 'green', 2010);
INSERT INTO device VALUES (2013, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '34813262', '2013-06-25 11:13:07.339', false, 2009);
INSERT INTO component VALUES (2014, 'Tests', 'Ok', 'E', 'D', '54022941', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:40:06.491', 'G4', 'green', 2013);
INSERT INTO component VALUES (2015, 'Network', 'IP: 10.0.0.1', 'F', 'G', '82306332', 'Howard Joel Wolowitz', '2013-06-25 17:12:53.3', 'H4', 'green', 2013);
INSERT INTO line VALUES (2016, 'C2 PreSeries', 'Series 4', 2, 'polygon25', 2000);
INSERT INTO location VALUES (2017, 'BF5', 'motor test', 'Hans Schulze', 2016);
INSERT INTO device VALUES (2018, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '43582907', '2013-06-25 06:05:12.251', false, 2017);
INSERT INTO component VALUES (2019, 'Tests', 'Ok', 'E', 'C', '46771206', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:47:17.363', 'G6', 'green', 2018);
INSERT INTO component VALUES (2020, 'Network', 'IP: 10.0.0.1', 'F', 'A', '39093117', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 02:31:16.823', 'D9', 'green', 2018);
INSERT INTO device VALUES (2021, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '40121497', '2013-06-25 10:23:32.107', false, 2017);
INSERT INTO component VALUES (2022, 'Tests', 'Ok', 'A', 'F', '70311376', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:11:35.476', 'B7', 'green', 2021);
INSERT INTO component VALUES (2023, 'Network', 'IP: 10.0.0.1', 'I', 'I', '43798811', 'Howard Joel Wolowitz', '2013-06-26 00:26:35.967', 'C1', 'green', 2021);
INSERT INTO location VALUES (2024, 'FI1', 'transmission test', 'Peter Schulze', 2016);
INSERT INTO device VALUES (2025, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '91934732', '2013-06-25 12:04:44.384', false, 2024);
INSERT INTO component VALUES (2026, 'Tests', 'Ok', 'D', 'B', '11439762', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 12:08:48.59', 'I3', 'green', 2025);
INSERT INTO component VALUES (2027, 'Network', 'IP: 10.0.0.1', 'E', 'G', '35252137', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 14:10:48.872', 'D3', 'green', 2025);
INSERT INTO device VALUES (2028, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '25159999', '2013-06-25 03:50:26.762', false, 2024);
INSERT INTO component VALUES (2029, 'Tests', 'Ok', 'B', 'A', '1215599', 'Howard Joel Wolowitz', '2013-06-25 16:37:35.804', 'A4', 'red', 2028);
INSERT INTO component VALUES (2030, 'Network', 'IP: 10.0.0.1', 'I', 'E', '18341405', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:47:35.447', 'H4', 'red', 2028);
INSERT INTO line VALUES (2031, 'C2 Finish', 'Series 1', 23, 'rect497', 2000);
INSERT INTO location VALUES (2032, 'HG5', 'security test', 'Franziska Schmitt', 2031);
INSERT INTO device VALUES (2033, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '75603097', '2013-06-25 22:55:03.554', false, 2032);
INSERT INTO component VALUES (2034, 'Tests', 'Ok', 'I', 'A', '68460571', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 09:14:12.321', 'C1', 'green', 2033);
INSERT INTO component VALUES (2035, 'Network', 'IP: 10.0.0.1', 'D', 'A', '67059438', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:13:39.523', 'F2', 'green', 2033);
INSERT INTO device VALUES (2036, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '63549069', '2013-06-25 13:53:22.093', false, 2032);
INSERT INTO component VALUES (2037, 'Tests', 'Ok', 'A', 'C', '45769395', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:42:23.464', 'G2', 'green', 2036);
INSERT INTO component VALUES (2038, 'Network', 'IP: 10.0.0.1', 'F', 'C', '30230375', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 14:28:01.232', 'B6', 'green', 2036);
INSERT INTO location VALUES (2039, 'BG9', 'multimedia test', 'Franziska Mueller', 2031);
INSERT INTO device VALUES (2040, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '8994741', '2013-06-25 03:16:23.463', false, 2039);
INSERT INTO component VALUES (2041, 'Tests', 'Ok', 'C', 'C', '59407737', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 21:52:30.304', 'E2', 'yellow', 2040);
INSERT INTO component VALUES (2042, 'Network', 'IP: 10.0.0.1', 'C', 'F', '63476718', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 20:01:18.009', 'F7', 'green', 2040);
INSERT INTO device VALUES (2043, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '46465938', '2013-06-25 11:23:13.642', false, 2039);
INSERT INTO component VALUES (2044, 'Tests', 'Ok', 'A', 'D', '28599345', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:15:26.396', 'H2', 'yellow', 2043);
INSERT INTO component VALUES (2045, 'Network', 'IP: 10.0.0.1', 'H', 'C', '85491398', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:07:03.94', 'F7', 'green', 2043);
INSERT INTO hall VALUES (2046, 'D4', 'Assembly+Finish', 509, 643, 'Audi A4', 2, 'polygon249', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2047, 'D4 Assembly', 'Series 8', 91, 'rect217', 2046);
INSERT INTO location VALUES (2048, 'BH2', 'transmission test', 'Hans Meier', 2047);
INSERT INTO device VALUES (2049, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '13960302', '2013-06-25 11:58:06.483', false, 2048);
INSERT INTO component VALUES (2050, 'Tests', 'Ok', 'I', 'I', '99748808', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 17:29:05.734', 'I8', 'green', 2049);
INSERT INTO component VALUES (2051, 'Network', 'IP: 10.0.0.1', 'H', 'H', '97676956', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 18:28:57.731', 'B9', 'yellow', 2049);
INSERT INTO device VALUES (2052, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '24810013', '2013-06-25 03:20:37.204', false, 2048);
INSERT INTO component VALUES (2053, 'Tests', 'Ok', 'B', 'H', '62010769', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 09:55:30.301', 'D3', 'green', 2052);
INSERT INTO component VALUES (2054, 'Network', 'IP: 10.0.0.1', 'D', 'G', '620573', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 17:40:45.796', 'E9', 'green', 2052);
INSERT INTO location VALUES (2055, 'EI3', 'motor test', 'Hans Merkel', 2047);
INSERT INTO device VALUES (2056, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '35969547', '2013-06-25 07:16:54.782', false, 2055);
INSERT INTO component VALUES (2057, 'Tests', 'Ok', 'A', 'G', '3526113', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:34:12.82', 'E1', 'green', 2056);
INSERT INTO component VALUES (2058, 'Network', 'IP: 10.0.0.1', 'C', 'D', '27995080', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 13:33:53.914', 'B8', 'green', 2056);
INSERT INTO device VALUES (2059, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '75732459', '2013-06-25 23:28:11.807', false, 2055);
INSERT INTO component VALUES (2060, 'Tests', 'Ok', 'I', 'B', '16186507', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 21:27:46.187', 'D6', 'green', 2059);
INSERT INTO component VALUES (2061, 'Network', 'IP: 10.0.0.1', 'E', 'H', '45465869', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 12:26:44.803', 'F4', 'green', 2059);
INSERT INTO line VALUES (2062, 'D4 PreSeries', 'Series 7', 60, 'polygon25', 2046);
INSERT INTO location VALUES (2063, 'CG1', 'security test', 'Robert Meier', 2062);
INSERT INTO device VALUES (2064, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '47872305', '2013-06-25 19:42:48.205', false, 2063);
INSERT INTO component VALUES (2065, 'Tests', 'Ok', 'B', 'B', '85544485', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:58:26.024', 'G3', 'red', 2064);
INSERT INTO component VALUES (2066, 'Network', 'IP: 10.0.0.1', 'B', 'F', '67393047', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 19:41:24.605', 'H6', 'red', 2064);
INSERT INTO device VALUES (2067, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '54341784', '2013-06-26 00:19:26.48', false, 2063);
INSERT INTO component VALUES (2068, 'Tests', 'Ok', 'E', 'C', '40869477', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:46:26.826', 'I8', 'red', 2067);
INSERT INTO component VALUES (2069, 'Network', 'IP: 10.0.0.1', 'C', 'H', '18136714', 'Howard Joel Wolowitz', '2013-06-25 22:45:27.014', 'G6', 'green', 2067);
INSERT INTO location VALUES (2070, 'BG7', 'motor test', 'Sarah Mueller', 2062);
INSERT INTO device VALUES (2071, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '91995870', '2013-06-25 14:27:49.514', false, 2070);
INSERT INTO component VALUES (2072, 'Tests', 'Ok', 'A', 'E', '42563337', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 17:53:00.498', 'D5', 'green', 2071);
INSERT INTO component VALUES (2073, 'Network', 'IP: 10.0.0.1', 'A', 'E', '53253485', 'Howard Joel Wolowitz', '2013-06-25 10:47:20.507', 'G1', 'green', 2071);
INSERT INTO device VALUES (2074, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '39830885', '2013-06-25 13:08:30.871', false, 2070);
INSERT INTO component VALUES (2075, 'Tests', 'Ok', 'A', 'F', '72022863', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 12:23:19.937', 'E3', 'green', 2074);
INSERT INTO component VALUES (2076, 'Network', 'IP: 10.0.0.1', 'G', 'I', '13676219', 'Howard Joel Wolowitz', '2013-06-25 10:17:37.152', 'B1', 'red', 2074);
INSERT INTO line VALUES (2077, 'D4 Finish', 'Series 5', 62, 'rect497', 2046);
INSERT INTO location VALUES (2078, 'CI3', 'motor test', 'Hans Mueller', 2077);
INSERT INTO device VALUES (2079, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '14768891', '2013-06-25 21:59:22.316', false, 2078);
INSERT INTO component VALUES (2080, 'Tests', 'Ok', 'A', 'F', '72852715', 'Howard Joel Wolowitz', '2013-06-25 10:08:05.059', 'A7', 'green', 2079);
INSERT INTO component VALUES (2081, 'Network', 'IP: 10.0.0.1', 'I', 'E', '10771365', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 06:51:13.516', 'F8', 'green', 2079);
INSERT INTO device VALUES (2082, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '87695426', '2013-06-25 14:48:20.039', false, 2078);
INSERT INTO component VALUES (2083, 'Tests', 'Ok', 'E', 'H', '14186961', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 22:14:11.697', 'F3', 'green', 2082);
INSERT INTO component VALUES (2084, 'Network', 'IP: 10.0.0.1', 'F', 'F', '44390690', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 21:00:38.358', 'F9', 'green', 2082);
INSERT INTO location VALUES (2085, 'GD4', 'motor test', 'Franziska Schulze', 2077);
INSERT INTO device VALUES (2086, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '47060585', '2013-06-25 06:22:26.651', false, 2085);
INSERT INTO component VALUES (2087, 'Tests', 'Ok', 'D', 'C', '19046604', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:52:04.797', 'G2', 'green', 2086);
INSERT INTO component VALUES (2088, 'Network', 'IP: 10.0.0.1', 'G', 'H', '52897882', 'Howard Joel Wolowitz', '2013-06-25 17:27:02.135', 'I1', 'green', 2086);
INSERT INTO device VALUES (2089, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '90042677', '2013-06-25 18:17:39.407', false, 2085);
INSERT INTO component VALUES (2090, 'Tests', 'Ok', 'C', 'D', '29795681', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-26 00:51:29.992', 'E1', 'green', 2089);
INSERT INTO component VALUES (2091, 'Network', 'IP: 10.0.0.1', 'C', 'H', '68671540', 'Howard Joel Wolowitz', '2013-06-25 23:55:59.089', 'I7', 'green', 2089);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 2;
INSERT INTO hall VALUES (2092, 'F1', 'Assembly+Finish', 940, 645, 'Audi A4', 2, 'path369', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2093, 'F1 Assembly', 'Series 1', 89, 'rect217', 2092);
INSERT INTO location VALUES (2094, 'GF5', 'ABS test', 'Sarah Schulze', 2093);
INSERT INTO device VALUES (2095, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '17549692', '2013-06-25 13:07:05.047', false, 2094);
INSERT INTO component VALUES (2096, 'Tests', 'Ok', 'B', 'B', '19483158', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:36:46.448', 'E1', 'green', 2095);
INSERT INTO component VALUES (2097, 'Network', 'IP: 10.0.0.1', 'H', 'A', '78421939', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 07:21:09.498', 'F4', 'green', 2095);
INSERT INTO device VALUES (2098, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '22348288', '2013-06-25 17:39:16.325', false, 2094);
INSERT INTO component VALUES (2099, 'Tests', 'Ok', 'I', 'I', '51078359', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 00:26:21.861', 'I3', 'yellow', 2098);
INSERT INTO component VALUES (2100, 'Network', 'IP: 10.0.0.1', 'F', 'B', '83304743', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:02:36.132', 'B8', 'green', 2098);
INSERT INTO location VALUES (2101, 'GC3', 'ABS test', 'Franziska Schmitt', 2093);
INSERT INTO device VALUES (2102, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '52232828', '2013-06-25 21:17:23.303', false, 2101);
INSERT INTO component VALUES (2103, 'Tests', 'Ok', 'H', 'A', '36558263', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 14:40:08.953', 'H1', 'green', 2102);
INSERT INTO component VALUES (2104, 'Network', 'IP: 10.0.0.1', 'F', 'A', '78708712', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 23:58:19.851', 'A4', 'green', 2102);
INSERT INTO device VALUES (2105, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '91453378', '2013-06-25 05:51:09.938', false, 2101);
INSERT INTO component VALUES (2106, 'Tests', 'Ok', 'C', 'A', '76949292', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 22:17:51.496', 'D6', 'green', 2105);
INSERT INTO component VALUES (2107, 'Network', 'IP: 10.0.0.1', 'A', 'E', '1361512', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:02:17.721', 'D9', 'yellow', 2105);
INSERT INTO line VALUES (2108, 'F1 PreSeries', 'Series 2', 85, 'polygon25', 2092);
INSERT INTO location VALUES (2109, 'BH6', 'security test', 'Franziska Schmitt', 2108);
INSERT INTO device VALUES (2110, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '68977548', '2013-06-25 18:47:12.374', true, 2109);
INSERT INTO component VALUES (2111, 'Tests', 'Ok', 'B', 'B', '58305876', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:45:37.855', 'A1', 'green', 2110);
INSERT INTO component VALUES (2112, 'Network', 'IP: 10.0.0.1', 'G', 'E', '8218679', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 17:34:00.539', 'I3', 'green', 2110);
INSERT INTO device VALUES (2113, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '84362847', '2013-06-26 00:20:52.077', false, 2109);
INSERT INTO component VALUES (2114, 'Tests', 'Ok', 'F', 'E', '74153242', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 22:26:57.082', 'F5', 'green', 2113);
INSERT INTO component VALUES (2115, 'Network', 'IP: 10.0.0.1', 'H', 'B', '87930352', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:01:11.903', 'A4', 'yellow', 2113);
INSERT INTO location VALUES (2116, 'BH1', 'multimedia test', 'Sarah Schmitt', 2108);
INSERT INTO device VALUES (2117, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '60997861', '2013-06-25 14:32:56.645', false, 2116);
INSERT INTO component VALUES (2118, 'Tests', 'Ok', 'G', 'A', '11773154', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-26 00:51:25.426', 'G8', 'green', 2117);
INSERT INTO component VALUES (2119, 'Network', 'IP: 10.0.0.1', 'G', 'A', '34551280', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:27:20.776', 'I3', 'green', 2117);
INSERT INTO device VALUES (2120, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '44970332', '2013-06-25 12:27:43.615', false, 2116);
INSERT INTO component VALUES (2121, 'Tests', 'Ok', 'A', 'F', '918133', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:15:11.069', 'F9', 'green', 2120);
INSERT INTO component VALUES (2122, 'Network', 'IP: 10.0.0.1', 'G', 'B', '4772776', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 15:39:35.134', 'B5', 'green', 2120);
INSERT INTO line VALUES (2123, 'F1 Finish', 'Series 7', 64, 'rect497', 2092);
INSERT INTO location VALUES (2124, 'HI7', 'transmission test', 'Peter Schulze', 2123);
INSERT INTO device VALUES (2125, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '67176069', '2013-06-25 19:48:09.151', false, 2124);
INSERT INTO component VALUES (2126, 'Tests', 'Ok', 'I', 'C', '6636831', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:30:48.238', 'D2', 'green', 2125);
INSERT INTO component VALUES (2127, 'Network', 'IP: 10.0.0.1', 'B', 'D', '2897574', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 23:12:58.169', 'G7', 'red', 2125);
INSERT INTO device VALUES (2128, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '96725510', '2013-06-25 07:18:59.78', false, 2124);
INSERT INTO component VALUES (2129, 'Tests', 'Ok', 'D', 'A', '20296676', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 06:27:25.096', 'C5', 'green', 2128);
INSERT INTO component VALUES (2130, 'Network', 'IP: 10.0.0.1', 'D', 'H', '16825256', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:27:42.976', 'A1', 'green', 2128);
INSERT INTO location VALUES (2131, 'AF8', 'motor test', 'Sarah Schmitt', 2123);
INSERT INTO device VALUES (2132, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '43756094', '2013-06-25 06:56:26.776', true, 2131);
INSERT INTO component VALUES (2133, 'Tests', 'Ok', 'I', 'E', '73516641', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 01:55:06.216', 'C5', 'green', 2132);
INSERT INTO component VALUES (2134, 'Network', 'IP: 10.0.0.1', 'A', 'F', '60316789', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 04:31:36.252', 'G4', 'green', 2132);
INSERT INTO device VALUES (2135, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '60528800', '2013-06-25 02:29:33.971', false, 2131);
INSERT INTO component VALUES (2136, 'Tests', 'Ok', 'F', 'G', '34000', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 23:43:25.125', 'B8', 'green', 2135);
INSERT INTO component VALUES (2137, 'Network', 'IP: 10.0.0.1', 'D', 'H', '53431793', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:13:29.737', 'G7', 'green', 2135);
INSERT INTO hall VALUES (2138, 'H9', 'Assembly+Finish', 211, 5712, 'Audi A4', 2, 'polygon249', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2139, 'H9 Assembly', 'Series 8', 66, 'rect217', 2138);
INSERT INTO location VALUES (2140, 'BB3', 'transmission test', 'Hans Schulze', 2139);
INSERT INTO device VALUES (2141, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '56383003', '2013-06-25 02:11:34.757', false, 2140);
INSERT INTO component VALUES (2142, 'Tests', 'Ok', 'E', 'C', '12004524', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 04:01:33.656', 'B7', 'green', 2141);
INSERT INTO component VALUES (2143, 'Network', 'IP: 10.0.0.1', 'H', 'I', '24888204', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 03:22:08.658', 'G2', 'green', 2141);
INSERT INTO device VALUES (2144, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '96492594', '2013-06-25 22:50:48.933', false, 2140);
INSERT INTO component VALUES (2145, 'Tests', 'Ok', 'D', 'D', '32259351', 'Howard Joel Wolowitz', '2013-06-25 15:08:09.344', 'G7', 'green', 2144);
INSERT INTO component VALUES (2146, 'Network', 'IP: 10.0.0.1', 'C', 'I', '18297083', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 04:37:10.166', 'G9', 'green', 2144);
INSERT INTO location VALUES (2147, 'DE7', 'transmission test', 'Hans Meier', 2139);
INSERT INTO device VALUES (2148, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '35211598', '2013-06-25 17:42:37.164', false, 2147);
INSERT INTO component VALUES (2149, 'Tests', 'Ok', 'A', 'G', '40537533', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 09:59:28.456', 'A5', 'green', 2148);
INSERT INTO component VALUES (2150, 'Network', 'IP: 10.0.0.1', 'I', 'B', '16643029', 'Howard Joel Wolowitz', '2013-06-25 21:51:28.06', 'A1', 'green', 2148);
INSERT INTO device VALUES (2151, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '26616884', '2013-06-25 12:55:34.769', false, 2147);
INSERT INTO component VALUES (2152, 'Tests', 'Ok', 'D', 'E', '39044744', 'Howard Joel Wolowitz', '2013-06-25 23:48:45.209', 'F4', 'green', 2151);
INSERT INTO component VALUES (2153, 'Network', 'IP: 10.0.0.1', 'A', 'D', '2580380', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 10:28:37.42', 'B9', 'green', 2151);
INSERT INTO line VALUES (2154, 'H9 PreSeries', 'Series 1', 60, 'polygon25', 2138);
INSERT INTO location VALUES (2155, 'IA3', 'ABS test', 'Hans Mueller', 2154);
INSERT INTO device VALUES (2156, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '79026275', '2013-06-25 02:27:27.682', false, 2155);
INSERT INTO component VALUES (2157, 'Tests', 'Ok', 'D', 'I', '81233286', 'Howard Joel Wolowitz', '2013-06-25 05:57:42.464', 'I9', 'green', 2156);
INSERT INTO component VALUES (2158, 'Network', 'IP: 10.0.0.1', 'I', 'I', '31188221', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 21:36:51.957', 'A5', 'green', 2156);
INSERT INTO device VALUES (2159, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '8425745', '2013-06-25 23:54:34.172', false, 2155);
INSERT INTO component VALUES (2160, 'Tests', 'Ok', 'F', 'G', '42213765', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 00:56:40.654', 'F4', 'green', 2159);
INSERT INTO component VALUES (2161, 'Network', 'IP: 10.0.0.1', 'I', 'C', '7256947', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 14:25:48.761', 'H8', 'green', 2159);
INSERT INTO location VALUES (2162, 'CD6', 'ABS test', 'Peter Schulze', 2154);
INSERT INTO device VALUES (2163, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '72919158', '2013-06-25 20:38:31.703', false, 2162);
INSERT INTO component VALUES (2164, 'Tests', 'Ok', 'H', 'B', '15420471', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:08:51.462', 'F7', 'green', 2163);
INSERT INTO component VALUES (2165, 'Network', 'IP: 10.0.0.1', 'I', 'I', '67526816', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:53:28.98', 'C7', 'green', 2163);
INSERT INTO device VALUES (2166, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '87587809', '2013-06-25 22:32:15.125', false, 2162);
INSERT INTO component VALUES (2167, 'Tests', 'Ok', 'A', 'B', '87076588', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 20:14:26.747', 'D7', 'green', 2166);
INSERT INTO component VALUES (2168, 'Network', 'IP: 10.0.0.1', 'B', 'E', '15225975', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 07:07:53.003', 'F7', 'green', 2166);
INSERT INTO line VALUES (2169, 'H9 Finish', 'Series 1', 19, 'rect497', 2138);
INSERT INTO location VALUES (2170, 'DI4', 'security test', 'Hans Mueller', 2169);
INSERT INTO device VALUES (2171, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '61648389', '2013-06-25 12:33:09.142', false, 2170);
INSERT INTO component VALUES (2172, 'Tests', 'Ok', 'I', 'I', '88960493', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 23:44:44.665', 'D2', 'green', 2171);
INSERT INTO component VALUES (2173, 'Network', 'IP: 10.0.0.1', 'F', 'A', '23087114', 'Howard Joel Wolowitz', '2013-06-25 21:01:12.903', 'E8', 'red', 2171);
INSERT INTO device VALUES (2174, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '72822734', '2013-06-25 20:28:45.774', false, 2170);
INSERT INTO component VALUES (2175, 'Tests', 'Ok', 'D', 'F', '5520750', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 12:51:20.422', 'H3', 'green', 2174);
INSERT INTO component VALUES (2176, 'Network', 'IP: 10.0.0.1', 'G', 'I', '42808325', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:45:07.187', 'I5', 'green', 2174);
INSERT INTO location VALUES (2177, 'BH2', 'transmission test', 'Robert Schulze', 2169);
INSERT INTO device VALUES (2178, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '30191843', '2013-06-25 21:25:29.805', true, 2177);
INSERT INTO component VALUES (2179, 'Tests', 'Ok', 'F', 'I', '69465097', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 18:33:24.526', 'F9', 'yellow', 2178);
INSERT INTO component VALUES (2180, 'Network', 'IP: 10.0.0.1', 'B', 'H', '9647509', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 10:40:16.117', 'I9', 'green', 2178);
INSERT INTO device VALUES (2181, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '83076810', '2013-06-25 02:20:15.078', false, 2177);
INSERT INTO component VALUES (2182, 'Tests', 'Ok', 'D', 'C', '86460754', 'Howard Joel Wolowitz', '2013-06-25 18:04:03.972', 'F8', 'green', 2181);
INSERT INTO component VALUES (2183, 'Network', 'IP: 10.0.0.1', 'E', 'F', '41199757', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 02:56:13.44', 'H2', 'green', 2181);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 3;
INSERT INTO hall VALUES (2184, 'B8', 'Assembly+Finish', 521, 9633, 'Audi A4', 2, 'path369', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2185, 'B8 Assembly', 'Series 1', 55, 'rect217', 2184);
INSERT INTO location VALUES (2186, 'DC3', 'multimedia test', 'Robert Mueller', 2185);
INSERT INTO device VALUES (2187, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '66748256', '2013-06-26 01:26:25.055', false, 2186);
INSERT INTO component VALUES (2188, 'Tests', 'Ok', 'C', 'E', '80201896', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 09:18:32.08', 'H9', 'green', 2187);
INSERT INTO component VALUES (2189, 'Network', 'IP: 10.0.0.1', 'B', 'F', '23945407', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 09:28:25.901', 'G9', 'green', 2187);
INSERT INTO device VALUES (2190, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '77095305', '2013-06-25 07:44:10.272', false, 2186);
INSERT INTO component VALUES (2191, 'Tests', 'Ok', 'E', 'G', '26040620', 'Howard Joel Wolowitz', '2013-06-25 23:24:07.533', 'E2', 'green', 2190);
INSERT INTO component VALUES (2192, 'Network', 'IP: 10.0.0.1', 'G', 'H', '56368705', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 09:09:58.099', 'C7', 'green', 2190);
INSERT INTO location VALUES (2193, 'DC7', 'security test', 'Peter Schulze', 2185);
INSERT INTO device VALUES (2194, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '6163511', '2013-06-25 01:43:26.828', false, 2193);
INSERT INTO component VALUES (2195, 'Tests', 'Ok', 'I', 'H', '82800609', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 11:28:47.563', 'D4', 'green', 2194);
INSERT INTO component VALUES (2196, 'Network', 'IP: 10.0.0.1', 'C', 'F', '96352758', 'Howard Joel Wolowitz', '2013-06-25 12:33:12.854', 'A5', 'green', 2194);
INSERT INTO device VALUES (2197, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '82910322', '2013-06-26 00:50:13.404', false, 2193);
INSERT INTO component VALUES (2198, 'Tests', 'Ok', 'G', 'E', '75534860', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:06:55.686', 'I4', 'green', 2197);
INSERT INTO component VALUES (2199, 'Network', 'IP: 10.0.0.1', 'A', 'E', '14766671', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 14:28:47.1', 'E6', 'red', 2197);
INSERT INTO line VALUES (2200, 'B8 PreSeries', 'Series 7', 18, 'polygon25', 2184);
INSERT INTO location VALUES (2201, 'EA4', 'ABS test', 'Sarah Schulze', 2200);
INSERT INTO device VALUES (2202, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '13050024', '2013-06-25 04:48:19.414', false, 2201);
INSERT INTO component VALUES (2203, 'Tests', 'Ok', 'C', 'I', '26073520', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 03:24:35.674', 'C2', 'green', 2202);
INSERT INTO component VALUES (2204, 'Network', 'IP: 10.0.0.1', 'C', 'C', '49540506', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 09:31:36.729', 'A8', 'green', 2202);
INSERT INTO device VALUES (2205, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '61230826', '2013-06-25 18:39:21.245', false, 2201);
INSERT INTO component VALUES (2206, 'Tests', 'Ok', 'E', 'A', '77082664', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 00:14:05.663', 'G3', 'yellow', 2205);
INSERT INTO component VALUES (2207, 'Network', 'IP: 10.0.0.1', 'F', 'H', '58624223', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 14:31:48.582', 'G2', 'green', 2205);
INSERT INTO location VALUES (2208, 'FC3', 'motor test', 'Hans Schmitt', 2200);
INSERT INTO device VALUES (2209, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '74155145', '2013-06-25 06:38:16.688', true, 2208);
INSERT INTO component VALUES (2210, 'Tests', 'Ok', 'F', 'B', '49123158', 'Howard Joel Wolowitz', '2013-06-25 13:40:02.609', 'D6', 'green', 2209);
INSERT INTO component VALUES (2211, 'Network', 'IP: 10.0.0.1', 'A', 'C', '95043439', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 00:24:56.234', 'H8', 'yellow', 2209);
INSERT INTO device VALUES (2212, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '29999154', '2013-06-25 05:48:02.584', false, 2208);
INSERT INTO component VALUES (2213, 'Tests', 'Ok', 'E', 'H', '49040575', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 01:52:26.876', 'H9', 'green', 2212);
INSERT INTO component VALUES (2214, 'Network', 'IP: 10.0.0.1', 'A', 'I', '13645112', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 10:27:21.924', 'B6', 'green', 2212);
INSERT INTO line VALUES (2215, 'B8 Finish', 'Series 2', 70, 'rect497', 2184);
INSERT INTO location VALUES (2216, 'DG2', 'multimedia test', 'Sarah Merkel', 2215);
INSERT INTO device VALUES (2217, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '80567296', '2013-06-25 18:13:40.2', false, 2216);
INSERT INTO component VALUES (2218, 'Tests', 'Ok', 'F', 'F', '83444753', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:51:26.974', 'B8', 'green', 2217);
INSERT INTO component VALUES (2219, 'Network', 'IP: 10.0.0.1', 'E', 'I', '48333293', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 19:06:54.324', 'D5', 'green', 2217);
INSERT INTO device VALUES (2220, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '54365325', '2013-06-25 03:43:37.716', false, 2216);
INSERT INTO component VALUES (2221, 'Tests', 'Ok', 'C', 'G', '95560144', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 04:14:32.431', 'E8', 'green', 2220);
INSERT INTO component VALUES (2222, 'Network', 'IP: 10.0.0.1', 'H', 'H', '12230861', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 12:15:51.337', 'B4', 'green', 2220);
INSERT INTO location VALUES (2223, 'AF3', 'ABS test', 'Robert Mueller', 2215);
INSERT INTO device VALUES (2224, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '47253093', '2013-06-25 22:10:54.922', false, 2223);
INSERT INTO component VALUES (2225, 'Tests', 'Ok', 'A', 'I', '19692579', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:35:03.715', 'B3', 'green', 2224);
INSERT INTO component VALUES (2226, 'Network', 'IP: 10.0.0.1', 'C', 'I', '6921178', 'Howard Joel Wolowitz', '2013-06-25 06:00:11.606', 'C6', 'green', 2224);
INSERT INTO device VALUES (2227, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '40886114', '2013-06-25 15:30:30.325', false, 2223);
INSERT INTO component VALUES (2228, 'Tests', 'Ok', 'C', 'B', '91293929', 'Howard Joel Wolowitz', '2013-06-25 03:33:10.193', 'E4', 'green', 2227);
INSERT INTO component VALUES (2229, 'Network', 'IP: 10.0.0.1', 'D', 'B', '84035965', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 13:54:59.178', 'D2', 'green', 2227);
INSERT INTO hall VALUES (2230, 'H9', 'Assembly+Finish', 26, 2895, 'Audi A4', 2, 'polygon249', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2231, 'H9 Assembly', 'Series 3', 34, 'rect217', 2230);
INSERT INTO location VALUES (2232, 'GI1', 'multimedia test', 'Peter Schulze', 2231);
INSERT INTO device VALUES (2233, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '83156702', '2013-06-25 12:44:35.423', false, 2232);
INSERT INTO component VALUES (2234, 'Tests', 'Ok', 'H', 'C', '22159154', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:49:21.355', 'H5', 'green', 2233);
INSERT INTO component VALUES (2235, 'Network', 'IP: 10.0.0.1', 'H', 'H', '2121634', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:53:50.731', 'D5', 'green', 2233);
INSERT INTO device VALUES (2236, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '84870085', '2013-06-25 20:10:18.771', false, 2232);
INSERT INTO component VALUES (2237, 'Tests', 'Ok', 'A', 'G', '59702427', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:22:14.978', 'E2', 'green', 2236);
INSERT INTO component VALUES (2238, 'Network', 'IP: 10.0.0.1', 'B', 'C', '78301643', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 01:07:47.393', 'D8', 'green', 2236);
INSERT INTO location VALUES (2239, 'BE2', 'multimedia test', 'Robert Mueller', 2231);
INSERT INTO device VALUES (2240, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '53819919', '2013-06-25 20:39:30.306', false, 2239);
INSERT INTO component VALUES (2241, 'Tests', 'Ok', 'C', 'I', '2955585', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 07:46:17.193', 'C5', 'green', 2240);
INSERT INTO component VALUES (2242, 'Network', 'IP: 10.0.0.1', 'B', 'I', '1301063', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 00:05:49.791', 'D4', 'yellow', 2240);
INSERT INTO device VALUES (2243, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '38114311', '2013-06-25 05:38:42.41', false, 2239);
INSERT INTO component VALUES (2244, 'Tests', 'Ok', 'I', 'I', '83276656', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 20:51:56.742', 'D2', 'green', 2243);
INSERT INTO component VALUES (2245, 'Network', 'IP: 10.0.0.1', 'H', 'B', '64098702', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:15:54.819', 'I3', 'green', 2243);
INSERT INTO line VALUES (2246, 'H9 PreSeries', 'Series 5', 86, 'polygon25', 2230);
INSERT INTO location VALUES (2247, 'IH5', 'motor test', 'Hans Mueller', 2246);
INSERT INTO device VALUES (2248, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '62583890', '2013-06-25 17:34:05.369', false, 2247);
INSERT INTO component VALUES (2249, 'Tests', 'Ok', 'I', 'D', '89505591', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 13:38:52.787', 'F2', 'red', 2248);
INSERT INTO component VALUES (2250, 'Network', 'IP: 10.0.0.1', 'G', 'F', '73339447', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 03:46:27.582', 'A6', 'green', 2248);
INSERT INTO device VALUES (2251, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '73191333', '2013-06-25 09:02:59.216', false, 2247);
INSERT INTO component VALUES (2252, 'Tests', 'Ok', 'B', 'C', '50126246', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 09:35:20.252', 'D9', 'green', 2251);
INSERT INTO component VALUES (2253, 'Network', 'IP: 10.0.0.1', 'I', 'I', '27625390', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 14:13:19.002', 'D9', 'green', 2251);
INSERT INTO location VALUES (2254, 'HB6', 'transmission test', 'Sarah Schulze', 2246);
INSERT INTO device VALUES (2255, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '20092115', '2013-06-25 10:20:45.195', false, 2254);
INSERT INTO component VALUES (2256, 'Tests', 'Ok', 'E', 'G', '91161030', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:54:40.131', 'G5', 'green', 2255);
INSERT INTO component VALUES (2257, 'Network', 'IP: 10.0.0.1', 'G', 'H', '15142765', 'Howard Joel Wolowitz', '2013-06-25 13:12:14.787', 'C6', 'green', 2255);
INSERT INTO device VALUES (2258, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '10471842', '2013-06-25 22:15:02.507', false, 2254);
INSERT INTO component VALUES (2259, 'Tests', 'Ok', 'A', 'C', '99344366', 'Howard Joel Wolowitz', '2013-06-26 00:50:39.668', 'A8', 'green', 2258);
INSERT INTO component VALUES (2260, 'Network', 'IP: 10.0.0.1', 'E', 'C', '51639145', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 04:41:18.39', 'F9', 'green', 2258);
INSERT INTO line VALUES (2261, 'H9 Finish', 'Series 2', 64, 'rect497', 2230);
INSERT INTO location VALUES (2262, 'CD5', 'motor test', 'Franziska Merkel', 2261);
INSERT INTO device VALUES (2263, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '78289699', '2013-06-25 15:51:06.221', true, 2262);
INSERT INTO component VALUES (2264, 'Tests', 'Ok', 'H', 'F', '11517196', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 08:42:03.644', 'I7', 'green', 2263);
INSERT INTO component VALUES (2265, 'Network', 'IP: 10.0.0.1', 'E', 'E', '73143927', 'Howard Joel Wolowitz', '2013-06-25 14:56:45.199', 'A7', 'green', 2263);
INSERT INTO device VALUES (2266, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '37411382', '2013-06-25 16:01:14.852', false, 2262);
INSERT INTO component VALUES (2267, 'Tests', 'Ok', 'I', 'D', '81213333', 'Howard Joel Wolowitz', '2013-06-25 22:31:38.511', 'C3', 'green', 2266);
INSERT INTO component VALUES (2268, 'Network', 'IP: 10.0.0.1', 'H', 'I', '76490302', 'Howard Joel Wolowitz', '2013-06-25 16:47:47.96', 'B9', 'green', 2266);
INSERT INTO location VALUES (2269, 'DF9', 'security test', 'Hans Merkel', 2261);
INSERT INTO device VALUES (2270, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '51015675', '2013-06-25 19:46:13.398', true, 2269);
INSERT INTO component VALUES (2271, 'Tests', 'Ok', 'H', 'F', '77487911', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 20:54:22.985', 'I8', 'green', 2270);
INSERT INTO component VALUES (2272, 'Network', 'IP: 10.0.0.1', 'G', 'G', '253578', 'Howard Joel Wolowitz', '2013-06-25 14:30:26.217', 'I2', 'green', 2270);
INSERT INTO device VALUES (2273, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '36172300', '2013-06-25 21:15:48.067', false, 2269);
INSERT INTO component VALUES (2274, 'Tests', 'Ok', 'F', 'D', '99831806', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 10:58:14.853', 'E5', 'green', 2273);
INSERT INTO component VALUES (2275, 'Network', 'IP: 10.0.0.1', 'I', 'I', '23717856', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:04:11.98', 'B8', 'green', 2273);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 4;
INSERT INTO hall VALUES (2276, 'H1', 'Assembly+Finish', 89, 3717, 'Audi A4', 2, 'path369', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2277, 'H1 Assembly', 'Series 5', 57, 'rect217', 2276);
INSERT INTO location VALUES (2278, 'AF2', 'ABS test', 'Hans Mueller', 2277);
INSERT INTO device VALUES (2279, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '92781023', '2013-06-25 07:52:40.512', false, 2278);
INSERT INTO component VALUES (2280, 'Tests', 'Ok', 'G', 'B', '68948456', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 00:25:56.096', 'C1', 'green', 2279);
INSERT INTO component VALUES (2281, 'Network', 'IP: 10.0.0.1', 'E', 'I', '43100773', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 09:43:31.858', 'D8', 'green', 2279);
INSERT INTO device VALUES (2282, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '57119275', '2013-06-25 13:38:19.125', false, 2278);
INSERT INTO component VALUES (2283, 'Tests', 'Ok', 'H', 'G', '33290957', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:53:15.545', 'D9', 'green', 2282);
INSERT INTO component VALUES (2284, 'Network', 'IP: 10.0.0.1', 'F', 'B', '30298300', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 22:55:01.329', 'H7', 'green', 2282);
INSERT INTO location VALUES (2285, 'AD5', 'transmission test', 'Franziska Schulze', 2277);
INSERT INTO device VALUES (2286, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '18539996', '2013-06-25 14:38:00.09', false, 2285);
INSERT INTO component VALUES (2287, 'Tests', 'Ok', 'C', 'B', '52855805', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 07:34:37.585', 'F6', 'green', 2286);
INSERT INTO component VALUES (2288, 'Network', 'IP: 10.0.0.1', 'D', 'D', '60644053', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 06:58:42.86', 'B2', 'green', 2286);
INSERT INTO device VALUES (2289, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '15332473', '2013-06-25 15:54:49.55', false, 2285);
INSERT INTO component VALUES (2290, 'Tests', 'Ok', 'F', 'B', '16785892', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 06:33:19.485', 'E9', 'green', 2289);
INSERT INTO component VALUES (2291, 'Network', 'IP: 10.0.0.1', 'C', 'C', '86571139', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 00:44:37.927', 'E4', 'green', 2289);
INSERT INTO line VALUES (2292, 'H1 PreSeries', 'Series 2', 65, 'polygon25', 2276);
INSERT INTO location VALUES (2293, 'BD1', 'multimedia test', 'Sarah Schulze', 2292);
INSERT INTO device VALUES (2294, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '10454951', '2013-06-25 09:49:19.102', false, 2293);
INSERT INTO component VALUES (2295, 'Tests', 'Ok', 'B', 'B', '78827368', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 22:15:34.326', 'A9', 'green', 2294);
INSERT INTO component VALUES (2296, 'Network', 'IP: 10.0.0.1', 'C', 'H', '18297346', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-26 01:20:53.011', 'H2', 'green', 2294);
INSERT INTO device VALUES (2297, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '72003510', '2013-06-26 00:58:15.866', true, 2293);
INSERT INTO component VALUES (2298, 'Tests', 'Ok', 'E', 'I', '52452451', 'Howard Joel Wolowitz', '2013-06-25 08:15:46.644', 'B3', 'green', 2297);
INSERT INTO component VALUES (2299, 'Network', 'IP: 10.0.0.1', 'F', 'A', '42207524', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:56:41.711', 'H1', 'green', 2297);
INSERT INTO location VALUES (2300, 'FE1', 'ABS test', 'Peter Schmitt', 2292);
INSERT INTO device VALUES (2301, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '29173993', '2013-06-25 08:33:29.01', false, 2300);
INSERT INTO component VALUES (2302, 'Tests', 'Ok', 'I', 'F', '24377769', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 15:11:43.239', 'G5', 'yellow', 2301);
INSERT INTO component VALUES (2303, 'Network', 'IP: 10.0.0.1', 'B', 'C', '6478548', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 17:06:06.838', 'H5', 'green', 2301);
INSERT INTO device VALUES (2304, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '85029312', '2013-06-25 04:12:30.94', false, 2300);
INSERT INTO component VALUES (2305, 'Tests', 'Ok', 'I', 'I', '94583900', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 03:44:11.503', 'C8', 'green', 2304);
INSERT INTO component VALUES (2306, 'Network', 'IP: 10.0.0.1', 'B', 'A', '4773647', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 01:32:30.505', 'E9', 'green', 2304);
INSERT INTO line VALUES (2307, 'H1 Finish', 'Series 9', 36, 'rect497', 2276);
INSERT INTO location VALUES (2308, 'GH4', 'motor test', 'Franziska Merkel', 2307);
INSERT INTO device VALUES (2309, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '73636883', '2013-06-25 09:14:49.361', false, 2308);
INSERT INTO component VALUES (2310, 'Tests', 'Ok', 'H', 'H', '79137223', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 13:56:08.581', 'E2', 'green', 2309);
INSERT INTO component VALUES (2311, 'Network', 'IP: 10.0.0.1', 'F', 'G', '70478333', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:10:06.253', 'C3', 'green', 2309);
INSERT INTO device VALUES (2312, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '97233231', '2013-06-25 05:28:24.464', false, 2308);
INSERT INTO component VALUES (2313, 'Tests', 'Ok', 'B', 'I', '66060865', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 22:35:38.381', 'D5', 'green', 2312);
INSERT INTO component VALUES (2314, 'Network', 'IP: 10.0.0.1', 'A', 'B', '50328354', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 16:28:42.183', 'I7', 'green', 2312);
INSERT INTO location VALUES (2315, 'BG7', 'transmission test', 'Robert Schulze', 2307);
INSERT INTO device VALUES (2316, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '5353103', '2013-06-25 05:15:45.91', false, 2315);
INSERT INTO component VALUES (2317, 'Tests', 'Ok', 'D', 'C', '66630597', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 06:19:31.405', 'E3', 'green', 2316);
INSERT INTO component VALUES (2318, 'Network', 'IP: 10.0.0.1', 'A', 'E', '59086871', 'Howard Joel Wolowitz', '2013-06-25 10:58:54.572', 'D8', 'green', 2316);
INSERT INTO device VALUES (2319, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '65346471', '2013-06-25 01:46:45.558', true, 2315);
INSERT INTO component VALUES (2320, 'Tests', 'Ok', 'F', 'B', '47147316', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 16:40:11.278', 'E5', 'green', 2319);
INSERT INTO component VALUES (2321, 'Network', 'IP: 10.0.0.1', 'H', 'C', '97294537', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:43:53.114', 'D3', 'green', 2319);
INSERT INTO hall VALUES (2322, 'B3', 'Assembly+Finish', 51, 4318, 'Audi A4', 2, 'polygon249', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2323, 'B3 Assembly', 'Series 6', 66, 'rect217', 2322);
INSERT INTO location VALUES (2324, 'DG2', 'security test', 'Robert Schmitt', 2323);
INSERT INTO device VALUES (2325, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '71310788', '2013-06-25 18:47:45.389', false, 2324);
INSERT INTO component VALUES (2326, 'Tests', 'Ok', 'C', 'B', '7192923', 'Howard Joel Wolowitz', '2013-06-25 12:06:13.661', 'C8', 'green', 2325);
INSERT INTO component VALUES (2327, 'Network', 'IP: 10.0.0.1', 'I', 'E', '43460302', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:09:47.923', 'E4', 'green', 2325);
INSERT INTO device VALUES (2328, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '90087759', '2013-06-25 22:23:01.96', false, 2324);
INSERT INTO component VALUES (2329, 'Tests', 'Ok', 'B', 'E', '39111802', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 04:09:26.875', 'H6', 'green', 2328);
INSERT INTO component VALUES (2330, 'Network', 'IP: 10.0.0.1', 'E', 'B', '79739136', 'Howard Joel Wolowitz', '2013-06-25 14:08:26.746', 'F6', 'green', 2328);
INSERT INTO location VALUES (2331, 'DG4', 'transmission test', 'Sarah Merkel', 2323);
INSERT INTO device VALUES (2332, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '84510949', '2013-06-25 13:18:34.484', false, 2331);
INSERT INTO component VALUES (2333, 'Tests', 'Ok', 'B', 'C', '60955111', 'Howard Joel Wolowitz', '2013-06-25 20:24:58.793', 'E8', 'green', 2332);
INSERT INTO component VALUES (2334, 'Network', 'IP: 10.0.0.1', 'B', 'F', '20244781', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 12:35:38.248', 'E9', 'green', 2332);
INSERT INTO device VALUES (2335, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '63581425', '2013-06-25 12:44:45.703', false, 2331);
INSERT INTO component VALUES (2336, 'Tests', 'Ok', 'H', 'A', '16407741', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 10:57:15.471', 'B9', 'green', 2335);
INSERT INTO component VALUES (2337, 'Network', 'IP: 10.0.0.1', 'G', 'A', '12882863', 'Howard Joel Wolowitz', '2013-06-25 20:59:01.232', 'E1', 'red', 2335);
INSERT INTO line VALUES (2338, 'B3 PreSeries', 'Series 8', 100, 'polygon25', 2322);
INSERT INTO location VALUES (2339, 'GH2', 'transmission test', 'Robert Schulze', 2338);
INSERT INTO device VALUES (2340, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '5680455', '2013-06-25 13:06:41.13', false, 2339);
INSERT INTO component VALUES (2341, 'Tests', 'Ok', 'A', 'G', '12701265', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 00:07:07.98', 'C1', 'green', 2340);
INSERT INTO component VALUES (2342, 'Network', 'IP: 10.0.0.1', 'E', 'B', '80620842', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:45:28.112', 'A6', 'green', 2340);
INSERT INTO device VALUES (2343, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '10598952', '2013-06-25 15:29:11.373', false, 2339);
INSERT INTO component VALUES (2344, 'Tests', 'Ok', 'A', 'H', '35203420', 'Howard Joel Wolowitz', '2013-06-25 22:53:02.537', 'D2', 'green', 2343);
INSERT INTO component VALUES (2345, 'Network', 'IP: 10.0.0.1', 'I', 'B', '36270196', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 05:54:41.091', 'E3', 'green', 2343);
INSERT INTO location VALUES (2346, 'HA3', 'multimedia test', 'Franziska Mueller', 2338);
INSERT INTO device VALUES (2347, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '2437462', '2013-06-25 15:17:23.251', false, 2346);
INSERT INTO component VALUES (2348, 'Tests', 'Ok', 'C', 'I', '18395019', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 13:52:23.175', 'H8', 'green', 2347);
INSERT INTO component VALUES (2349, 'Network', 'IP: 10.0.0.1', 'B', 'B', '6032428', 'Howard Joel Wolowitz', '2013-06-25 23:18:17.028', 'E4', 'green', 2347);
INSERT INTO device VALUES (2350, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '18024505', '2013-06-25 09:21:56.325', false, 2346);
INSERT INTO component VALUES (2351, 'Tests', 'Ok', 'E', 'B', '25248056', 'Howard Joel Wolowitz', '2013-06-25 02:36:31.913', 'C8', 'green', 2350);
INSERT INTO component VALUES (2352, 'Network', 'IP: 10.0.0.1', 'G', 'F', '50115665', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 09:40:11.035', 'A8', 'green', 2350);
INSERT INTO line VALUES (2353, 'B3 Finish', 'Series 9', 65, 'rect497', 2322);
INSERT INTO location VALUES (2354, 'IF6', 'ABS test', 'Hans Merkel', 2353);
INSERT INTO device VALUES (2355, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '62058014', '2013-06-25 08:29:52.165', false, 2354);
INSERT INTO component VALUES (2356, 'Tests', 'Ok', 'I', 'F', '77400811', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 08:01:33.551', 'G9', 'green', 2355);
INSERT INTO component VALUES (2357, 'Network', 'IP: 10.0.0.1', 'C', 'E', '85242747', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 01:35:33.736', 'C3', 'green', 2355);
INSERT INTO device VALUES (2358, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '75142236', '2013-06-25 19:37:16.817', false, 2354);
INSERT INTO component VALUES (2359, 'Tests', 'Ok', 'H', 'F', '42400488', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 20:30:31.071', 'I2', 'green', 2358);
INSERT INTO component VALUES (2360, 'Network', 'IP: 10.0.0.1', 'G', 'E', '90539784', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 03:17:53.67', 'C2', 'yellow', 2358);
INSERT INTO location VALUES (2361, 'AI2', 'ABS test', 'Peter Merkel', 2353);
INSERT INTO device VALUES (2362, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '16452953', '2013-06-25 15:17:54.537', false, 2361);
INSERT INTO component VALUES (2363, 'Tests', 'Ok', 'D', 'H', '62839652', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 06:04:43.371', 'B9', 'green', 2362);
INSERT INTO component VALUES (2364, 'Network', 'IP: 10.0.0.1', 'H', 'G', '82081384', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 23:43:44.845', 'B5', 'green', 2362);
INSERT INTO device VALUES (2365, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '79376132', '2013-06-25 22:54:06.84', false, 2361);
INSERT INTO component VALUES (2366, 'Tests', 'Ok', 'I', 'B', '8497370', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 11:57:16.012', 'I8', 'green', 2365);
INSERT INTO component VALUES (2367, 'Network', 'IP: 10.0.0.1', 'E', 'H', '26718632', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 19:58:35.277', 'F1', 'green', 2365);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 5;
INSERT INTO hall VALUES (2368, 'I9', 'Assembly+Finish', 146, 817, 'Audi A4', 2, 'path369', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2369, 'I9 Assembly', 'Series 8', 80, 'rect217', 2368);
INSERT INTO location VALUES (2370, 'CF2', 'multimedia test', 'Sarah Meier', 2369);
INSERT INTO device VALUES (2371, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '75072048', '2013-06-25 04:17:55.861', false, 2370);
INSERT INTO component VALUES (2372, 'Tests', 'Ok', 'D', 'H', '73990799', 'Howard Joel Wolowitz', '2013-06-25 19:58:43.806', 'D1', 'green', 2371);
INSERT INTO component VALUES (2373, 'Network', 'IP: 10.0.0.1', 'E', 'B', '41241738', 'Howard Joel Wolowitz', '2013-06-25 08:16:31.288', 'D3', 'green', 2371);
INSERT INTO device VALUES (2374, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '54324931', '2013-06-26 01:06:40.92', false, 2370);
INSERT INTO component VALUES (2375, 'Tests', 'Ok', 'C', 'E', '47586853', 'Howard Joel Wolowitz', '2013-06-25 06:18:59.572', 'I3', 'green', 2374);
INSERT INTO component VALUES (2376, 'Network', 'IP: 10.0.0.1', 'I', 'G', '28057745', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 10:25:13.907', 'F2', 'green', 2374);
INSERT INTO location VALUES (2377, 'GD1', 'motor test', 'Robert Schmitt', 2369);
INSERT INTO device VALUES (2378, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '19035943', '2013-06-25 05:19:43.015', false, 2377);
INSERT INTO component VALUES (2379, 'Tests', 'Ok', 'G', 'F', '58732550', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 10:25:04.219', 'E4', 'green', 2378);
INSERT INTO component VALUES (2380, 'Network', 'IP: 10.0.0.1', 'I', 'G', '87364599', 'Howard Joel Wolowitz', '2013-06-26 01:15:44.649', 'A1', 'green', 2378);
INSERT INTO device VALUES (2381, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '74975783', '2013-06-25 17:59:14.895', false, 2377);
INSERT INTO component VALUES (2382, 'Tests', 'Ok', 'F', 'E', '26528876', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 07:02:48.74', 'G8', 'red', 2381);
INSERT INTO component VALUES (2383, 'Network', 'IP: 10.0.0.1', 'H', 'E', '38326226', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:35:36.472', 'F9', 'green', 2381);
INSERT INTO line VALUES (2384, 'I9 PreSeries', 'Series 2', 67, 'polygon25', 2368);
INSERT INTO location VALUES (2385, 'FC2', 'motor test', 'Sarah Meier', 2384);
INSERT INTO device VALUES (2386, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '93217467', '2013-06-25 10:24:43.401', false, 2385);
INSERT INTO component VALUES (2387, 'Tests', 'Ok', 'I', 'C', '32057892', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 20:56:05.999', 'D6', 'green', 2386);
INSERT INTO component VALUES (2388, 'Network', 'IP: 10.0.0.1', 'I', 'A', '20898560', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 07:26:09.171', 'B5', 'green', 2386);
INSERT INTO device VALUES (2389, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '99174623', '2013-06-25 20:12:46.789', false, 2385);
INSERT INTO component VALUES (2390, 'Tests', 'Ok', 'F', 'F', '90837977', 'Howard Joel Wolowitz', '2013-06-25 12:54:27.656', 'G1', 'green', 2389);
INSERT INTO component VALUES (2391, 'Network', 'IP: 10.0.0.1', 'E', 'H', '27464589', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:04:54.457', 'D2', 'green', 2389);
INSERT INTO location VALUES (2392, 'FD9', 'motor test', 'Franziska Merkel', 2384);
INSERT INTO device VALUES (2393, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '85197415', '2013-06-25 15:50:51.614', false, 2392);
INSERT INTO component VALUES (2394, 'Tests', 'Ok', 'I', 'I', '89194838', 'Howard Joel Wolowitz', '2013-06-25 21:48:38.544', 'D6', 'green', 2393);
INSERT INTO component VALUES (2395, 'Network', 'IP: 10.0.0.1', 'I', 'D', '61517920', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 22:04:04.748', 'E4', 'green', 2393);
INSERT INTO device VALUES (2396, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '97403383', '2013-06-25 12:54:17.482', false, 2392);
INSERT INTO component VALUES (2397, 'Tests', 'Ok', 'F', 'D', '88103288', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:37:23.705', 'F2', 'green', 2396);
INSERT INTO component VALUES (2398, 'Network', 'IP: 10.0.0.1', 'A', 'C', '6878531', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 02:54:39.189', 'E5', 'green', 2396);
INSERT INTO line VALUES (2399, 'I9 Finish', 'Series 6', 22, 'rect497', 2368);
INSERT INTO location VALUES (2400, 'AA1', 'transmission test', 'Hans Mueller', 2399);
INSERT INTO device VALUES (2401, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '7631269', '2013-06-25 04:45:36.354', true, 2400);
INSERT INTO component VALUES (2402, 'Tests', 'Ok', 'D', 'A', '6272104', 'Howard Joel Wolowitz', '2013-06-25 05:40:36.724', 'I1', 'green', 2401);
INSERT INTO component VALUES (2403, 'Network', 'IP: 10.0.0.1', 'C', 'F', '6671984', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 18:35:01.431', 'I8', 'green', 2401);
INSERT INTO device VALUES (2404, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '89331723', '2013-06-25 21:17:25.749', false, 2400);
INSERT INTO component VALUES (2405, 'Tests', 'Ok', 'H', 'I', '65027360', 'Howard Joel Wolowitz', '2013-06-25 08:36:45.158', 'C8', 'green', 2404);
INSERT INTO component VALUES (2406, 'Network', 'IP: 10.0.0.1', 'H', 'E', '28821502', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 17:20:28.713', 'A5', 'green', 2404);
INSERT INTO location VALUES (2407, 'AF1', 'motor test', 'Franziska Meier', 2399);
INSERT INTO device VALUES (2408, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '40697266', '2013-06-25 06:35:13.775', false, 2407);
INSERT INTO component VALUES (2409, 'Tests', 'Ok', 'E', 'F', '13296735', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:46:53.176', 'C1', 'green', 2408);
INSERT INTO component VALUES (2410, 'Network', 'IP: 10.0.0.1', 'C', 'H', '76332779', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 03:21:15.745', 'I2', 'green', 2408);
INSERT INTO device VALUES (2411, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '33004329', '2013-06-25 19:03:41.574', false, 2407);
INSERT INTO component VALUES (2412, 'Tests', 'Ok', 'I', 'C', '87804113', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:55:59.165', 'E9', 'green', 2411);
INSERT INTO component VALUES (2413, 'Network', 'IP: 10.0.0.1', 'G', 'F', '76630578', 'Howard Joel Wolowitz', '2013-06-25 12:02:42.23', 'H9', 'green', 2411);
INSERT INTO hall VALUES (2414, 'G3', 'Assembly+Finish', 958, 527, 'Audi A4', 2, 'polygon249', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2415, 'G3 Assembly', 'Series 4', 26, 'rect217', 2414);
INSERT INTO location VALUES (2416, 'BD9', 'transmission test', 'Hans Mueller', 2415);
INSERT INTO device VALUES (2417, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '56142308', '2013-06-25 16:55:41.365', false, 2416);
INSERT INTO component VALUES (2418, 'Tests', 'Ok', 'C', 'E', '97389237', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 22:50:16.302', 'F1', 'green', 2417);
INSERT INTO component VALUES (2419, 'Network', 'IP: 10.0.0.1', 'C', 'F', '9838604', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:47:40.487', 'B6', 'yellow', 2417);
INSERT INTO device VALUES (2420, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '3759594', '2013-06-25 10:46:12.099', false, 2416);
INSERT INTO component VALUES (2421, 'Tests', 'Ok', 'D', 'G', '97349087', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:10:27.188', 'A2', 'green', 2420);
INSERT INTO component VALUES (2422, 'Network', 'IP: 10.0.0.1', 'D', 'D', '10505', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 14:28:28.634', 'B3', 'green', 2420);
INSERT INTO location VALUES (2423, 'BD9', 'security test', 'Robert Schmitt', 2415);
INSERT INTO device VALUES (2424, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '12153769', '2013-06-25 01:59:38.123', false, 2423);
INSERT INTO component VALUES (2425, 'Tests', 'Ok', 'H', 'E', '36270051', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 08:33:53.811', 'F2', 'green', 2424);
INSERT INTO component VALUES (2426, 'Network', 'IP: 10.0.0.1', 'E', 'A', '17002746', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 20:49:11.671', 'G5', 'green', 2424);
INSERT INTO device VALUES (2427, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '85420501', '2013-06-25 11:09:52.289', false, 2423);
INSERT INTO component VALUES (2428, 'Tests', 'Ok', 'E', 'H', '40526491', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:11:03.862', 'B7', 'green', 2427);
INSERT INTO component VALUES (2429, 'Network', 'IP: 10.0.0.1', 'E', 'G', '47356843', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 11:04:53.468', 'H4', 'green', 2427);
INSERT INTO line VALUES (2430, 'G3 PreSeries', 'Series 5', 99, 'polygon25', 2414);
INSERT INTO location VALUES (2431, 'IE6', 'motor test', 'Franziska Schmitt', 2430);
INSERT INTO device VALUES (2432, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '31972372', '2013-06-25 22:49:18.965', false, 2431);
INSERT INTO component VALUES (2433, 'Tests', 'Ok', 'C', 'B', '37008625', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 15:02:08.184', 'B5', 'green', 2432);
INSERT INTO component VALUES (2434, 'Network', 'IP: 10.0.0.1', 'I', 'D', '868870', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:46:51.432', 'F4', 'green', 2432);
INSERT INTO device VALUES (2435, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '40595846', '2013-06-25 16:09:25.13', false, 2431);
INSERT INTO component VALUES (2436, 'Tests', 'Ok', 'I', 'H', '17104160', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-26 01:30:11.172', 'F2', 'green', 2435);
INSERT INTO component VALUES (2437, 'Network', 'IP: 10.0.0.1', 'E', 'I', '26550719', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 11:02:01.758', 'B7', 'green', 2435);
INSERT INTO location VALUES (2438, 'GH7', 'multimedia test', 'Peter Mueller', 2430);
INSERT INTO device VALUES (2439, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '55205198', '2013-06-25 07:12:50.47', false, 2438);
INSERT INTO component VALUES (2440, 'Tests', 'Ok', 'A', 'F', '11828290', 'Howard Joel Wolowitz', '2013-06-26 00:06:25.247', 'E8', 'green', 2439);
INSERT INTO component VALUES (2441, 'Network', 'IP: 10.0.0.1', 'H', 'G', '57332913', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 09:09:57.14', 'D4', 'green', 2439);
INSERT INTO device VALUES (2442, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '34960833', '2013-06-25 15:38:58.614', false, 2438);
INSERT INTO component VALUES (2443, 'Tests', 'Ok', 'C', 'G', '31633032', 'Howard Joel Wolowitz', '2013-06-25 10:16:06.217', 'C8', 'green', 2442);
INSERT INTO component VALUES (2444, 'Network', 'IP: 10.0.0.1', 'F', 'D', '31944143', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-26 01:13:22.698', 'C5', 'red', 2442);
INSERT INTO line VALUES (2445, 'G3 Finish', 'Series 4', 81, 'rect497', 2414);
INSERT INTO location VALUES (2446, 'FF8', 'transmission test', 'Peter Schmitt', 2445);
INSERT INTO device VALUES (2447, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '89939432', '2013-06-25 17:28:52.832', false, 2446);
INSERT INTO component VALUES (2448, 'Tests', 'Ok', 'C', 'G', '48630797', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 20:30:05.521', 'I7', 'green', 2447);
INSERT INTO component VALUES (2449, 'Network', 'IP: 10.0.0.1', 'C', 'E', '90753296', 'Howard Joel Wolowitz', '2013-06-25 18:56:00.514', 'G4', 'green', 2447);
INSERT INTO device VALUES (2450, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '77619123', '2013-06-25 17:11:13.352', false, 2446);
INSERT INTO component VALUES (2451, 'Tests', 'Ok', 'A', 'D', '6243820', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 13:27:16.591', 'G1', 'yellow', 2450);
INSERT INTO component VALUES (2452, 'Network', 'IP: 10.0.0.1', 'D', 'B', '77681941', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:11:27.191', 'F8', 'red', 2450);
INSERT INTO location VALUES (2453, 'HC5', 'motor test', 'Robert Meier', 2445);
INSERT INTO device VALUES (2454, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '39286527', '2013-06-25 06:11:48.77', false, 2453);
INSERT INTO component VALUES (2455, 'Tests', 'Ok', 'F', 'H', '17527821', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 22:50:03.955', 'H2', 'green', 2454);
INSERT INTO component VALUES (2456, 'Network', 'IP: 10.0.0.1', 'C', 'C', '7129747', 'Howard Joel Wolowitz', '2013-06-25 03:48:33.052', 'F1', 'green', 2454);
INSERT INTO device VALUES (2457, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '29576405', '2013-06-25 10:38:37.869', false, 2453);
INSERT INTO component VALUES (2458, 'Tests', 'Ok', 'E', 'I', '89750553', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:08:31.895', 'C1', 'green', 2457);
INSERT INTO component VALUES (2459, 'Network', 'IP: 10.0.0.1', 'I', 'C', '81458541', 'Howard Joel Wolowitz', '2013-06-25 11:02:13.425', 'H5', 'red', 2457);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 6;
INSERT INTO hall VALUES (2460, 'G6', 'Assembly+Finish', 215, 1337, 'Audi A4', 2, 'path369', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2461, 'G6 Assembly', 'Series 5', 15, 'rect217', 2460);
INSERT INTO location VALUES (2462, 'BC3', 'multimedia test', 'Hans Schulze', 2461);
INSERT INTO device VALUES (2463, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '39752483', '2013-06-25 19:05:04.868', false, 2462);
INSERT INTO component VALUES (2464, 'Tests', 'Ok', 'E', 'E', '72335189', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 20:34:36.332', 'G4', 'green', 2463);
INSERT INTO component VALUES (2465, 'Network', 'IP: 10.0.0.1', 'F', 'E', '35823592', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:12:25.047', 'C9', 'green', 2463);
INSERT INTO device VALUES (2466, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '26592858', '2013-06-25 11:38:46.084', true, 2462);
INSERT INTO component VALUES (2467, 'Tests', 'Ok', 'G', 'I', '69124180', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:49:21.682', 'B4', 'green', 2466);
INSERT INTO component VALUES (2468, 'Network', 'IP: 10.0.0.1', 'D', 'G', '99790909', 'Howard Joel Wolowitz', '2013-06-25 16:19:37.43', 'G1', 'green', 2466);
INSERT INTO location VALUES (2469, 'IB6', 'ABS test', 'Robert Mueller', 2461);
INSERT INTO device VALUES (2470, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '66221756', '2013-06-25 08:02:13.427', false, 2469);
INSERT INTO component VALUES (2471, 'Tests', 'Ok', 'G', 'C', '28219363', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 12:09:01.861', 'B6', 'green', 2470);
INSERT INTO component VALUES (2472, 'Network', 'IP: 10.0.0.1', 'G', 'E', '82913878', 'Howard Joel Wolowitz', '2013-06-26 00:09:19.153', 'A1', 'yellow', 2470);
INSERT INTO device VALUES (2473, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '83852548', '2013-06-25 10:40:50.85', false, 2469);
INSERT INTO component VALUES (2474, 'Tests', 'Ok', 'C', 'D', '33240611', 'Howard Joel Wolowitz', '2013-06-25 21:03:33.67', 'C5', 'green', 2473);
INSERT INTO component VALUES (2475, 'Network', 'IP: 10.0.0.1', 'D', 'B', '62748187', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 09:32:25.68', 'D3', 'green', 2473);
INSERT INTO line VALUES (2476, 'G6 PreSeries', 'Series 1', 74, 'polygon25', 2460);
INSERT INTO location VALUES (2477, 'CC5', 'multimedia test', 'Hans Meier', 2476);
INSERT INTO device VALUES (2478, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '21688621', '2013-06-25 05:07:02.42', false, 2477);
INSERT INTO component VALUES (2479, 'Tests', 'Ok', 'E', 'H', '37011456', 'Howard Joel Wolowitz', '2013-06-25 18:55:49.739', 'A4', 'green', 2478);
INSERT INTO component VALUES (2480, 'Network', 'IP: 10.0.0.1', 'C', 'A', '38662185', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 10:33:38.879', 'D8', 'green', 2478);
INSERT INTO device VALUES (2481, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '35448937', '2013-06-25 03:22:07.279', false, 2477);
INSERT INTO component VALUES (2482, 'Tests', 'Ok', 'F', 'D', '55138748', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 00:51:58.496', 'G5', 'yellow', 2481);
INSERT INTO component VALUES (2483, 'Network', 'IP: 10.0.0.1', 'E', 'F', '1622113', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:50:56.442', 'B1', 'green', 2481);
INSERT INTO location VALUES (2484, 'CF6', 'transmission test', 'Robert Merkel', 2476);
INSERT INTO device VALUES (2485, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '35883691', '2013-06-25 11:31:09.39', false, 2484);
INSERT INTO component VALUES (2486, 'Tests', 'Ok', 'F', 'C', '27909418', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:15:30.336', 'G8', 'green', 2485);
INSERT INTO component VALUES (2487, 'Network', 'IP: 10.0.0.1', 'B', 'B', '28231795', 'Howard Joel Wolowitz', '2013-06-25 23:00:28.548', 'B8', 'green', 2485);
INSERT INTO device VALUES (2488, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '84979249', '2013-06-25 02:58:24.882', false, 2484);
INSERT INTO component VALUES (2489, 'Tests', 'Ok', 'I', 'G', '70291765', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 18:24:49.409', 'C7', 'green', 2488);
INSERT INTO component VALUES (2490, 'Network', 'IP: 10.0.0.1', 'C', 'B', '75065603', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:50:05.584', 'I4', 'green', 2488);
INSERT INTO line VALUES (2491, 'G6 Finish', 'Series 6', 28, 'rect497', 2460);
INSERT INTO location VALUES (2492, 'BH9', 'security test', 'Robert Meier', 2491);
INSERT INTO device VALUES (2493, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '85108912', '2013-06-25 04:15:31.851', false, 2492);
INSERT INTO component VALUES (2494, 'Tests', 'Ok', 'F', 'E', '50070991', 'Howard Joel Wolowitz', '2013-06-25 21:31:11.682', 'I4', 'green', 2493);
INSERT INTO component VALUES (2495, 'Network', 'IP: 10.0.0.1', 'H', 'D', '69067892', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 06:07:15.567', 'I8', 'yellow', 2493);
INSERT INTO device VALUES (2496, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '47967', '2013-06-25 16:17:06.126', false, 2492);
INSERT INTO component VALUES (2497, 'Tests', 'Ok', 'B', 'A', '46673411', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 05:08:46.88', 'C4', 'green', 2496);
INSERT INTO component VALUES (2498, 'Network', 'IP: 10.0.0.1', 'D', 'B', '77438024', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:59:04.75', 'G1', 'green', 2496);
INSERT INTO location VALUES (2499, 'FB2', 'ABS test', 'Hans Meier', 2491);
INSERT INTO device VALUES (2500, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '40634630', '2013-06-25 13:09:48.596', false, 2499);
INSERT INTO component VALUES (2501, 'Tests', 'Ok', 'C', 'H', '35279591', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 00:11:50.782', 'H2', 'yellow', 2500);
INSERT INTO component VALUES (2502, 'Network', 'IP: 10.0.0.1', 'F', 'B', '99046171', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 10:47:43.756', 'G1', 'green', 2500);
INSERT INTO device VALUES (2503, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '58316670', '2013-06-25 13:21:36.35', false, 2499);
INSERT INTO component VALUES (2504, 'Tests', 'Ok', 'F', 'F', '27699383', 'Howard Joel Wolowitz', '2013-06-25 07:33:47.266', 'H3', 'green', 2503);
INSERT INTO component VALUES (2505, 'Network', 'IP: 10.0.0.1', 'B', 'C', '76007032', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 05:38:37.053', 'E5', 'green', 2503);
INSERT INTO hall VALUES (2506, 'F1', 'Assembly+Finish', 973, 6016, 'Audi A4', 2, 'polygon249', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2507, 'F1 Assembly', 'Series 1', 43, 'rect217', 2506);
INSERT INTO location VALUES (2508, 'DA9', 'multimedia test', 'Sarah Schulze', 2507);
INSERT INTO device VALUES (2509, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '51027630', '2013-06-25 10:42:49.775', false, 2508);
INSERT INTO component VALUES (2510, 'Tests', 'Ok', 'I', 'E', '21877521', 'Dr. Leonard Leakey Hofstadter', '2013-06-26 01:24:03.226', 'G7', 'green', 2509);
INSERT INTO component VALUES (2511, 'Network', 'IP: 10.0.0.1', 'E', 'H', '82748575', 'Howard Joel Wolowitz', '2013-06-25 04:11:18.563', 'H2', 'green', 2509);
INSERT INTO device VALUES (2512, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '67584621', '2013-06-25 03:05:18.543', false, 2508);
INSERT INTO component VALUES (2513, 'Tests', 'Ok', 'B', 'H', '44502030', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:12:42.56', 'D1', 'green', 2512);
INSERT INTO component VALUES (2514, 'Network', 'IP: 10.0.0.1', 'A', 'D', '45600524', 'Howard Joel Wolowitz', '2013-06-25 15:11:30.068', 'B5', 'green', 2512);
INSERT INTO location VALUES (2515, 'II6', 'transmission test', 'Peter Schulze', 2507);
INSERT INTO device VALUES (2516, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '47299279', '2013-06-25 20:11:47.189', false, 2515);
INSERT INTO component VALUES (2517, 'Tests', 'Ok', 'I', 'H', '10067952', 'Howard Joel Wolowitz', '2013-06-25 15:20:09.7', 'I1', 'green', 2516);
INSERT INTO component VALUES (2518, 'Network', 'IP: 10.0.0.1', 'F', 'A', '73980678', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 14:23:01.456', 'H6', 'green', 2516);
INSERT INTO device VALUES (2519, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '77895015', '2013-06-25 11:11:00.099', false, 2515);
INSERT INTO component VALUES (2520, 'Tests', 'Ok', 'H', 'E', '95561279', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 10:16:02.996', 'D8', 'green', 2519);
INSERT INTO component VALUES (2521, 'Network', 'IP: 10.0.0.1', 'H', 'H', '523761', 'Howard Joel Wolowitz', '2013-06-25 19:59:43.257', 'B5', 'green', 2519);
INSERT INTO line VALUES (2522, 'F1 PreSeries', 'Series 4', 69, 'polygon25', 2506);
INSERT INTO location VALUES (2523, 'IC1', 'multimedia test', 'Robert Schulze', 2522);
INSERT INTO device VALUES (2524, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '54312904', '2013-06-25 01:41:32.73', false, 2523);
INSERT INTO component VALUES (2525, 'Tests', 'Ok', 'E', 'H', '21039896', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:53:58.744', 'H3', 'green', 2524);
INSERT INTO component VALUES (2526, 'Network', 'IP: 10.0.0.1', 'H', 'B', '5649320', 'Howard Joel Wolowitz', '2013-06-25 01:56:16.256', 'F4', 'green', 2524);
INSERT INTO device VALUES (2527, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '38140772', '2013-06-25 18:21:35.192', false, 2523);
INSERT INTO component VALUES (2528, 'Tests', 'Ok', 'E', 'F', '98837412', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 17:15:24.205', 'E3', 'green', 2527);
INSERT INTO component VALUES (2529, 'Network', 'IP: 10.0.0.1', 'G', 'B', '9169295', 'Howard Joel Wolowitz', '2013-06-25 03:51:04.742', 'I9', 'green', 2527);
INSERT INTO location VALUES (2530, 'DD1', 'security test', 'Robert Schulze', 2522);
INSERT INTO device VALUES (2531, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '35793097', '2013-06-25 15:14:31.116', false, 2530);
INSERT INTO component VALUES (2532, 'Tests', 'Ok', 'C', 'D', '2396495', 'Howard Joel Wolowitz', '2013-06-25 15:57:45.026', 'G4', 'green', 2531);
INSERT INTO component VALUES (2533, 'Network', 'IP: 10.0.0.1', 'C', 'H', '73792956', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:55:34.558', 'E5', 'green', 2531);
INSERT INTO device VALUES (2534, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '72060506', '2013-06-25 21:51:28.684', false, 2530);
INSERT INTO component VALUES (2535, 'Tests', 'Ok', 'E', 'D', '94450340', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 01:54:11.227', 'B1', 'green', 2534);
INSERT INTO component VALUES (2536, 'Network', 'IP: 10.0.0.1', 'E', 'E', '39601705', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:08:56.837', 'C3', 'green', 2534);
INSERT INTO line VALUES (2537, 'F1 Finish', 'Series 9', 20, 'rect497', 2506);
INSERT INTO location VALUES (2538, 'IH2', 'multimedia test', 'Peter Meier', 2537);
INSERT INTO device VALUES (2539, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '12503995', '2013-06-25 19:17:48.875', true, 2538);
INSERT INTO component VALUES (2540, 'Tests', 'Ok', 'F', 'A', '11437300', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 23:09:51.903', 'G2', 'green', 2539);
INSERT INTO component VALUES (2541, 'Network', 'IP: 10.0.0.1', 'F', 'H', '2067143', 'Howard Joel Wolowitz', '2013-06-25 22:59:39.417', 'A1', 'yellow', 2539);
INSERT INTO device VALUES (2542, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '53080518', '2013-06-25 02:21:53.572', false, 2538);
INSERT INTO component VALUES (2543, 'Tests', 'Ok', 'F', 'D', '40260244', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 20:55:16.849', 'A1', 'green', 2542);
INSERT INTO component VALUES (2544, 'Network', 'IP: 10.0.0.1', 'A', 'C', '96519057', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 18:53:06.801', 'A5', 'green', 2542);
INSERT INTO location VALUES (2545, 'EC9', 'ABS test', 'Franziska Meier', 2537);
INSERT INTO device VALUES (2546, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '44204280', '2013-06-25 23:49:46.597', false, 2545);
INSERT INTO component VALUES (2547, 'Tests', 'Ok', 'F', 'G', '69746223', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 22:39:09.317', 'H9', 'yellow', 2546);
INSERT INTO component VALUES (2548, 'Network', 'IP: 10.0.0.1', 'B', 'A', '44816917', 'Howard Joel Wolowitz', '2013-06-25 16:00:46.15', 'C3', 'green', 2546);
INSERT INTO device VALUES (2549, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '31231212', '2013-06-25 06:23:45.097', true, 2545);
INSERT INTO component VALUES (2550, 'Tests', 'Ok', 'D', 'F', '32881371', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 23:58:40.339', 'H2', 'green', 2549);
INSERT INTO component VALUES (2551, 'Network', 'IP: 10.0.0.1', 'D', 'E', '56576934', 'Howard Joel Wolowitz', '2013-06-25 12:47:40.565', 'I7', 'green', 2549);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 7;
INSERT INTO hall VALUES (2552, 'F3', 'Assembly+Finish', 102, 3335, 'Audi A4', 2, 'path369', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2553, 'F3 Assembly', 'Series 7', 14, 'rect217', 2552);
INSERT INTO location VALUES (2554, 'GE9', 'transmission test', 'Sarah Schmitt', 2553);
INSERT INTO device VALUES (2555, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '89299789', '2013-06-25 09:53:55.568', false, 2554);
INSERT INTO component VALUES (2556, 'Tests', 'Ok', 'C', 'I', '38368538', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 03:20:49.5', 'A8', 'green', 2555);
INSERT INTO component VALUES (2557, 'Network', 'IP: 10.0.0.1', 'E', 'C', '13929737', 'Howard Joel Wolowitz', '2013-06-25 21:20:50.786', 'E3', 'green', 2555);
INSERT INTO device VALUES (2558, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '21560198', '2013-06-25 09:28:12.828', false, 2554);
INSERT INTO component VALUES (2559, 'Tests', 'Ok', 'F', 'G', '82800594', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 15:46:37.929', 'I9', 'green', 2558);
INSERT INTO component VALUES (2560, 'Network', 'IP: 10.0.0.1', 'E', 'G', '84108344', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 14:31:28.231', 'D7', 'green', 2558);
INSERT INTO location VALUES (2561, 'CC1', 'multimedia test', 'Peter Meier', 2553);
INSERT INTO device VALUES (2562, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '35366485', '2013-06-25 06:56:22.039', false, 2561);
INSERT INTO component VALUES (2563, 'Tests', 'Ok', 'C', 'A', '26229109', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:55:58.737', 'B2', 'green', 2562);
INSERT INTO component VALUES (2564, 'Network', 'IP: 10.0.0.1', 'H', 'G', '25858397', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 07:10:56.219', 'H3', 'green', 2562);
INSERT INTO device VALUES (2565, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '10977270', '2013-06-26 00:45:04.419', false, 2561);
INSERT INTO component VALUES (2566, 'Tests', 'Ok', 'A', 'C', '36691090', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 15:42:56.932', 'E9', 'green', 2565);
INSERT INTO component VALUES (2567, 'Network', 'IP: 10.0.0.1', 'C', 'C', '56387455', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 19:38:20.911', 'G6', 'green', 2565);
INSERT INTO line VALUES (2568, 'F3 PreSeries', 'Series 7', 72, 'polygon25', 2552);
INSERT INTO location VALUES (2569, 'AI9', 'security test', 'Hans Merkel', 2568);
INSERT INTO device VALUES (2570, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '10144148', '2013-06-25 22:21:49.59', false, 2569);
INSERT INTO component VALUES (2571, 'Tests', 'Ok', 'D', 'I', '78976033', 'Howard Joel Wolowitz', '2013-06-25 17:30:20.117', 'E8', 'green', 2570);
INSERT INTO component VALUES (2572, 'Network', 'IP: 10.0.0.1', 'H', 'I', '47443086', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 08:02:20.34', 'D6', 'green', 2570);
INSERT INTO device VALUES (2573, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '69757149', '2013-06-25 11:24:02.87', false, 2569);
INSERT INTO component VALUES (2574, 'Tests', 'Ok', 'H', 'I', '79002880', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 18:27:28.681', 'F9', 'green', 2573);
INSERT INTO component VALUES (2575, 'Network', 'IP: 10.0.0.1', 'B', 'G', '60824415', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 18:52:26.306', 'I8', 'green', 2573);
INSERT INTO location VALUES (2576, 'BG2', 'motor test', 'Sarah Schmitt', 2568);
INSERT INTO device VALUES (2577, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '38704281', '2013-06-25 12:07:00.302', false, 2576);
INSERT INTO component VALUES (2578, 'Tests', 'Ok', 'A', 'H', '14182790', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 10:28:37.649', 'I1', 'green', 2577);
INSERT INTO component VALUES (2579, 'Network', 'IP: 10.0.0.1', 'B', 'A', '57257053', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 10:05:51.306', 'B6', 'green', 2577);
INSERT INTO device VALUES (2580, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '98152911', '2013-06-25 21:42:50.672', false, 2576);
INSERT INTO component VALUES (2581, 'Tests', 'Ok', 'E', 'H', '8951757', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 13:50:07.599', 'E2', 'green', 2580);
INSERT INTO component VALUES (2582, 'Network', 'IP: 10.0.0.1', 'F', 'G', '28707148', 'Howard Joel Wolowitz', '2013-06-25 02:15:05.773', 'G6', 'green', 2580);
INSERT INTO line VALUES (2583, 'F3 Finish', 'Series 7', 42, 'rect497', 2552);
INSERT INTO location VALUES (2584, 'BI8', 'ABS test', 'Sarah Mueller', 2583);
INSERT INTO device VALUES (2585, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '2391308', '2013-06-25 19:55:27.675', false, 2584);
INSERT INTO component VALUES (2586, 'Tests', 'Ok', 'A', 'B', '4198490', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:04:14.656', 'I9', 'green', 2585);
INSERT INTO component VALUES (2587, 'Network', 'IP: 10.0.0.1', 'C', 'I', '48879718', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 22:17:46.291', 'G3', 'green', 2585);
INSERT INTO device VALUES (2588, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '58487736', '2013-06-25 05:50:55.963', false, 2584);
INSERT INTO component VALUES (2589, 'Tests', 'Ok', 'C', 'G', '83862562', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 05:03:40.773', 'A4', 'green', 2588);
INSERT INTO component VALUES (2590, 'Network', 'IP: 10.0.0.1', 'G', 'B', '11149637', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 03:34:29.202', 'D1', 'green', 2588);
INSERT INTO location VALUES (2591, 'IC2', 'multimedia test', 'Franziska Schmitt', 2583);
INSERT INTO device VALUES (2592, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '31396405', '2013-06-25 18:38:47.206', false, 2591);
INSERT INTO component VALUES (2593, 'Tests', 'Ok', 'C', 'D', '85442681', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 15:16:17.156', 'E8', 'green', 2592);
INSERT INTO component VALUES (2594, 'Network', 'IP: 10.0.0.1', 'H', 'B', '51330191', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:58:49.566', 'I3', 'green', 2592);
INSERT INTO device VALUES (2595, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '9110030', '2013-06-25 15:39:05.667', false, 2591);
INSERT INTO component VALUES (2596, 'Tests', 'Ok', 'G', 'B', '37621574', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 22:32:04.828', 'H5', 'green', 2595);
INSERT INTO component VALUES (2597, 'Network', 'IP: 10.0.0.1', 'G', 'A', '57705374', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 13:53:36.366', 'C2', 'green', 2595);
INSERT INTO hall VALUES (2598, 'E2', 'Assembly+Finish', 48, 3538, 'Audi A4', 2, 'polygon249', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2599, 'E2 Assembly', 'Series 7', 3, 'rect217', 2598);
INSERT INTO location VALUES (2600, 'CI9', 'security test', 'Sarah Merkel', 2599);
INSERT INTO device VALUES (2601, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '26360665', '2013-06-25 21:44:11.8', false, 2600);
INSERT INTO component VALUES (2602, 'Tests', 'Ok', 'I', 'E', '62803084', 'Howard Joel Wolowitz', '2013-06-26 00:34:47.609', 'D7', 'green', 2601);
INSERT INTO component VALUES (2603, 'Network', 'IP: 10.0.0.1', 'H', 'I', '77018955', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 04:17:36.125', 'H5', 'green', 2601);
INSERT INTO device VALUES (2604, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '45167395', '2013-06-25 19:12:24.42', false, 2600);
INSERT INTO component VALUES (2605, 'Tests', 'Ok', 'A', 'B', '34230737', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:51:45.392', 'E7', 'green', 2604);
INSERT INTO component VALUES (2606, 'Network', 'IP: 10.0.0.1', 'G', 'H', '98779214', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:35:00.224', 'C7', 'green', 2604);
INSERT INTO location VALUES (2607, 'IB3', 'multimedia test', 'Robert Mueller', 2599);
INSERT INTO device VALUES (2608, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '72967855', '2013-06-25 19:11:09.368', false, 2607);
INSERT INTO component VALUES (2609, 'Tests', 'Ok', 'B', 'H', '40044472', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:21:23.634', 'I4', 'green', 2608);
INSERT INTO component VALUES (2610, 'Network', 'IP: 10.0.0.1', 'D', 'D', '66307501', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 11:20:53.371', 'B7', 'green', 2608);
INSERT INTO device VALUES (2611, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '53643028', '2013-06-25 21:36:24.447', false, 2607);
INSERT INTO component VALUES (2612, 'Tests', 'Ok', 'D', 'E', '73648416', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 19:30:43.322', 'B5', 'green', 2611);
INSERT INTO component VALUES (2613, 'Network', 'IP: 10.0.0.1', 'D', 'H', '74531952', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:03:36.72', 'F8', 'red', 2611);
INSERT INTO line VALUES (2614, 'E2 PreSeries', 'Series 3', 56, 'polygon25', 2598);
INSERT INTO location VALUES (2615, 'GA7', 'motor test', 'Robert Merkel', 2614);
INSERT INTO device VALUES (2616, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '91802812', '2013-06-25 20:09:26.03', false, 2615);
INSERT INTO component VALUES (2617, 'Tests', 'Ok', 'E', 'D', '8185135', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 01:09:12.532', 'C4', 'green', 2616);
INSERT INTO component VALUES (2618, 'Network', 'IP: 10.0.0.1', 'H', 'G', '15471722', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 15:10:10.311', 'F5', 'green', 2616);
INSERT INTO device VALUES (2619, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '7317557', '2013-06-25 01:36:34.555', false, 2615);
INSERT INTO component VALUES (2620, 'Tests', 'Ok', 'C', 'B', '40385723', 'Howard Joel Wolowitz', '2013-06-25 03:42:42.661', 'F6', 'green', 2619);
INSERT INTO component VALUES (2621, 'Network', 'IP: 10.0.0.1', 'C', 'C', '72476901', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:08:19.942', 'B8', 'green', 2619);
INSERT INTO location VALUES (2622, 'FE9', 'security test', 'Robert Merkel', 2614);
INSERT INTO device VALUES (2623, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '29456722', '2013-06-25 08:38:26.987', false, 2622);
INSERT INTO component VALUES (2624, 'Tests', 'Ok', 'I', 'G', '89396027', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:33:53.376', 'F6', 'green', 2623);
INSERT INTO component VALUES (2625, 'Network', 'IP: 10.0.0.1', 'A', 'F', '48093790', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 07:53:39.516', 'E5', 'green', 2623);
INSERT INTO device VALUES (2626, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '22717222', '2013-06-25 21:46:04.718', false, 2622);
INSERT INTO component VALUES (2627, 'Tests', 'Ok', 'B', 'E', '50368295', 'Howard Joel Wolowitz', '2013-06-25 01:54:12.216', 'B3', 'green', 2626);
INSERT INTO component VALUES (2628, 'Network', 'IP: 10.0.0.1', 'E', 'F', '61403841', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 04:41:13.428', 'G3', 'green', 2626);
INSERT INTO line VALUES (2629, 'E2 Finish', 'Series 4', 88, 'rect497', 2598);
INSERT INTO location VALUES (2630, 'BE7', 'motor test', 'Hans Schulze', 2629);
INSERT INTO device VALUES (2631, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '79206725', '2013-06-25 10:03:02.512', false, 2630);
INSERT INTO component VALUES (2632, 'Tests', 'Ok', 'A', 'G', '83702012', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 19:30:25.063', 'A9', 'red', 2631);
INSERT INTO component VALUES (2633, 'Network', 'IP: 10.0.0.1', 'C', 'H', '75355129', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 03:33:45.028', 'G4', 'green', 2631);
INSERT INTO device VALUES (2634, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '16551069', '2013-06-25 08:23:37.866', false, 2630);
INSERT INTO component VALUES (2635, 'Tests', 'Ok', 'I', 'G', '23357853', 'Howard Joel Wolowitz', '2013-06-25 14:20:02.733', 'H1', 'green', 2634);
INSERT INTO component VALUES (2636, 'Network', 'IP: 10.0.0.1', 'H', 'G', '31448119', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 03:24:28.303', 'E2', 'green', 2634);
INSERT INTO location VALUES (2637, 'GB5', 'multimedia test', 'Peter Schulze', 2629);
INSERT INTO device VALUES (2638, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '83565759', '2013-06-25 23:09:54.202', false, 2637);
INSERT INTO component VALUES (2639, 'Tests', 'Ok', 'G', 'E', '75639239', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:54:50.845', 'A2', 'green', 2638);
INSERT INTO component VALUES (2640, 'Network', 'IP: 10.0.0.1', 'I', 'G', '90533918', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:10:03.208', 'E7', 'green', 2638);
INSERT INTO device VALUES (2641, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '78761668', '2013-06-25 23:53:38.576', false, 2637);
INSERT INTO component VALUES (2642, 'Tests', 'Ok', 'F', 'D', '85989096', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:09:15.201', 'B7', 'green', 2641);
INSERT INTO component VALUES (2643, 'Network', 'IP: 10.0.0.1', 'H', 'F', '83283082', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 12:54:31.433', 'F1', 'green', 2641);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 8;
INSERT INTO hall VALUES (2644, 'C8', 'Assembly+Finish', 192, 6819, 'Audi A4', 2, 'path369', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="56.25"
   height="29.5"
   viewBox="0 0 56.25 29.5"
   id="SVGPlan">
  <defs
     id="defs4" />
  <metadata
     id="metadata7">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     transform="translate(-93,-274.25)"
     id="layer1">
    <g
       id="text2985"
       style="font-size:12px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Times New Roman;-inkscape-font-specification:Times New Roman">
      <path
         d="m 99.64314,293.6957 -4.399012,1.39286 -0.20312,2.0372 c -0.0502,0.50144 -0.04081,0.86108 0.02817,1.07894 0.05483,0.17317 0.185414,0.29929 0.391774,0.37839 0.206351,0.0791 0.589433,0.0515 1.149251,-0.0827 l 0.09816,0.31002 -3.577865,1.13286 -0.09816,-0.31002 c 0.448281,-0.23414 0.721026,-0.44034 0.818227,-0.61863 0.19999,-0.35833 0.343152,-1.00291 0.429491,-1.93371 l 1.036002,-10.61656 0.293271,-0.0929 6.947571,8.19935 c 0.55894,0.65889 1.00411,1.06033 1.3355,1.20432 0.33137,0.144 0.7333,0.15655 1.20581,0.0377 l 0.0982,0.31002 -4.48281,1.41939 -0.0982,-0.31002 c 0.4454,-0.16557 0.72735,-0.33786 0.84588,-0.51675 0.11851,-0.17888 0.14859,-0.3605 0.0902,-0.54485 -0.0778,-0.24578 -0.31248,-0.59863 -0.70394,-1.05857 z m -0.430937,-0.54576 -3.381071,-3.98153 -0.523579,5.21785 z"
         id="path2990"
         style="font-size:18px" />
      <path
         d="m 115.01591,295.66574 -4.60547,-10.02832 0,7.96289 c 0,0.73242 0.0791,1.18946 0.2373,1.3711 0.2168,0.24609 0.55957,0.36914 1.02832,0.36914 l 0.42188,0 0,0.32519 -4.14844,0 0,-0.32519 0.42188,0 c 0.5039,0 0.86132,-0.15235 1.07226,-0.45704 0.12891,-0.18749 0.19336,-0.61523 0.19336,-1.2832 l 0,-7.78711 c 0,-0.52733 -0.0586,-0.90819 -0.17578,-1.14258 -0.082,-0.16991 -0.23291,-0.312 -0.45264,-0.42627 -0.21972,-0.11424 -0.57275,-0.17137 -1.05908,-0.17138 l 0,-0.3252 3.375,0 4.32422,9.3252 4.25391,-9.3252 3.375,0 0,0.3252 -0.41309,0 c -0.50978,10e-6 -0.87013,0.15235 -1.08105,0.45703 -0.12892,0.18751 -0.19338,0.61524 -0.19336,1.2832 l 0,7.78711 c -2e-5,0.73242 0.082,1.18946 0.24609,1.3711 0.21678,0.24609 0.55956,0.36914 1.02832,0.36914 l 0.41309,0 0,0.32519 -5.0625,0 0,-0.32519 0.42187,0 c 0.50976,0 0.86718,-0.15235 1.07227,-0.45704 0.12889,-0.18749 0.19334,-0.61523 0.19336,-1.2832 l 0,-7.96289 -4.59668,10.02832 z"
         id="rect497"
         style="font-size:18px" />
      <path
         d="m 132.92905,284.49812 c 1.48861,0.42054 2.61877,1.35022 3.39048,2.78899 0.7717,1.4388 0.9186,3.00399 0.44074,4.69559 -0.49223,1.74237 -1.45059,3.03338 -2.87507,3.87305 -1.42452,0.83968 -2.91772,1.03888 -4.47963,0.59765 -1.57885,-0.44603 -2.74685,-1.38182 -3.50402,-2.80736 -0.75719,-1.42555 -0.88409,-3.02924 -0.38072,-4.81107 0.51452,-1.82129 1.5545,-3.13187 3.11998,-3.93172 1.35893,-0.69379 2.78834,-0.82883 4.28824,-0.40513 z m -0.33513,0.57204 c -1.02624,-0.2899 -1.95702,-0.14185 -2.79239,0.44366 -1.04012,0.72908 -1.81823,2.00708 -2.33434,3.83401 -0.52885,1.87204 -0.53549,3.42583 -0.0199,4.66135 0.39798,0.94049 1.10163,1.5533 2.11096,1.83844 1.07697,0.30425 2.08515,0.13545 3.02452,-0.50639 0.93935,-0.64186 1.66471,-1.86779 2.17605,-3.67781 0.55433,-1.96226 0.58144,-3.53461 0.0814,-4.71706 -0.40363,-0.94209 -1.1524,-1.56765 -2.2463,-1.87669 z"
         id="path2994"
         style="font-size:18px" />
      <path
         d="m 148.26216,289.69335 -1.66208,3.77213 -0.29759,-0.13113 c 0.22243,-0.76638 0.30348,-1.41899 0.24317,-1.95781 -0.0606,-0.53877 -0.26553,-1.0358 -0.61562,-1.49101 -0.35009,-0.45518 -0.77179,-0.79146 -1.26508,-1.00882 -0.55764,-0.2457 -1.09379,-0.27865 -1.6084,-0.0988 -0.51465,0.17984 -0.86765,0.48691 -1.05902,0.92122 -0.14649,0.33245 -0.16469,0.6862 -0.0546,1.06124 0.15523,0.54863 0.70987,1.4333 1.66389,2.65403 0.77778,0.99581 1.28861,1.72192 1.53251,2.17835 0.24389,0.45643 0.37896,0.92733 0.40521,1.41271 0.0263,0.48537 -0.0563,0.94523 -0.24769,1.37955 -0.36384,0.82573 -0.99786,1.39636 -1.90203,1.71189 -0.90418,0.31553 -1.8603,0.25118 -2.86834,-0.19295 -0.31635,-0.1394 -0.6033,-0.29468 -0.86087,-0.46576 -0.15441,-0.10005 -0.45579,-0.3497 -0.90416,-0.74896 -0.44838,-0.39925 -0.74226,-0.62959 -0.88166,-0.69101 -0.13406,-0.0591 -0.25765,-0.0656 -0.37086,-0.0193 -0.11322,0.0462 -0.24406,0.18699 -0.39265,0.42246 l -0.29758,-0.13112 1.6479,-3.73995 0.29759,0.13112 c -0.20553,0.84427 -0.27597,1.51275 -0.21133,2.00545 0.065,0.49264 0.28288,0.97463 0.65473,1.44582 0.37185,0.47119 0.84732,0.83436 1.42641,1.08952 0.67024,0.29533 1.2777,0.35168 1.82237,0.16908 0.54467,-0.1826 0.92332,-0.51519 1.13596,-0.99776 0.11812,-0.2681 0.16369,-0.57137 0.13676,-0.90979 -0.027,-0.33843 -0.14401,-0.69412 -0.351,-1.06707 -0.13825,-0.25301 -0.55869,-0.84644 -1.26129,-1.78033 -0.70265,-0.93387 -1.18249,-1.64314 -1.43956,-2.12778 -0.25707,-0.48464 -0.4048,-0.95952 -0.44317,-1.42464 -0.0384,-0.46511 0.0417,-0.92287 0.24013,-1.37327 0.34494,-0.78284 0.94229,-1.3248 1.79209,-1.62589 0.84978,-0.30106 1.73849,-0.2472 2.66612,0.16148 0.57907,0.25516 1.1304,0.66778 1.65399,1.23782 0.2412,0.26637 0.42347,0.42671 0.5468,0.48104 0.13939,0.0615 0.27165,0.0701 0.39675,0.026 0.12511,-0.0441 0.26996,-0.18037 0.43464,-0.40877 z"
         id="path2996"
         style="font-size:18px" />
      <path
         d="m 93.528397,301.6186 50.381363,1.6415 c 0,0 -15.25606,-7.07408 -26.01143,-6.56599 -10.75537,0.50809 -24.369933,4.92449 -24.369933,4.92449 z"
         id="polygon25"/>
      <path
         d="m 93.168625,284.12585 23.359785,-4.79823 1.38896,-3.28299 z"
         id="rect217"/>
      <path
         d="m 125.17226,275.24106 1.13642,3.53553 22.72843,8.46003 z"
         id="path3002"
         style="stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
    </g>
  </g>
</svg>
');
INSERT INTO line VALUES (2645, 'C8 Assembly', 'Series 6', 31, 'rect217', 2644);
INSERT INTO location VALUES (2646, 'AD1', 'motor test', 'Sarah Meier', 2645);
INSERT INTO device VALUES (2647, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '85631094', '2013-06-25 23:56:55.598', false, 2646);
INSERT INTO component VALUES (2648, 'Tests', 'Ok', 'I', 'F', '62529046', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:42:08.613', 'H7', 'green', 2647);
INSERT INTO component VALUES (2649, 'Network', 'IP: 10.0.0.1', 'C', 'B', '55352709', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:06:36.222', 'H2', 'green', 2647);
INSERT INTO device VALUES (2650, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '93194149', '2013-06-25 13:02:04.877', false, 2646);
INSERT INTO component VALUES (2651, 'Tests', 'Ok', 'A', 'G', '57629856', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:21:25.924', 'H5', 'green', 2650);
INSERT INTO component VALUES (2652, 'Network', 'IP: 10.0.0.1', 'I', 'G', '47368448', 'Howard Joel Wolowitz', '2013-06-25 14:25:23.323', 'F7', 'green', 2650);
INSERT INTO location VALUES (2653, 'GB7', 'multimedia test', 'Peter Schmitt', 2645);
INSERT INTO device VALUES (2654, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '79486957', '2013-06-25 07:02:23.148', false, 2653);
INSERT INTO component VALUES (2655, 'Tests', 'Ok', 'B', 'I', '378967', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 10:45:28.642', 'B2', 'green', 2654);
INSERT INTO component VALUES (2656, 'Network', 'IP: 10.0.0.1', 'H', 'H', '89691947', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:44:05.227', 'D2', 'green', 2654);
INSERT INTO device VALUES (2657, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '42982305', '2013-06-25 08:20:34.258', false, 2653);
INSERT INTO component VALUES (2658, 'Tests', 'Ok', 'F', 'D', '67714776', 'Howard Joel Wolowitz', '2013-06-25 18:51:18.843', 'E6', 'green', 2657);
INSERT INTO component VALUES (2659, 'Network', 'IP: 10.0.0.1', 'D', 'F', '25692787', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 07:07:38.149', 'F2', 'green', 2657);
INSERT INTO line VALUES (2660, 'C8 PreSeries', 'Series 3', 57, 'polygon25', 2644);
INSERT INTO location VALUES (2661, 'IF3', 'ABS test', 'Peter Mueller', 2660);
INSERT INTO device VALUES (2662, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '63263278', '2013-06-25 16:15:29.629', false, 2661);
INSERT INTO component VALUES (2663, 'Tests', 'Ok', 'F', 'E', '91011247', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:17:09.525', 'A1', 'yellow', 2662);
INSERT INTO component VALUES (2664, 'Network', 'IP: 10.0.0.1', 'G', 'D', '41814373', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 15:14:48.73', 'A6', 'green', 2662);
INSERT INTO device VALUES (2665, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '62890187', '2013-06-25 19:18:12.928', false, 2661);
INSERT INTO component VALUES (2666, 'Tests', 'Ok', 'F', 'C', '2005359', 'Howard Joel Wolowitz', '2013-06-25 18:31:21.193', 'F4', 'green', 2665);
INSERT INTO component VALUES (2667, 'Network', 'IP: 10.0.0.1', 'A', 'G', '8411780', 'Howard Joel Wolowitz', '2013-06-25 06:00:40.084', 'D2', 'yellow', 2665);
INSERT INTO location VALUES (2668, 'HE9', 'transmission test', 'Franziska Schmitt', 2660);
INSERT INTO device VALUES (2669, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '22474548', '2013-06-25 08:50:28.571', false, 2668);
INSERT INTO component VALUES (2670, 'Tests', 'Ok', 'C', 'A', '28252714', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 18:16:40.049', 'B5', 'red', 2669);
INSERT INTO component VALUES (2671, 'Network', 'IP: 10.0.0.1', 'A', 'D', '60352695', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 01:34:56.405', 'H2', 'green', 2669);
INSERT INTO device VALUES (2672, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '92790584', '2013-06-25 16:09:54.004', false, 2668);
INSERT INTO component VALUES (2673, 'Tests', 'Ok', 'A', 'H', '58012954', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 12:20:25.614', 'D9', 'green', 2672);
INSERT INTO component VALUES (2674, 'Network', 'IP: 10.0.0.1', 'B', 'A', '6997138', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 07:21:24.092', 'C7', 'green', 2672);
INSERT INTO line VALUES (2675, 'C8 Finish', 'Series 9', 52, 'rect497', 2644);
INSERT INTO location VALUES (2676, 'EG7', 'transmission test', 'Sarah Schulze', 2675);
INSERT INTO device VALUES (2677, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '18655691', '2013-06-25 18:26:43.901', false, 2676);
INSERT INTO component VALUES (2678, 'Tests', 'Ok', 'F', 'E', '93934503', 'Howard Joel Wolowitz', '2013-06-25 06:13:36.713', 'C7', 'green', 2677);
INSERT INTO component VALUES (2679, 'Network', 'IP: 10.0.0.1', 'F', 'E', '9437609', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 11:58:14.855', 'E4', 'green', 2677);
INSERT INTO device VALUES (2680, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '2952676', '2013-06-25 22:37:40.223', false, 2676);
INSERT INTO component VALUES (2681, 'Tests', 'Ok', 'A', 'F', '19694031', 'Howard Joel Wolowitz', '2013-06-25 12:26:41.692', 'C8', 'green', 2680);
INSERT INTO component VALUES (2682, 'Network', 'IP: 10.0.0.1', 'B', 'I', '83346822', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 15:12:10.901', 'F6', 'green', 2680);
INSERT INTO location VALUES (2683, 'DF9', 'security test', 'Hans Schmitt', 2675);
INSERT INTO device VALUES (2684, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '43465547', '2013-06-25 19:35:20.804', false, 2683);
INSERT INTO component VALUES (2685, 'Tests', 'Ok', 'A', 'A', '42149971', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 15:10:39.306', 'G9', 'green', 2684);
INSERT INTO component VALUES (2686, 'Network', 'IP: 10.0.0.1', 'A', 'D', '48523567', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 12:31:14.723', 'H9', 'green', 2684);
INSERT INTO device VALUES (2687, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '22456079', '2013-06-25 10:37:23.119', false, 2683);
INSERT INTO component VALUES (2688, 'Tests', 'Ok', 'E', 'E', '87374248', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 17:49:55.833', 'I3', 'green', 2687);
INSERT INTO component VALUES (2689, 'Network', 'IP: 10.0.0.1', 'E', 'I', '88637078', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 17:54:33.299', 'I3', 'green', 2687);
INSERT INTO hall VALUES (2690, 'H1', 'Assembly+Finish', 494, 9234, 'Audi A4', 2, 'polygon249', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="56.25"
   height="29.5"
   viewBox="0 0 56.25 29.5"
   id="SVGPlan">
  <defs
     id="defs4" />
  <metadata
     id="metadata7">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     transform="translate(-93,-274.25)"
     id="layer1">
    <g
       id="text2985"
       style="font-size:12px;font-style:normal;font-weight:normal;line-height:125%;letter-spacing:0px;word-spacing:0px;fill:#000000;fill-opacity:1;stroke:none;font-family:Times New Roman;-inkscape-font-specification:Times New Roman">
      <path
         d="m 99.64314,293.6957 -4.399012,1.39286 -0.20312,2.0372 c -0.0502,0.50144 -0.04081,0.86108 0.02817,1.07894 0.05483,0.17317 0.185414,0.29929 0.391774,0.37839 0.206351,0.0791 0.589433,0.0515 1.149251,-0.0827 l 0.09816,0.31002 -3.577865,1.13286 -0.09816,-0.31002 c 0.448281,-0.23414 0.721026,-0.44034 0.818227,-0.61863 0.19999,-0.35833 0.343152,-1.00291 0.429491,-1.93371 l 1.036002,-10.61656 0.293271,-0.0929 6.947571,8.19935 c 0.55894,0.65889 1.00411,1.06033 1.3355,1.20432 0.33137,0.144 0.7333,0.15655 1.20581,0.0377 l 0.0982,0.31002 -4.48281,1.41939 -0.0982,-0.31002 c 0.4454,-0.16557 0.72735,-0.33786 0.84588,-0.51675 0.11851,-0.17888 0.14859,-0.3605 0.0902,-0.54485 -0.0778,-0.24578 -0.31248,-0.59863 -0.70394,-1.05857 z m -0.430937,-0.54576 -3.381071,-3.98153 -0.523579,5.21785 z"
         id="path2990"
         style="font-size:18px" />
      <path
         d="m 115.01591,295.66574 -4.60547,-10.02832 0,7.96289 c 0,0.73242 0.0791,1.18946 0.2373,1.3711 0.2168,0.24609 0.55957,0.36914 1.02832,0.36914 l 0.42188,0 0,0.32519 -4.14844,0 0,-0.32519 0.42188,0 c 0.5039,0 0.86132,-0.15235 1.07226,-0.45704 0.12891,-0.18749 0.19336,-0.61523 0.19336,-1.2832 l 0,-7.78711 c 0,-0.52733 -0.0586,-0.90819 -0.17578,-1.14258 -0.082,-0.16991 -0.23291,-0.312 -0.45264,-0.42627 -0.21972,-0.11424 -0.57275,-0.17137 -1.05908,-0.17138 l 0,-0.3252 3.375,0 4.32422,9.3252 4.25391,-9.3252 3.375,0 0,0.3252 -0.41309,0 c -0.50978,10e-6 -0.87013,0.15235 -1.08105,0.45703 -0.12892,0.18751 -0.19338,0.61524 -0.19336,1.2832 l 0,7.78711 c -2e-5,0.73242 0.082,1.18946 0.24609,1.3711 0.21678,0.24609 0.55956,0.36914 1.02832,0.36914 l 0.41309,0 0,0.32519 -5.0625,0 0,-0.32519 0.42187,0 c 0.50976,0 0.86718,-0.15235 1.07227,-0.45704 0.12889,-0.18749 0.19334,-0.61523 0.19336,-1.2832 l 0,-7.96289 -4.59668,10.02832 z"
         id="rect497"
         style="font-size:18px" />
      <path
         d="m 132.92905,284.49812 c 1.48861,0.42054 2.61877,1.35022 3.39048,2.78899 0.7717,1.4388 0.9186,3.00399 0.44074,4.69559 -0.49223,1.74237 -1.45059,3.03338 -2.87507,3.87305 -1.42452,0.83968 -2.91772,1.03888 -4.47963,0.59765 -1.57885,-0.44603 -2.74685,-1.38182 -3.50402,-2.80736 -0.75719,-1.42555 -0.88409,-3.02924 -0.38072,-4.81107 0.51452,-1.82129 1.5545,-3.13187 3.11998,-3.93172 1.35893,-0.69379 2.78834,-0.82883 4.28824,-0.40513 z m -0.33513,0.57204 c -1.02624,-0.2899 -1.95702,-0.14185 -2.79239,0.44366 -1.04012,0.72908 -1.81823,2.00708 -2.33434,3.83401 -0.52885,1.87204 -0.53549,3.42583 -0.0199,4.66135 0.39798,0.94049 1.10163,1.5533 2.11096,1.83844 1.07697,0.30425 2.08515,0.13545 3.02452,-0.50639 0.93935,-0.64186 1.66471,-1.86779 2.17605,-3.67781 0.55433,-1.96226 0.58144,-3.53461 0.0814,-4.71706 -0.40363,-0.94209 -1.1524,-1.56765 -2.2463,-1.87669 z"
         id="path2994"
         style="font-size:18px" />
      <path
         d="m 148.26216,289.69335 -1.66208,3.77213 -0.29759,-0.13113 c 0.22243,-0.76638 0.30348,-1.41899 0.24317,-1.95781 -0.0606,-0.53877 -0.26553,-1.0358 -0.61562,-1.49101 -0.35009,-0.45518 -0.77179,-0.79146 -1.26508,-1.00882 -0.55764,-0.2457 -1.09379,-0.27865 -1.6084,-0.0988 -0.51465,0.17984 -0.86765,0.48691 -1.05902,0.92122 -0.14649,0.33245 -0.16469,0.6862 -0.0546,1.06124 0.15523,0.54863 0.70987,1.4333 1.66389,2.65403 0.77778,0.99581 1.28861,1.72192 1.53251,2.17835 0.24389,0.45643 0.37896,0.92733 0.40521,1.41271 0.0263,0.48537 -0.0563,0.94523 -0.24769,1.37955 -0.36384,0.82573 -0.99786,1.39636 -1.90203,1.71189 -0.90418,0.31553 -1.8603,0.25118 -2.86834,-0.19295 -0.31635,-0.1394 -0.6033,-0.29468 -0.86087,-0.46576 -0.15441,-0.10005 -0.45579,-0.3497 -0.90416,-0.74896 -0.44838,-0.39925 -0.74226,-0.62959 -0.88166,-0.69101 -0.13406,-0.0591 -0.25765,-0.0656 -0.37086,-0.0193 -0.11322,0.0462 -0.24406,0.18699 -0.39265,0.42246 l -0.29758,-0.13112 1.6479,-3.73995 0.29759,0.13112 c -0.20553,0.84427 -0.27597,1.51275 -0.21133,2.00545 0.065,0.49264 0.28288,0.97463 0.65473,1.44582 0.37185,0.47119 0.84732,0.83436 1.42641,1.08952 0.67024,0.29533 1.2777,0.35168 1.82237,0.16908 0.54467,-0.1826 0.92332,-0.51519 1.13596,-0.99776 0.11812,-0.2681 0.16369,-0.57137 0.13676,-0.90979 -0.027,-0.33843 -0.14401,-0.69412 -0.351,-1.06707 -0.13825,-0.25301 -0.55869,-0.84644 -1.26129,-1.78033 -0.70265,-0.93387 -1.18249,-1.64314 -1.43956,-2.12778 -0.25707,-0.48464 -0.4048,-0.95952 -0.44317,-1.42464 -0.0384,-0.46511 0.0417,-0.92287 0.24013,-1.37327 0.34494,-0.78284 0.94229,-1.3248 1.79209,-1.62589 0.84978,-0.30106 1.73849,-0.2472 2.66612,0.16148 0.57907,0.25516 1.1304,0.66778 1.65399,1.23782 0.2412,0.26637 0.42347,0.42671 0.5468,0.48104 0.13939,0.0615 0.27165,0.0701 0.39675,0.026 0.12511,-0.0441 0.26996,-0.18037 0.43464,-0.40877 z"
         id="path2996"
         style="font-size:18px" />
      <path
         d="m 93.528397,301.6186 50.381363,1.6415 c 0,0 -15.25606,-7.07408 -26.01143,-6.56599 -10.75537,0.50809 -24.369933,4.92449 -24.369933,4.92449 z"
         id="polygon25"/>
      <path
         d="m 93.168625,284.12585 23.359785,-4.79823 1.38896,-3.28299 z"
         id="rect217"/>
      <path
         d="m 125.17226,275.24106 1.13642,3.53553 22.72843,8.46003 z"
         id="path3002"
         style="stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
    </g>
  </g>
</svg>
');
INSERT INTO line VALUES (2691, 'H1 Assembly', 'Series 7', 86, 'rect217', 2690);
INSERT INTO location VALUES (2692, 'HF4', 'ABS test', 'Hans Schulze', 2691);
INSERT INTO device VALUES (2693, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '17273758', '2013-06-25 09:56:21.59', false, 2692);
INSERT INTO component VALUES (2694, 'Tests', 'Ok', 'A', 'A', '75989911', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 14:44:15.961', 'C6', 'green', 2693);
INSERT INTO component VALUES (2695, 'Network', 'IP: 10.0.0.1', 'B', 'C', '17286282', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:14:12.148', 'B8', 'green', 2693);
INSERT INTO device VALUES (2696, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '52742283', '2013-06-25 16:37:17.921', false, 2692);
INSERT INTO component VALUES (2697, 'Tests', 'Ok', 'E', 'I', '25681966', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 06:22:06.143', 'D9', 'green', 2696);
INSERT INTO component VALUES (2698, 'Network', 'IP: 10.0.0.1', 'E', 'G', '35240287', 'Howard Joel Wolowitz', '2013-06-25 15:25:21.925', 'C9', 'green', 2696);
INSERT INTO location VALUES (2699, 'CE1', 'transmission test', 'Peter Schulze', 2691);
INSERT INTO device VALUES (2700, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '86939967', '2013-06-25 07:42:11.387', false, 2699);
INSERT INTO component VALUES (2701, 'Tests', 'Ok', 'I', 'C', '42032467', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 17:56:08.949', 'B6', 'green', 2700);
INSERT INTO component VALUES (2702, 'Network', 'IP: 10.0.0.1', 'G', 'D', '51109121', 'Howard Joel Wolowitz', '2013-06-25 12:21:56.194', 'E8', 'green', 2700);
INSERT INTO device VALUES (2703, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '36928249', '2013-06-25 20:16:34.869', true, 2699);
INSERT INTO component VALUES (2704, 'Tests', 'Ok', 'B', 'E', '50490030', 'Howard Joel Wolowitz', '2013-06-25 03:12:47.689', 'D5', 'green', 2703);
INSERT INTO component VALUES (2705, 'Network', 'IP: 10.0.0.1', 'H', 'F', '978561', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 10:25:52.969', 'F8', 'yellow', 2703);
INSERT INTO line VALUES (2706, 'H1 PreSeries', 'Series 7', 67, 'polygon25', 2690);
INSERT INTO location VALUES (2707, 'AD1', 'security test', 'Sarah Merkel', 2706);
INSERT INTO device VALUES (2708, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '94454334', '2013-06-25 05:31:22.195', false, 2707);
INSERT INTO component VALUES (2709, 'Tests', 'Ok', 'G', 'C', '67487258', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 20:40:02.458', 'G2', 'green', 2708);
INSERT INTO component VALUES (2710, 'Network', 'IP: 10.0.0.1', 'D', 'F', '91475262', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 09:02:46.369', 'D5', 'green', 2708);
INSERT INTO device VALUES (2711, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '80573542', '2013-06-25 16:22:10.814', false, 2707);
INSERT INTO component VALUES (2712, 'Tests', 'Ok', 'D', 'G', '40246731', 'Howard Joel Wolowitz', '2013-06-25 16:18:01.759', 'A2', 'green', 2711);
INSERT INTO component VALUES (2713, 'Network', 'IP: 10.0.0.1', 'H', 'H', '94468752', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 15:33:51.93', 'H6', 'green', 2711);
INSERT INTO location VALUES (2714, 'AF3', 'ABS test', 'Sarah Mueller', 2706);
INSERT INTO device VALUES (2715, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '12951679', '2013-06-25 04:52:41.274', false, 2714);
INSERT INTO component VALUES (2716, 'Tests', 'Ok', 'B', 'I', '11897090', 'Howard Joel Wolowitz', '2013-06-25 22:01:40.57', 'H9', 'green', 2715);
INSERT INTO component VALUES (2717, 'Network', 'IP: 10.0.0.1', 'H', 'A', '67711674', 'Howard Joel Wolowitz', '2013-06-25 12:48:56.558', 'F8', 'green', 2715);
INSERT INTO device VALUES (2718, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '25445912', '2013-06-25 08:19:41.787', false, 2714);
INSERT INTO component VALUES (2719, 'Tests', 'Ok', 'E', 'D', '24597293', 'Howard Joel Wolowitz', '2013-06-25 19:48:00.202', 'F4', 'green', 2718);
INSERT INTO component VALUES (2720, 'Network', 'IP: 10.0.0.1', 'I', 'D', '64819352', 'Howard Joel Wolowitz', '2013-06-25 11:41:50.665', 'F6', 'green', 2718);
INSERT INTO line VALUES (2721, 'H1 Finish', 'Series 3', 81, 'rect497', 2690);
INSERT INTO location VALUES (2722, 'GC2', 'security test', 'Peter Mueller', 2721);
INSERT INTO device VALUES (2723, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '72219464', '2013-06-25 14:00:03.59', true, 2722);
INSERT INTO component VALUES (2724, 'Tests', 'Ok', 'B', 'H', '99160874', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 06:37:52.736', 'H7', 'green', 2723);
INSERT INTO component VALUES (2725, 'Network', 'IP: 10.0.0.1', 'G', 'E', '42939330', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 08:43:14.243', 'C7', 'green', 2723);
INSERT INTO device VALUES (2726, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '2047865', '2013-06-25 02:29:13.749', false, 2722);
INSERT INTO component VALUES (2727, 'Tests', 'Ok', 'F', 'C', '11060881', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:20:54.626', 'I4', 'green', 2726);
INSERT INTO component VALUES (2728, 'Network', 'IP: 10.0.0.1', 'A', 'G', '14606228', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 21:09:14.939', 'G4', 'red', 2726);
INSERT INTO location VALUES (2729, 'FH5', 'security test', 'Franziska Meier', 2721);
INSERT INTO device VALUES (2730, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '70218107', '2013-06-25 05:13:26.701', false, 2729);
INSERT INTO component VALUES (2731, 'Tests', 'Ok', 'I', 'C', '38184041', 'Howard Joel Wolowitz', '2013-06-25 12:02:59.373', 'D1', 'green', 2730);
INSERT INTO component VALUES (2732, 'Network', 'IP: 10.0.0.1', 'A', 'A', '99663563', 'Howard Joel Wolowitz', '2013-06-25 19:12:55.27', 'E1', 'green', 2730);
INSERT INTO device VALUES (2733, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '27832376', '2013-06-25 04:21:19.42', false, 2729);
INSERT INTO component VALUES (2734, 'Tests', 'Ok', 'I', 'I', '58710509', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 01:45:21.557', 'A6', 'green', 2733);
INSERT INTO component VALUES (2735, 'Network', 'IP: 10.0.0.1', 'F', 'G', '93533675', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 04:28:03.463', 'A4', 'green', 2733);
UPDATE factory SET map = '
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="221.57703"
   height="165.85001"
   id="SVGPlan"
   viewBox="0 0 221.57703 165.85001">
  <defs
     id="defs3825" />
  <metadata
     id="metadata3828">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <path
     d="m 159.97063,4.344321 -6,0 0,-3.75 -16.125,0 0,3.75 -3.125,0 0,37.125 25.25,0 z"
     id="polygon249" />
  <path
     d="m 187.97063,45.469326 22.625,0 0,18.875 -22.625,0 z"
     id="rect251"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 190.72063,82.719321 0,2 5.375,0 0,1.125 14.75,0 0,-10 -11.875,0 0,-3 12.125,0 0,-4.625 -21.625,0 0,4.625 7.5,0 0,3 -0.875,0 -3,0 0,-1.625 -6.5,0 0,1.875 2.25,0 0,3.5 -2.625,0 0,3.125 z"
     id="polygon253"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 214.34566,67.46933 7,0 0,17.5 -7,0 z"
     id="rect255"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 182.97063,67.001321 0,1.218 -9,0 0,5.25 5.75,0 0,2 -7.5,0 0,2.875 7.5,5.75 3.625,0 0,-10.625 1.25,0 0,-0.343 0,-4.907 0,-1.218 z"
     id="polygon257"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 127.72063,12.969321 -11.125,0 0,2.875 -8.749,0 0,6.375 8.749,0 0,0.125 11.125,0 z"
     id="polygon259"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 103.55464,126.84633 5.667,0 0,3.835 -5.667,0 z"
     id="rect261"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 112.13664,127.18134 3.417,0 0,3.5 -3.417,0 z"
     id="rect263"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 114.30364,127.18134 2.25,0 0,6 -2.25,0 z"
     id="rect265"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 167.49639,135.86053 -7.61136,5.04927 -8.79782,-13.26197 7.61136,-5.04927 z"
     id="rect267"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 134.88563,141.59832 16.193,-9.889 -3.11,-4.528 -6.998,4.528 0.832,1.472 -7.5,5.917 0,-3 -5.082,0 0,5.5 z"
     id="polygon269"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.78208,128.1621 -6.30399,4.92702 -3.70897,-4.74553 6.30399,-4.92701 z"
     id="rect271"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 143.91644,144.37019 -3.7003,2.89288 -2.17659,-2.78408 3.7003,-2.89289 z"
     id="rect273"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 204.50183,112.48552 -6.3032,4.9272 -3.70956,-4.74551 6.3032,-4.9272 z"
     id="rect275"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 211.31095,111.65341 -3.00701,2.34952 -1.67039,-2.13785 3.00701,-2.34951 z"
     id="rect277"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 207.73634,126.67218 -11.76729,9.19697 -6.98009,-8.93085 11.76729,-9.19697 z"
     id="rect279"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 186.82163,99.68632 -24.869,16.461 6.721,10.15201 24.611,-16.28901 v 0.001 l 0.043,-0.03 0.215,-0.143 -0.004,-0.008 6.287,-4.486 c 0,0 -2.299,-8.065 -13.004,-5.658 z"
     id="path281"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.65962,91.28133 3.293,0 0,10.113 -3.293,0 z"
     id="rect283"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.30464,97.59433 6.479,0 0,2.75 -6.479,0 z"
     id="rect285"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 160.59563,91.28133 2.438,0 0,2.938 -2.438,0 z"
     id="rect287"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 164.59563,92.75132 2.894,0 0,2.719 -2.894,0 z"
     id="rect289"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.97063,104.03133 6.625,0 0,4.938 -6.625,0 z"
     id="rect291"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 163.03462,104.03133 5.312,0 0,3.709 -5.312,0 z"
     id="rect293"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 170.53462,99.68633 3.75,0 0,4.033 -3.75,0 z"
     id="rect295"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 169.73964,92.75132 3.856,0 0,5.28 -3.856,0 z"
     id="rect297"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 172.22063,92.75132 7.062,0 0,1.719 -7.062,0 z"
     id="rect299"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15962,95.03133 5.688,0 0,3.938 -5.688,0 z"
     id="rect301"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 158.28462,85.84433 11.938,0 0,3.188 -11.938,0 z"
     id="rect303"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 32.555618,99.92433 11.333,0 0,6.795 -11.333,0 z"
     id="rect305"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.971634,111.75833 2,0 0,9.505 -2,0 z"
     id="rect307"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 1.305618,91.25833 13.916001,0 0,3.043 -13.916001,0 z"
     id="rect309"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,76.719321 3.916,7.522 10.417,0 0,-7.522 z"
     id="polygon311"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 47.971634,87.006332 4.25,0 0,1.671998 -4.25,0 z"
     id="rect313"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.88863,39.532321 10.75,0 0,-8.026 -10.75,0 0,4.541 -2.333,0 0,-2.458 -5.167,0 0,3.917 -2.917,0 0,8.09 4.25,0 0,-7.09 0.666,0 0,6.257 3.168,0 0,-6.257 2.333,0 z"
     id="polygon315"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,41.469326 5.25,0 0,2.87 -5.25,0 z"
     id="rect317"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,53.71933 5.25,0 0,2.87 -5.25,0 z"
     id="rect319"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 65.387619,45.344326 5.25,0 0,7.245 -5.25,0 z"
     id="rect321"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 8.24663,59.305321 -1.451,-13.547 8.692,-0.967 1.806,16.123 -6.164,0.66 -0.273,-2.548 z"
     id="polygon323"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 38.821978,81.701589 -10.94426,1.172246 -0.447087,-4.174072 10.94426,-1.172245 z"
     id="rect325"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 52.619687,79.044594 41.676421,80.216733 41.229334,76.042662 52.1726,74.870523 z"
     id="rect327"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 61.974878,78.168454 -7.439353,0.796833 -0.397032,-3.706751 7.439353,-0.796833 z"
     id="rect329"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 35.17863,72.791321 17.441,-1.868 -0.177,-1.677 -17.444,1.867 -0.618,-5.77 -9.085,0.969 1.176,10.979 9.084,-0.973 z"
     id="polygon331"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 42.491403,68.862412 -6.218351,0.664174 -0.340265,-3.185737 6.218351,-0.664175 z"
     id="rect333"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.58263,64.215321 -1.891,0.202 0.341,3.185 1.584,-0.169 0.142,1.322 5.145,-0.55 -0.332,-3.101 -2.344,0.251 -0.248,-2.33 -2.495,0.266 z"
     id="polygon335"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 52.755653,63.946244 -3.72005,0.39692 -0.239149,-2.241378 3.720049,-0.39692 z"
     id="rect337"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.404416,67.307784 -5.538251,0.592091 -0.239706,-2.242146 5.53825,-0.592091 z"
     id="rect339"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 63.886642,61.574326 6.417,0 0,2.770999 -6.417,0 z"
     id="rect341"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 62.721634,65.343323 8.915,0 0,2.537 -8.915,0 z"
     id="rect343"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 66.636642,69.246323 5,0 0,2.599 -5,0 z"
     id="rect345"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,62.496323 2.082,0 0,4.849 -2.082,0 z"
     id="rect347"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 58.555618,58.305328 4.166,0 0,2.88 -4.166,0 z"
     id="rect349"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,57.022321 10.29,0 0,-6.259 0,-1.003 0,-4.416 -3.249,0 0,1.833 -8.416,0 0,3.586 1.375,0 z"
     id="polygon351"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 45.30363,23.422321 -2.5,0 0,5.921 0,2.163 2.5,0 1.039,0 2.627,0 0,-2.163 0,-2.834 -2.627,0 0,2.834 -1.039,0 z"
     id="polygon353"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 56.38763,29.343321 -3.768,0 0,-1.542 -2.15,0 0,3.208 0.417,0 1.733,0 3.768,0 z"
     id="polygon355"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="M 32.981776,34.661429 18.964135,36.162866 17.593906,23.370202 31.611546,21.868765 z"
     id="rect357"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 39.404759,32.454644 -5.042095,0.540062 -0.492882,-4.60162 5.042095,-0.540062 z"
     id="rect359"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 27.42463,63.125321 0,1.488 -3.179,0.307 -1.325,-10.887 -1.367,0.266 -1.334,-12.998 3.551,-0.648 -0.127,-1.179 15.31,-1.635 -0.269,-2.516 3.627,-0.387 0.269,2.516 1.002,-0.107 0.234,2.187 4.524,-0.242 1.756,17.299 -9.426,1.086 -0.439,-4.509 -14.949,1.6 -0.125,-1.168 -0.684,0.133 0.514,4.132 1.81,-0.233 0.203,-0.021 1.112,-0.172 -10e-4,-0.007 8.346,-0.893 0.179,1.677 -4.468,0.479 0.41,3.827 z"
     id="polygon361"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 5.80563,62.613321 1.348,-0.145 -1.807,-16.871 -4.978,0.528 1.806,16.877 0.879,-0.094 0,2.435 2.752,0 z"
     id="polygon363"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 51.59663,60.283321 -0.125,-1.582 -3.7,0.346 -0.1,-0.933 -13.838,1.48 0.355,3.315 13.838,-1.482 -0.077,-0.722 z"
     id="polygon365"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 53.59663,34.258321 -5.57,-0.039 0,2.352 5.57,0 z"
     id="polygon367"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 161.47063,40.844321 v 4.344 h -27.125 v -0.008 h -3.125 v -12.461 h -39.374 v 13.625 h 1.209 l -0.021,4.281 h -3.583 l 0.021,0.013 h -1.624997 v -18.794 h -13 v 27 h 13 v -6.706 h 1.624997 v 9.081 H 75.347633 v 3.125 h 14.124997 4.125 34.249 v 2.656 h -5.405 v 2.938 h 5.405 v 1.281 h -6.875 v -3.875 h -16.124 v 5.125 h 15.812 0.312 6.875 l 0.062,5.77 h -17.625 v 2.938 h 17.625 l -0.006,0.576 -17.562,-0.019 v 2.938 l 17.534,0.019 -0.03,3.279 h -1.858 v -1.51 h -21.641 v 1.51 h -5.957 v -3.208 h 10.582 v -5.167 h -7.938 v -6.375 h 1.812 v -2.875 -3.75 h -5.125 -3 -8.999997 v 7.5 H 96.49063 v 5.5 H 86.469633 v 4.125 h -11.125 v 1.042 h 5.125 v 2.583 h -24.082 v 3.249999 h -4.791 v 32.25001 h 2.375 v -1.5 h 1.918 v 1.5 h 6.582 V 92.76132 h 4.042 v 30.08401 h 14.812 1.479 3.666 5.665997 37.749 v 2.253 h -4.5 v 7.334 h 3.396 l 7.771,-5.584 v -4.003 h 7.262 v -4.50001 h 5.905 v -3.875 h -5.905 v -1.125 h 10.905 V 87.345321 h -5.562 v -4.625 -0.75 -2.188 h -14.812 v 2.938 h 4.125 v 3.74 h -4.125 v 1.51 h -3.75 v -14.156 h 3.75 v 2.031 h 5.625 l -0.03,-4.969 h -3.312 -0.031 -6 v -6.531 h 0.625 v -1.849 h 3.125 v 1.599 h 35 v -6 h 15.875 v -17.25 l -23.752,-10e-4 0,0 z m -33.833,9.75 h -33.416 v -4.25 h 33.416 v 4.25 z M 84.471633,117.88632 h -1.666 v -25.126 h 1.666 v 25.126 z M 97.72163,74.094321 v -3.75 h 2.125 v 2.875 h 0.021 v 6.375 h -2.146 v -5.5 z m 36.624,-14.371 h -3.125 v -9.129 h -2.416 v -4.25 h 1.083 v 0.002 h 4.458 v 13.377 l 0,0 z"
     id="path369" />
  <path
     d="m 171.84563,69.719321 0,-1.375 -3.5,0 0,-0.875 -1.561,0 0,9.25 1.561,0 0,-4.25 3.625,0 0,-1.375 -3.625,0 0,-1.375 z"
     id="polygon371"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,116.40632 4.75,7.02101 7.625,-4.58401 -0.625,-3.75 c 0,0 -3,-3.41 -6.375,-2.518 -3.375,0.893 -5.375,3.831 -5.375,3.831 z"
     id="path373"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,147.27633 3.894,6.443 1.856,-0.625 2.125,3.875 c 0,0 4,-1 3.125,-2.875 -0.875,-1.875 -6.25,-9.371 -6.25,-9.371 l -4.75,2.553 z"
     id="path375"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 200.72063,155.46932 1.056,-0.733 0.069,0.108 2.655,-2 -8.28,-11.979 -2.479,1.743 6.859,10.356 -6.066,5.38 1.686,5 8.28,2.5 6.345,-5.375 -4.125,-5.625 -4.03,2.5 z"
     id="polygon377"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 178.15963,151.96932 3.375,3.875 -9.314,6.375 -2,-3.313 z"
     id="polygon379"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 185.09563,159.59432 -2.25,-2.625 -3.095,1.937 2.47,3.313 z"
     id="polygon381"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 220.59563,127.96432 -3.375,-3.745 -3.75,3.5 2.75,3.99 z"
     id="polygon383"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 217.03463,89.65632 -1.875,-1.909999 -5.189,5.004999 1.33,2.28 z"
     id="polygon385"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 221.34563,91.96932 -2.125,-2.938 -8.125,8.563 2.375,2.75 z"
     id="polygon387"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 208.97063,87.746321 -11,0 0,3.642999 11,-0.108 z"
     id="polygon389"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 179.28462,61.21933 4.062,0 0,4 -4.062,0 z"
     id="rect391"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 152.68458,134.64916 -6.3678,4.2177 -1.04034,-1.57069 6.3678,-4.2177 z"
     id="rect395"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 155.02236,138.30769 -6.36857,4.21694 -1.04071,-1.57172 6.36857,-4.21694 z"
     id="rect397"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 157.30935,141.88836 -6.3669,4.21584 -1.0396,-1.57005 6.3669,-4.21583 z"
     id="rect399"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 17.80563,107.67432 -2.917,0 0,5.834 2.917,0 0,4.378 13.5,0 0,-6.694 2.916,0 0,10.152 9.667,0 0,-12.336 -9.667,0 0,1.1 -2.916,0 0,-13.933 1.25,0 0,2.254 11.333,0 0,-6.795 -11.333,0 0,3.397 -1.25,0 0,-1.19 0,-1.5 0,-2.289 -5.417,0 0,2.289 -2.833,0 0,-1.747 -2.917,0 0,1.747 -2.333,0 z"
     id="polygon401"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 57.396622,69.527328 8.340999,0 0,3.586 -8.340999,0 z"
     id="rect403"
     style="fill:#808080;fill-opacity:1" />
  <path
     d="m 10.175689,145.49863 15,-5 5,-15 5,15 15,5 -15,5 -5,15 -5,-15 z"
     id="path3845"
     style="fill:#c4c4c4;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <g
     transform="translate(-0.38178087,0)"
     id="g3833">
    <path
       d="m 44.273519,145.47014 a 13.703708,13.703708 0 1 1 -27.407416,0 13.703708,13.703708 0 1 1 27.407416,0 z"
       id="path3827"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
    <path
       d="m 39.354239,145.47014 a 8.7844276,8.7844276 0 1 1 -17.568856,0 8.7844276,8.7844276 0 1 1 17.568856,0 z"
       id="path3829"
       style="fill:none;stroke:#000000;stroke-width:1;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none" />
  </g>
  <path
     d="m 10.186907,145.47014 40.002246,0"
     id="path3831"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 30.18803,125.46902 0,40.00224"
     id="path3837"
     style="fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="m 18.873688,134.1558 22.628684,22.62868"
     id="path3839"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  <path
     d="M 18.873687,156.78448 41.502373,134.1558"
     id="path3841"
     style="fill:none;stroke:#414141;stroke-width:0.80000001px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
</svg>
' WHERE id = 9;
INSERT INTO hall VALUES (2736, 'H4', 'Assembly+Finish', 380, 9500, 'Audi A4', 2, 'path369', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2737, 'H4 Assembly', 'Series 8', 81, 'rect217', 2736);
INSERT INTO location VALUES (2738, 'BI8', 'security test', 'Robert Mueller', 2737);
INSERT INTO device VALUES (2739, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '12476121', '2013-06-25 03:46:08.422', false, 2738);
INSERT INTO component VALUES (2740, 'Tests', 'Ok', 'I', 'D', '87263939', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:57:42.832', 'B2', 'red', 2739);
INSERT INTO component VALUES (2741, 'Network', 'IP: 10.0.0.1', 'B', 'G', '26546829', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 02:21:20.217', 'H6', 'green', 2739);
INSERT INTO device VALUES (2742, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '8707440', '2013-06-25 02:30:50.536', true, 2738);
INSERT INTO component VALUES (2743, 'Tests', 'Ok', 'I', 'H', '73921516', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 18:21:47.267', 'H6', 'green', 2742);
INSERT INTO component VALUES (2744, 'Network', 'IP: 10.0.0.1', 'I', 'G', '91648644', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 23:16:23.933', 'E9', 'green', 2742);
INSERT INTO location VALUES (2745, 'FH9', 'transmission test', 'Hans Mueller', 2737);
INSERT INTO device VALUES (2746, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '66707861', '2013-06-25 23:17:32.234', false, 2745);
INSERT INTO component VALUES (2747, 'Tests', 'Ok', 'D', 'C', '68568584', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-26 00:17:49.255', 'C7', 'green', 2746);
INSERT INTO component VALUES (2748, 'Network', 'IP: 10.0.0.1', 'C', 'D', '49428151', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 08:07:47.385', 'G7', 'green', 2746);
INSERT INTO device VALUES (2749, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '29416584', '2013-06-25 10:40:34.606', false, 2745);
INSERT INTO component VALUES (2750, 'Tests', 'Ok', 'E', 'B', '87922957', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 08:12:13.309', 'G4', 'green', 2749);
INSERT INTO component VALUES (2751, 'Network', 'IP: 10.0.0.1', 'D', 'D', '27147412', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 16:37:14.028', 'C3', 'yellow', 2749);
INSERT INTO line VALUES (2752, 'H4 PreSeries', 'Series 7', 82, 'polygon25', 2736);
INSERT INTO location VALUES (2753, 'AA9', 'transmission test', 'Robert Schmitt', 2752);
INSERT INTO device VALUES (2754, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '79661438', '2013-06-25 21:27:16.439', false, 2753);
INSERT INTO component VALUES (2755, 'Tests', 'Ok', 'H', 'B', '14270895', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:36:53.326', 'G4', 'green', 2754);
INSERT INTO component VALUES (2756, 'Network', 'IP: 10.0.0.1', 'F', 'E', '12106409', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 23:05:50.313', 'H3', 'green', 2754);
INSERT INTO device VALUES (2757, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '1833780', '2013-06-26 00:14:07.708', false, 2753);
INSERT INTO component VALUES (2758, 'Tests', 'Ok', 'H', 'C', '90426709', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 04:16:26.643', 'C7', 'green', 2757);
INSERT INTO component VALUES (2759, 'Network', 'IP: 10.0.0.1', 'C', 'I', '9732967', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 11:09:37.552', 'C7', 'green', 2757);
INSERT INTO location VALUES (2760, 'FG4', 'multimedia test', 'Robert Schmitt', 2752);
INSERT INTO device VALUES (2761, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '87854144', '2013-06-25 14:00:54.727', false, 2760);
INSERT INTO component VALUES (2762, 'Tests', 'Ok', 'D', 'A', '22788526', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 15:17:27.315', 'D9', 'green', 2761);
INSERT INTO component VALUES (2763, 'Network', 'IP: 10.0.0.1', 'I', 'D', '72049896', 'Howard Joel Wolowitz', '2013-06-25 13:33:18.061', 'F7', 'green', 2761);
INSERT INTO device VALUES (2764, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '90474579', '2013-06-26 01:28:40.688', false, 2760);
INSERT INTO component VALUES (2765, 'Tests', 'Ok', 'G', 'A', '22348857', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 08:47:09.385', 'C7', 'green', 2764);
INSERT INTO component VALUES (2766, 'Network', 'IP: 10.0.0.1', 'C', 'C', '6602812', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 11:46:28.053', 'E2', 'green', 2764);
INSERT INTO line VALUES (2767, 'H4 Finish', 'Series 6', 86, 'rect497', 2736);
INSERT INTO location VALUES (2768, 'ID3', 'transmission test', 'Robert Schulze', 2767);
INSERT INTO device VALUES (2769, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '22501721', '2013-06-25 03:14:28.65', false, 2768);
INSERT INTO component VALUES (2770, 'Tests', 'Ok', 'D', 'C', '65982013', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 09:23:06.174', 'C8', 'green', 2769);
INSERT INTO component VALUES (2771, 'Network', 'IP: 10.0.0.1', 'C', 'H', '99128226', 'Howard Joel Wolowitz', '2013-06-25 23:25:37.596', 'A6', 'green', 2769);
INSERT INTO device VALUES (2772, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '24201577', '2013-06-25 22:00:48.856', true, 2768);
INSERT INTO component VALUES (2773, 'Tests', 'Ok', 'I', 'A', '16265989', 'Howard Joel Wolowitz', '2013-06-25 10:17:51.63', 'E9', 'red', 2772);
INSERT INTO component VALUES (2774, 'Network', 'IP: 10.0.0.1', 'F', 'F', '24722329', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 16:15:55.731', 'D9', 'green', 2772);
INSERT INTO location VALUES (2775, 'CD7', 'security test', 'Peter Schulze', 2767);
INSERT INTO device VALUES (2776, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '24884710', '2013-06-25 17:03:57.997', false, 2775);
INSERT INTO component VALUES (2777, 'Tests', 'Ok', 'E', 'D', '10353626', 'Howard Joel Wolowitz', '2013-06-25 19:32:05.502', 'C9', 'green', 2776);
INSERT INTO component VALUES (2778, 'Network', 'IP: 10.0.0.1', 'C', 'A', '36769399', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 00:50:53.022', 'C9', 'green', 2776);
INSERT INTO device VALUES (2779, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '18302541', '2013-06-25 17:51:29.671', false, 2775);
INSERT INTO component VALUES (2780, 'Tests', 'Ok', 'F', 'I', '5301096', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 15:57:41.903', 'D1', 'green', 2779);
INSERT INTO component VALUES (2781, 'Network', 'IP: 10.0.0.1', 'B', 'B', '67661961', 'Howard Joel Wolowitz', '2013-06-25 23:51:01.811', 'H9', 'green', 2779);
INSERT INTO hall VALUES (2782, 'D2', 'Assembly+Finish', 391, 9737, 'Audi A4', 2, 'polygon249', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="623.62"
   height="311.81"
   viewBox="0 0 623.62 311.81"
   id="SVGPlan"
   xml:space="preserve"><metadata
   id="metadata4065"><rdf:RDF><cc:Work
       rdf:about=""><dc:format>image/svg+xml</dc:format><dc:type
         rdf:resource="http://purl.org/dc/dcmitype/StillImage" /><dc:title></dc:title></cc:Work></rdf:RDF></metadata><defs
   id="defs4063">
</defs>
<g
   id="g7976"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="M 130.101,69.406 H 75.267 v 3.437 h 45.001 l 3.666,2.063 h 4.667 l 14.415,-4.833 h 138.36 c 1.413,0 2.56,1.146 2.56,2.559 v 14.506 c 0,1.413 -1.146,2.56 -2.56,2.56 h -126.36 l -25.415,3.876 H 76.185"
     id="path45"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 71.935,70.073 V 83.53 h 53.167 l 15.946,-5.59 h 136.545 c 0.778,0 1.409,-0.632 1.409,-1.409 v -7.983 c 0,-0.777 -0.631,-1.408 -1.409,-1.408 H 201.444 75.267 l -3.332,2.933 z"
     id="path49"
     style="fill:#434343;fill-opacity:1;stroke:none" /><path
     d="M 82.393,97.97 H 276.28 c 1.105,0 2.001,-0.896 2.001,-2 V 84.634 c 0,-1.104 -0.896,-2 -2.001,-2 H 168.152 141.768 L 125.31,87.655 71.935,87.572 v 8.166 l 3.332,2.232 h 7.126 z"
     id="path51"
     style="fill:#434343;fill-opacity:1;stroke:none" /></g><path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect3"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.186,78.155 0,9.375 4.875,0 0,3 4.875,0 0,2.125 -3.5,0 0,7.75 -6.25,0 0,-7.75 -14.75,0 0,72.749 14.75,0 0,-20.249 24.318,0 0,-42.5 0,-2.25 0,-7 0,-0.75 0,-3.125 0,-1 0,-1 0,-9.375 z"
   id="polygon5"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 510.186,246.15401 36.25,0 0,27.25 -36.25,0 z"
   id="rect7"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 514.93597,169.40401 5.75,0 0,35.5 -5.75,0 z"
   id="rect9"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 547.504,222.322 0,-1.416 0,-4.361 0.017,0 -0.033,-9.973 0.016,0 0,-54.667 -24.318,0 0,54.667 8.484,0 0.016,4.582 -21.5,0 0,28.25 13.75,0 6.666,0 1.084,0 1.25,0 14.585,0 0,-17.082 z"
   id="polygon11"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 59.248,251.154 0,0 c 3.382,0 6.124,-2.742 6.124,-6.125 v -94.25 H 54.435 v 100.375 h 4.813 z"
   id="path17"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,105.155 11.437001,0 0,43.25 -11.437001,0 z"
   id="rect19"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 53.935001,67.764 11.437001,0 0,34.75 -11.437001,0 z"
   id="rect21"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 -12.334,0 -7,0 -53.334,0 0,43.25 60.334,0 0,-18.166 12.334,0 z"
   id="polygon23"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 143.602,105.155 0,25.084 -12.334,0 0,18.166 12.334,0 309.584,0 0,-43.25 z"
   id="polygon25"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect27"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 508.436,78.154999 14.75,0 0,9.5 -14.75,0 z"
   id="rect29"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 501.436,105.155 -11.5,0 -3.25,0 -10,0 0,25.5 13.25,0 0,17.75 11.5,0 z"
   id="polygon31"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 476.686,130.655 0,-25.5 -23.5,0 0,43.25 23.5,0 13.375,0 0,-17.75 z"
   id="polygon33"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<g
   id="g7906"
   style="fill:#434343;fill-opacity:1;stroke:none"><path
     d="m 76.435,16.405 54.75,0 0,17.75"
     id="polyline15"
     style="fill:#434343" /><path
     d="m 58.185001,35.529999 26,0 0,24.25 -26,0 z"
     id="rect35"
     style="fill:#434343" /><path
     d="m 76.434998,16.091999 55.375002,0 0,18.375 -55.375002,0 z"
     id="rect37"
     style="fill:#434343" /><path
     d="m 114.935,45.655 0,-10.25 -19.75,0 0,24.25 18,0 1.75,0 8,0 0,-14 z"
     id="polygon39"
     style="fill:#434343" /><path
     d="m 127.685,35.404999 14.75,0 0,24.25 -14.75,0 z"
     id="rect41"
     style="fill:#434343" /></g>
<path
   d="m 314.07401,35.404999 32.111,0 0,24.5 -32.111,0 z"
   id="rect43"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,153.237 429.500002,0 0,17.333 -429.500002,0 z"
   id="rect53"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,176.90199 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect131"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 71.934998,200.967 429.500002,0 0,17.33399 -429.500002,0 z"
   id="rect217"/>

<path
   d="m 71.934998,225.40601 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect303"
   style="fill:#434343;fill-opacity:1;stroke:none" />

<path
   d="m 71.433998,249.15401 429.500002,0 0,17.334 -429.500002,0 z"
   id="rect391"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 349.38141,35.404999 173.80459,0 0,24.5 -173.80459,0 z"
   id="rect497"/>
<path
   d="m 285.935,66.404999 214,0 0,32.25 -214,0 z"
   id="rect1103"
   style="fill:#434343;fill-opacity:1;stroke:none" />
<path
   d="m 523.18597,35.404999 24.318,0 0,36 -24.318,0 z"
   id="rect2927"
   style="fill:#434343;fill-opacity:1;stroke:none" />
</svg>
');
INSERT INTO line VALUES (2783, 'D2 Assembly', 'Series 8', 29, 'rect217', 2782);
INSERT INTO location VALUES (2784, 'BE4', 'multimedia test', 'Robert Schulze', 2783);
INSERT INTO device VALUES (2785, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '47542284', '2013-06-25 21:38:26.119', false, 2784);
INSERT INTO component VALUES (2786, 'Tests', 'Ok', 'I', 'H', '6279713', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 19:07:38.769', 'G7', 'green', 2785);
INSERT INTO component VALUES (2787, 'Network', 'IP: 10.0.0.1', 'G', 'F', '50108910', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 12:47:35.97', 'F6', 'green', 2785);
INSERT INTO device VALUES (2788, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '27813031', '2013-06-25 08:05:50.203', false, 2784);
INSERT INTO component VALUES (2789, 'Tests', 'Ok', 'I', 'C', '6928027', 'Howard Joel Wolowitz', '2013-06-26 00:14:55.874', 'A4', 'green', 2788);
INSERT INTO component VALUES (2790, 'Network', 'IP: 10.0.0.1', 'E', 'H', '66394652', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 14:45:01.386', 'B5', 'green', 2788);
INSERT INTO location VALUES (2791, 'HF4', 'security test', 'Sarah Schulze', 2783);
INSERT INTO device VALUES (2792, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '662692', '2013-06-25 04:51:50.19', false, 2791);
INSERT INTO component VALUES (2793, 'Tests', 'Ok', 'F', 'I', '40122104', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-26 00:08:11.14', 'F7', 'green', 2792);
INSERT INTO component VALUES (2794, 'Network', 'IP: 10.0.0.1', 'C', 'A', '26463', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:00:06.247', 'C1', 'green', 2792);
INSERT INTO device VALUES (2795, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '71148063', '2013-06-25 04:34:23.939', false, 2791);
INSERT INTO component VALUES (2796, 'Tests', 'Ok', 'H', 'I', '45275513', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 05:57:09.581', 'I1', 'green', 2795);
INSERT INTO component VALUES (2797, 'Network', 'IP: 10.0.0.1', 'H', 'A', '49711421', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 16:42:51.616', 'E2', 'green', 2795);
INSERT INTO line VALUES (2798, 'D2 PreSeries', 'Series 6', 2, 'polygon25', 2782);
INSERT INTO location VALUES (2799, 'BH9', 'transmission test', 'Peter Schulze', 2798);
INSERT INTO device VALUES (2800, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '80582108', '2013-06-25 20:00:04.497', false, 2799);
INSERT INTO component VALUES (2801, 'Tests', 'Ok', 'D', 'I', '62936428', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 15:02:42.742', 'E8', 'green', 2800);
INSERT INTO component VALUES (2802, 'Network', 'IP: 10.0.0.1', 'C', 'H', '80910433', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:03:02.911', 'D2', 'green', 2800);
INSERT INTO device VALUES (2803, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '79298284', '2013-06-25 20:18:22.5', false, 2799);
INSERT INTO component VALUES (2804, 'Tests', 'Ok', 'A', 'C', '20750214', 'Howard Joel Wolowitz', '2013-06-25 13:42:01.19', 'I5', 'green', 2803);
INSERT INTO component VALUES (2805, 'Network', 'IP: 10.0.0.1', 'A', 'H', '24561781', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 05:18:27.446', 'C1', 'green', 2803);
INSERT INTO location VALUES (2806, 'HC6', 'transmission test', 'Franziska Merkel', 2798);
INSERT INTO device VALUES (2807, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '62808707', '2013-06-25 17:16:00.301', false, 2806);
INSERT INTO component VALUES (2808, 'Tests', 'Ok', 'B', 'F', '50649906', 'Howard Joel Wolowitz', '2013-06-25 15:50:03.422', 'G8', 'green', 2807);
INSERT INTO component VALUES (2809, 'Network', 'IP: 10.0.0.1', 'F', 'I', '97607262', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 15:29:37.113', 'A6', 'green', 2807);
INSERT INTO device VALUES (2810, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '96989506', '2013-06-25 21:05:34.024', false, 2806);
INSERT INTO component VALUES (2811, 'Tests', 'Ok', 'G', 'B', '18598034', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 03:47:59.587', 'E8', 'green', 2810);
INSERT INTO component VALUES (2812, 'Network', 'IP: 10.0.0.1', 'B', 'E', '16516796', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 23:09:03.341', 'E1', 'green', 2810);
INSERT INTO line VALUES (2813, 'D2 Finish', 'Series 7', 44, 'rect497', 2782);
INSERT INTO location VALUES (2814, 'EA1', 'multimedia test', 'Peter Merkel', 2813);
INSERT INTO device VALUES (2815, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '28051301', '2013-06-25 13:16:28.928', true, 2814);
INSERT INTO component VALUES (2816, 'Tests', 'Ok', 'A', 'H', '54335922', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 01:34:45.461', 'F9', 'green', 2815);
INSERT INTO component VALUES (2817, 'Network', 'IP: 10.0.0.1', 'I', 'B', '54547984', 'Howard Joel Wolowitz', '2013-06-25 04:17:08.92', 'B6', 'green', 2815);
INSERT INTO device VALUES (2818, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '976958', '2013-06-25 09:41:11.152', false, 2814);
INSERT INTO component VALUES (2819, 'Tests', 'Ok', 'D', 'F', '46043770', 'Howard Joel Wolowitz', '2013-06-25 20:30:35.367', 'F2', 'green', 2818);
INSERT INTO component VALUES (2820, 'Network', 'IP: 10.0.0.1', 'F', 'D', '42247151', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 16:40:33.531', 'E6', 'green', 2818);
INSERT INTO location VALUES (2821, 'ED6', 'motor test', 'Robert Schulze', 2813);
INSERT INTO device VALUES (2822, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '89232977', '2013-06-25 02:24:42.728', false, 2821);
INSERT INTO component VALUES (2823, 'Tests', 'Ok', 'H', 'F', '8907249', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 18:48:58.742', 'F9', 'green', 2822);
INSERT INTO component VALUES (2824, 'Network', 'IP: 10.0.0.1', 'A', 'B', '99436096', 'Dr. Leonard Leakey Hofstadter', '2013-06-25 21:18:50.812', 'A8', 'green', 2822);
INSERT INTO device VALUES (2825, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '25272615', '2013-06-25 16:16:09.431', false, 2821);
INSERT INTO component VALUES (2826, 'Tests', 'Ok', 'B', 'C', '81339', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-25 21:18:40.531', 'A4', 'green', 2825);
INSERT INTO component VALUES (2827, 'Network', 'IP: 10.0.0.1', 'H', 'D', '92584130', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-25 02:05:28.703', 'B7', 'green', 2825);
