DROP TABLE IF EXISTS component CASCADE; 
DROP TABLE IF EXISTS device CASCADE;
DROP TABLE IF EXISTS line CASCADE;
DROP TABLE IF EXISTS location CASCADE;
DROP TABLE IF EXISTS hall CASCADE;
DROP TABLE IF EXISTS factory CASCADE;
create table factory(
	id int PRIMARY KEY,
	name char varying(128), 
	company char varying(128), 
	city char varying(128), 
	country char varying(128), 	
	gpslatitude double precision , 
	gpslongitude double precision, 
	carmodels char varying(512), 
	sizeofstaff int, 
	sizeofstaffdate timestamp,
	vehiclesperyear int, 
	vehiclesperday int, 
	upssystems int, 
	upsservers int, 
	upsprovider char varying(128), 
	parent integer, 
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
INSERT INTO hall VALUES (2000, 'C6', 'Assembly+Finish', 937, 8504, 'Audi A4', 2, 'path369', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2001, 'C6 Assembly', 'Series 2', 9, 'rect217', 2000);
INSERT INTO location VALUES (2002, 'II4', 'motor test', 'Franziska Merkel', 2001);
INSERT INTO device VALUES (2003, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '77087062', '2013-06-12 20:28:57.683', true, 2002);
INSERT INTO component VALUES (2004, 'D', 'H', '8478933', 'Howard Joel Wolowitz', '2013-06-13 12:06:17.747', 'G1', 'green', 2003);
INSERT INTO component VALUES (2005, 'E', 'H', '72871405', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:49:29.908', 'H4', 'green', 2003);
INSERT INTO device VALUES (2006, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '65839659', '2013-06-13 08:48:58.495', false, 2002);
INSERT INTO component VALUES (2007, 'H', 'F', '37388204', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:24:03.877', 'C6', 'green', 2006);
INSERT INTO component VALUES (2008, 'H', 'F', '97652242', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:46:07.996', 'F3', 'green', 2006);
INSERT INTO location VALUES (2009, 'AE5', 'motor test', 'Franziska Meier', 2001);
INSERT INTO device VALUES (2010, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '75561099', '2013-06-12 18:27:06.635', false, 2009);
INSERT INTO component VALUES (2011, 'G', 'I', '38117017', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 04:53:55.045', 'G2', 'green', 2010);
INSERT INTO component VALUES (2012, 'F', 'B', '32055150', 'Howard Joel Wolowitz', '2013-06-13 04:29:29.27', 'F5', 'green', 2010);
INSERT INTO device VALUES (2013, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '65475727', '2013-06-13 12:18:11.542', false, 2009);
INSERT INTO component VALUES (2014, 'H', 'F', '87618058', 'Howard Joel Wolowitz', '2013-06-13 12:24:38.682', 'E9', 'red', 2013);
INSERT INTO component VALUES (2015, 'F', 'D', '21562675', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 20:19:01.564', 'D3', 'green', 2013);
INSERT INTO line VALUES (2016, 'C6 PreSeries', 'Series 4', 75, 'polygon25', 2000);
INSERT INTO location VALUES (2017, 'AH6', 'transmission test', 'Robert Schulze', 2016);
INSERT INTO device VALUES (2018, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '37596875', '2013-06-12 15:14:18.558', false, 2017);
INSERT INTO component VALUES (2019, 'A', 'I', '86874834', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 08:36:21.848', 'C6', 'green', 2018);
INSERT INTO component VALUES (2020, 'B', 'E', '3569520', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:18:43.317', 'D4', 'green', 2018);
INSERT INTO device VALUES (2021, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '84409392', '2013-06-13 08:19:51.365', false, 2017);
INSERT INTO component VALUES (2022, 'G', 'C', '10933482', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:15:58.478', 'C9', 'green', 2021);
INSERT INTO component VALUES (2023, 'B', 'F', '64532530', 'Howard Joel Wolowitz', '2013-06-13 12:55:05.104', 'B6', 'green', 2021);
INSERT INTO location VALUES (2024, 'DG9', 'ABS test', 'Robert Merkel', 2016);
INSERT INTO device VALUES (2025, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '14330604', '2013-06-12 18:06:20.677', false, 2024);
INSERT INTO component VALUES (2026, 'C', 'E', '36878721', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 08:14:09.208', 'C1', 'green', 2025);
INSERT INTO component VALUES (2027, 'E', 'C', '78929379', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 13:16:58.379', 'G7', 'green', 2025);
INSERT INTO device VALUES (2028, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '88464453', '2013-06-13 09:22:27.976', false, 2024);
INSERT INTO component VALUES (2029, 'H', 'B', '42011407', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:39:15.502', 'E6', 'green', 2028);
INSERT INTO component VALUES (2030, 'D', 'A', '25827317', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:46:04.964', 'C9', 'green', 2028);
INSERT INTO line VALUES (2031, 'C6 Finish', 'Series 9', 9, 'rect497', 2000);
INSERT INTO location VALUES (2032, 'HH3', 'ABS test', 'Sarah Schulze', 2031);
INSERT INTO device VALUES (2033, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '73953822', '2013-06-12 19:00:28.288', false, 2032);
INSERT INTO component VALUES (2034, 'B', 'B', '96247899', 'Howard Joel Wolowitz', '2013-06-12 22:26:45.314', 'A4', 'green', 2033);
INSERT INTO component VALUES (2035, 'I', 'C', '5392128', 'Howard Joel Wolowitz', '2013-06-13 07:03:26.152', 'H4', 'green', 2033);
INSERT INTO device VALUES (2036, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '84756411', '2013-06-13 04:57:22.088', false, 2032);
INSERT INTO component VALUES (2037, 'C', 'H', '63363646', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:36:37.572', 'B7', 'green', 2036);
INSERT INTO component VALUES (2038, 'G', 'A', '81552252', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:39:20.049', 'B4', 'green', 2036);
INSERT INTO location VALUES (2039, 'DC8', 'security test', 'Robert Schulze', 2031);
INSERT INTO device VALUES (2040, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '43456632', '2013-06-13 02:20:11.622', false, 2039);
INSERT INTO component VALUES (2041, 'A', 'H', '83280364', 'Howard Joel Wolowitz', '2013-06-12 23:48:55.516', 'H7', 'green', 2040);
INSERT INTO component VALUES (2042, 'G', 'F', '30782309', 'Howard Joel Wolowitz', '2013-06-13 02:13:04.291', 'I5', 'green', 2040);
INSERT INTO device VALUES (2043, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '10721450', '2013-06-12 23:54:35.337', false, 2039);
INSERT INTO component VALUES (2044, 'G', 'B', '36177500', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:02:40.296', 'E9', 'green', 2043);
INSERT INTO component VALUES (2045, 'B', 'B', '51821657', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:30:57.301', 'D1', 'green', 2043);
INSERT INTO hall VALUES (2046, 'G2', 'Assembly+Finish', 425, 5398, 'Audi A4', 2, 'polygon249', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2047, 'G2 Assembly', 'Series 8', 76, 'rect217', 2046);
INSERT INTO location VALUES (2048, 'AI2', 'motor test', 'Hans Merkel', 2047);
INSERT INTO device VALUES (2049, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '21386306', '2013-06-12 19:18:34.952', false, 2048);
INSERT INTO component VALUES (2050, 'B', 'E', '38653882', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:55:37.065', 'B8', 'green', 2049);
INSERT INTO component VALUES (2051, 'D', 'A', '72768760', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 06:25:03.479', 'E3', 'green', 2049);
INSERT INTO device VALUES (2052, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '98916863', '2013-06-13 11:22:43.814', false, 2048);
INSERT INTO component VALUES (2053, 'C', 'I', '17394572', 'Howard Joel Wolowitz', '2013-06-13 13:49:25.753', 'C9', 'green', 2052);
INSERT INTO component VALUES (2054, 'C', 'G', '38311349', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:19:38.706', 'A2', 'green', 2052);
INSERT INTO location VALUES (2055, 'GH6', 'multimedia test', 'Robert Meier', 2047);
INSERT INTO device VALUES (2056, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '61461939', '2013-06-13 14:06:19.6', false, 2055);
INSERT INTO component VALUES (2057, 'B', 'H', '85198019', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:38:38.924', 'H6', 'green', 2056);
INSERT INTO component VALUES (2058, 'A', 'C', '50752803', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 01:44:03.796', 'H2', 'red', 2056);
INSERT INTO device VALUES (2059, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '25729783', '2013-06-13 03:45:49.018', false, 2055);
INSERT INTO component VALUES (2060, 'A', 'C', '85588377', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:21:10.752', 'F5', 'green', 2059);
INSERT INTO component VALUES (2061, 'G', 'A', '56146435', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:35:26.848', 'D9', 'green', 2059);
INSERT INTO line VALUES (2062, 'G2 PreSeries', 'Series 7', 23, 'polygon25', 2046);
INSERT INTO location VALUES (2063, 'DB5', 'security test', 'Peter Schulze', 2062);
INSERT INTO device VALUES (2064, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '64316695', '2013-06-13 13:18:47.86', false, 2063);
INSERT INTO component VALUES (2065, 'B', 'G', '91037892', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:38:56.539', 'C6', 'green', 2064);
INSERT INTO component VALUES (2066, 'E', 'E', '7911159', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:26:33.21', 'H5', 'green', 2064);
INSERT INTO device VALUES (2067, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '26343157', '2013-06-13 00:50:38.142', true, 2063);
INSERT INTO component VALUES (2068, 'B', 'D', '21518944', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:58:31.861', 'I3', 'green', 2067);
INSERT INTO component VALUES (2069, 'H', 'C', '42664359', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:09:03.377', 'B5', 'green', 2067);
INSERT INTO location VALUES (2070, 'BB6', 'motor test', 'Franziska Meier', 2062);
INSERT INTO device VALUES (2071, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '97052364', '2013-06-13 01:14:21.72', false, 2070);
INSERT INTO component VALUES (2072, 'A', 'E', '46147797', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:41:46.518', 'H7', 'green', 2071);
INSERT INTO component VALUES (2073, 'C', 'B', '46316001', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 17:28:19.744', 'B6', 'green', 2071);
INSERT INTO device VALUES (2074, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '51356082', '2013-06-13 08:22:38.36', false, 2070);
INSERT INTO component VALUES (2075, 'A', 'B', '33478535', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:38:58.126', 'E2', 'green', 2074);
INSERT INTO component VALUES (2076, 'E', 'C', '8396054', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:12:16.796', 'D6', 'green', 2074);
INSERT INTO line VALUES (2077, 'G2 Finish', 'Series 7', 32, 'rect497', 2046);
INSERT INTO location VALUES (2078, 'CF4', 'security test', 'Franziska Schulze', 2077);
INSERT INTO device VALUES (2079, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '73036163', '2013-06-12 15:28:09.88', false, 2078);
INSERT INTO component VALUES (2080, 'B', 'F', '54638285', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 06:50:42.127', 'A1', 'green', 2079);
INSERT INTO component VALUES (2081, 'A', 'E', '73689059', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:08:07.51', 'A8', 'green', 2079);
INSERT INTO device VALUES (2082, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '5593847', '2013-06-12 20:25:26.235', false, 2078);
INSERT INTO component VALUES (2083, 'A', 'D', '26085217', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:33:16.425', 'C5', 'green', 2082);
INSERT INTO component VALUES (2084, 'B', 'D', '182592', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:34:41.74', 'E2', 'green', 2082);
INSERT INTO location VALUES (2085, 'IE4', 'ABS test', 'Hans Mueller', 2077);
INSERT INTO device VALUES (2086, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '48835587', '2013-06-12 15:04:42.566', false, 2085);
INSERT INTO component VALUES (2087, 'D', 'B', '98465886', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:02:32.598', 'G1', 'yellow', 2086);
INSERT INTO component VALUES (2088, 'G', 'G', '4205676', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 04:26:34.499', 'A1', 'green', 2086);
INSERT INTO device VALUES (2089, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '72089180', '2013-06-13 03:45:07.772', false, 2085);
INSERT INTO component VALUES (2090, 'A', 'F', '2594697', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:31:14.364', 'C3', 'green', 2089);
INSERT INTO component VALUES (2091, 'F', 'F', '19253224', 'Howard Joel Wolowitz', '2013-06-13 12:26:42.794', 'C2', 'green', 2089);
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
INSERT INTO hall VALUES (2092, 'D2', 'Assembly+Finish', 602, 9338, 'Audi A4', 2, 'path369', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2093, 'D2 Assembly', 'Series 7', 82, 'rect217', 2092);
INSERT INTO location VALUES (2094, 'AC4', 'transmission test', 'Sarah Merkel', 2093);
INSERT INTO device VALUES (2095, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '99474141', '2013-06-12 20:33:44.231', false, 2094);
INSERT INTO component VALUES (2096, 'H', 'H', '65664859', 'Howard Joel Wolowitz', '2013-06-13 12:43:00.431', 'I5', 'green', 2095);
INSERT INTO component VALUES (2097, 'I', 'C', '69352794', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:29:08.318', 'G4', 'green', 2095);
INSERT INTO device VALUES (2098, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '69666852', '2013-06-13 14:31:52.282', false, 2094);
INSERT INTO component VALUES (2099, 'C', 'D', '68874656', 'Howard Joel Wolowitz', '2013-06-13 14:24:40.126', 'F7', 'green', 2098);
INSERT INTO component VALUES (2100, 'E', 'E', '48914897', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:54:49.263', 'D1', 'red', 2098);
INSERT INTO location VALUES (2101, 'AG7', 'transmission test', 'Hans Mueller', 2093);
INSERT INTO device VALUES (2102, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '87717976', '2013-06-13 03:29:27.595', false, 2101);
INSERT INTO component VALUES (2103, 'H', 'G', '89536876', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 14:21:26.11', 'C1', 'green', 2102);
INSERT INTO component VALUES (2104, 'G', 'G', '71575497', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:42:04.571', 'I3', 'green', 2102);
INSERT INTO device VALUES (2105, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '14926681', '2013-06-13 01:22:47.067', true, 2101);
INSERT INTO component VALUES (2106, 'A', 'A', '94581010', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:50:13.46', 'F5', 'green', 2105);
INSERT INTO component VALUES (2107, 'F', 'H', '20647211', 'Howard Joel Wolowitz', '2013-06-13 11:57:07.093', 'G2', 'red', 2105);
INSERT INTO line VALUES (2108, 'D2 PreSeries', 'Series 4', 19, 'polygon25', 2092);
INSERT INTO location VALUES (2109, 'FE5', 'ABS test', 'Peter Merkel', 2108);
INSERT INTO device VALUES (2110, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '68543292', '2013-06-13 02:08:14.248', false, 2109);
INSERT INTO component VALUES (2111, 'A', 'E', '80029633', 'Howard Joel Wolowitz', '2013-06-12 14:52:35.654', 'C7', 'green', 2110);
INSERT INTO component VALUES (2112, 'D', 'F', '1646846', 'Howard Joel Wolowitz', '2013-06-13 04:43:16.331', 'C3', 'green', 2110);
INSERT INTO device VALUES (2113, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '90460526', '2013-06-13 06:52:39.318', false, 2109);
INSERT INTO component VALUES (2114, 'E', 'F', '46023785', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:54:35.546', 'H4', 'green', 2113);
INSERT INTO component VALUES (2115, 'B', 'B', '54330317', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:09:53.671', 'A7', 'green', 2113);
INSERT INTO location VALUES (2116, 'CG6', 'ABS test', 'Peter Schulze', 2108);
INSERT INTO device VALUES (2117, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '86501785', '2013-06-12 21:31:15.702', false, 2116);
INSERT INTO component VALUES (2118, 'A', 'F', '14560818', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:38:26.606', 'E7', 'green', 2117);
INSERT INTO component VALUES (2119, 'F', 'D', '19560754', 'Howard Joel Wolowitz', '2013-06-13 00:40:37.836', 'I1', 'green', 2117);
INSERT INTO device VALUES (2120, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '24180358', '2013-06-13 04:13:48.086', false, 2116);
INSERT INTO component VALUES (2121, 'F', 'G', '67352189', 'Howard Joel Wolowitz', '2013-06-12 19:36:38.557', 'B2', 'green', 2120);
INSERT INTO component VALUES (2122, 'A', 'E', '86733958', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:06:48.639', 'F2', 'green', 2120);
INSERT INTO line VALUES (2123, 'D2 Finish', 'Series 8', 6, 'rect497', 2092);
INSERT INTO location VALUES (2124, 'IF6', 'multimedia test', 'Hans Schmitt', 2123);
INSERT INTO device VALUES (2125, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '10142498', '2013-06-13 12:00:34.319', false, 2124);
INSERT INTO component VALUES (2126, 'G', 'B', '73273072', 'Howard Joel Wolowitz', '2013-06-13 07:58:13.507', 'I2', 'yellow', 2125);
INSERT INTO component VALUES (2127, 'G', 'G', '7226712', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:18:09.996', 'G9', 'yellow', 2125);
INSERT INTO device VALUES (2128, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '44178714', '2013-06-13 12:52:49.587', false, 2124);
INSERT INTO component VALUES (2129, 'D', 'A', '28230870', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:05:59.575', 'I6', 'green', 2128);
INSERT INTO component VALUES (2130, 'B', 'H', '94785884', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:20:41.063', 'H6', 'red', 2128);
INSERT INTO location VALUES (2131, 'BF1', 'multimedia test', 'Franziska Mueller', 2123);
INSERT INTO device VALUES (2132, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '48610603', '2013-06-12 19:54:54.951', false, 2131);
INSERT INTO component VALUES (2133, 'D', 'C', '30229194', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:03:53.381', 'H7', 'yellow', 2132);
INSERT INTO component VALUES (2134, 'D', 'B', '21307793', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:58:22.101', 'B6', 'yellow', 2132);
INSERT INTO device VALUES (2135, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '27462355', '2013-06-13 12:54:27.492', false, 2131);
INSERT INTO component VALUES (2136, 'C', 'E', '7683565', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:29:17.242', 'D6', 'green', 2135);
INSERT INTO component VALUES (2137, 'A', 'B', '5221394', 'Howard Joel Wolowitz', '2013-06-13 07:42:04.556', 'H6', 'green', 2135);
INSERT INTO hall VALUES (2138, 'F7', 'Assembly+Finish', 800, 3999, 'Audi A4', 2, 'polygon249', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2139, 'F7 Assembly', 'Series 8', 55, 'rect217', 2138);
INSERT INTO location VALUES (2140, 'FD7', 'motor test', 'Peter Merkel', 2139);
INSERT INTO device VALUES (2141, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '48743524', '2013-06-13 10:53:06.301', true, 2140);
INSERT INTO component VALUES (2142, 'I', 'E', '61213005', 'Howard Joel Wolowitz', '2013-06-12 16:17:24.078', 'A1', 'green', 2141);
INSERT INTO component VALUES (2143, 'G', 'E', '87361373', 'Howard Joel Wolowitz', '2013-06-12 23:40:28.851', 'A2', 'green', 2141);
INSERT INTO device VALUES (2144, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '39028834', '2013-06-13 09:58:41.254', false, 2140);
INSERT INTO component VALUES (2145, 'H', 'H', '8865817', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:06:48.274', 'G7', 'green', 2144);
INSERT INTO component VALUES (2146, 'C', 'A', '59724736', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:52:42.585', 'D4', 'red', 2144);
INSERT INTO location VALUES (2147, 'IB1', 'security test', 'Robert Schmitt', 2139);
INSERT INTO device VALUES (2148, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '46238271', '2013-06-13 01:34:20.092', false, 2147);
INSERT INTO component VALUES (2149, 'A', 'I', '90107266', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:58:52.746', 'D9', 'green', 2148);
INSERT INTO component VALUES (2150, 'E', 'H', '20246744', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:16:00.432', 'I1', 'green', 2148);
INSERT INTO device VALUES (2151, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '88559286', '2013-06-12 18:36:50.354', false, 2147);
INSERT INTO component VALUES (2152, 'D', 'D', '59766141', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:51:46.79', 'A9', 'green', 2151);
INSERT INTO component VALUES (2153, 'F', 'H', '41339753', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:46:58.572', 'G8', 'green', 2151);
INSERT INTO line VALUES (2154, 'F7 PreSeries', 'Series 9', 93, 'polygon25', 2138);
INSERT INTO location VALUES (2155, 'GH9', 'transmission test', 'Peter Schulze', 2154);
INSERT INTO device VALUES (2156, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '43354246', '2013-06-12 23:39:44.104', true, 2155);
INSERT INTO component VALUES (2157, 'D', 'D', '92439206', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:33:30.536', 'A9', 'green', 2156);
INSERT INTO component VALUES (2158, 'I', 'C', '77044403', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 13:30:54.984', 'C8', 'green', 2156);
INSERT INTO device VALUES (2159, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '78006035', '2013-06-12 19:32:12.418', false, 2155);
INSERT INTO component VALUES (2160, 'C', 'E', '44110715', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 14:08:13.888', 'B6', 'green', 2159);
INSERT INTO component VALUES (2161, 'C', 'B', '59912598', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:44:10.258', 'H7', 'green', 2159);
INSERT INTO location VALUES (2162, 'BC3', 'security test', 'Franziska Schmitt', 2154);
INSERT INTO device VALUES (2163, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '5942737', '2013-06-13 04:52:39.66', false, 2162);
INSERT INTO component VALUES (2164, 'H', 'A', '70114284', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:34:55.755', 'D8', 'green', 2163);
INSERT INTO component VALUES (2165, 'H', 'H', '4718658', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:16:11.527', 'B8', 'green', 2163);
INSERT INTO device VALUES (2166, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '32125995', '2013-06-13 04:30:27.233', false, 2162);
INSERT INTO component VALUES (2167, 'G', 'A', '65675891', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:31:50.084', 'A6', 'red', 2166);
INSERT INTO component VALUES (2168, 'E', 'B', '27835009', 'Howard Joel Wolowitz', '2013-06-12 17:45:42.274', 'I3', 'green', 2166);
INSERT INTO line VALUES (2169, 'F7 Finish', 'Series 9', 3, 'rect497', 2138);
INSERT INTO location VALUES (2170, 'AF3', 'security test', 'Franziska Merkel', 2169);
INSERT INTO device VALUES (2171, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '15097358', '2013-06-12 20:24:26.999', false, 2170);
INSERT INTO component VALUES (2172, 'B', 'F', '12190706', 'Howard Joel Wolowitz', '2013-06-13 02:12:23.736', 'A4', 'green', 2171);
INSERT INTO component VALUES (2173, 'G', 'G', '13585896', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:41:09.871', 'I5', 'red', 2171);
INSERT INTO device VALUES (2174, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '40077212', '2013-06-13 10:21:28.652', false, 2170);
INSERT INTO component VALUES (2175, 'F', 'D', '35442872', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:56:44.696', 'I9', 'green', 2174);
INSERT INTO component VALUES (2176, 'H', 'H', '91158030', 'Howard Joel Wolowitz', '2013-06-13 07:52:07.577', 'D2', 'green', 2174);
INSERT INTO location VALUES (2177, 'IB9', 'ABS test', 'Robert Mueller', 2169);
INSERT INTO device VALUES (2178, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '61555574', '2013-06-12 18:53:34.605', false, 2177);
INSERT INTO component VALUES (2179, 'F', 'B', '19203852', 'Howard Joel Wolowitz', '2013-06-12 21:57:14.797', 'A5', 'green', 2178);
INSERT INTO component VALUES (2180, 'F', 'F', '94597561', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 20:25:58.206', 'E3', 'green', 2178);
INSERT INTO device VALUES (2181, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '70992866', '2013-06-12 14:50:41.01', false, 2177);
INSERT INTO component VALUES (2182, 'G', 'D', '71177803', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 19:55:35.545', 'H5', 'green', 2181);
INSERT INTO component VALUES (2183, 'B', 'A', '56273779', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:17:18.956', 'F6', 'green', 2181);
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
INSERT INTO hall VALUES (2184, 'B5', 'Assembly+Finish', 848, 5076, 'Audi A4', 2, 'path369', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2185, 'B5 Assembly', 'Series 6', 51, 'rect217', 2184);
INSERT INTO location VALUES (2186, 'EI5', 'ABS test', 'Robert Meier', 2185);
INSERT INTO device VALUES (2187, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '39559753', '2013-06-13 00:20:18.575', true, 2186);
INSERT INTO component VALUES (2188, 'E', 'C', '64513881', 'Howard Joel Wolowitz', '2013-06-13 10:21:34.559', 'I5', 'green', 2187);
INSERT INTO component VALUES (2189, 'C', 'G', '28877483', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:41:41.439', 'D4', 'green', 2187);
INSERT INTO device VALUES (2190, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '10569914', '2013-06-13 01:29:06.807', false, 2186);
INSERT INTO component VALUES (2191, 'G', 'G', '27155144', 'Howard Joel Wolowitz', '2013-06-13 08:56:29.262', 'A2', 'green', 2190);
INSERT INTO component VALUES (2192, 'H', 'B', '92137152', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:58:10.531', 'A6', 'yellow', 2190);
INSERT INTO location VALUES (2193, 'HI2', 'motor test', 'Robert Merkel', 2185);
INSERT INTO device VALUES (2194, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '62450936', '2013-06-13 14:08:19.266', false, 2193);
INSERT INTO component VALUES (2195, 'G', 'F', '86162907', 'Howard Joel Wolowitz', '2013-06-12 17:07:08.72', 'D9', 'yellow', 2194);
INSERT INTO component VALUES (2196, 'D', 'H', '7609900', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:32:57.908', 'H4', 'green', 2194);
INSERT INTO device VALUES (2197, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '99255524', '2013-06-12 17:20:40.756', false, 2193);
INSERT INTO component VALUES (2198, 'E', 'H', '36147246', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:13:44.713', 'H7', 'green', 2197);
INSERT INTO component VALUES (2199, 'E', 'E', '50192796', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 01:56:49.979', 'G2', 'green', 2197);
INSERT INTO line VALUES (2200, 'B5 PreSeries', 'Series 8', 5, 'polygon25', 2184);
INSERT INTO location VALUES (2201, 'HD9', 'ABS test', 'Robert Schulze', 2200);
INSERT INTO device VALUES (2202, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '32020285', '2013-06-13 13:24:42.337', false, 2201);
INSERT INTO component VALUES (2203, 'G', 'F', '69694874', 'Howard Joel Wolowitz', '2013-06-13 10:46:46.907', 'B8', 'green', 2202);
INSERT INTO component VALUES (2204, 'A', 'B', '9096479', 'Howard Joel Wolowitz', '2013-06-13 02:38:59.723', 'B6', 'green', 2202);
INSERT INTO device VALUES (2205, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '97009353', '2013-06-13 01:55:27.651', false, 2201);
INSERT INTO component VALUES (2206, 'G', 'A', '64672752', 'Howard Joel Wolowitz', '2013-06-13 14:19:29.521', 'F7', 'green', 2205);
INSERT INTO component VALUES (2207, 'B', 'D', '75891346', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:53:49.291', 'F8', 'green', 2205);
INSERT INTO location VALUES (2208, 'BB9', 'motor test', 'Peter Mueller', 2200);
INSERT INTO device VALUES (2209, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '65510753', '2013-06-12 23:11:15.547', false, 2208);
INSERT INTO component VALUES (2210, 'C', 'A', '47551645', 'Howard Joel Wolowitz', '2013-06-12 15:20:03.26', 'E7', 'green', 2209);
INSERT INTO component VALUES (2211, 'F', 'A', '95764488', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 16:48:08.8', 'H9', 'green', 2209);
INSERT INTO device VALUES (2212, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '88074782', '2013-06-13 01:51:56.117', false, 2208);
INSERT INTO component VALUES (2213, 'D', 'D', '53891808', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:32:35.831', 'B9', 'green', 2212);
INSERT INTO component VALUES (2214, 'F', 'I', '26489376', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:31:41.932', 'F9', 'yellow', 2212);
INSERT INTO line VALUES (2215, 'B5 Finish', 'Series 7', 93, 'rect497', 2184);
INSERT INTO location VALUES (2216, 'CB1', 'multimedia test', 'Franziska Schulze', 2215);
INSERT INTO device VALUES (2217, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '7740428', '2013-06-13 05:12:09.25', false, 2216);
INSERT INTO component VALUES (2218, 'H', 'G', '62662966', 'Howard Joel Wolowitz', '2013-06-13 11:19:29.224', 'C5', 'green', 2217);
INSERT INTO component VALUES (2219, 'B', 'I', '13475353', 'Howard Joel Wolowitz', '2013-06-12 15:34:46.031', 'D1', 'green', 2217);
INSERT INTO device VALUES (2220, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '5621454', '2013-06-13 02:27:25.087', false, 2216);
INSERT INTO component VALUES (2221, 'B', 'D', '58773417', 'Howard Joel Wolowitz', '2013-06-13 01:11:16.352', 'I5', 'green', 2220);
INSERT INTO component VALUES (2222, 'A', 'H', '2528818', 'Howard Joel Wolowitz', '2013-06-12 21:40:31.819', 'B7', 'red', 2220);
INSERT INTO location VALUES (2223, 'IE7', 'ABS test', 'Franziska Meier', 2215);
INSERT INTO device VALUES (2224, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '641651', '2013-06-13 01:29:59.09', false, 2223);
INSERT INTO component VALUES (2225, 'D', 'A', '16879901', 'Howard Joel Wolowitz', '2013-06-12 20:38:42.573', 'I1', 'green', 2224);
INSERT INTO component VALUES (2226, 'I', 'C', '68357161', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:07:54.272', 'I7', 'green', 2224);
INSERT INTO device VALUES (2227, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '37293614', '2013-06-12 15:44:21.538', true, 2223);
INSERT INTO component VALUES (2228, 'F', 'E', '25144686', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:22:57.495', 'C7', 'green', 2227);
INSERT INTO component VALUES (2229, 'G', 'H', '71020844', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:42:52.85', 'B6', 'yellow', 2227);
INSERT INTO hall VALUES (2230, 'H3', 'Assembly+Finish', 569, 9262, 'Audi A4', 2, 'polygon249', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2231, 'H3 Assembly', 'Series 4', 93, 'rect217', 2230);
INSERT INTO location VALUES (2232, 'HC1', 'motor test', 'Peter Schmitt', 2231);
INSERT INTO device VALUES (2233, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '951786', '2013-06-12 17:26:53.565', false, 2232);
INSERT INTO component VALUES (2234, 'D', 'E', '91427350', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 00:10:24.503', 'G7', 'green', 2233);
INSERT INTO component VALUES (2235, 'C', 'E', '62989186', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 19:09:54.643', 'D7', 'green', 2233);
INSERT INTO device VALUES (2236, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '30975261', '2013-06-13 10:40:58.154', false, 2232);
INSERT INTO component VALUES (2237, 'E', 'G', '81428699', 'Howard Joel Wolowitz', '2013-06-13 02:48:02.519', 'I7', 'green', 2236);
INSERT INTO component VALUES (2238, 'A', 'G', '10649642', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:21:06.973', 'E3', 'green', 2236);
INSERT INTO location VALUES (2239, 'GC3', 'motor test', 'Franziska Schmitt', 2231);
INSERT INTO device VALUES (2240, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '45206228', '2013-06-12 22:09:23.534', false, 2239);
INSERT INTO component VALUES (2241, 'D', 'A', '67431128', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:51:48.956', 'G3', 'green', 2240);
INSERT INTO component VALUES (2242, 'D', 'F', '16180066', 'Howard Joel Wolowitz', '2013-06-12 16:20:46.916', 'E4', 'green', 2240);
INSERT INTO device VALUES (2243, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '5520480', '2013-06-12 16:55:52.727', false, 2239);
INSERT INTO component VALUES (2244, 'A', 'E', '87716094', 'Howard Joel Wolowitz', '2013-06-13 00:49:16.065', 'E4', 'red', 2243);
INSERT INTO component VALUES (2245, 'E', 'B', '89691926', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:53:48.995', 'I7', 'green', 2243);
INSERT INTO line VALUES (2246, 'H3 PreSeries', 'Series 8', 83, 'polygon25', 2230);
INSERT INTO location VALUES (2247, 'HA7', 'transmission test', 'Franziska Meier', 2246);
INSERT INTO device VALUES (2248, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '37013548', '2013-06-13 03:29:23.31', false, 2247);
INSERT INTO component VALUES (2249, 'D', 'A', '73556613', 'Howard Joel Wolowitz', '2013-06-13 11:11:14.581', 'C6', 'green', 2248);
INSERT INTO component VALUES (2250, 'I', 'G', '11099349', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:13:18.864', 'A1', 'green', 2248);
INSERT INTO device VALUES (2251, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '73606463', '2013-06-13 09:52:13.907', false, 2247);
INSERT INTO component VALUES (2252, 'A', 'D', '35218410', 'Howard Joel Wolowitz', '2013-06-12 14:52:35.831', 'D2', 'green', 2251);
INSERT INTO component VALUES (2253, 'A', 'D', '17067334', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:20:16.493', 'D9', 'green', 2251);
INSERT INTO location VALUES (2254, 'HH6', 'transmission test', 'Robert Mueller', 2246);
INSERT INTO device VALUES (2255, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '1229949', '2013-06-13 01:23:08.128', false, 2254);
INSERT INTO component VALUES (2256, 'F', 'D', '80859446', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:36:03.66', 'B2', 'green', 2255);
INSERT INTO component VALUES (2257, 'B', 'F', '58993674', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:57:19.495', 'B3', 'green', 2255);
INSERT INTO device VALUES (2258, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '47440895', '2013-06-12 15:58:51.096', false, 2254);
INSERT INTO component VALUES (2259, 'C', 'C', '29879910', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:36:17.336', 'H3', 'green', 2258);
INSERT INTO component VALUES (2260, 'I', 'A', '5066554', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:44:00.333', 'C8', 'green', 2258);
INSERT INTO line VALUES (2261, 'H3 Finish', 'Series 4', 89, 'rect497', 2230);
INSERT INTO location VALUES (2262, 'EA7', 'motor test', 'Franziska Meier', 2261);
INSERT INTO device VALUES (2263, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '79026571', '2013-06-13 06:47:50.396', false, 2262);
INSERT INTO component VALUES (2264, 'A', 'D', '90030782', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:47:14.36', 'F8', 'green', 2263);
INSERT INTO component VALUES (2265, 'H', 'E', '56905968', 'Howard Joel Wolowitz', '2013-06-12 17:19:34.556', 'E3', 'green', 2263);
INSERT INTO device VALUES (2266, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '6198165', '2013-06-13 02:39:10.013', false, 2262);
INSERT INTO component VALUES (2267, 'G', 'I', '82483343', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:04:30.886', 'B6', 'green', 2266);
INSERT INTO component VALUES (2268, 'E', 'C', '72174757', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:03:47.664', 'D4', 'green', 2266);
INSERT INTO location VALUES (2269, 'HF2', 'ABS test', 'Franziska Schulze', 2261);
INSERT INTO device VALUES (2270, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '89186684', '2013-06-12 16:30:40.353', false, 2269);
INSERT INTO component VALUES (2271, 'I', 'E', '98207389', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:08:59.398', 'E5', 'green', 2270);
INSERT INTO component VALUES (2272, 'B', 'C', '60242256', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:19:26.891', 'C9', 'green', 2270);
INSERT INTO device VALUES (2273, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '52834365', '2013-06-13 04:32:10.589', false, 2269);
INSERT INTO component VALUES (2274, 'E', 'C', '34868791', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:53:16.268', 'B9', 'green', 2273);
INSERT INTO component VALUES (2275, 'E', 'A', '15415596', 'Howard Joel Wolowitz', '2013-06-13 12:25:00.511', 'C6', 'green', 2273);
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
INSERT INTO hall VALUES (2276, 'D7', 'Assembly+Finish', 504, 7003, 'Audi A4', 2, 'path369', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2277, 'D7 Assembly', 'Series 1', 16, 'rect217', 2276);
INSERT INTO location VALUES (2278, 'IH3', 'transmission test', 'Franziska Schmitt', 2277);
INSERT INTO device VALUES (2279, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '22861363', '2013-06-13 03:49:18.068', false, 2278);
INSERT INTO component VALUES (2280, 'E', 'G', '9870876', 'Howard Joel Wolowitz', '2013-06-12 22:41:44.906', 'H2', 'green', 2279);
INSERT INTO component VALUES (2281, 'A', 'I', '88369690', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:44:48.18', 'D7', 'green', 2279);
INSERT INTO device VALUES (2282, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '59017461', '2013-06-12 22:14:33.541', false, 2278);
INSERT INTO component VALUES (2283, 'H', 'D', '76993463', 'Howard Joel Wolowitz', '2013-06-12 18:45:38.278', 'A3', 'green', 2282);
INSERT INTO component VALUES (2284, 'D', 'H', '65622391', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:10:15.768', 'E5', 'green', 2282);
INSERT INTO location VALUES (2285, 'FB2', 'multimedia test', 'Sarah Schulze', 2277);
INSERT INTO device VALUES (2286, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '22580254', '2013-06-13 02:15:18.253', true, 2285);
INSERT INTO component VALUES (2287, 'B', 'E', '98610155', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:35:54.427', 'G7', 'red', 2286);
INSERT INTO component VALUES (2288, 'A', 'I', '19591937', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:44:23.865', 'F3', 'green', 2286);
INSERT INTO device VALUES (2289, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '83394455', '2013-06-13 00:51:00.612', false, 2285);
INSERT INTO component VALUES (2290, 'G', 'G', '99744620', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:17:01.557', 'D8', 'green', 2289);
INSERT INTO component VALUES (2291, 'I', 'B', '70293862', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:50:43.032', 'D2', 'green', 2289);
INSERT INTO line VALUES (2292, 'D7 PreSeries', 'Series 3', 53, 'polygon25', 2276);
INSERT INTO location VALUES (2293, 'FB5', 'motor test', 'Hans Schulze', 2292);
INSERT INTO device VALUES (2294, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '11314026', '2013-06-12 20:22:23.606', false, 2293);
INSERT INTO component VALUES (2295, 'F', 'G', '32746930', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:45:06.792', 'B6', 'green', 2294);
INSERT INTO component VALUES (2296, 'I', 'F', '25260264', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:38:47.76', 'B1', 'green', 2294);
INSERT INTO device VALUES (2297, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '31900392', '2013-06-13 06:25:53.421', false, 2293);
INSERT INTO component VALUES (2298, 'A', 'F', '19996542', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:21:16.195', 'E3', 'green', 2297);
INSERT INTO component VALUES (2299, 'B', 'G', '68218766', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:03:38.589', 'G4', 'green', 2297);
INSERT INTO location VALUES (2300, 'GA2', 'ABS test', 'Sarah Merkel', 2292);
INSERT INTO device VALUES (2301, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '42714726', '2013-06-13 02:56:32.226', false, 2300);
INSERT INTO component VALUES (2302, 'A', 'I', '37266984', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 08:21:55.419', 'H2', 'green', 2301);
INSERT INTO component VALUES (2303, 'C', 'B', '92906171', 'Howard Joel Wolowitz', '2013-06-12 19:18:57.414', 'D8', 'green', 2301);
INSERT INTO device VALUES (2304, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '65706034', '2013-06-13 11:07:54.59', true, 2300);
INSERT INTO component VALUES (2305, 'G', 'I', '25950489', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 15:25:43.668', 'H5', 'yellow', 2304);
INSERT INTO component VALUES (2306, 'H', 'I', '85197367', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:24:33.189', 'I6', 'green', 2304);
INSERT INTO line VALUES (2307, 'D7 Finish', 'Series 9', 77, 'rect497', 2276);
INSERT INTO location VALUES (2308, 'AG9', 'multimedia test', 'Franziska Merkel', 2307);
INSERT INTO device VALUES (2309, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '38793471', '2013-06-12 23:11:57.662', false, 2308);
INSERT INTO component VALUES (2310, 'D', 'D', '786884', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:20:25.982', 'G9', 'green', 2309);
INSERT INTO component VALUES (2311, 'A', 'C', '18473948', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:29:04.861', 'E2', 'green', 2309);
INSERT INTO device VALUES (2312, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '61487143', '2013-06-13 05:36:41.632', false, 2308);
INSERT INTO component VALUES (2313, 'B', 'D', '62640556', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:35:37.226', 'D4', 'green', 2312);
INSERT INTO component VALUES (2314, 'F', 'I', '64314776', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 14:35:26.843', 'G5', 'green', 2312);
INSERT INTO location VALUES (2315, 'DI2', 'ABS test', 'Peter Schulze', 2307);
INSERT INTO device VALUES (2316, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '24256587', '2013-06-13 03:28:27.526', false, 2315);
INSERT INTO component VALUES (2317, 'E', 'D', '80592621', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:53:00.251', 'G2', 'green', 2316);
INSERT INTO component VALUES (2318, 'E', 'I', '86891675', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:41:10.84', 'E9', 'green', 2316);
INSERT INTO device VALUES (2319, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '52127543', '2013-06-13 02:17:05.095', false, 2315);
INSERT INTO component VALUES (2320, 'C', 'H', '31199120', 'Howard Joel Wolowitz', '2013-06-12 18:44:17.311', 'A2', 'red', 2319);
INSERT INTO component VALUES (2321, 'A', 'I', '59686639', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:58:58.21', 'A4', 'red', 2319);
INSERT INTO hall VALUES (2322, 'D1', 'Assembly+Finish', 561, 1515, 'Audi A4', 2, 'polygon249', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2323, 'D1 Assembly', 'Series 2', 89, 'rect217', 2322);
INSERT INTO location VALUES (2324, 'AF9', 'security test', 'Franziska Schulze', 2323);
INSERT INTO device VALUES (2325, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '45072043', '2013-06-12 17:15:12.966', false, 2324);
INSERT INTO component VALUES (2326, 'B', 'B', '71764790', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 08:28:40.96', 'C9', 'green', 2325);
INSERT INTO component VALUES (2327, 'F', 'C', '41638123', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:09:00.919', 'F6', 'green', 2325);
INSERT INTO device VALUES (2328, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '41266139', '2013-06-13 05:53:56.347', false, 2324);
INSERT INTO component VALUES (2329, 'A', 'A', '98746440', 'Howard Joel Wolowitz', '2013-06-12 17:06:03.115', 'I9', 'green', 2328);
INSERT INTO component VALUES (2330, 'D', 'I', '95193318', 'Howard Joel Wolowitz', '2013-06-13 03:21:27.734', 'B1', 'green', 2328);
INSERT INTO location VALUES (2331, 'DC9', 'security test', 'Peter Schulze', 2323);
INSERT INTO device VALUES (2332, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '33124499', '2013-06-12 19:29:54.21', false, 2331);
INSERT INTO component VALUES (2333, 'B', 'E', '97627213', 'Howard Joel Wolowitz', '2013-06-12 15:42:08.513', 'F4', 'green', 2332);
INSERT INTO component VALUES (2334, 'C', 'I', '5730129', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:27:52.505', 'B6', 'green', 2332);
INSERT INTO device VALUES (2335, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '77434296', '2013-06-13 04:19:12.703', true, 2331);
INSERT INTO component VALUES (2336, 'H', 'I', '1280154', 'Howard Joel Wolowitz', '2013-06-12 14:43:46.367', 'A9', 'green', 2335);
INSERT INTO component VALUES (2337, 'E', 'F', '19274548', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:27:39.195', 'H8', 'green', 2335);
INSERT INTO line VALUES (2338, 'D1 PreSeries', 'Series 8', 23, 'polygon25', 2322);
INSERT INTO location VALUES (2339, 'BB2', 'multimedia test', 'Robert Schmitt', 2338);
INSERT INTO device VALUES (2340, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '98350582', '2013-06-13 09:31:59.086', false, 2339);
INSERT INTO component VALUES (2341, 'H', 'E', '65825821', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:44:42.667', 'D4', 'green', 2340);
INSERT INTO component VALUES (2342, 'C', 'C', '1433191', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:59:01.325', 'A1', 'green', 2340);
INSERT INTO device VALUES (2343, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '78000849', '2013-06-13 10:18:00.106', false, 2339);
INSERT INTO component VALUES (2344, 'D', 'H', '87468743', 'Howard Joel Wolowitz', '2013-06-12 23:45:50.836', 'B6', 'green', 2343);
INSERT INTO component VALUES (2345, 'B', 'E', '67277089', 'Howard Joel Wolowitz', '2013-06-12 21:02:44.548', 'F3', 'green', 2343);
INSERT INTO location VALUES (2346, 'DC2', 'ABS test', 'Hans Schulze', 2338);
INSERT INTO device VALUES (2347, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '50427045', '2013-06-13 09:49:32.255', true, 2346);
INSERT INTO component VALUES (2348, 'G', 'H', '26961820', 'Howard Joel Wolowitz', '2013-06-13 00:49:16.779', 'G3', 'green', 2347);
INSERT INTO component VALUES (2349, 'A', 'F', '64640305', 'Howard Joel Wolowitz', '2013-06-13 09:04:41.924', 'C5', 'green', 2347);
INSERT INTO device VALUES (2350, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '82589988', '2013-06-12 16:57:24.745', false, 2346);
INSERT INTO component VALUES (2351, 'D', 'A', '44239778', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:49:58.962', 'E3', 'green', 2350);
INSERT INTO component VALUES (2352, 'B', 'I', '58734222', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:53:54.462', 'H4', 'green', 2350);
INSERT INTO line VALUES (2353, 'D1 Finish', 'Series 9', 24, 'rect497', 2322);
INSERT INTO location VALUES (2354, 'HB8', 'security test', 'Robert Merkel', 2353);
INSERT INTO device VALUES (2355, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '83988229', '2013-06-13 05:59:36.619', false, 2354);
INSERT INTO component VALUES (2356, 'E', 'B', '7537912', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:12:37.658', 'H8', 'green', 2355);
INSERT INTO component VALUES (2357, 'D', 'E', '45686849', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 16:22:21.768', 'F7', 'green', 2355);
INSERT INTO device VALUES (2358, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '40742383', '2013-06-12 20:03:08.058', false, 2354);
INSERT INTO component VALUES (2359, 'C', 'E', '26284124', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:12:53.709', 'D4', 'yellow', 2358);
INSERT INTO component VALUES (2360, 'H', 'G', '78971274', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:17:16.453', 'I4', 'green', 2358);
INSERT INTO location VALUES (2361, 'DA5', 'multimedia test', 'Hans Schmitt', 2353);
INSERT INTO device VALUES (2362, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '8058039', '2013-06-13 13:39:59.769', false, 2361);
INSERT INTO component VALUES (2363, 'F', 'B', '74580380', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:46:34.929', 'A1', 'green', 2362);
INSERT INTO component VALUES (2364, 'H', 'A', '59739738', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:40:56.759', 'E9', 'green', 2362);
INSERT INTO device VALUES (2365, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '87839872', '2013-06-13 12:28:55.971', true, 2361);
INSERT INTO component VALUES (2366, 'A', 'G', '13758154', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:52:41.703', 'G1', 'green', 2365);
INSERT INTO component VALUES (2367, 'E', 'E', '17086581', 'Howard Joel Wolowitz', '2013-06-13 08:43:14.42', 'H5', 'green', 2365);
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
INSERT INTO hall VALUES (2368, 'E2', 'Assembly+Finish', 673, 2542, 'Audi A4', 2, 'path369', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2369, 'E2 Assembly', 'Series 9', 42, 'rect217', 2368);
INSERT INTO location VALUES (2370, 'EH1', 'multimedia test', 'Hans Mueller', 2369);
INSERT INTO device VALUES (2371, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '55872687', '2013-06-13 12:25:25.245', false, 2370);
INSERT INTO component VALUES (2372, 'H', 'B', '74952572', 'Howard Joel Wolowitz', '2013-06-13 06:32:50.164', 'H1', 'green', 2371);
INSERT INTO component VALUES (2373, 'H', 'G', '51455216', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:48:47.135', 'F2', 'green', 2371);
INSERT INTO device VALUES (2374, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '73553163', '2013-06-12 16:10:47.949', false, 2370);
INSERT INTO component VALUES (2375, 'I', 'H', '91082787', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:41:39.602', 'C2', 'green', 2374);
INSERT INTO component VALUES (2376, 'G', 'D', '58635583', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:39:12.604', 'D9', 'green', 2374);
INSERT INTO location VALUES (2377, 'DI4', 'ABS test', 'Sarah Merkel', 2369);
INSERT INTO device VALUES (2378, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '16611648', '2013-06-12 16:46:45.175', true, 2377);
INSERT INTO component VALUES (2379, 'F', 'F', '18952347', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:43:29.789', 'I8', 'green', 2378);
INSERT INTO component VALUES (2380, 'G', 'A', '51625967', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:08:19.879', 'B5', 'green', 2378);
INSERT INTO device VALUES (2381, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '74504120', '2013-06-12 22:27:59.057', false, 2377);
INSERT INTO component VALUES (2382, 'A', 'D', '91472589', 'Howard Joel Wolowitz', '2013-06-12 16:23:00.329', 'I7', 'green', 2381);
INSERT INTO component VALUES (2383, 'E', 'F', '81051698', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:16:23.128', 'C9', 'green', 2381);
INSERT INTO line VALUES (2384, 'E2 PreSeries', 'Series 6', 71, 'polygon25', 2368);
INSERT INTO location VALUES (2385, 'BE8', 'ABS test', 'Hans Schmitt', 2384);
INSERT INTO device VALUES (2386, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '76363352', '2013-06-13 00:10:06.4', true, 2385);
INSERT INTO component VALUES (2387, 'B', 'C', '93611909', 'Howard Joel Wolowitz', '2013-06-13 02:10:34.931', 'H7', 'green', 2386);
INSERT INTO component VALUES (2388, 'G', 'D', '20268410', 'Howard Joel Wolowitz', '2013-06-12 15:34:02.262', 'I1', 'green', 2386);
INSERT INTO device VALUES (2389, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '48370731', '2013-06-13 09:01:03.631', false, 2385);
INSERT INTO component VALUES (2390, 'F', 'D', '51326392', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:56:20.338', 'G6', 'green', 2389);
INSERT INTO component VALUES (2391, 'C', 'C', '98841232', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:08:34.619', 'E3', 'green', 2389);
INSERT INTO location VALUES (2392, 'FD6', 'multimedia test', 'Franziska Schmitt', 2384);
INSERT INTO device VALUES (2393, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '81852225', '2013-06-12 17:09:55.818', false, 2392);
INSERT INTO component VALUES (2394, 'G', 'E', '2751383', 'Howard Joel Wolowitz', '2013-06-13 10:52:42.24', 'G9', 'green', 2393);
INSERT INTO component VALUES (2395, 'A', 'A', '39966376', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:39:59.842', 'B2', 'green', 2393);
INSERT INTO device VALUES (2396, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '41393679', '2013-06-13 09:06:20.098', false, 2392);
INSERT INTO component VALUES (2397, 'E', 'F', '51251937', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:14:35.728', 'G4', 'green', 2396);
INSERT INTO component VALUES (2398, 'H', 'B', '30939688', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:46:31.483', 'F5', 'green', 2396);
INSERT INTO line VALUES (2399, 'E2 Finish', 'Series 3', 74, 'rect497', 2368);
INSERT INTO location VALUES (2400, 'HC1', 'transmission test', 'Franziska Mueller', 2399);
INSERT INTO device VALUES (2401, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '84794584', '2013-06-12 23:08:09.56', false, 2400);
INSERT INTO component VALUES (2402, 'C', 'F', '17192623', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 06:52:34.951', 'A7', 'green', 2401);
INSERT INTO component VALUES (2403, 'A', 'H', '50072223', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:31:50.628', 'F1', 'green', 2401);
INSERT INTO device VALUES (2404, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '22137738', '2013-06-12 15:43:36.033', false, 2400);
INSERT INTO component VALUES (2405, 'I', 'F', '3243604', 'Howard Joel Wolowitz', '2013-06-13 10:24:02.697', 'D7', 'green', 2404);
INSERT INTO component VALUES (2406, 'A', 'C', '79623483', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 20:08:15.121', 'A6', 'green', 2404);
INSERT INTO location VALUES (2407, 'GC4', 'transmission test', 'Sarah Schulze', 2399);
INSERT INTO device VALUES (2408, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '27169119', '2013-06-13 03:12:21.93', false, 2407);
INSERT INTO component VALUES (2409, 'A', 'G', '32419410', 'Howard Joel Wolowitz', '2013-06-13 11:56:51.113', 'D7', 'green', 2408);
INSERT INTO component VALUES (2410, 'H', 'F', '67226853', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:30:14.96', 'F3', 'green', 2408);
INSERT INTO device VALUES (2411, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '95839213', '2013-06-12 17:36:18.862', false, 2407);
INSERT INTO component VALUES (2412, 'F', 'I', '79549208', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 06:38:21.027', 'I3', 'green', 2411);
INSERT INTO component VALUES (2413, 'D', 'A', '56450398', 'Howard Joel Wolowitz', '2013-06-12 22:30:35.116', 'I1', 'green', 2411);
INSERT INTO hall VALUES (2414, 'C2', 'Assembly+Finish', 813, 5708, 'Audi A4', 2, 'polygon249', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2415, 'C2 Assembly', 'Series 9', 21, 'rect217', 2414);
INSERT INTO location VALUES (2416, 'DG7', 'ABS test', 'Franziska Schmitt', 2415);
INSERT INTO device VALUES (2417, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '6656126', '2013-06-13 05:44:07.562', false, 2416);
INSERT INTO component VALUES (2418, 'C', 'D', '98826010', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:53:05.739', 'A6', 'green', 2417);
INSERT INTO component VALUES (2419, 'H', 'A', '56592307', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:37:49.07', 'B7', 'green', 2417);
INSERT INTO device VALUES (2420, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '5194616', '2013-06-13 06:38:24.099', false, 2416);
INSERT INTO component VALUES (2421, 'C', 'E', '82691889', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:02:23.631', 'D8', 'green', 2420);
INSERT INTO component VALUES (2422, 'E', 'B', '66332062', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:22:42.687', 'H9', 'green', 2420);
INSERT INTO location VALUES (2423, 'DG4', 'security test', 'Franziska Schmitt', 2415);
INSERT INTO device VALUES (2424, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '92473456', '2013-06-12 21:38:27.132', false, 2423);
INSERT INTO component VALUES (2425, 'I', 'I', '80858339', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:59:48.119', 'H3', 'green', 2424);
INSERT INTO component VALUES (2426, 'E', 'F', '442788', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 14:19:58.774', 'H3', 'green', 2424);
INSERT INTO device VALUES (2427, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '94971932', '2013-06-13 10:08:55.932', false, 2423);
INSERT INTO component VALUES (2428, 'C', 'A', '39901862', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:53:56.202', 'I2', 'green', 2427);
INSERT INTO component VALUES (2429, 'G', 'G', '1564900', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:56:49.698', 'B5', 'green', 2427);
INSERT INTO line VALUES (2430, 'C2 PreSeries', 'Series 9', 80, 'polygon25', 2414);
INSERT INTO location VALUES (2431, 'BI9', 'security test', 'Franziska Schmitt', 2430);
INSERT INTO device VALUES (2432, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '71561390', '2013-06-12 22:47:59.241', false, 2431);
INSERT INTO component VALUES (2433, 'B', 'E', '94382015', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:44:03.884', 'C2', 'green', 2432);
INSERT INTO component VALUES (2434, 'D', 'A', '19225141', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 08:57:12.216', 'E2', 'green', 2432);
INSERT INTO device VALUES (2435, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '40364764', '2013-06-12 20:07:49.551', false, 2431);
INSERT INTO component VALUES (2436, 'D', 'D', '23235792', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 23:39:04.405', 'B8', 'green', 2435);
INSERT INTO component VALUES (2437, 'G', 'H', '6531851', 'Howard Joel Wolowitz', '2013-06-13 05:30:50.611', 'H2', 'green', 2435);
INSERT INTO location VALUES (2438, 'HG5', 'multimedia test', 'Sarah Mueller', 2430);
INSERT INTO device VALUES (2439, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '61582596', '2013-06-13 01:59:25.42', false, 2438);
INSERT INTO component VALUES (2440, 'A', 'G', '81631405', 'Howard Joel Wolowitz', '2013-06-13 04:41:41.855', 'F3', 'green', 2439);
INSERT INTO component VALUES (2441, 'H', 'B', '98912972', 'Howard Joel Wolowitz', '2013-06-12 20:31:39.296', 'G9', 'green', 2439);
INSERT INTO device VALUES (2442, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '30568263', '2013-06-13 11:05:50.041', false, 2438);
INSERT INTO component VALUES (2443, 'B', 'B', '50576251', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:19:04.755', 'A5', 'green', 2442);
INSERT INTO component VALUES (2444, 'H', 'F', '39855980', 'Howard Joel Wolowitz', '2013-06-12 20:48:49.505', 'H8', 'green', 2442);
INSERT INTO line VALUES (2445, 'C2 Finish', 'Series 2', 90, 'rect497', 2414);
INSERT INTO location VALUES (2446, 'EB5', 'multimedia test', 'Sarah Merkel', 2445);
INSERT INTO device VALUES (2447, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '11550431', '2013-06-12 22:21:40.491', false, 2446);
INSERT INTO component VALUES (2448, 'F', 'C', '88332429', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 13:44:14.336', 'G6', 'green', 2447);
INSERT INTO component VALUES (2449, 'F', 'A', '72226717', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 13:16:14.998', 'B2', 'green', 2447);
INSERT INTO device VALUES (2450, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '95305594', '2013-06-13 06:10:54.627', false, 2446);
INSERT INTO component VALUES (2451, 'F', 'E', '14659930', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:56:15.167', 'H9', 'green', 2450);
INSERT INTO component VALUES (2452, 'E', 'A', '57898833', 'Howard Joel Wolowitz', '2013-06-12 19:18:58.353', 'E8', 'green', 2450);
INSERT INTO location VALUES (2453, 'HH8', 'transmission test', 'Peter Mueller', 2445);
INSERT INTO device VALUES (2454, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '92371111', '2013-06-12 23:11:58.641', false, 2453);
INSERT INTO component VALUES (2455, 'D', 'G', '19198328', 'Howard Joel Wolowitz', '2013-06-13 00:24:48.412', 'G6', 'green', 2454);
INSERT INTO component VALUES (2456, 'D', 'A', '15956508', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:50:22.019', 'I4', 'green', 2454);
INSERT INTO device VALUES (2457, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '85679910', '2013-06-12 20:26:26.471', false, 2453);
INSERT INTO component VALUES (2458, 'B', 'A', '5632461', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 04:14:38.922', 'I5', 'green', 2457);
INSERT INTO component VALUES (2459, 'G', 'H', '24059172', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:50:30.824', 'H5', 'green', 2457);
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
INSERT INTO hall VALUES (2460, 'C4', 'Assembly+Finish', 474, 2361, 'Audi A4', 2, 'path369', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2461, 'C4 Assembly', 'Series 1', 11, 'rect217', 2460);
INSERT INTO location VALUES (2462, 'FE2', 'security test', 'Hans Schulze', 2461);
INSERT INTO device VALUES (2463, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '34537113', '2013-06-13 11:33:41.86', false, 2462);
INSERT INTO component VALUES (2464, 'C', 'H', '61514327', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:23:43.208', 'C2', 'green', 2463);
INSERT INTO component VALUES (2465, 'A', 'H', '598916', 'Howard Joel Wolowitz', '2013-06-13 09:06:08.543', 'B1', 'green', 2463);
INSERT INTO device VALUES (2466, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '73964762', '2013-06-13 01:24:35.278', false, 2462);
INSERT INTO component VALUES (2467, 'D', 'D', '74480388', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:32:57.686', 'A4', 'yellow', 2466);
INSERT INTO component VALUES (2468, 'A', 'G', '59847432', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:00:19.767', 'I8', 'green', 2466);
INSERT INTO location VALUES (2469, 'DC3', 'motor test', 'Robert Mueller', 2461);
INSERT INTO device VALUES (2470, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '18211587', '2013-06-13 04:09:14.374', false, 2469);
INSERT INTO component VALUES (2471, 'H', 'E', '8996022', 'Howard Joel Wolowitz', '2013-06-12 17:57:37.22', 'G6', 'green', 2470);
INSERT INTO component VALUES (2472, 'H', 'I', '81363005', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:12:17.97', 'G4', 'green', 2470);
INSERT INTO device VALUES (2473, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '94072192', '2013-06-13 06:53:09.168', false, 2469);
INSERT INTO component VALUES (2474, 'F', 'D', '53978233', 'Howard Joel Wolowitz', '2013-06-12 20:53:04.836', 'A4', 'green', 2473);
INSERT INTO component VALUES (2475, 'F', 'A', '71447524', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:22:23.987', 'D3', 'green', 2473);
INSERT INTO line VALUES (2476, 'C4 PreSeries', 'Series 1', 75, 'polygon25', 2460);
INSERT INTO location VALUES (2477, 'GB1', 'ABS test', 'Robert Mueller', 2476);
INSERT INTO device VALUES (2478, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '26768582', '2013-06-13 02:55:14.171', false, 2477);
INSERT INTO component VALUES (2479, 'C', 'G', '23179344', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:07:10.95', 'C5', 'green', 2478);
INSERT INTO component VALUES (2480, 'A', 'B', '21265450', 'Howard Joel Wolowitz', '2013-06-12 19:35:08.02', 'B9', 'green', 2478);
INSERT INTO device VALUES (2481, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '94476851', '2013-06-13 03:46:16.475', false, 2477);
INSERT INTO component VALUES (2482, 'A', 'D', '52552669', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:37:20.653', 'I6', 'green', 2481);
INSERT INTO component VALUES (2483, 'D', 'E', '69160889', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:28:04.554', 'F1', 'green', 2481);
INSERT INTO location VALUES (2484, 'CI6', 'security test', 'Peter Merkel', 2476);
INSERT INTO device VALUES (2485, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '93715708', '2013-06-13 11:22:08.0', false, 2484);
INSERT INTO component VALUES (2486, 'G', 'A', '82980213', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 10:18:06.313', 'D3', 'green', 2485);
INSERT INTO component VALUES (2487, 'F', 'F', '92158341', 'Howard Joel Wolowitz', '2013-06-13 02:40:56.501', 'A8', 'green', 2485);
INSERT INTO device VALUES (2488, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '51993033', '2013-06-13 00:45:29.158', false, 2484);
INSERT INTO component VALUES (2489, 'B', 'B', '43856611', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 13:05:26.679', 'E2', 'green', 2488);
INSERT INTO component VALUES (2490, 'A', 'H', '24769809', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:30:27.324', 'E8', 'green', 2488);
INSERT INTO line VALUES (2491, 'C4 Finish', 'Series 7', 73, 'rect497', 2460);
INSERT INTO location VALUES (2492, 'CB4', 'ABS test', 'Robert Schmitt', 2491);
INSERT INTO device VALUES (2493, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '74371959', '2013-06-13 11:18:02.067', false, 2492);
INSERT INTO component VALUES (2494, 'F', 'I', '22048265', 'Howard Joel Wolowitz', '2013-06-13 07:41:41.414', 'E7', 'green', 2493);
INSERT INTO component VALUES (2495, 'F', 'C', '89249882', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 15:37:54.987', 'D5', 'green', 2493);
INSERT INTO device VALUES (2496, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '98860621', '2013-06-13 07:10:58.639', false, 2492);
INSERT INTO component VALUES (2497, 'G', 'E', '63293230', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:39:16.247', 'A5', 'green', 2496);
INSERT INTO component VALUES (2498, 'C', 'F', '48929795', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:00:31.365', 'D4', 'green', 2496);
INSERT INTO location VALUES (2499, 'EC8', 'motor test', 'Peter Mueller', 2491);
INSERT INTO device VALUES (2500, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '87559863', '2013-06-13 14:12:06.115', false, 2499);
INSERT INTO component VALUES (2501, 'B', 'C', '8494835', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 00:14:50.038', 'I8', 'green', 2500);
INSERT INTO component VALUES (2502, 'G', 'C', '51734520', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:30:32.526', 'E2', 'green', 2500);
INSERT INTO device VALUES (2503, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '97180461', '2013-06-13 12:20:48.161', false, 2499);
INSERT INTO component VALUES (2504, 'I', 'B', '10831135', 'Howard Joel Wolowitz', '2013-06-12 16:59:01.522', 'E1', 'green', 2503);
INSERT INTO component VALUES (2505, 'A', 'A', '30703603', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 14:44:08.675', 'B4', 'green', 2503);
INSERT INTO hall VALUES (2506, 'D4', 'Assembly+Finish', 91, 8077, 'Audi A4', 2, 'polygon249', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2507, 'D4 Assembly', 'Series 6', 56, 'rect217', 2506);
INSERT INTO location VALUES (2508, 'BI4', 'motor test', 'Sarah Schmitt', 2507);
INSERT INTO device VALUES (2509, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '7590382', '2013-06-13 09:17:18.627', true, 2508);
INSERT INTO component VALUES (2510, 'E', 'D', '1297649', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:57:49.479', 'G5', 'green', 2509);
INSERT INTO component VALUES (2511, 'E', 'I', '62049832', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:14:07.795', 'D6', 'green', 2509);
INSERT INTO device VALUES (2512, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '25707724', '2013-06-13 11:00:39.457', false, 2508);
INSERT INTO component VALUES (2513, 'E', 'I', '51377665', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 13:24:56.602', 'G1', 'green', 2512);
INSERT INTO component VALUES (2514, 'F', 'F', '23347667', 'Howard Joel Wolowitz', '2013-06-13 00:53:46.625', 'G4', 'green', 2512);
INSERT INTO location VALUES (2515, 'DG7', 'motor test', 'Hans Merkel', 2507);
INSERT INTO device VALUES (2516, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '48996405', '2013-06-13 01:02:36.187', false, 2515);
INSERT INTO component VALUES (2517, 'H', 'G', '53070182', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 14:27:02.871', 'D9', 'red', 2516);
INSERT INTO component VALUES (2518, 'E', 'E', '55228206', 'Howard Joel Wolowitz', '2013-06-13 03:03:27.763', 'A9', 'red', 2516);
INSERT INTO device VALUES (2519, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '57873545', '2013-06-13 04:05:55.595', true, 2515);
INSERT INTO component VALUES (2520, 'H', 'E', '12747505', 'Howard Joel Wolowitz', '2013-06-12 22:41:56.82', 'C6', 'red', 2519);
INSERT INTO component VALUES (2521, 'H', 'C', '6890130', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:07:41.091', 'C4', 'green', 2519);
INSERT INTO line VALUES (2522, 'D4 PreSeries', 'Series 8', 84, 'polygon25', 2506);
INSERT INTO location VALUES (2523, 'CA7', 'ABS test', 'Hans Meier', 2522);
INSERT INTO device VALUES (2524, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '9119734', '2013-06-13 12:16:13.768', false, 2523);
INSERT INTO component VALUES (2525, 'E', 'I', '45890487', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:30:24.48', 'B2', 'green', 2524);
INSERT INTO component VALUES (2526, 'E', 'I', '20925219', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:48:39.765', 'H3', 'green', 2524);
INSERT INTO device VALUES (2527, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '7981968', '2013-06-13 11:37:23.949', false, 2523);
INSERT INTO component VALUES (2528, 'B', 'I', '92331362', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:42:21.608', 'I6', 'green', 2527);
INSERT INTO component VALUES (2529, 'G', 'C', '65893808', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:52:26.97', 'G8', 'green', 2527);
INSERT INTO location VALUES (2530, 'GB1', 'motor test', 'Hans Merkel', 2522);
INSERT INTO device VALUES (2531, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '67674784', '2013-06-13 13:31:58.869', false, 2530);
INSERT INTO component VALUES (2532, 'C', 'B', '17038862', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:08:05.416', 'C8', 'green', 2531);
INSERT INTO component VALUES (2533, 'B', 'C', '75776564', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:12:49.862', 'I4', 'green', 2531);
INSERT INTO device VALUES (2534, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '54933916', '2013-06-13 09:09:48.962', false, 2530);
INSERT INTO component VALUES (2535, 'I', 'D', '53784730', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 12:49:37.603', 'B3', 'red', 2534);
INSERT INTO component VALUES (2536, 'D', 'A', '64740277', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:44:02.939', 'I9', 'green', 2534);
INSERT INTO line VALUES (2537, 'D4 Finish', 'Series 6', 24, 'rect497', 2506);
INSERT INTO location VALUES (2538, 'CH1', 'multimedia test', 'Peter Meier', 2537);
INSERT INTO device VALUES (2539, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '39294778', '2013-06-13 04:45:12.183', false, 2538);
INSERT INTO component VALUES (2540, 'F', 'G', '57529131', 'Howard Joel Wolowitz', '2013-06-12 20:53:49.6', 'C1', 'green', 2539);
INSERT INTO component VALUES (2541, 'D', 'A', '99503235', 'Howard Joel Wolowitz', '2013-06-13 05:07:21.676', 'H2', 'green', 2539);
INSERT INTO device VALUES (2542, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '42848095', '2013-06-13 07:13:48.68', false, 2538);
INSERT INTO component VALUES (2543, 'F', 'B', '48621746', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:25:20.549', 'E4', 'green', 2542);
INSERT INTO component VALUES (2544, 'B', 'B', '53266824', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:43:25.244', 'I8', 'green', 2542);
INSERT INTO location VALUES (2545, 'CI1', 'security test', 'Sarah Mueller', 2537);
INSERT INTO device VALUES (2546, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '23074383', '2013-06-13 04:46:52.407', false, 2545);
INSERT INTO component VALUES (2547, 'D', 'E', '88370784', 'Howard Joel Wolowitz', '2013-06-13 02:18:44.927', 'A5', 'green', 2546);
INSERT INTO component VALUES (2548, 'I', 'D', '24979078', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 17:57:54.734', 'E6', 'green', 2546);
INSERT INTO device VALUES (2549, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '46736303', '2013-06-13 08:29:44.567', false, 2545);
INSERT INTO component VALUES (2550, 'F', 'D', '78704490', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:18:36.783', 'H1', 'green', 2549);
INSERT INTO component VALUES (2551, 'C', 'A', '7657974', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:42:58.161', 'G2', 'green', 2549);
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
INSERT INTO hall VALUES (2552, 'D9', 'Assembly+Finish', 264, 6531, 'Audi A4', 2, 'path369', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2553, 'D9 Assembly', 'Series 3', 2, 'rect217', 2552);
INSERT INTO location VALUES (2554, 'HH6', 'multimedia test', 'Robert Schmitt', 2553);
INSERT INTO device VALUES (2555, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '99829576', '2013-06-12 20:26:25.043', true, 2554);
INSERT INTO component VALUES (2556, 'G', 'H', '53075654', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:00:43.381', 'G6', 'green', 2555);
INSERT INTO component VALUES (2557, 'B', 'A', '93917048', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:28:05.176', 'A3', 'green', 2555);
INSERT INTO device VALUES (2558, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '67849235', '2013-06-13 06:16:53.229', false, 2554);
INSERT INTO component VALUES (2559, 'I', 'B', '34498480', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:14:09.373', 'H9', 'green', 2558);
INSERT INTO component VALUES (2560, 'H', 'D', '93049501', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 08:29:15.483', 'G5', 'red', 2558);
INSERT INTO location VALUES (2561, 'AH5', 'ABS test', 'Sarah Merkel', 2553);
INSERT INTO device VALUES (2562, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '54088082', '2013-06-12 20:21:00.779', false, 2561);
INSERT INTO component VALUES (2563, 'F', 'E', '83398495', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:40:02.761', 'H3', 'green', 2562);
INSERT INTO component VALUES (2564, 'F', 'B', '25502354', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:57:04.576', 'A2', 'green', 2562);
INSERT INTO device VALUES (2565, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '71509401', '2013-06-12 21:05:56.373', false, 2561);
INSERT INTO component VALUES (2566, 'H', 'I', '99294932', 'Howard Joel Wolowitz', '2013-06-12 15:52:09.297', 'G4', 'green', 2565);
INSERT INTO component VALUES (2567, 'G', 'H', '79449066', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:30:34.149', 'I8', 'yellow', 2565);
INSERT INTO line VALUES (2568, 'D9 PreSeries', 'Series 1', 10, 'polygon25', 2552);
INSERT INTO location VALUES (2569, 'FF6', 'ABS test', 'Robert Mueller', 2568);
INSERT INTO device VALUES (2570, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '14224515', '2013-06-13 02:54:52.91', false, 2569);
INSERT INTO component VALUES (2571, 'B', 'F', '75731631', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 14:15:03.251', 'B7', 'green', 2570);
INSERT INTO component VALUES (2572, 'B', 'C', '66014877', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:06:37.814', 'D7', 'green', 2570);
INSERT INTO device VALUES (2573, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '54955012', '2013-06-13 09:18:05.027', false, 2569);
INSERT INTO component VALUES (2574, 'C', 'F', '94728515', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 13:36:24.13', 'E9', 'green', 2573);
INSERT INTO component VALUES (2575, 'I', 'B', '23101988', 'Howard Joel Wolowitz', '2013-06-12 19:15:11.366', 'A3', 'green', 2573);
INSERT INTO location VALUES (2576, 'EF5', 'security test', 'Franziska Meier', 2568);
INSERT INTO device VALUES (2577, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '69019976', '2013-06-12 16:30:33.026', true, 2576);
INSERT INTO component VALUES (2578, 'I', 'H', '66913924', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:29:46.092', 'C8', 'green', 2577);
INSERT INTO component VALUES (2579, 'A', 'F', '48303969', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:12:21.64', 'F7', 'green', 2577);
INSERT INTO device VALUES (2580, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '41514032', '2013-06-12 22:17:50.147', false, 2576);
INSERT INTO component VALUES (2581, 'D', 'B', '53655554', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 20:35:31.371', 'H3', 'green', 2580);
INSERT INTO component VALUES (2582, 'E', 'D', '37162482', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:12:35.385', 'E7', 'green', 2580);
INSERT INTO line VALUES (2583, 'D9 Finish', 'Series 1', 81, 'rect497', 2552);
INSERT INTO location VALUES (2584, 'GD5', 'transmission test', 'Franziska Merkel', 2583);
INSERT INTO device VALUES (2585, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '78757470', '2013-06-13 05:12:24.136', false, 2584);
INSERT INTO component VALUES (2586, 'G', 'G', '17750123', 'Howard Joel Wolowitz', '2013-06-13 09:22:08.545', 'I1', 'green', 2585);
INSERT INTO component VALUES (2587, 'E', 'E', '20074225', 'Howard Joel Wolowitz', '2013-06-13 13:33:16.438', 'A1', 'green', 2585);
INSERT INTO device VALUES (2588, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '94201499', '2013-06-13 10:45:38.023', false, 2584);
INSERT INTO component VALUES (2589, 'I', 'G', '18917294', 'Howard Joel Wolowitz', '2013-06-13 10:53:47.76', 'H4', 'green', 2588);
INSERT INTO component VALUES (2590, 'B', 'I', '5338987', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:24:46.32', 'I9', 'green', 2588);
INSERT INTO location VALUES (2591, 'GG3', 'motor test', 'Robert Mueller', 2583);
INSERT INTO device VALUES (2592, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '98555569', '2013-06-13 11:31:07.297', false, 2591);
INSERT INTO component VALUES (2593, 'E', 'G', '42644172', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 16:47:23.449', 'I4', 'green', 2592);
INSERT INTO component VALUES (2594, 'F', 'E', '67871789', 'Howard Joel Wolowitz', '2013-06-13 10:09:33.901', 'H1', 'green', 2592);
INSERT INTO device VALUES (2595, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '85080765', '2013-06-12 16:15:31.706', false, 2591);
INSERT INTO component VALUES (2596, 'I', 'I', '72875918', 'Howard Joel Wolowitz', '2013-06-13 07:32:03.198', 'G8', 'yellow', 2595);
INSERT INTO component VALUES (2597, 'C', 'E', '86050694', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:48:04.147', 'I8', 'green', 2595);
INSERT INTO hall VALUES (2598, 'F7', 'Assembly+Finish', 751, 6825, 'Audi A4', 2, 'polygon249', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2599, 'F7 Assembly', 'Series 9', 62, 'rect217', 2598);
INSERT INTO location VALUES (2600, 'HA8', 'transmission test', 'Hans Schmitt', 2599);
INSERT INTO device VALUES (2601, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '26547326', '2013-06-13 06:43:58.224', false, 2600);
INSERT INTO component VALUES (2602, 'D', 'A', '46408013', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:50:56.902', 'D9', 'green', 2601);
INSERT INTO component VALUES (2603, 'D', 'E', '10151688', 'Howard Joel Wolowitz', '2013-06-13 04:52:06.467', 'D1', 'green', 2601);
INSERT INTO device VALUES (2604, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '95700109', '2013-06-13 13:05:17.706', false, 2600);
INSERT INTO component VALUES (2605, 'E', 'E', '1980717', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:56:58.073', 'G1', 'green', 2604);
INSERT INTO component VALUES (2606, 'D', 'F', '630462', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:18:23.224', 'H9', 'green', 2604);
INSERT INTO location VALUES (2607, 'FE3', 'ABS test', 'Peter Schmitt', 2599);
INSERT INTO device VALUES (2608, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '77741984', '2013-06-12 23:49:01.326', false, 2607);
INSERT INTO component VALUES (2609, 'H', 'E', '66144539', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:07:33.363', 'H3', 'green', 2608);
INSERT INTO component VALUES (2610, 'H', 'I', '79328976', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:55:03.297', 'E9', 'green', 2608);
INSERT INTO device VALUES (2611, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '17167010', '2013-06-13 09:37:25.781', false, 2607);
INSERT INTO component VALUES (2612, 'D', 'E', '6946608', 'Howard Joel Wolowitz', '2013-06-12 23:25:23.145', 'H8', 'green', 2611);
INSERT INTO component VALUES (2613, 'F', 'B', '65814598', 'Howard Joel Wolowitz', '2013-06-13 01:06:43.998', 'H6', 'green', 2611);
INSERT INTO line VALUES (2614, 'F7 PreSeries', 'Series 9', 81, 'polygon25', 2598);
INSERT INTO location VALUES (2615, 'DC3', 'ABS test', 'Hans Schmitt', 2614);
INSERT INTO device VALUES (2616, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '37432165', '2013-06-13 08:37:28.532', false, 2615);
INSERT INTO component VALUES (2617, 'A', 'C', '38470005', 'Howard Joel Wolowitz', '2013-06-13 03:16:41.152', 'A7', 'green', 2616);
INSERT INTO component VALUES (2618, 'A', 'F', '46269736', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 12:19:30.45', 'I5', 'green', 2616);
INSERT INTO device VALUES (2619, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '16359349', '2013-06-13 03:49:05.246', true, 2615);
INSERT INTO component VALUES (2620, 'D', 'D', '27836675', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:32:03.218', 'D1', 'green', 2619);
INSERT INTO component VALUES (2621, 'I', 'B', '76852434', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:37:37.467', 'D9', 'green', 2619);
INSERT INTO location VALUES (2622, 'AC6', 'transmission test', 'Peter Schulze', 2614);
INSERT INTO device VALUES (2623, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '52303457', '2013-06-12 16:38:54.137', false, 2622);
INSERT INTO component VALUES (2624, 'I', 'I', '15184344', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:28:52.44', 'B7', 'green', 2623);
INSERT INTO component VALUES (2625, 'E', 'G', '8972558', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 13:49:51.87', 'G4', 'green', 2623);
INSERT INTO device VALUES (2626, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '6756175', '2013-06-12 16:08:31.408', false, 2622);
INSERT INTO component VALUES (2627, 'F', 'C', '3665695', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 12:32:25.575', 'D3', 'green', 2626);
INSERT INTO component VALUES (2628, 'I', 'E', '53854088', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 13:45:04.731', 'I4', 'red', 2626);
INSERT INTO line VALUES (2629, 'F7 Finish', 'Series 8', 9, 'rect497', 2598);
INSERT INTO location VALUES (2630, 'BI9', 'security test', 'Robert Mueller', 2629);
INSERT INTO device VALUES (2631, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '99751095', '2013-06-12 15:56:32.698', false, 2630);
INSERT INTO component VALUES (2632, 'D', 'D', '89051239', 'Howard Joel Wolowitz', '2013-06-13 05:11:54.773', 'F1', 'green', 2631);
INSERT INTO component VALUES (2633, 'F', 'E', '68278166', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 08:05:41.205', 'F9', 'green', 2631);
INSERT INTO device VALUES (2634, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '80368085', '2013-06-13 13:47:23.817', false, 2630);
INSERT INTO component VALUES (2635, 'B', 'A', '13570236', 'Howard Joel Wolowitz', '2013-06-13 10:00:10.175', 'B6', 'green', 2634);
INSERT INTO component VALUES (2636, 'E', 'H', '76069525', 'Howard Joel Wolowitz', '2013-06-12 17:09:11.755', 'I3', 'green', 2634);
INSERT INTO location VALUES (2637, 'AC8', 'ABS test', 'Robert Mueller', 2629);
INSERT INTO device VALUES (2638, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '95949966', '2013-06-13 06:25:07.249', false, 2637);
INSERT INTO component VALUES (2639, 'G', 'H', '65164260', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 04:04:23.624', 'F9', 'green', 2638);
INSERT INTO component VALUES (2640, 'C', 'A', '75242342', 'Howard Joel Wolowitz', '2013-06-12 23:43:20.29', 'C6', 'yellow', 2638);
INSERT INTO device VALUES (2641, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '2104516', '2013-06-13 07:52:54.343', false, 2637);
INSERT INTO component VALUES (2642, 'F', 'G', '61985363', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:38:39.106', 'H7', 'yellow', 2641);
INSERT INTO component VALUES (2643, 'G', 'G', '21381376', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:24:46.586', 'E9', 'yellow', 2641);
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
INSERT INTO hall VALUES (2644, 'H7', 'Assembly+Finish', 308, 1853, 'Audi A4', 2, 'path369', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2645, 'H7 Assembly', 'Series 5', 27, 'rect217', 2644);
INSERT INTO location VALUES (2646, 'FE8', 'ABS test', 'Sarah Schmitt', 2645);
INSERT INTO device VALUES (2647, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '12872439', '2013-06-12 21:38:31.856', false, 2646);
INSERT INTO component VALUES (2648, 'B', 'E', '48708227', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 14:08:15.142', 'H9', 'green', 2647);
INSERT INTO component VALUES (2649, 'E', 'E', '45645080', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:11:50.122', 'I5', 'green', 2647);
INSERT INTO device VALUES (2650, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '61775529', '2013-06-13 04:01:17.408', false, 2646);
INSERT INTO component VALUES (2651, 'E', 'D', '43607950', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:16:19.637', 'F3', 'green', 2650);
INSERT INTO component VALUES (2652, 'H', 'E', '8225478', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:06:43.283', 'F9', 'green', 2650);
INSERT INTO location VALUES (2653, 'GE7', 'motor test', 'Sarah Mueller', 2645);
INSERT INTO device VALUES (2654, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '10042236', '2013-06-12 20:37:07.966', false, 2653);
INSERT INTO component VALUES (2655, 'D', 'H', '38989507', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:45:37.368', 'A1', 'green', 2654);
INSERT INTO component VALUES (2656, 'D', 'E', '96912669', 'Howard Joel Wolowitz', '2013-06-12 21:18:16.975', 'D4', 'yellow', 2654);
INSERT INTO device VALUES (2657, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '43057365', '2013-06-12 18:54:25.591', false, 2653);
INSERT INTO component VALUES (2658, 'G', 'F', '48019760', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:38:12.574', 'I9', 'green', 2657);
INSERT INTO component VALUES (2659, 'C', 'D', '83183468', 'Howard Joel Wolowitz', '2013-06-12 15:18:40.437', 'D1', 'green', 2657);
INSERT INTO line VALUES (2660, 'H7 PreSeries', 'Series 7', 7, 'polygon25', 2644);
INSERT INTO location VALUES (2661, 'DE2', 'security test', 'Hans Mueller', 2660);
INSERT INTO device VALUES (2662, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '6840091', '2013-06-13 10:48:51.94', false, 2661);
INSERT INTO component VALUES (2663, 'I', 'D', '93399737', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:44:50.815', 'G1', 'green', 2662);
INSERT INTO component VALUES (2664, 'A', 'I', '69392567', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:39:16.92', 'C7', 'green', 2662);
INSERT INTO device VALUES (2665, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '83697262', '2013-06-13 03:46:52.137', false, 2661);
INSERT INTO component VALUES (2666, 'E', 'G', '67016057', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:51:20.068', 'F5', 'green', 2665);
INSERT INTO component VALUES (2667, 'H', 'H', '68360210', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:04:56.794', 'G2', 'green', 2665);
INSERT INTO location VALUES (2668, 'HI2', 'multimedia test', 'Franziska Mueller', 2660);
INSERT INTO device VALUES (2669, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '93053109', '2013-06-13 06:57:33.893', false, 2668);
INSERT INTO component VALUES (2670, 'G', 'D', '21304838', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:47:01.43', 'B8', 'green', 2669);
INSERT INTO component VALUES (2671, 'D', 'A', '67697342', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:50:58.267', 'E9', 'green', 2669);
INSERT INTO device VALUES (2672, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '50717169', '2013-06-13 12:56:32.412', false, 2668);
INSERT INTO component VALUES (2673, 'F', 'H', '35088001', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 17:01:34.188', 'E6', 'green', 2672);
INSERT INTO component VALUES (2674, 'B', 'E', '87753401', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:56:06.724', 'I8', 'green', 2672);
INSERT INTO line VALUES (2675, 'H7 Finish', 'Series 2', 58, 'rect497', 2644);
INSERT INTO location VALUES (2676, 'FE2', 'security test', 'Sarah Schulze', 2675);
INSERT INTO device VALUES (2677, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '67002417', '2013-06-13 11:03:51.264', false, 2676);
INSERT INTO component VALUES (2678, 'C', 'A', '56817029', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:29:05.52', 'D4', 'green', 2677);
INSERT INTO component VALUES (2679, 'C', 'C', '5131919', 'Howard Joel Wolowitz', '2013-06-13 08:05:40.037', 'A1', 'green', 2677);
INSERT INTO device VALUES (2680, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '50131806', '2013-06-12 17:50:49.47', false, 2676);
INSERT INTO component VALUES (2681, 'G', 'B', '59709300', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:23:45.741', 'E6', 'green', 2680);
INSERT INTO component VALUES (2682, 'D', 'A', '47601213', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:08:23.296', 'H7', 'green', 2680);
INSERT INTO location VALUES (2683, 'CH2', 'transmission test', 'Peter Schmitt', 2675);
INSERT INTO device VALUES (2684, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '72401571', '2013-06-13 09:09:06.959', false, 2683);
INSERT INTO component VALUES (2685, 'H', 'E', '23864382', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:49:46.902', 'G6', 'green', 2684);
INSERT INTO component VALUES (2686, 'I', 'F', '11303166', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:13:32.148', 'B1', 'green', 2684);
INSERT INTO device VALUES (2687, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '307115', '2013-06-13 10:14:03.531', false, 2683);
INSERT INTO component VALUES (2688, 'E', 'H', '19538922', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:23:30.23', 'G1', 'green', 2687);
INSERT INTO component VALUES (2689, 'B', 'C', '91791762', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:03:48.885', 'I2', 'green', 2687);
INSERT INTO hall VALUES (2690, 'H6', 'Assembly+Finish', 81, 3543, 'Audi A4', 2, 'polygon249', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2691, 'H6 Assembly', 'Series 3', 76, 'rect217', 2690);
INSERT INTO location VALUES (2692, 'CB1', 'ABS test', 'Peter Meier', 2691);
INSERT INTO device VALUES (2693, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '77022684', '2013-06-13 06:53:04.799', false, 2692);
INSERT INTO component VALUES (2694, 'C', 'F', '79916196', 'Howard Joel Wolowitz', '2013-06-13 02:08:10.387', 'F7', 'green', 2693);
INSERT INTO component VALUES (2695, 'C', 'E', '92401668', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:31:17.349', 'F7', 'green', 2693);
INSERT INTO device VALUES (2696, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '70074770', '2013-06-12 14:34:46.792', true, 2692);
INSERT INTO component VALUES (2697, 'E', 'G', '73435872', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:12:11.051', 'G6', 'green', 2696);
INSERT INTO component VALUES (2698, 'F', 'E', '38541019', 'Howard Joel Wolowitz', '2013-06-13 08:55:04.348', 'C7', 'green', 2696);
INSERT INTO location VALUES (2699, 'II6', 'motor test', 'Peter Meier', 2691);
INSERT INTO device VALUES (2700, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '45145411', '2013-06-13 14:15:33.892', false, 2699);
INSERT INTO component VALUES (2701, 'G', 'E', '36596674', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:38:18.794', 'I7', 'green', 2700);
INSERT INTO component VALUES (2702, 'H', 'D', '50108142', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:58:14.905', 'G8', 'green', 2700);
INSERT INTO device VALUES (2703, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '10574381', '2013-06-13 06:18:16.982', false, 2699);
INSERT INTO component VALUES (2704, 'I', 'G', '35354997', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 20:42:25.875', 'C3', 'green', 2703);
INSERT INTO component VALUES (2705, 'G', 'H', '65773253', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:05:54.991', 'A3', 'green', 2703);
INSERT INTO line VALUES (2706, 'H6 PreSeries', 'Series 8', 38, 'polygon25', 2690);
INSERT INTO location VALUES (2707, 'GF7', 'transmission test', 'Hans Mueller', 2706);
INSERT INTO device VALUES (2708, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '2696949', '2013-06-12 21:19:19.606', false, 2707);
INSERT INTO component VALUES (2709, 'G', 'C', '85917221', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:07:34.592', 'C2', 'red', 2708);
INSERT INTO component VALUES (2710, 'A', 'D', '86828516', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:42:24.888', 'H9', 'green', 2708);
INSERT INTO device VALUES (2711, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '21169779', '2013-06-13 02:57:32.995', false, 2707);
INSERT INTO component VALUES (2712, 'G', 'C', '93309064', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:45:01.047', 'F1', 'green', 2711);
INSERT INTO component VALUES (2713, 'H', 'C', '25052844', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:46:32.816', 'G5', 'green', 2711);
INSERT INTO location VALUES (2714, 'AD8', 'ABS test', 'Robert Schulze', 2706);
INSERT INTO device VALUES (2715, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '35365235', '2013-06-12 23:21:33.43', false, 2714);
INSERT INTO component VALUES (2716, 'I', 'A', '70008790', 'Howard Joel Wolowitz', '2013-06-13 12:11:20.965', 'D8', 'green', 2715);
INSERT INTO component VALUES (2717, 'B', 'H', '25831936', 'Howard Joel Wolowitz', '2013-06-13 10:28:42.785', 'A3', 'green', 2715);
INSERT INTO device VALUES (2718, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '50502467', '2013-06-12 22:30:58.089', false, 2714);
INSERT INTO component VALUES (2719, 'F', 'G', '95347369', 'Howard Joel Wolowitz', '2013-06-13 12:32:39.971', 'G5', 'green', 2718);
INSERT INTO component VALUES (2720, 'H', 'I', '66677360', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:43:33.377', 'C8', 'green', 2718);
INSERT INTO line VALUES (2721, 'H6 Finish', 'Series 7', 79, 'rect497', 2690);
INSERT INTO location VALUES (2722, 'HE4', 'transmission test', 'Robert Mueller', 2721);
INSERT INTO device VALUES (2723, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '2600566', '2013-06-13 07:19:33.109', false, 2722);
INSERT INTO component VALUES (2724, 'A', 'H', '17429352', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 14:08:43.717', 'G2', 'green', 2723);
INSERT INTO component VALUES (2725, 'H', 'F', '3697201', 'Howard Joel Wolowitz', '2013-06-13 13:47:00.476', 'B5', 'green', 2723);
INSERT INTO device VALUES (2726, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '95102629', '2013-06-12 16:10:28.585', false, 2722);
INSERT INTO component VALUES (2727, 'G', 'B', '66250444', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:59:33.736', 'G7', 'green', 2726);
INSERT INTO component VALUES (2728, 'B', 'F', '29024224', 'Howard Joel Wolowitz', '2013-06-13 02:37:59.664', 'I5', 'green', 2726);
INSERT INTO location VALUES (2729, 'EA5', 'security test', 'Robert Mueller', 2721);
INSERT INTO device VALUES (2730, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '68766657', '2013-06-13 12:48:14.816', false, 2729);
INSERT INTO component VALUES (2731, 'B', 'B', '14042748', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:54:20.968', 'D9', 'green', 2730);
INSERT INTO component VALUES (2732, 'I', 'D', '58217340', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:40:21.665', 'C7', 'green', 2730);
INSERT INTO device VALUES (2733, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '56638685', '2013-06-13 11:28:14.314', false, 2729);
INSERT INTO component VALUES (2734, 'F', 'E', '40520781', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:48:58.042', 'D8', 'green', 2733);
INSERT INTO component VALUES (2735, 'C', 'B', '60305812', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:55:36.18', 'D9', 'green', 2733);
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
INSERT INTO hall VALUES (2736, 'B7', 'Assembly+Finish', 3, 3948, 'Audi A4', 2, 'path369', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2737, 'B7 Assembly', 'Series 8', 28, 'rect217', 2736);
INSERT INTO location VALUES (2738, 'II6', 'ABS test', 'Robert Meier', 2737);
INSERT INTO device VALUES (2739, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '69096843', '2013-06-12 18:58:47.069', false, 2738);
INSERT INTO component VALUES (2740, 'I', 'C', '32944608', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 04:28:46.15', 'D1', 'green', 2739);
INSERT INTO component VALUES (2741, 'B', 'I', '53695075', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:30:40.62', 'H8', 'green', 2739);
INSERT INTO device VALUES (2742, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '66780629', '2013-06-12 19:31:38.35', false, 2738);
INSERT INTO component VALUES (2743, 'A', 'D', '22077758', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 01:34:02.911', 'D3', 'green', 2742);
INSERT INTO component VALUES (2744, 'D', 'F', '7663886', 'Howard Joel Wolowitz', '2013-06-13 04:54:28.613', 'B6', 'green', 2742);
INSERT INTO location VALUES (2745, 'CD9', 'transmission test', 'Hans Merkel', 2737);
INSERT INTO device VALUES (2746, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '16585880', '2013-06-13 02:32:22.23', false, 2745);
INSERT INTO component VALUES (2747, 'D', 'D', '9152525', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:53:34.833', 'H1', 'green', 2746);
INSERT INTO component VALUES (2748, 'D', 'A', '42358922', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:06:19.378', 'A3', 'green', 2746);
INSERT INTO device VALUES (2749, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '8276849', '2013-06-12 14:43:50.436', false, 2745);
INSERT INTO component VALUES (2750, 'A', 'H', '97181240', 'Howard Joel Wolowitz', '2013-06-13 05:44:15.338', 'B3', 'green', 2749);
INSERT INTO component VALUES (2751, 'F', 'E', '26048166', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:58:38.92', 'B2', 'green', 2749);
INSERT INTO line VALUES (2752, 'B7 PreSeries', 'Series 8', 54, 'polygon25', 2736);
INSERT INTO location VALUES (2753, 'DH2', 'transmission test', 'Robert Meier', 2752);
INSERT INTO device VALUES (2754, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '29743655', '2013-06-13 09:21:56.06', false, 2753);
INSERT INTO component VALUES (2755, 'E', 'C', '70507128', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 04:53:42.827', 'C5', 'green', 2754);
INSERT INTO component VALUES (2756, 'E', 'D', '48056814', 'Howard Joel Wolowitz', '2013-06-13 01:41:12.982', 'G8', 'green', 2754);
INSERT INTO device VALUES (2757, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '91940206', '2013-06-13 07:51:57.841', true, 2753);
INSERT INTO component VALUES (2758, 'D', 'B', '19308987', 'Howard Joel Wolowitz', '2013-06-13 10:43:51.726', 'G8', 'green', 2757);
INSERT INTO component VALUES (2759, 'I', 'G', '67233874', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:11:18.152', 'E4', 'green', 2757);
INSERT INTO location VALUES (2760, 'CC3', 'security test', 'Hans Meier', 2752);
INSERT INTO device VALUES (2761, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '47816760', '2013-06-13 06:01:49.277', false, 2760);
INSERT INTO component VALUES (2762, 'C', 'E', '59072151', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 14:13:06.248', 'G9', 'green', 2761);
INSERT INTO component VALUES (2763, 'F', 'C', '53992924', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:45:08.95', 'D9', 'green', 2761);
INSERT INTO device VALUES (2764, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '33723530', '2013-06-13 04:12:49.677', false, 2760);
INSERT INTO component VALUES (2765, 'C', 'A', '61321283', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:44:29.9', 'F6', 'green', 2764);
INSERT INTO component VALUES (2766, 'C', 'I', '38556255', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:53:47.763', 'C5', 'green', 2764);
INSERT INTO line VALUES (2767, 'B7 Finish', 'Series 3', 9, 'rect497', 2736);
INSERT INTO location VALUES (2768, 'HF6', 'motor test', 'Franziska Meier', 2767);
INSERT INTO device VALUES (2769, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '47648434', '2013-06-13 10:16:01.518', false, 2768);
INSERT INTO component VALUES (2770, 'D', 'E', '80160496', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:43:05.145', 'G1', 'green', 2769);
INSERT INTO component VALUES (2771, 'G', 'C', '3021865', 'Howard Joel Wolowitz', '2013-06-12 16:06:47.077', 'G5', 'green', 2769);
INSERT INTO device VALUES (2772, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '51088378', '2013-06-13 12:05:43.348', false, 2768);
INSERT INTO component VALUES (2773, 'F', 'A', '80472387', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:46:52.185', 'C3', 'green', 2772);
INSERT INTO component VALUES (2774, 'F', 'H', '58420600', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 09:32:16.74', 'A9', 'green', 2772);
INSERT INTO location VALUES (2775, 'II8', 'multimedia test', 'Robert Schulze', 2767);
INSERT INTO device VALUES (2776, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '79011057', '2013-06-13 05:44:13.778', false, 2775);
INSERT INTO component VALUES (2777, 'A', 'E', '14671645', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:38:35.937', 'I6', 'green', 2776);
INSERT INTO component VALUES (2778, 'G', 'H', '36990461', 'Howard Joel Wolowitz', '2013-06-12 23:53:23.662', 'G7', 'green', 2776);
INSERT INTO device VALUES (2779, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '36591828', '2013-06-13 04:25:05.666', false, 2775);
INSERT INTO component VALUES (2780, 'I', 'A', '25974289', 'Howard Joel Wolowitz', '2013-06-13 05:56:14.649', 'F8', 'green', 2779);
INSERT INTO component VALUES (2781, 'A', 'B', '52329225', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:20:26.134', 'A2', 'green', 2779);
INSERT INTO hall VALUES (2782, 'A2', 'Assembly+Finish', 619, 6414, 'Audi A4', 2, 'polygon249', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2783, 'A2 Assembly', 'Series 9', 56, 'rect217', 2782);
INSERT INTO location VALUES (2784, 'CD6', 'multimedia test', 'Sarah Schmitt', 2783);
INSERT INTO device VALUES (2785, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '39573927', '2013-06-13 10:37:49.334', false, 2784);
INSERT INTO component VALUES (2786, 'B', 'B', '29601834', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:44:27.283', 'B4', 'green', 2785);
INSERT INTO component VALUES (2787, 'E', 'I', '17286264', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 08:33:55.119', 'A2', 'green', 2785);
INSERT INTO device VALUES (2788, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '58461655', '2013-06-12 21:27:26.922', false, 2784);
INSERT INTO component VALUES (2789, 'F', 'G', '9900817', 'Howard Joel Wolowitz', '2013-06-13 04:41:04.757', 'I2', 'green', 2788);
INSERT INTO component VALUES (2790, 'B', 'B', '27999424', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:07:22.261', 'B3', 'green', 2788);
INSERT INTO location VALUES (2791, 'HA9', 'ABS test', 'Sarah Mueller', 2783);
INSERT INTO device VALUES (2792, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '4313288', '2013-06-13 00:09:26.76', false, 2791);
INSERT INTO component VALUES (2793, 'I', 'H', '3552636', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:28:05.316', 'E9', 'green', 2792);
INSERT INTO component VALUES (2794, 'F', 'C', '73483732', 'Howard Joel Wolowitz', '2013-06-13 03:20:04.192', 'B1', 'red', 2792);
INSERT INTO device VALUES (2795, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '77572164', '2013-06-13 09:22:55.537', false, 2791);
INSERT INTO component VALUES (2796, 'F', 'D', '32200889', 'Howard Joel Wolowitz', '2013-06-13 02:08:07.353', 'D2', 'green', 2795);
INSERT INTO component VALUES (2797, 'H', 'H', '32457476', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:07:03.535', 'G1', 'green', 2795);
INSERT INTO line VALUES (2798, 'A2 PreSeries', 'Series 4', 84, 'polygon25', 2782);
INSERT INTO location VALUES (2799, 'HG5', 'transmission test', 'Robert Meier', 2798);
INSERT INTO device VALUES (2800, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '42041779', '2013-06-12 21:07:29.966', false, 2799);
INSERT INTO component VALUES (2801, 'I', 'H', '89877690', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:04:57.98', 'G7', 'green', 2800);
INSERT INTO component VALUES (2802, 'F', 'G', '53189672', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:36:37.784', 'E7', 'green', 2800);
INSERT INTO device VALUES (2803, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '89734791', '2013-06-13 12:59:45.769', false, 2799);
INSERT INTO component VALUES (2804, 'B', 'B', '55534672', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:52:25.542', 'G4', 'green', 2803);
INSERT INTO component VALUES (2805, 'I', 'A', '14259927', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:33:22.412', 'G8', 'green', 2803);
INSERT INTO location VALUES (2806, 'FD4', 'transmission test', 'Franziska Mueller', 2798);
INSERT INTO device VALUES (2807, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '11920967', '2013-06-12 22:42:54.231', false, 2806);
INSERT INTO component VALUES (2808, 'D', 'F', '80186596', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:52:55.098', 'C1', 'green', 2807);
INSERT INTO component VALUES (2809, 'F', 'C', '73945841', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:57:08.358', 'B8', 'green', 2807);
INSERT INTO device VALUES (2810, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '45794914', '2013-06-12 19:15:30.416', false, 2806);
INSERT INTO component VALUES (2811, 'A', 'H', '67554243', 'Howard Joel Wolowitz', '2013-06-13 11:30:52.207', 'C6', 'red', 2810);
INSERT INTO component VALUES (2812, 'E', 'B', '74409611', 'Howard Joel Wolowitz', '2013-06-13 00:23:20.01', 'H8', 'green', 2810);
INSERT INTO line VALUES (2813, 'A2 Finish', 'Series 2', 64, 'rect497', 2782);
INSERT INTO location VALUES (2814, 'HB4', 'ABS test', 'Robert Mueller', 2813);
INSERT INTO device VALUES (2815, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '56925412', '2013-06-12 23:36:23.382', false, 2814);
INSERT INTO component VALUES (2816, 'E', 'H', '40573983', 'Howard Joel Wolowitz', '2013-06-13 08:31:08.322', 'A1', 'green', 2815);
INSERT INTO component VALUES (2817, 'E', 'E', '9551853', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:52:06.298', 'A1', 'green', 2815);
INSERT INTO device VALUES (2818, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '86991997', '2013-06-13 11:25:45.945', true, 2814);
INSERT INTO component VALUES (2819, 'A', 'B', '74362487', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:52:29.976', 'E5', 'green', 2818);
INSERT INTO component VALUES (2820, 'C', 'A', '98953525', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 14:29:21.025', 'G7', 'green', 2818);
INSERT INTO location VALUES (2821, 'BH4', 'motor test', 'Peter Schulze', 2813);
INSERT INTO device VALUES (2822, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '53354733', '2013-06-12 15:29:15.302', false, 2821);
INSERT INTO component VALUES (2823, 'F', 'H', '97634047', 'Howard Joel Wolowitz', '2013-06-13 10:19:04.153', 'E2', 'green', 2822);
INSERT INTO component VALUES (2824, 'I', 'C', '79991332', 'Howard Joel Wolowitz', '2013-06-13 07:28:34.165', 'B5', 'green', 2822);
INSERT INTO device VALUES (2825, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '14129668', '2013-06-12 23:42:47.781', false, 2821);
INSERT INTO component VALUES (2826, 'G', 'E', '25637949', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:05:27.927', 'F1', 'green', 2825);
INSERT INTO component VALUES (2827, 'A', 'E', '68065846', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:42:21.435', 'E8', 'green', 2825);
