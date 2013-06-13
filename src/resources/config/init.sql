drop table if exists component; 
drop table if exists device;
drop table if exists line;
drop table if exists location;
drop table if exists hall;
drop table if exists factory;
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
	id integer,
	name character varying(50),
	description character varying(100),
	personincharge character varying(100),
	parent integer
);
CREATE TABLE device (
	id integer,
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
	id integer,
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
INSERT INTO hall VALUES (2000, 'A8', 'Assembly+Finish', 461, 4650, 'Audi A4', 2, 'path369', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2001, 'A8 Assembly', 'Series 6', 64, 'rect217', 2000);
INSERT INTO location VALUES (2002, 'AC6', 'multimedia test', 'Robert Schmitt', 2001);
INSERT INTO device VALUES (2003, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '1574500', '2013-06-12 21:52:01.748', false, 2002);
INSERT INTO component VALUES (2004, 'H', 'E', '7094409', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:20:10.781', 'F4', 'yellow', 2003);
INSERT INTO component VALUES (2005, 'G', 'E', '35848181', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 00:27:38.593', 'B8', 'green', 2003);
INSERT INTO device VALUES (2006, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '13789010', '2013-06-13 09:53:12.318', false, 2002);
INSERT INTO component VALUES (2007, 'E', 'A', '50069576', 'Howard Joel Wolowitz', '2013-06-12 18:32:15.884', 'D1', 'green', 2006);
INSERT INTO component VALUES (2008, 'D', 'B', '26572514', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 00:03:26.408', 'D8', 'green', 2006);
INSERT INTO location VALUES (2009, 'IH8', 'security test', 'Sarah Schmitt', 2001);
INSERT INTO device VALUES (2010, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '85143864', '2013-06-12 15:28:49.212', false, 2009);
INSERT INTO component VALUES (2011, 'E', 'H', '37869688', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:28:06.96', 'D8', 'green', 2010);
INSERT INTO component VALUES (2012, 'D', 'C', '70731668', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:30:56.865', 'B1', 'green', 2010);
INSERT INTO device VALUES (2013, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '37290196', '2013-06-12 18:12:38.27', false, 2009);
INSERT INTO component VALUES (2014, 'H', 'D', '99598027', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 01:56:05.285', 'E9', 'green', 2013);
INSERT INTO component VALUES (2015, 'G', 'G', '59842911', 'Howard Joel Wolowitz', '2013-06-12 16:32:53.169', 'D8', 'green', 2013);
INSERT INTO line VALUES (2016, 'A8 PreSeries', 'Series 1', 47, 'polygon25', 2000);
INSERT INTO location VALUES (2017, 'HI6', 'motor test', 'Sarah Merkel', 2016);
INSERT INTO device VALUES (2018, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '52571066', '2013-06-12 18:32:54.863', false, 2017);
INSERT INTO component VALUES (2019, 'A', 'B', '16668689', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:51:20.805', 'A4', 'green', 2018);
INSERT INTO component VALUES (2020, 'D', 'H', '7188167', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:37:11.388', 'C9', 'green', 2018);
INSERT INTO device VALUES (2021, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '39093845', '2013-06-13 07:42:26.307', false, 2017);
INSERT INTO component VALUES (2022, 'A', 'C', '2342651', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:08:55.735', 'G1', 'red', 2021);
INSERT INTO component VALUES (2023, 'H', 'A', '56698086', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:35:41.615', 'E5', 'green', 2021);
INSERT INTO location VALUES (2024, 'FI7', 'multimedia test', 'Peter Schulze', 2016);
INSERT INTO device VALUES (2025, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '71094100', '2013-06-13 01:08:34.648', false, 2024);
INSERT INTO component VALUES (2026, 'A', 'G', '62484033', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 19:18:24.533', 'B1', 'green', 2025);
INSERT INTO component VALUES (2027, 'G', 'D', '26404578', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 23:32:13.022', 'H4', 'green', 2025);
INSERT INTO device VALUES (2028, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '97717507', '2013-06-12 13:20:50.271', true, 2024);
INSERT INTO component VALUES (2029, 'F', 'G', '91496945', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:32:18.475', 'D3', 'green', 2028);
INSERT INTO component VALUES (2030, 'I', 'D', '80352030', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:05:46.336', 'C2', 'green', 2028);
INSERT INTO line VALUES (2031, 'A8 Finish', 'Series 5', 72, 'rect497', 2000);
INSERT INTO location VALUES (2032, 'FG7', 'transmission test', 'Sarah Schmitt', 2031);
INSERT INTO device VALUES (2033, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '49439467', '2013-06-13 11:32:37.03', false, 2032);
INSERT INTO component VALUES (2034, 'A', 'I', '36898180', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 15:30:09.951', 'A4', 'green', 2033);
INSERT INTO component VALUES (2035, 'I', 'F', '88924303', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:23:16.992', 'A5', 'green', 2033);
INSERT INTO device VALUES (2036, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '10347276', '2013-06-13 05:23:09.751', false, 2032);
INSERT INTO component VALUES (2037, 'F', 'D', '97234986', 'Howard Joel Wolowitz', '2013-06-12 14:27:30.201', 'E5', 'green', 2036);
INSERT INTO component VALUES (2038, 'H', 'H', '46684940', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 15:54:57.13', 'B3', 'yellow', 2036);
INSERT INTO location VALUES (2039, 'HB4', 'security test', 'Robert Schmitt', 2031);
INSERT INTO device VALUES (2040, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '5504180', '2013-06-13 05:41:11.285', false, 2039);
INSERT INTO component VALUES (2041, 'F', 'C', '83532583', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:21:38.08', 'B3', 'green', 2040);
INSERT INTO component VALUES (2042, 'D', 'F', '15576780', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:35:14.469', 'I4', 'green', 2040);
INSERT INTO device VALUES (2043, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '2287492', '2013-06-12 21:13:46.875', false, 2039);
INSERT INTO component VALUES (2044, 'A', 'E', '41064143', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:53:04.785', 'D3', 'green', 2043);
INSERT INTO component VALUES (2045, 'I', 'H', '76031048', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:41:24.493', 'E2', 'green', 2043);
INSERT INTO hall VALUES (2046, 'E9', 'Assembly+Finish', 430, 492, 'Audi A4', 2, 'polygon249', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2047, 'E9 Assembly', 'Series 6', 50, 'rect217', 2046);
INSERT INTO location VALUES (2048, 'CF8', 'ABS test', 'Franziska Mueller', 2047);
INSERT INTO device VALUES (2049, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '30037752', '2013-06-13 12:33:35.899', false, 2048);
INSERT INTO component VALUES (2050, 'I', 'D', '44102524', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:12:09.394', 'B3', 'green', 2049);
INSERT INTO component VALUES (2051, 'A', 'B', '74746210', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:53:54.766', 'H4', 'green', 2049);
INSERT INTO device VALUES (2052, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '7765282', '2013-06-13 02:49:03.33', false, 2048);
INSERT INTO component VALUES (2053, 'F', 'D', '45932141', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:24:14.977', 'C6', 'green', 2052);
INSERT INTO component VALUES (2054, 'G', 'G', '22498505', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:32:08.003', 'B5', 'green', 2052);
INSERT INTO location VALUES (2055, 'BA1', 'multimedia test', 'Franziska Mueller', 2047);
INSERT INTO device VALUES (2056, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '25425375', '2013-06-13 12:32:47.075', false, 2055);
INSERT INTO component VALUES (2057, 'E', 'E', '78930802', 'Howard Joel Wolowitz', '2013-06-12 23:54:17.885', 'B7', 'green', 2056);
INSERT INTO component VALUES (2058, 'D', 'B', '7435393', 'Howard Joel Wolowitz', '2013-06-13 06:42:32.445', 'A1', 'green', 2056);
INSERT INTO device VALUES (2059, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '72084101', '2013-06-13 08:20:40.787', false, 2055);
INSERT INTO component VALUES (2060, 'I', 'B', '38513644', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:25:53.432', 'E9', 'green', 2059);
INSERT INTO component VALUES (2061, 'F', 'D', '81276554', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:04:31.778', 'F4', 'green', 2059);
INSERT INTO line VALUES (2062, 'E9 PreSeries', 'Series 2', 14, 'polygon25', 2046);
INSERT INTO location VALUES (2063, 'BE6', 'multimedia test', 'Sarah Mueller', 2062);
INSERT INTO device VALUES (2064, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '79947416', '2013-06-13 12:02:40.156', false, 2063);
INSERT INTO component VALUES (2065, 'G', 'D', '30853706', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:24:59.217', 'I8', 'green', 2064);
INSERT INTO component VALUES (2066, 'I', 'C', '61715772', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:42:46.749', 'C5', 'green', 2064);
INSERT INTO device VALUES (2067, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '37345964', '2013-06-13 09:13:16.045', false, 2063);
INSERT INTO component VALUES (2068, 'E', 'H', '62291043', 'Howard Joel Wolowitz', '2013-06-13 01:01:39.93', 'H1', 'yellow', 2067);
INSERT INTO component VALUES (2069, 'E', 'E', '40051301', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:14:31.847', 'B3', 'green', 2067);
INSERT INTO location VALUES (2070, 'AA8', 'security test', 'Sarah Schulze', 2062);
INSERT INTO device VALUES (2071, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '44660929', '2013-06-12 17:22:18.08', false, 2070);
INSERT INTO component VALUES (2072, 'F', 'B', '89146754', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:02:15.841', 'E9', 'green', 2071);
INSERT INTO component VALUES (2073, 'B', 'H', '23375927', 'Howard Joel Wolowitz', '2013-06-13 10:13:29.604', 'G1', 'red', 2071);
INSERT INTO device VALUES (2074, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '8700827', '2013-06-12 17:07:32.528', false, 2070);
INSERT INTO component VALUES (2075, 'F', 'B', '81600194', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:08:34.293', 'F8', 'green', 2074);
INSERT INTO component VALUES (2076, 'F', 'B', '82685668', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:34:55.807', 'A9', 'green', 2074);
INSERT INTO line VALUES (2077, 'E9 Finish', 'Series 8', 48, 'rect497', 2046);
INSERT INTO location VALUES (2078, 'BA9', 'transmission test', 'Franziska Schulze', 2077);
INSERT INTO device VALUES (2079, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '64983857', '2013-06-12 14:10:04.64', false, 2078);
INSERT INTO component VALUES (2080, 'C', 'E', '91309894', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:14:55.339', 'D8', 'green', 2079);
INSERT INTO component VALUES (2081, 'H', 'H', '41944598', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:02:49.206', 'D9', 'green', 2079);
INSERT INTO device VALUES (2082, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '68091357', '2013-06-13 02:04:29.238', true, 2078);
INSERT INTO component VALUES (2083, 'A', 'D', '1420027', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 13:20:30.147', 'G1', 'green', 2082);
INSERT INTO component VALUES (2084, 'C', 'A', '65421818', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:46:44.334', 'I2', 'green', 2082);
INSERT INTO location VALUES (2085, 'IC8', 'motor test', 'Franziska Meier', 2077);
INSERT INTO device VALUES (2086, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '83556214', '2013-06-12 14:02:33.25', false, 2085);
INSERT INTO component VALUES (2087, 'B', 'G', '97175017', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:58:39.378', 'D6', 'green', 2086);
INSERT INTO component VALUES (2088, 'B', 'I', '19077419', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:11:42.78', 'B9', 'green', 2086);
INSERT INTO device VALUES (2089, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '73611187', '2013-06-13 00:13:29.331', false, 2085);
INSERT INTO component VALUES (2090, 'D', 'H', '45035041', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:38:56.121', 'G4', 'green', 2089);
INSERT INTO component VALUES (2091, 'I', 'H', '98072633', 'Howard Joel Wolowitz', '2013-06-12 16:07:17.041', 'G1', 'green', 2089);
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
INSERT INTO hall VALUES (2092, 'H1', 'Assembly+Finish', 383, 9167, 'Audi A4', 2, 'path369', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2093, 'H1 Assembly', 'Series 1', 96, 'rect217', 2092);
INSERT INTO location VALUES (2094, 'DA9', 'security test', 'Sarah Mueller', 2093);
INSERT INTO device VALUES (2095, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '25987781', '2013-06-13 12:29:24.046', true, 2094);
INSERT INTO component VALUES (2096, 'H', 'E', '71618809', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 12:31:58.356', 'B8', 'green', 2095);
INSERT INTO component VALUES (2097, 'E', 'I', '78242867', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 06:17:03.963', 'G8', 'green', 2095);
INSERT INTO device VALUES (2098, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '96920232', '2013-06-12 19:09:32.436', false, 2094);
INSERT INTO component VALUES (2099, 'D', 'A', '62125483', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:11:13.435', 'I6', 'green', 2098);
INSERT INTO component VALUES (2100, 'D', 'I', '67736678', 'Howard Joel Wolowitz', '2013-06-12 20:15:53.865', 'E2', 'green', 2098);
INSERT INTO location VALUES (2101, 'BH5', 'transmission test', 'Hans Schmitt', 2093);
INSERT INTO device VALUES (2102, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '42399777', '2013-06-13 12:07:55.38', false, 2101);
INSERT INTO component VALUES (2103, 'I', 'H', '53073524', 'Howard Joel Wolowitz', '2013-06-12 20:37:37.665', 'A6', 'green', 2102);
INSERT INTO component VALUES (2104, 'F', 'I', '87540825', 'Howard Joel Wolowitz', '2013-06-13 00:47:33.872', 'E1', 'green', 2102);
INSERT INTO device VALUES (2105, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '85665220', '2013-06-12 22:46:15.075', false, 2101);
INSERT INTO component VALUES (2106, 'B', 'C', '76844915', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 12:19:12.812', 'E5', 'green', 2105);
INSERT INTO component VALUES (2107, 'F', 'F', '52501249', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:26:55.507', 'C9', 'green', 2105);
INSERT INTO line VALUES (2108, 'H1 PreSeries', 'Series 7', 11, 'polygon25', 2092);
INSERT INTO location VALUES (2109, 'IE8', 'ABS test', 'Hans Schulze', 2108);
INSERT INTO device VALUES (2110, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '85357563', '2013-06-12 14:54:21.173', false, 2109);
INSERT INTO component VALUES (2111, 'E', 'C', '95488075', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:39:44.131', 'B9', 'green', 2110);
INSERT INTO component VALUES (2112, 'H', 'C', '42893062', 'Howard Joel Wolowitz', '2013-06-13 00:31:00.64', 'G4', 'green', 2110);
INSERT INTO device VALUES (2113, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '92471705', '2013-06-12 20:08:58.759', false, 2109);
INSERT INTO component VALUES (2114, 'E', 'G', '47111754', 'Howard Joel Wolowitz', '2013-06-13 00:49:30.36', 'C8', 'green', 2113);
INSERT INTO component VALUES (2115, 'H', 'E', '45114945', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:54:17.698', 'D5', 'green', 2113);
INSERT INTO location VALUES (2116, 'GG6', 'motor test', 'Franziska Mueller', 2108);
INSERT INTO device VALUES (2117, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '32857839', '2013-06-13 08:14:44.508', false, 2116);
INSERT INTO component VALUES (2118, 'B', 'H', '95567077', 'Howard Joel Wolowitz', '2013-06-13 05:53:14.527', 'I7', 'green', 2117);
INSERT INTO component VALUES (2119, 'E', 'D', '95308732', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 13:46:34.392', 'H5', 'green', 2117);
INSERT INTO device VALUES (2120, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '13880977', '2013-06-13 06:28:36.907', false, 2116);
INSERT INTO component VALUES (2121, 'G', 'I', '73020569', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:43:39.369', 'G7', 'green', 2120);
INSERT INTO component VALUES (2122, 'A', 'G', '5704746', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:32:19.668', 'F3', 'green', 2120);
INSERT INTO line VALUES (2123, 'H1 Finish', 'Series 5', 89, 'rect497', 2092);
INSERT INTO location VALUES (2124, 'AC2', 'multimedia test', 'Peter Schulze', 2123);
INSERT INTO device VALUES (2125, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '77385172', '2013-06-12 16:15:03.465', false, 2124);
INSERT INTO component VALUES (2126, 'H', 'F', '15099235', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:54:23.614', 'E2', 'green', 2125);
INSERT INTO component VALUES (2127, 'C', 'C', '46497724', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:06:13.155', 'E7', 'green', 2125);
INSERT INTO device VALUES (2128, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '87170496', '2013-06-12 16:29:22.363', false, 2124);
INSERT INTO component VALUES (2129, 'I', 'A', '59553280', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:25:14.284', 'A9', 'green', 2128);
INSERT INTO component VALUES (2130, 'G', 'A', '16906945', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:55:35.077', 'F7', 'green', 2128);
INSERT INTO location VALUES (2131, 'EI9', 'security test', 'Hans Schmitt', 2123);
INSERT INTO device VALUES (2132, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '20189893', '2013-06-13 00:45:04.956', false, 2131);
INSERT INTO component VALUES (2133, 'D', 'B', '13517135', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:34:20.719', 'B1', 'green', 2132);
INSERT INTO component VALUES (2134, 'G', 'I', '98010312', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:54:07.94', 'H3', 'green', 2132);
INSERT INTO device VALUES (2135, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '50674967', '2013-06-12 17:46:10.0', false, 2131);
INSERT INTO component VALUES (2136, 'D', 'A', '28249404', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 13:24:12.632', 'A4', 'green', 2135);
INSERT INTO component VALUES (2137, 'G', 'G', '24826091', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 04:08:20.987', 'B5', 'green', 2135);
INSERT INTO hall VALUES (2138, 'C1', 'Assembly+Finish', 465, 2560, 'Audi A4', 2, 'polygon249', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2139, 'C1 Assembly', 'Series 3', 4, 'rect217', 2138);
INSERT INTO location VALUES (2140, 'FG5', 'motor test', 'Sarah Merkel', 2139);
INSERT INTO device VALUES (2141, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '54134271', '2013-06-13 09:09:20.892', false, 2140);
INSERT INTO component VALUES (2142, 'H', 'E', '26458365', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:13:26.755', 'G8', 'green', 2141);
INSERT INTO component VALUES (2143, 'D', 'C', '75298950', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:09:09.843', 'H9', 'green', 2141);
INSERT INTO device VALUES (2144, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '93891709', '2013-06-12 13:47:39.866', false, 2140);
INSERT INTO component VALUES (2145, 'I', 'E', '89549053', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:29:52.004', 'D7', 'red', 2144);
INSERT INTO component VALUES (2146, 'E', 'H', '26906952', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 23:17:45.115', 'G6', 'green', 2144);
INSERT INTO location VALUES (2147, 'IH9', 'ABS test', 'Robert Schulze', 2139);
INSERT INTO device VALUES (2148, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '89817726', '2013-06-13 04:09:50.663', false, 2147);
INSERT INTO component VALUES (2149, 'E', 'G', '49022050', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:00:36.016', 'I7', 'green', 2148);
INSERT INTO component VALUES (2150, 'G', 'D', '95552179', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:29:55.666', 'D1', 'green', 2148);
INSERT INTO device VALUES (2151, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '77291495', '2013-06-13 11:00:30.953', false, 2147);
INSERT INTO component VALUES (2152, 'F', 'H', '611618', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:16:16.791', 'B4', 'green', 2151);
INSERT INTO component VALUES (2153, 'D', 'B', '56924076', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:57:04.932', 'A9', 'green', 2151);
INSERT INTO line VALUES (2154, 'C1 PreSeries', 'Series 3', 76, 'polygon25', 2138);
INSERT INTO location VALUES (2155, 'DC9', 'multimedia test', 'Sarah Mueller', 2154);
INSERT INTO device VALUES (2156, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '20882672', '2013-06-12 19:59:20.408', false, 2155);
INSERT INTO component VALUES (2157, 'B', 'C', '49341760', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 23:06:31.367', 'H8', 'yellow', 2156);
INSERT INTO component VALUES (2158, 'H', 'E', '30606942', 'Howard Joel Wolowitz', '2013-06-13 05:27:25.344', 'B4', 'green', 2156);
INSERT INTO device VALUES (2159, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '98419817', '2013-06-12 13:43:09.223', false, 2155);
INSERT INTO component VALUES (2160, 'E', 'E', '15654609', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:23:20.304', 'G5', 'green', 2159);
INSERT INTO component VALUES (2161, 'H', 'E', '91955929', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 04:28:06.844', 'E5', 'green', 2159);
INSERT INTO location VALUES (2162, 'GD2', 'security test', 'Franziska Schmitt', 2154);
INSERT INTO device VALUES (2163, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '81440996', '2013-06-13 06:49:23.834', false, 2162);
INSERT INTO component VALUES (2164, 'D', 'A', '82417717', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:37:51.391', 'A7', 'green', 2163);
INSERT INTO component VALUES (2165, 'E', 'C', '51436252', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:36:14.217', 'A7', 'green', 2163);
INSERT INTO device VALUES (2166, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '35237955', '2013-06-12 15:06:14.205', false, 2162);
INSERT INTO component VALUES (2167, 'I', 'G', '31096491', 'Howard Joel Wolowitz', '2013-06-13 05:55:20.639', 'C3', 'green', 2166);
INSERT INTO component VALUES (2168, 'G', 'B', '1163758', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:11:50.379', 'H5', 'green', 2166);
INSERT INTO line VALUES (2169, 'C1 Finish', 'Series 2', 8, 'rect497', 2138);
INSERT INTO location VALUES (2170, 'GA4', 'transmission test', 'Sarah Schulze', 2169);
INSERT INTO device VALUES (2171, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '31236173', '2013-06-13 09:29:43.853', false, 2170);
INSERT INTO component VALUES (2172, 'E', 'I', '60118747', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:10:35.299', 'I1', 'green', 2171);
INSERT INTO component VALUES (2173, 'E', 'B', '68003592', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:48:13.606', 'A5', 'red', 2171);
INSERT INTO device VALUES (2174, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '15232701', '2013-06-12 14:22:30.76', true, 2170);
INSERT INTO component VALUES (2175, 'C', 'H', '85822590', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:32:23.363', 'F1', 'green', 2174);
INSERT INTO component VALUES (2176, 'A', 'D', '27147546', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:45:10.05', 'C8', 'green', 2174);
INSERT INTO location VALUES (2177, 'ID2', 'transmission test', 'Hans Meier', 2169);
INSERT INTO device VALUES (2178, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '91529348', '2013-06-12 19:12:07.151', true, 2177);
INSERT INTO component VALUES (2179, 'I', 'D', '64025274', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:40:54.816', 'D2', 'green', 2178);
INSERT INTO component VALUES (2180, 'E', 'B', '94872300', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:48:18.639', 'D4', 'green', 2178);
INSERT INTO device VALUES (2181, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '68743971', '2013-06-13 08:36:57.496', false, 2177);
INSERT INTO component VALUES (2182, 'C', 'E', '50598630', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 19:41:30.038', 'H5', 'green', 2181);
INSERT INTO component VALUES (2183, 'C', 'F', '94186053', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:00:31.037', 'E5', 'green', 2181);
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
INSERT INTO hall VALUES (2184, 'B3', 'Assembly+Finish', 233, 664, 'Audi A4', 2, 'path369', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2185, 'B3 Assembly', 'Series 7', 77, 'rect217', 2184);
INSERT INTO location VALUES (2186, 'HA4', 'multimedia test', 'Hans Merkel', 2185);
INSERT INTO device VALUES (2187, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '87004065', '2013-06-13 10:05:06.672', false, 2186);
INSERT INTO component VALUES (2188, 'I', 'A', '50445839', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 12:28:30.193', 'E7', 'green', 2187);
INSERT INTO component VALUES (2189, 'E', 'E', '55378809', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:21:28.366', 'D5', 'green', 2187);
INSERT INTO device VALUES (2190, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '93878144', '2013-06-13 09:21:00.019', false, 2186);
INSERT INTO component VALUES (2191, 'B', 'F', '16774691', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:21:55.075', 'E8', 'green', 2190);
INSERT INTO component VALUES (2192, 'H', 'B', '32515840', 'Howard Joel Wolowitz', '2013-06-13 11:51:13.027', 'E1', 'green', 2190);
INSERT INTO location VALUES (2193, 'ED2', 'security test', 'Franziska Merkel', 2185);
INSERT INTO device VALUES (2194, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '55818919', '2013-06-13 03:49:30.209', false, 2193);
INSERT INTO component VALUES (2195, 'D', 'I', '11246000', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:37:14.32', 'E5', 'green', 2194);
INSERT INTO component VALUES (2196, 'B', 'D', '64725178', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 14:36:54.45', 'F6', 'green', 2194);
INSERT INTO device VALUES (2197, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '77368597', '2013-06-13 03:45:44.879', false, 2193);
INSERT INTO component VALUES (2198, 'E', 'D', '30820779', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:02:43.194', 'G5', 'green', 2197);
INSERT INTO component VALUES (2199, 'F', 'B', '35665478', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:25:08.413', 'D4', 'green', 2197);
INSERT INTO line VALUES (2200, 'B3 PreSeries', 'Series 7', 43, 'polygon25', 2184);
INSERT INTO location VALUES (2201, 'IB9', 'security test', 'Sarah Schulze', 2200);
INSERT INTO device VALUES (2202, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '33661671', '2013-06-13 00:39:57.919', false, 2201);
INSERT INTO component VALUES (2203, 'C', 'B', '49479876', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:32:25.561', 'C4', 'yellow', 2202);
INSERT INTO component VALUES (2204, 'F', 'F', '11659402', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 13:37:23.239', 'A1', 'green', 2202);
INSERT INTO device VALUES (2205, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '63226059', '2013-06-13 03:22:09.528', false, 2201);
INSERT INTO component VALUES (2206, 'G', 'I', '89837762', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:00:45.37', 'I1', 'green', 2205);
INSERT INTO component VALUES (2207, 'E', 'E', '51223248', 'Howard Joel Wolowitz', '2013-06-12 22:40:33.622', 'C5', 'green', 2205);
INSERT INTO location VALUES (2208, 'GI1', 'multimedia test', 'Robert Merkel', 2200);
INSERT INTO device VALUES (2209, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '89334311', '2013-06-13 01:53:01.308', false, 2208);
INSERT INTO component VALUES (2210, 'A', 'F', '9558788', 'Howard Joel Wolowitz', '2013-06-13 01:20:59.931', 'E7', 'yellow', 2209);
INSERT INTO component VALUES (2211, 'B', 'H', '27355608', 'Howard Joel Wolowitz', '2013-06-13 07:30:08.924', 'B9', 'green', 2209);
INSERT INTO device VALUES (2212, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '84015226', '2013-06-12 18:22:20.736', false, 2208);
INSERT INTO component VALUES (2213, 'E', 'F', '32222046', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:04:03.601', 'I6', 'green', 2212);
INSERT INTO component VALUES (2214, 'I', 'G', '85224077', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:31:42.602', 'G8', 'green', 2212);
INSERT INTO line VALUES (2215, 'B3 Finish', 'Series 5', 13, 'rect497', 2184);
INSERT INTO location VALUES (2216, 'FH8', 'transmission test', 'Peter Meier', 2215);
INSERT INTO device VALUES (2217, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '22696615', '2013-06-13 04:15:33.998', false, 2216);
INSERT INTO component VALUES (2218, 'D', 'B', '45014682', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:52:15.449', 'A6', 'green', 2217);
INSERT INTO component VALUES (2219, 'G', 'I', '76632631', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:49:01.808', 'E1', 'green', 2217);
INSERT INTO device VALUES (2220, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '60211614', '2013-06-13 07:54:07.312', false, 2216);
INSERT INTO component VALUES (2221, 'F', 'F', '13170263', 'Howard Joel Wolowitz', '2013-06-13 07:24:22.354', 'I4', 'green', 2220);
INSERT INTO component VALUES (2222, 'H', 'C', '25440108', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:40:33.126', 'F6', 'green', 2220);
INSERT INTO location VALUES (2223, 'DA5', 'transmission test', 'Sarah Merkel', 2215);
INSERT INTO device VALUES (2224, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '33503995', '2013-06-12 16:03:08.829', false, 2223);
INSERT INTO component VALUES (2225, 'G', 'E', '15291985', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:30:29.082', 'A9', 'green', 2224);
INSERT INTO component VALUES (2226, 'A', 'G', '3761216', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 13:29:47.87', 'H2', 'green', 2224);
INSERT INTO device VALUES (2227, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '17470658', '2013-06-12 16:49:07.244', false, 2223);
INSERT INTO component VALUES (2228, 'H', 'B', '51351307', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:10:25.181', 'E1', 'green', 2227);
INSERT INTO component VALUES (2229, 'B', 'I', '62978278', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:54:24.8', 'I3', 'green', 2227);
INSERT INTO hall VALUES (2230, 'E2', 'Assembly+Finish', 1, 6419, 'Audi A4', 2, 'polygon249', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2231, 'E2 Assembly', 'Series 9', 82, 'rect217', 2230);
INSERT INTO location VALUES (2232, 'AE5', 'ABS test', 'Hans Schulze', 2231);
INSERT INTO device VALUES (2233, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '11652237', '2013-06-12 15:30:43.11', false, 2232);
INSERT INTO component VALUES (2234, 'C', 'H', '21876396', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 10:14:56.737', 'H2', 'green', 2233);
INSERT INTO component VALUES (2235, 'F', 'H', '328038', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:12:18.99', 'E4', 'green', 2233);
INSERT INTO device VALUES (2236, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '66443180', '2013-06-12 18:59:56.75', false, 2232);
INSERT INTO component VALUES (2237, 'F', 'E', '68257182', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:45:04.86', 'B3', 'green', 2236);
INSERT INTO component VALUES (2238, 'C', 'A', '18191870', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:06:35.257', 'B9', 'green', 2236);
INSERT INTO location VALUES (2239, 'CB7', 'motor test', 'Hans Schmitt', 2231);
INSERT INTO device VALUES (2240, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '11866998', '2013-06-12 14:53:49.085', true, 2239);
INSERT INTO component VALUES (2241, 'D', 'E', '85878536', 'Howard Joel Wolowitz', '2013-06-13 07:18:35.426', 'C8', 'green', 2240);
INSERT INTO component VALUES (2242, 'B', 'B', '36789478', 'Howard Joel Wolowitz', '2013-06-13 02:01:51.628', 'I4', 'green', 2240);
INSERT INTO device VALUES (2243, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '54761294', '2013-06-13 03:41:24.887', false, 2239);
INSERT INTO component VALUES (2244, 'B', 'C', '27602348', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:32:13.875', 'E9', 'green', 2243);
INSERT INTO component VALUES (2245, 'C', 'B', '3271833', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:54:12.264', 'F1', 'green', 2243);
INSERT INTO line VALUES (2246, 'E2 PreSeries', 'Series 3', 49, 'polygon25', 2230);
INSERT INTO location VALUES (2247, 'CF3', 'transmission test', 'Hans Schulze', 2246);
INSERT INTO device VALUES (2248, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '89985561', '2013-06-13 08:46:20.576', false, 2247);
INSERT INTO component VALUES (2249, 'G', 'G', '9833803', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:46:15.518', 'F3', 'green', 2248);
INSERT INTO component VALUES (2250, 'A', 'E', '66575746', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 20:37:55.136', 'A6', 'green', 2248);
INSERT INTO device VALUES (2251, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '91347296', '2013-06-13 06:27:37.454', false, 2247);
INSERT INTO component VALUES (2252, 'G', 'B', '36081997', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:36:22.036', 'F4', 'green', 2251);
INSERT INTO component VALUES (2253, 'I', 'I', '49679902', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:41:02.034', 'G3', 'green', 2251);
INSERT INTO location VALUES (2254, 'DA3', 'multimedia test', 'Franziska Meier', 2246);
INSERT INTO device VALUES (2255, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '76325412', '2013-06-13 00:45:29.813', false, 2254);
INSERT INTO component VALUES (2256, 'E', 'F', '94815719', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:37:16.267', 'G4', 'green', 2255);
INSERT INTO component VALUES (2257, 'A', 'F', '7002084', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 04:28:17.649', 'H8', 'green', 2255);
INSERT INTO device VALUES (2258, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '18730103', '2013-06-13 09:45:22.588', false, 2254);
INSERT INTO component VALUES (2259, 'A', 'D', '17450651', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:12:59.548', 'B6', 'green', 2258);
INSERT INTO component VALUES (2260, 'E', 'F', '27142571', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:31:01.935', 'E4', 'yellow', 2258);
INSERT INTO line VALUES (2261, 'E2 Finish', 'Series 9', 53, 'rect497', 2230);
INSERT INTO location VALUES (2262, 'BG5', 'transmission test', 'Sarah Schulze', 2261);
INSERT INTO device VALUES (2263, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '22327504', '2013-06-12 20:33:26.011', false, 2262);
INSERT INTO component VALUES (2264, 'E', 'H', '52298719', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 17:51:30.258', 'D6', 'green', 2263);
INSERT INTO component VALUES (2265, 'G', 'A', '9763387', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:16:23.83', 'G3', 'green', 2263);
INSERT INTO device VALUES (2266, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '90877298', '2013-06-13 05:19:29.25', false, 2262);
INSERT INTO component VALUES (2267, 'C', 'C', '85588996', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:49:12.189', 'B1', 'green', 2266);
INSERT INTO component VALUES (2268, 'E', 'D', '17727449', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:21:19.296', 'B7', 'green', 2266);
INSERT INTO location VALUES (2269, 'CG4', 'motor test', 'Peter Merkel', 2261);
INSERT INTO device VALUES (2270, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '14708744', '2013-06-13 03:51:02.883', false, 2269);
INSERT INTO component VALUES (2271, 'I', 'F', '32914933', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:26:38.721', 'C6', 'green', 2270);
INSERT INTO component VALUES (2272, 'H', 'D', '22925368', 'Howard Joel Wolowitz', '2013-06-13 10:56:21.49', 'G8', 'green', 2270);
INSERT INTO device VALUES (2273, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '7637655', '2013-06-13 09:42:59.8', false, 2269);
INSERT INTO component VALUES (2274, 'D', 'G', '31032394', 'Howard Joel Wolowitz', '2013-06-13 10:57:14.969', 'I6', 'green', 2273);
INSERT INTO component VALUES (2275, 'I', 'A', '23749043', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 01:55:11.718', 'A6', 'green', 2273);
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
INSERT INTO hall VALUES (2276, 'C7', 'Assembly+Finish', 469, 2563, 'Audi A4', 2, 'path369', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2277, 'C7 Assembly', 'Series 9', 1, 'rect217', 2276);
INSERT INTO location VALUES (2278, 'EH5', 'transmission test', 'Hans Meier', 2277);
INSERT INTO device VALUES (2279, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '68347658', '2013-06-13 09:13:44.995', false, 2278);
INSERT INTO component VALUES (2280, 'E', 'H', '79837591', 'Howard Joel Wolowitz', '2013-06-12 15:29:32.094', 'B9', 'green', 2279);
INSERT INTO component VALUES (2281, 'D', 'B', '36676916', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:39:46.569', 'C4', 'green', 2279);
INSERT INTO device VALUES (2282, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '50250947', '2013-06-13 05:37:17.354', false, 2278);
INSERT INTO component VALUES (2283, 'E', 'H', '95410278', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:09:31.74', 'I1', 'green', 2282);
INSERT INTO component VALUES (2284, 'A', 'I', '79276802', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:17:37.03', 'D3', 'green', 2282);
INSERT INTO location VALUES (2285, 'IB7', 'transmission test', 'Robert Schmitt', 2277);
INSERT INTO device VALUES (2286, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '61086084', '2013-06-12 14:06:23.914', false, 2285);
INSERT INTO component VALUES (2287, 'B', 'A', '44282259', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:44:15.262', 'A3', 'green', 2286);
INSERT INTO component VALUES (2288, 'C', 'D', '35776039', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:48:58.081', 'D2', 'yellow', 2286);
INSERT INTO device VALUES (2289, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '75508196', '2013-06-12 18:18:34.165', false, 2285);
INSERT INTO component VALUES (2290, 'D', 'A', '71016207', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:10:59.226', 'G1', 'green', 2289);
INSERT INTO component VALUES (2291, 'E', 'E', '30647168', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 04:11:04.613', 'E9', 'green', 2289);
INSERT INTO line VALUES (2292, 'C7 PreSeries', 'Series 8', 66, 'polygon25', 2276);
INSERT INTO location VALUES (2293, 'IA2', 'security test', 'Sarah Mueller', 2292);
INSERT INTO device VALUES (2294, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '24819058', '2013-06-12 16:04:19.396', true, 2293);
INSERT INTO component VALUES (2295, 'B', 'D', '43378380', 'Howard Joel Wolowitz', '2013-06-13 12:31:22.864', 'E2', 'green', 2294);
INSERT INTO component VALUES (2296, 'G', 'C', '82682648', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:58:06.431', 'G6', 'green', 2294);
INSERT INTO device VALUES (2297, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '17426825', '2013-06-13 05:23:48.508', false, 2293);
INSERT INTO component VALUES (2298, 'H', 'B', '63311899', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:16:51.043', 'H2', 'green', 2297);
INSERT INTO component VALUES (2299, 'A', 'H', '12033143', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 19:29:59.963', 'B6', 'green', 2297);
INSERT INTO location VALUES (2300, 'HI6', 'motor test', 'Peter Schulze', 2292);
INSERT INTO device VALUES (2301, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '23010710', '2013-06-12 17:56:45.807', false, 2300);
INSERT INTO component VALUES (2302, 'A', 'B', '81090160', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 12:45:54.48', 'F6', 'green', 2301);
INSERT INTO component VALUES (2303, 'C', 'A', '11804793', 'Howard Joel Wolowitz', '2013-06-13 03:39:08.665', 'E5', 'green', 2301);
INSERT INTO device VALUES (2304, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '55971185', '2013-06-13 06:43:54.783', false, 2300);
INSERT INTO component VALUES (2305, 'I', 'C', '22183058', 'Howard Joel Wolowitz', '2013-06-13 05:31:01.844', 'E7', 'red', 2304);
INSERT INTO component VALUES (2306, 'D', 'C', '16002442', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:45:20.543', 'F7', 'green', 2304);
INSERT INTO line VALUES (2307, 'C7 Finish', 'Series 1', 37, 'rect497', 2276);
INSERT INTO location VALUES (2308, 'DE1', 'motor test', 'Sarah Meier', 2307);
INSERT INTO device VALUES (2309, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '57961949', '2013-06-13 00:01:25.437', false, 2308);
INSERT INTO component VALUES (2310, 'D', 'G', '85407023', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:56:09.164', 'B1', 'green', 2309);
INSERT INTO component VALUES (2311, 'D', 'F', '12321756', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:08:05.586', 'G3', 'green', 2309);
INSERT INTO device VALUES (2312, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '39686455', '2013-06-13 10:31:24.288', false, 2308);
INSERT INTO component VALUES (2313, 'E', 'B', '14372001', 'Howard Joel Wolowitz', '2013-06-12 14:29:07.607', 'D3', 'green', 2312);
INSERT INTO component VALUES (2314, 'G', 'C', '71033643', 'Howard Joel Wolowitz', '2013-06-13 09:35:09.433', 'H3', 'green', 2312);
INSERT INTO location VALUES (2315, 'FF4', 'motor test', 'Hans Schmitt', 2307);
INSERT INTO device VALUES (2316, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '8378103', '2013-06-13 00:30:12.265', false, 2315);
INSERT INTO component VALUES (2317, 'A', 'B', '87860417', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:24:58.16', 'A4', 'green', 2316);
INSERT INTO component VALUES (2318, 'H', 'H', '12676867', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 14:55:40.555', 'H5', 'green', 2316);
INSERT INTO device VALUES (2319, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '97255758', '2013-06-13 08:24:20.22', false, 2315);
INSERT INTO component VALUES (2320, 'A', 'F', '34413004', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:17:17.943', 'D3', 'green', 2319);
INSERT INTO component VALUES (2321, 'C', 'B', '49602336', 'Howard Joel Wolowitz', '2013-06-12 22:06:46.803', 'A9', 'green', 2319);
INSERT INTO hall VALUES (2322, 'D2', 'Assembly+Finish', 592, 2946, 'Audi A4', 2, 'polygon249', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2323, 'D2 Assembly', 'Series 3', 3, 'rect217', 2322);
INSERT INTO location VALUES (2324, 'GG6', 'ABS test', 'Hans Mueller', 2323);
INSERT INTO device VALUES (2325, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '19081377', '2013-06-13 09:51:08.021', true, 2324);
INSERT INTO component VALUES (2326, 'I', 'C', '235399', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 12:42:58.188', 'I1', 'green', 2325);
INSERT INTO component VALUES (2327, 'H', 'C', '47356250', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:58:28.638', 'B3', 'yellow', 2325);
INSERT INTO device VALUES (2328, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '54290018', '2013-06-13 01:50:07.434', false, 2324);
INSERT INTO component VALUES (2329, 'E', 'I', '80716392', 'Howard Joel Wolowitz', '2013-06-13 01:12:36.617', 'B2', 'green', 2328);
INSERT INTO component VALUES (2330, 'C', 'C', '39580561', 'Howard Joel Wolowitz', '2013-06-13 11:09:48.558', 'F9', 'green', 2328);
INSERT INTO location VALUES (2331, 'CF4', 'security test', 'Sarah Mueller', 2323);
INSERT INTO device VALUES (2332, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '32646115', '2013-06-12 13:12:53.821', false, 2331);
INSERT INTO component VALUES (2333, 'C', 'F', '91391551', 'Howard Joel Wolowitz', '2013-06-12 17:29:58.241', 'B4', 'green', 2332);
INSERT INTO component VALUES (2334, 'B', 'A', '3793405', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:24:12.462', 'B5', 'green', 2332);
INSERT INTO device VALUES (2335, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '2824028', '2013-06-13 05:41:29.782', false, 2331);
INSERT INTO component VALUES (2336, 'I', 'H', '6945365', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:41:00.787', 'I9', 'red', 2335);
INSERT INTO component VALUES (2337, 'I', 'G', '20566366', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:23:47.619', 'C3', 'green', 2335);
INSERT INTO line VALUES (2338, 'D2 PreSeries', 'Series 6', 41, 'polygon25', 2322);
INSERT INTO location VALUES (2339, 'GD9', 'transmission test', 'Franziska Meier', 2338);
INSERT INTO device VALUES (2340, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '14500678', '2013-06-13 09:24:43.286', false, 2339);
INSERT INTO component VALUES (2341, 'F', 'I', '21214025', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 12:36:38.968', 'D1', 'green', 2340);
INSERT INTO component VALUES (2342, 'G', 'F', '55700930', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 08:26:14.4', 'E2', 'red', 2340);
INSERT INTO device VALUES (2343, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '4071865', '2013-06-12 23:24:16.104', false, 2339);
INSERT INTO component VALUES (2344, 'F', 'G', '26124473', 'Howard Joel Wolowitz', '2013-06-12 20:24:15.753', 'C8', 'green', 2343);
INSERT INTO component VALUES (2345, 'E', 'F', '47152881', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:12:12.774', 'A3', 'green', 2343);
INSERT INTO location VALUES (2346, 'CC5', 'security test', 'Franziska Meier', 2338);
INSERT INTO device VALUES (2347, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '33352801', '2013-06-13 01:13:04.209', false, 2346);
INSERT INTO component VALUES (2348, 'D', 'A', '21465752', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 12:12:10.27', 'D4', 'green', 2347);
INSERT INTO component VALUES (2349, 'D', 'C', '22475324', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:33:53.232', 'D5', 'yellow', 2347);
INSERT INTO device VALUES (2350, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '11327772', '2013-06-13 10:32:34.905', false, 2346);
INSERT INTO component VALUES (2351, 'H', 'D', '81092898', 'Howard Joel Wolowitz', '2013-06-12 13:18:03.601', 'G1', 'green', 2350);
INSERT INTO component VALUES (2352, 'G', 'B', '20439805', 'Howard Joel Wolowitz', '2013-06-13 10:42:47.848', 'H7', 'green', 2350);
INSERT INTO line VALUES (2353, 'D2 Finish', 'Series 3', 46, 'rect497', 2322);
INSERT INTO location VALUES (2354, 'GC1', 'security test', 'Robert Schulze', 2353);
INSERT INTO device VALUES (2355, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '61709028', '2013-06-12 18:17:57.216', false, 2354);
INSERT INTO component VALUES (2356, 'C', 'C', '664148', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:13:31.8', 'B5', 'green', 2355);
INSERT INTO component VALUES (2357, 'G', 'B', '65636996', 'Howard Joel Wolowitz', '2013-06-12 17:14:52.421', 'D8', 'green', 2355);
INSERT INTO device VALUES (2358, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '44743003', '2013-06-13 01:56:04.178', false, 2354);
INSERT INTO component VALUES (2359, 'B', 'B', '90809810', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:38:01.74', 'F2', 'green', 2358);
INSERT INTO component VALUES (2360, 'C', 'D', '7440031', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 04:44:26.754', 'G3', 'green', 2358);
INSERT INTO location VALUES (2361, 'CB9', 'ABS test', 'Franziska Meier', 2353);
INSERT INTO device VALUES (2362, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '16902084', '2013-06-12 16:52:28.611', false, 2361);
INSERT INTO component VALUES (2363, 'A', 'D', '43350281', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:12:10.018', 'C3', 'green', 2362);
INSERT INTO component VALUES (2364, 'F', 'D', '44639231', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 01:19:10.328', 'F9', 'green', 2362);
INSERT INTO device VALUES (2365, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '10012330', '2013-06-13 09:00:13.535', false, 2361);
INSERT INTO component VALUES (2366, 'G', 'I', '2797213', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:21:07.813', 'C8', 'green', 2365);
INSERT INTO component VALUES (2367, 'H', 'D', '62794623', 'Howard Joel Wolowitz', '2013-06-13 01:47:33.109', 'B7', 'green', 2365);
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
INSERT INTO hall VALUES (2368, 'G3', 'Assembly+Finish', 305, 6215, 'Audi A4', 2, 'path369', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2369, 'G3 Assembly', 'Series 5', 36, 'rect217', 2368);
INSERT INTO location VALUES (2370, 'BH3', 'security test', 'Franziska Meier', 2369);
INSERT INTO device VALUES (2371, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '73468545', '2013-06-13 10:02:52.747', false, 2370);
INSERT INTO component VALUES (2372, 'C', 'D', '72544141', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:45:17.039', 'F3', 'yellow', 2371);
INSERT INTO component VALUES (2373, 'D', 'I', '93718308', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:34:45.648', 'D5', 'red', 2371);
INSERT INTO device VALUES (2374, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '86609217', '2013-06-13 10:33:25.559', false, 2370);
INSERT INTO component VALUES (2375, 'D', 'H', '82935277', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:33:55.125', 'F8', 'green', 2374);
INSERT INTO component VALUES (2376, 'G', 'D', '15067655', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:30:54.492', 'D4', 'red', 2374);
INSERT INTO location VALUES (2377, 'GB9', 'motor test', 'Robert Schulze', 2369);
INSERT INTO device VALUES (2378, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '82944792', '2013-06-13 06:34:54.764', false, 2377);
INSERT INTO component VALUES (2379, 'F', 'G', '74985803', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:32:00.969', 'I3', 'green', 2378);
INSERT INTO component VALUES (2380, 'I', 'G', '82162290', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:29:28.217', 'G4', 'green', 2378);
INSERT INTO device VALUES (2381, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '6066717', '2013-06-12 18:48:27.994', false, 2377);
INSERT INTO component VALUES (2382, 'A', 'D', '63500887', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:12:11.882', 'E4', 'green', 2381);
INSERT INTO component VALUES (2383, 'I', 'G', '47951334', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:31:17.503', 'F6', 'green', 2381);
INSERT INTO line VALUES (2384, 'G3 PreSeries', 'Series 2', 45, 'polygon25', 2368);
INSERT INTO location VALUES (2385, 'CG1', 'transmission test', 'Hans Schulze', 2384);
INSERT INTO device VALUES (2386, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '53160430', '2013-06-13 00:15:08.871', false, 2385);
INSERT INTO component VALUES (2387, 'B', 'B', '84353647', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:34:19.491', 'G5', 'green', 2386);
INSERT INTO component VALUES (2388, 'G', 'D', '21716388', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:48:19.151', 'G2', 'red', 2386);
INSERT INTO device VALUES (2389, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '2128749', '2013-06-12 19:23:41.675', false, 2385);
INSERT INTO component VALUES (2390, 'B', 'I', '8665946', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:11:16.581', 'B3', 'green', 2389);
INSERT INTO component VALUES (2391, 'E', 'B', '93023969', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:46:31.655', 'B7', 'green', 2389);
INSERT INTO location VALUES (2392, 'BG1', 'ABS test', 'Franziska Meier', 2384);
INSERT INTO device VALUES (2393, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '69695480', '2013-06-12 17:57:35.521', false, 2392);
INSERT INTO component VALUES (2394, 'E', 'H', '75821621', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:15:19.361', 'F1', 'green', 2393);
INSERT INTO component VALUES (2395, 'D', 'H', '46819510', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:32:56.317', 'E3', 'green', 2393);
INSERT INTO device VALUES (2396, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '33582832', '2013-06-12 20:57:21.931', false, 2392);
INSERT INTO component VALUES (2397, 'F', 'G', '37519055', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 04:06:01.257', 'E5', 'green', 2396);
INSERT INTO component VALUES (2398, 'F', 'E', '1561475', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:33:52.359', 'G1', 'green', 2396);
INSERT INTO line VALUES (2399, 'G3 Finish', 'Series 3', 47, 'rect497', 2368);
INSERT INTO location VALUES (2400, 'EH7', 'transmission test', 'Robert Schulze', 2399);
INSERT INTO device VALUES (2401, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '24207889', '2013-06-12 19:21:45.369', false, 2400);
INSERT INTO component VALUES (2402, 'D', 'D', '76764351', 'Howard Joel Wolowitz', '2013-06-12 16:51:38.992', 'A6', 'red', 2401);
INSERT INTO component VALUES (2403, 'H', 'H', '25501825', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 09:50:38.827', 'A4', 'green', 2401);
INSERT INTO device VALUES (2404, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '31698221', '2013-06-13 08:01:46.229', false, 2400);
INSERT INTO component VALUES (2405, 'A', 'B', '8941895', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:32:18.806', 'G4', 'green', 2404);
INSERT INTO component VALUES (2406, 'A', 'D', '16001035', 'Howard Joel Wolowitz', '2013-06-12 18:00:27.505', 'D1', 'red', 2404);
INSERT INTO location VALUES (2407, 'EI6', 'security test', 'Sarah Schmitt', 2399);
INSERT INTO device VALUES (2408, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '48131167', '2013-06-13 09:30:25.043', true, 2407);
INSERT INTO component VALUES (2409, 'A', 'H', '60147595', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 14:38:31.243', 'F7', 'green', 2408);
INSERT INTO component VALUES (2410, 'B', 'B', '73788364', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 17:47:03.663', 'F6', 'green', 2408);
INSERT INTO device VALUES (2411, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '98468470', '2013-06-13 10:27:24.219', false, 2407);
INSERT INTO component VALUES (2412, 'H', 'G', '45733911', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:21:55.47', 'C7', 'green', 2411);
INSERT INTO component VALUES (2413, 'G', 'C', '99185602', 'Howard Joel Wolowitz', '2013-06-12 17:07:37.793', 'A6', 'green', 2411);
INSERT INTO hall VALUES (2414, 'E5', 'Assembly+Finish', 230, 5024, 'Audi A4', 2, 'polygon249', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2415, 'E5 Assembly', 'Series 4', 83, 'rect217', 2414);
INSERT INTO location VALUES (2416, 'BD5', 'motor test', 'Peter Schmitt', 2415);
INSERT INTO device VALUES (2417, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '50124846', '2013-06-13 10:40:08.927', false, 2416);
INSERT INTO component VALUES (2418, 'E', 'F', '65956332', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 13:03:44.556', 'I9', 'green', 2417);
INSERT INTO component VALUES (2419, 'I', 'C', '5072267', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:39:29.014', 'F5', 'green', 2417);
INSERT INTO device VALUES (2420, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '1876975', '2013-06-13 00:53:22.913', false, 2416);
INSERT INTO component VALUES (2421, 'H', 'G', '81127098', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:27:37.279', 'D5', 'green', 2420);
INSERT INTO component VALUES (2422, 'H', 'A', '68258449', 'Howard Joel Wolowitz', '2013-06-13 09:31:34.359', 'E8', 'green', 2420);
INSERT INTO location VALUES (2423, 'GE9', 'multimedia test', 'Robert Merkel', 2415);
INSERT INTO device VALUES (2424, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '14496426', '2013-06-13 03:46:22.307', true, 2423);
INSERT INTO component VALUES (2425, 'G', 'E', '9534276', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:21:24.298', 'G4', 'green', 2424);
INSERT INTO component VALUES (2426, 'E', 'A', '29675765', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 13:42:39.779', 'H2', 'green', 2424);
INSERT INTO device VALUES (2427, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '53229104', '2013-06-12 18:07:23.281', false, 2423);
INSERT INTO component VALUES (2428, 'H', 'H', '13854470', 'Howard Joel Wolowitz', '2013-06-13 06:50:11.39', 'D3', 'green', 2427);
INSERT INTO component VALUES (2429, 'D', 'A', '9780861', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:58:46.026', 'D7', 'green', 2427);
INSERT INTO line VALUES (2430, 'E5 PreSeries', 'Series 9', 68, 'polygon25', 2414);
INSERT INTO location VALUES (2431, 'BF3', 'motor test', 'Sarah Meier', 2430);
INSERT INTO device VALUES (2432, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '69283504', '2013-06-12 22:14:26.272', true, 2431);
INSERT INTO component VALUES (2433, 'G', 'F', '97653206', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:04:35.908', 'H2', 'green', 2432);
INSERT INTO component VALUES (2434, 'G', 'I', '29533404', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:13:02.204', 'F1', 'green', 2432);
INSERT INTO device VALUES (2435, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '74134768', '2013-06-12 13:11:40.334', true, 2431);
INSERT INTO component VALUES (2436, 'A', 'H', '87358353', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 02:03:55.091', 'D9', 'green', 2435);
INSERT INTO component VALUES (2437, 'D', 'I', '35858808', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:22:59.84', 'C9', 'green', 2435);
INSERT INTO location VALUES (2438, 'CE8', 'transmission test', 'Franziska Merkel', 2430);
INSERT INTO device VALUES (2439, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '5782583', '2013-06-13 03:54:38.369', false, 2438);
INSERT INTO component VALUES (2440, 'A', 'E', '66842489', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:24:49.115', 'A7', 'green', 2439);
INSERT INTO component VALUES (2441, 'F', 'D', '32509848', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:13:19.558', 'G3', 'green', 2439);
INSERT INTO device VALUES (2442, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '78757474', '2013-06-12 16:06:33.876', false, 2438);
INSERT INTO component VALUES (2443, 'A', 'I', '66021492', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 13:33:25.926', 'A7', 'green', 2442);
INSERT INTO component VALUES (2444, 'C', 'B', '38502399', 'Howard Joel Wolowitz', '2013-06-13 07:04:31.471', 'E4', 'green', 2442);
INSERT INTO line VALUES (2445, 'E5 Finish', 'Series 6', 6, 'rect497', 2414);
INSERT INTO location VALUES (2446, 'II4', 'security test', 'Peter Merkel', 2445);
INSERT INTO device VALUES (2447, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '12994080', '2013-06-12 23:52:47.077', false, 2446);
INSERT INTO component VALUES (2448, 'B', 'C', '54395120', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:34:54.313', 'H5', 'green', 2447);
INSERT INTO component VALUES (2449, 'I', 'F', '78440427', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:47:22.847', 'E6', 'green', 2447);
INSERT INTO device VALUES (2450, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '25393926', '2013-06-13 00:19:47.106', false, 2446);
INSERT INTO component VALUES (2451, 'B', 'H', '98429644', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:43:57.439', 'E3', 'green', 2450);
INSERT INTO component VALUES (2452, 'A', 'C', '70590144', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:23:34.011', 'E3', 'green', 2450);
INSERT INTO location VALUES (2453, 'IF1', 'security test', 'Robert Meier', 2445);
INSERT INTO device VALUES (2454, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '59548431', '2013-06-13 06:10:52.672', false, 2453);
INSERT INTO component VALUES (2455, 'H', 'C', '80281508', 'Howard Joel Wolowitz', '2013-06-12 20:46:52.211', 'G4', 'green', 2454);
INSERT INTO component VALUES (2456, 'C', 'I', '69562206', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 16:18:49.5', 'C4', 'green', 2454);
INSERT INTO device VALUES (2457, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '12645709', '2013-06-12 14:37:15.094', false, 2453);
INSERT INTO component VALUES (2458, 'G', 'H', '81095229', 'Howard Joel Wolowitz', '2013-06-12 14:55:09.936', 'H5', 'green', 2457);
INSERT INTO component VALUES (2459, 'D', 'I', '58033641', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 18:38:55.379', 'F4', 'green', 2457);
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
INSERT INTO hall VALUES (2460, 'I8', 'Assembly+Finish', 4, 3489, 'Audi A4', 2, 'path369', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2461, 'I8 Assembly', 'Series 9', 1, 'rect217', 2460);
INSERT INTO location VALUES (2462, 'DI7', 'multimedia test', 'Hans Meier', 2461);
INSERT INTO device VALUES (2463, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '39645480', '2013-06-13 01:34:54.833', false, 2462);
INSERT INTO component VALUES (2464, 'C', 'F', '88666351', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 04:08:54.497', 'D5', 'green', 2463);
INSERT INTO component VALUES (2465, 'F', 'B', '98282009', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 13:49:03.636', 'H8', 'green', 2463);
INSERT INTO device VALUES (2466, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '720088', '2013-06-13 04:17:49.314', false, 2462);
INSERT INTO component VALUES (2467, 'B', 'H', '12861928', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 13:30:26.443', 'G3', 'green', 2466);
INSERT INTO component VALUES (2468, 'A', 'C', '43120495', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:25:08.081', 'G2', 'green', 2466);
INSERT INTO location VALUES (2469, 'BH8', 'ABS test', 'Hans Schmitt', 2461);
INSERT INTO device VALUES (2470, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '64827464', '2013-06-13 07:47:17.413', false, 2469);
INSERT INTO component VALUES (2471, 'D', 'F', '29020553', 'Howard Joel Wolowitz', '2013-06-13 10:56:08.399', 'H4', 'green', 2470);
INSERT INTO component VALUES (2472, 'E', 'H', '62405678', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:10:30.553', 'F4', 'red', 2470);
INSERT INTO device VALUES (2473, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '19333607', '2013-06-13 05:01:43.414', false, 2469);
INSERT INTO component VALUES (2474, 'B', 'B', '28745801', 'Howard Joel Wolowitz', '2013-06-13 11:47:37.001', 'A6', 'green', 2473);
INSERT INTO component VALUES (2475, 'I', 'B', '56218406', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:20:42.343', 'G5', 'green', 2473);
INSERT INTO line VALUES (2476, 'I8 PreSeries', 'Series 8', 2, 'polygon25', 2460);
INSERT INTO location VALUES (2477, 'IF6', 'security test', 'Hans Schulze', 2476);
INSERT INTO device VALUES (2478, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '79613880', '2013-06-12 22:38:31.388', false, 2477);
INSERT INTO component VALUES (2479, 'G', 'D', '33028564', 'Howard Joel Wolowitz', '2013-06-12 21:14:30.996', 'B2', 'yellow', 2478);
INSERT INTO component VALUES (2480, 'I', 'H', '91359850', 'Howard Joel Wolowitz', '2013-06-12 21:03:13.52', 'E7', 'green', 2478);
INSERT INTO device VALUES (2481, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '19743735', '2013-06-13 07:49:24.27', false, 2477);
INSERT INTO component VALUES (2482, 'F', 'I', '97092139', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:38:59.335', 'H9', 'green', 2481);
INSERT INTO component VALUES (2483, 'H', 'D', '38362542', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:40:35.945', 'A4', 'green', 2481);
INSERT INTO location VALUES (2484, 'AB1', 'transmission test', 'Hans Mueller', 2476);
INSERT INTO device VALUES (2485, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '35168383', '2013-06-13 10:24:14.141', false, 2484);
INSERT INTO component VALUES (2486, 'C', 'C', '39428621', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 14:02:45.448', 'I2', 'green', 2485);
INSERT INTO component VALUES (2487, 'C', 'D', '21463971', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 13:34:03.215', 'F7', 'green', 2485);
INSERT INTO device VALUES (2488, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '72322347', '2013-06-12 20:26:24.835', false, 2484);
INSERT INTO component VALUES (2489, 'D', 'G', '64925414', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 23:00:29.208', 'I2', 'green', 2488);
INSERT INTO component VALUES (2490, 'B', 'G', '48608316', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:10:31.534', 'H2', 'green', 2488);
INSERT INTO line VALUES (2491, 'I8 Finish', 'Series 9', 68, 'rect497', 2460);
INSERT INTO location VALUES (2492, 'BG5', 'multimedia test', 'Robert Merkel', 2491);
INSERT INTO device VALUES (2493, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '82028452', '2013-06-13 02:58:45.81', false, 2492);
INSERT INTO component VALUES (2494, 'A', 'B', '88960921', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 10:31:54.067', 'D3', 'green', 2493);
INSERT INTO component VALUES (2495, 'C', 'F', '49547219', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:01:17.551', 'C3', 'green', 2493);
INSERT INTO device VALUES (2496, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '12407954', '2013-06-12 15:32:10.591', false, 2492);
INSERT INTO component VALUES (2497, 'I', 'A', '75290392', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:19:36.16', 'G3', 'red', 2496);
INSERT INTO component VALUES (2498, 'B', 'H', '75334665', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:50:22.024', 'D1', 'green', 2496);
INSERT INTO location VALUES (2499, 'EE4', 'transmission test', 'Hans Schmitt', 2491);
INSERT INTO device VALUES (2500, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '22624249', '2013-06-13 04:25:53.117', false, 2499);
INSERT INTO component VALUES (2501, 'C', 'F', '77832636', 'Howard Joel Wolowitz', '2013-06-12 21:45:17.343', 'I9', 'green', 2500);
INSERT INTO component VALUES (2502, 'G', 'I', '58859261', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 16:46:53.971', 'E1', 'green', 2500);
INSERT INTO device VALUES (2503, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '1329555', '2013-06-12 19:19:08.097', false, 2499);
INSERT INTO component VALUES (2504, 'F', 'A', '14074943', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:16:45.553', 'D7', 'green', 2503);
INSERT INTO component VALUES (2505, 'C', 'B', '48539159', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:53:32.28', 'C5', 'green', 2503);
INSERT INTO hall VALUES (2506, 'D5', 'Assembly+Finish', 731, 9867, 'Audi A4', 2, 'polygon249', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2507, 'D5 Assembly', 'Series 5', 25, 'rect217', 2506);
INSERT INTO location VALUES (2508, 'BB2', 'security test', 'Franziska Schmitt', 2507);
INSERT INTO device VALUES (2509, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '50919443', '2013-06-12 17:57:00.346', true, 2508);
INSERT INTO component VALUES (2510, 'H', 'A', '77186910', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:10:08.295', 'H4', 'green', 2509);
INSERT INTO component VALUES (2511, 'B', 'C', '74884833', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:41:54.989', 'H4', 'green', 2509);
INSERT INTO device VALUES (2512, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '75724084', '2013-06-13 11:42:10.051', false, 2508);
INSERT INTO component VALUES (2513, 'H', 'H', '48328454', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:30:11.265', 'B7', 'green', 2512);
INSERT INTO component VALUES (2514, 'D', 'H', '93247687', 'Howard Joel Wolowitz', '2013-06-12 13:58:33.578', 'B8', 'red', 2512);
INSERT INTO location VALUES (2515, 'IH2', 'security test', 'Franziska Merkel', 2507);
INSERT INTO device VALUES (2516, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '97476114', '2013-06-12 16:42:27.996', false, 2515);
INSERT INTO component VALUES (2517, 'H', 'I', '25099344', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 01:49:56.686', 'C2', 'green', 2516);
INSERT INTO component VALUES (2518, 'D', 'E', '10589322', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:49:26.602', 'D5', 'green', 2516);
INSERT INTO device VALUES (2519, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '68502682', '2013-06-13 04:08:08.604', false, 2515);
INSERT INTO component VALUES (2520, 'F', 'D', '10581634', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 04:13:10.589', 'C6', 'green', 2519);
INSERT INTO component VALUES (2521, 'G', 'G', '28647807', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:42:18.329', 'A8', 'green', 2519);
INSERT INTO line VALUES (2522, 'D5 PreSeries', 'Series 4', 88, 'polygon25', 2506);
INSERT INTO location VALUES (2523, 'BH1', 'motor test', 'Peter Merkel', 2522);
INSERT INTO device VALUES (2524, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '98872448', '2013-06-13 10:04:04.453', false, 2523);
INSERT INTO component VALUES (2525, 'B', 'C', '48935928', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:19:22.77', 'C3', 'green', 2524);
INSERT INTO component VALUES (2526, 'D', 'D', '71411979', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:10:41.743', 'D5', 'red', 2524);
INSERT INTO device VALUES (2527, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '38120990', '2013-06-13 12:34:54.467', false, 2523);
INSERT INTO component VALUES (2528, 'A', 'G', '36109823', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:35:45.372', 'I3', 'green', 2527);
INSERT INTO component VALUES (2529, 'I', 'H', '5994821', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 14:42:59.2', 'I4', 'green', 2527);
INSERT INTO location VALUES (2530, 'HB5', 'motor test', 'Peter Merkel', 2522);
INSERT INTO device VALUES (2531, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '37732973', '2013-06-13 01:37:23.109', false, 2530);
INSERT INTO component VALUES (2532, 'C', 'H', '24306263', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:18:00.376', 'D7', 'green', 2531);
INSERT INTO component VALUES (2533, 'B', 'E', '81593212', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 06:43:46.201', 'D7', 'green', 2531);
INSERT INTO device VALUES (2534, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '38114070', '2013-06-13 05:01:11.001', false, 2530);
INSERT INTO component VALUES (2535, 'I', 'G', '51562150', 'Howard Joel Wolowitz', '2013-06-13 06:31:40.847', 'G2', 'green', 2534);
INSERT INTO component VALUES (2536, 'E', 'F', '87169944', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:19:05.897', 'F2', 'green', 2534);
INSERT INTO line VALUES (2537, 'D5 Finish', 'Series 1', 73, 'rect497', 2506);
INSERT INTO location VALUES (2538, 'CB2', 'ABS test', 'Robert Schulze', 2537);
INSERT INTO device VALUES (2539, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '55243908', '2013-06-12 17:43:47.918', false, 2538);
INSERT INTO component VALUES (2540, 'E', 'G', '50532498', 'Howard Joel Wolowitz', '2013-06-13 08:48:34.694', 'D6', 'red', 2539);
INSERT INTO component VALUES (2541, 'A', 'C', '12679844', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:59:45.16', 'E4', 'green', 2539);
INSERT INTO device VALUES (2542, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '89076782', '2013-06-12 21:27:43.701', false, 2538);
INSERT INTO component VALUES (2543, 'F', 'F', '99411236', 'Howard Joel Wolowitz', '2013-06-12 17:42:57.162', 'F9', 'green', 2542);
INSERT INTO component VALUES (2544, 'G', 'G', '78794297', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:33:44.476', 'F3', 'green', 2542);
INSERT INTO location VALUES (2545, 'AG3', 'motor test', 'Hans Merkel', 2537);
INSERT INTO device VALUES (2546, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '17893704', '2013-06-12 22:18:14.21', false, 2545);
INSERT INTO component VALUES (2547, 'G', 'B', '97368470', 'Howard Joel Wolowitz', '2013-06-13 06:12:10.19', 'C9', 'green', 2546);
INSERT INTO component VALUES (2548, 'B', 'H', '10092625', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:23:30.806', 'H4', 'red', 2546);
INSERT INTO device VALUES (2549, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '90449085', '2013-06-12 13:16:50.143', false, 2545);
INSERT INTO component VALUES (2550, 'H', 'D', '49617094', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:25:01.579', 'D7', 'green', 2549);
INSERT INTO component VALUES (2551, 'C', 'F', '36025229', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:37:32.498', 'D7', 'green', 2549);
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
INSERT INTO hall VALUES (2552, 'B3', 'Assembly+Finish', 561, 272, 'Audi A4', 2, 'path369', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2553, 'B3 Assembly', 'Series 4', 73, 'rect217', 2552);
INSERT INTO location VALUES (2554, 'AF4', 'motor test', 'Peter Meier', 2553);
INSERT INTO device VALUES (2555, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '36248505', '2013-06-12 18:31:58.173', false, 2554);
INSERT INTO component VALUES (2556, 'I', 'A', '74888688', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:24:52.304', 'F9', 'green', 2555);
INSERT INTO component VALUES (2557, 'F', 'B', '43074748', 'Howard Joel Wolowitz', '2013-06-13 09:45:04.601', 'D8', 'green', 2555);
INSERT INTO device VALUES (2558, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '52212555', '2013-06-13 12:41:14.115', true, 2554);
INSERT INTO component VALUES (2559, 'G', 'G', '72743949', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:54:49.795', 'C4', 'green', 2558);
INSERT INTO component VALUES (2560, 'E', 'F', '96875498', 'Howard Joel Wolowitz', '2013-06-13 09:35:09.745', 'A5', 'green', 2558);
INSERT INTO location VALUES (2561, 'DE3', 'security test', 'Hans Mueller', 2553);
INSERT INTO device VALUES (2562, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '45832520', '2013-06-12 22:43:03.051', false, 2561);
INSERT INTO component VALUES (2563, 'C', 'H', '4878295', 'Howard Joel Wolowitz', '2013-06-13 01:21:00.871', 'B2', 'green', 2562);
INSERT INTO component VALUES (2564, 'A', 'F', '77319045', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:32:11.716', 'C4', 'green', 2562);
INSERT INTO device VALUES (2565, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '33557109', '2013-06-12 13:57:53.054', true, 2561);
INSERT INTO component VALUES (2566, 'A', 'G', '87454806', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:28:53.262', 'B9', 'yellow', 2565);
INSERT INTO component VALUES (2567, 'D', 'C', '19163116', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:48:12.386', 'D4', 'green', 2565);
INSERT INTO line VALUES (2568, 'B3 PreSeries', 'Series 7', 55, 'polygon25', 2552);
INSERT INTO location VALUES (2569, 'FE1', 'motor test', 'Peter Schmitt', 2568);
INSERT INTO device VALUES (2570, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '8701932', '2013-06-13 12:29:35.161', false, 2569);
INSERT INTO component VALUES (2571, 'B', 'B', '55292111', 'Howard Joel Wolowitz', '2013-06-12 14:02:40.202', 'E4', 'green', 2570);
INSERT INTO component VALUES (2572, 'A', 'D', '96722755', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 06:41:25.061', 'F9', 'green', 2570);
INSERT INTO device VALUES (2573, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '95805784', '2013-06-12 22:26:21.174', false, 2569);
INSERT INTO component VALUES (2574, 'H', 'A', '12527310', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 13:43:02.226', 'A2', 'green', 2573);
INSERT INTO component VALUES (2575, 'G', 'F', '36703811', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:38:39.424', 'I7', 'green', 2573);
INSERT INTO location VALUES (2576, 'ED4', 'security test', 'Franziska Meier', 2568);
INSERT INTO device VALUES (2577, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '18420712', '2013-06-13 10:43:32.505', false, 2576);
INSERT INTO component VALUES (2578, 'B', 'I', '68496957', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:30:44.381', 'B4', 'green', 2577);
INSERT INTO component VALUES (2579, 'A', 'I', '58748325', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:05:14.582', 'D6', 'green', 2577);
INSERT INTO device VALUES (2580, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '42687278', '2013-06-13 07:13:10.249', false, 2576);
INSERT INTO component VALUES (2581, 'I', 'E', '76582567', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:45:59.177', 'I8', 'green', 2580);
INSERT INTO component VALUES (2582, 'G', 'C', '2501630', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:56:44.137', 'B9', 'green', 2580);
INSERT INTO line VALUES (2583, 'B3 Finish', 'Series 3', 27, 'rect497', 2552);
INSERT INTO location VALUES (2584, 'HG2', 'ABS test', 'Sarah Mueller', 2583);
INSERT INTO device VALUES (2585, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '22276557', '2013-06-12 15:18:07.75', false, 2584);
INSERT INTO component VALUES (2586, 'C', 'C', '41836417', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 12:07:28.445', 'I8', 'yellow', 2585);
INSERT INTO component VALUES (2587, 'D', 'G', '98959119', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:38:00.749', 'C8', 'green', 2585);
INSERT INTO device VALUES (2588, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '54756176', '2013-06-12 18:15:33.27', true, 2584);
INSERT INTO component VALUES (2589, 'A', 'G', '19199505', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 11:15:23.809', 'F2', 'green', 2588);
INSERT INTO component VALUES (2590, 'D', 'A', '98811367', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 03:38:40.647', 'C6', 'green', 2588);
INSERT INTO location VALUES (2591, 'FD4', 'ABS test', 'Peter Schmitt', 2583);
INSERT INTO device VALUES (2592, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '83087329', '2013-06-13 01:13:16.49', false, 2591);
INSERT INTO component VALUES (2593, 'F', 'D', '84653025', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 04:33:08.142', 'A4', 'yellow', 2592);
INSERT INTO component VALUES (2594, 'F', 'H', '59503710', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:24:58.776', 'G4', 'green', 2592);
INSERT INTO device VALUES (2595, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '4558736', '2013-06-12 23:24:20.633', false, 2591);
INSERT INTO component VALUES (2596, 'H', 'G', '94095024', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:06:37.393', 'A9', 'green', 2595);
INSERT INTO component VALUES (2597, 'A', 'D', '17500096', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:20:35.413', 'I3', 'green', 2595);
INSERT INTO hall VALUES (2598, 'E8', 'Assembly+Finish', 768, 4510, 'Audi A4', 2, 'polygon249', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2599, 'E8 Assembly', 'Series 5', 32, 'rect217', 2598);
INSERT INTO location VALUES (2600, 'EB8', 'multimedia test', 'Robert Meier', 2599);
INSERT INTO device VALUES (2601, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '42609858', '2013-06-12 18:30:56.737', false, 2600);
INSERT INTO component VALUES (2602, 'D', 'B', '10090643', 'Howard Joel Wolowitz', '2013-06-13 11:41:30.012', 'D7', 'green', 2601);
INSERT INTO component VALUES (2603, 'H', 'I', '60714082', 'Howard Joel Wolowitz', '2013-06-13 04:00:00.255', 'B2', 'green', 2601);
INSERT INTO device VALUES (2604, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '76250072', '2013-06-13 09:57:21.986', false, 2600);
INSERT INTO component VALUES (2605, 'H', 'C', '11061790', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 19:19:47.008', 'F9', 'green', 2604);
INSERT INTO component VALUES (2606, 'I', 'E', '81385407', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:30:07.41', 'E1', 'green', 2604);
INSERT INTO location VALUES (2607, 'FF2', 'security test', 'Robert Schmitt', 2599);
INSERT INTO device VALUES (2608, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '51660278', '2013-06-13 11:57:49.256', false, 2607);
INSERT INTO component VALUES (2609, 'B', 'D', '71226348', 'Howard Joel Wolowitz', '2013-06-12 20:16:09.917', 'H3', 'green', 2608);
INSERT INTO component VALUES (2610, 'D', 'C', '31406585', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:32:21.292', 'F6', 'green', 2608);
INSERT INTO device VALUES (2611, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '48947254', '2013-06-12 18:03:57.495', true, 2607);
INSERT INTO component VALUES (2612, 'I', 'H', '91090361', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:51:48.336', 'B2', 'green', 2611);
INSERT INTO component VALUES (2613, 'I', 'G', '93176956', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 14:17:55.661', 'C7', 'green', 2611);
INSERT INTO line VALUES (2614, 'E8 PreSeries', 'Series 3', 90, 'polygon25', 2598);
INSERT INTO location VALUES (2615, 'CH2', 'motor test', 'Franziska Merkel', 2614);
INSERT INTO device VALUES (2616, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '94111992', '2013-06-13 02:14:15.823', false, 2615);
INSERT INTO component VALUES (2617, 'C', 'I', '23125361', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:57:38.992', 'B5', 'green', 2616);
INSERT INTO component VALUES (2618, 'D', 'D', '74414824', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:51:06.065', 'I8', 'green', 2616);
INSERT INTO device VALUES (2619, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '83648746', '2013-06-13 06:47:10.715', false, 2615);
INSERT INTO component VALUES (2620, 'F', 'A', '32372062', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:44:23.549', 'E4', 'green', 2619);
INSERT INTO component VALUES (2621, 'D', 'I', '2429946', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:14:49.752', 'B1', 'green', 2619);
INSERT INTO location VALUES (2622, 'CC9', 'security test', 'Peter Mueller', 2614);
INSERT INTO device VALUES (2623, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '22693730', '2013-06-13 10:18:01.949', false, 2622);
INSERT INTO component VALUES (2624, 'F', 'C', '39215721', 'Howard Joel Wolowitz', '2013-06-12 23:02:59.239', 'D1', 'yellow', 2623);
INSERT INTO component VALUES (2625, 'H', 'B', '38517836', 'Howard Joel Wolowitz', '2013-06-13 07:19:28.169', 'A6', 'green', 2623);
INSERT INTO device VALUES (2626, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '3923956', '2013-06-13 10:11:00.768', false, 2622);
INSERT INTO component VALUES (2627, 'A', 'G', '88209386', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:59:18.211', 'E1', 'green', 2626);
INSERT INTO component VALUES (2628, 'I', 'E', '85832736', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:39:30.26', 'F1', 'green', 2626);
INSERT INTO line VALUES (2629, 'E8 Finish', 'Series 3', 64, 'rect497', 2598);
INSERT INTO location VALUES (2630, 'DA3', 'multimedia test', 'Robert Schulze', 2629);
INSERT INTO device VALUES (2631, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '29480511', '2013-06-12 15:31:12.359', false, 2630);
INSERT INTO component VALUES (2632, 'I', 'F', '98104657', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:16:39.268', 'I5', 'green', 2631);
INSERT INTO component VALUES (2633, 'A', 'F', '44424365', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 05:47:24.792', 'H8', 'green', 2631);
INSERT INTO device VALUES (2634, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '13416642', '2013-06-12 20:30:47.642', false, 2630);
INSERT INTO component VALUES (2635, 'A', 'G', '82680407', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:16:07.94', 'B8', 'green', 2634);
INSERT INTO component VALUES (2636, 'F', 'H', '53951584', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 10:07:41.549', 'G9', 'green', 2634);
INSERT INTO location VALUES (2637, 'HA5', 'motor test', 'Hans Schulze', 2629);
INSERT INTO device VALUES (2638, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '59995436', '2013-06-12 14:10:33.426', false, 2637);
INSERT INTO component VALUES (2639, 'C', 'H', '31316417', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 07:47:50.005', 'G2', 'green', 2638);
INSERT INTO component VALUES (2640, 'C', 'E', '54704945', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 18:55:39.176', 'F2', 'green', 2638);
INSERT INTO device VALUES (2641, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '99616005', '2013-06-13 04:11:49.533', false, 2637);
INSERT INTO component VALUES (2642, 'F', 'C', '39393956', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 14:38:11.149', 'A6', 'green', 2641);
INSERT INTO component VALUES (2643, 'A', 'H', '86638029', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:14:05.594', 'I1', 'red', 2641);
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
INSERT INTO hall VALUES (2644, 'C9', 'Assembly+Finish', 344, 5563, 'Audi A4', 2, 'path369', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2645, 'C9 Assembly', 'Series 4', 36, 'rect217', 2644);
INSERT INTO location VALUES (2646, 'GD8', 'security test', 'Franziska Schmitt', 2645);
INSERT INTO device VALUES (2647, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '34812402', '2013-06-12 21:29:08.148', false, 2646);
INSERT INTO component VALUES (2648, 'C', 'A', '42066344', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:03:23.881', 'C6', 'green', 2647);
INSERT INTO component VALUES (2649, 'E', 'I', '47204897', 'Howard Joel Wolowitz', '2013-06-13 06:09:18.431', 'A2', 'green', 2647);
INSERT INTO device VALUES (2650, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '79520979', '2013-06-12 18:02:46.237', false, 2646);
INSERT INTO component VALUES (2651, 'B', 'E', '88681615', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 15:36:39.353', 'A4', 'green', 2650);
INSERT INTO component VALUES (2652, 'G', 'D', '61049374', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:31:05.023', 'G9', 'green', 2650);
INSERT INTO location VALUES (2653, 'EG5', 'ABS test', 'Robert Merkel', 2645);
INSERT INTO device VALUES (2654, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '50802626', '2013-06-13 10:36:02.821', true, 2653);
INSERT INTO component VALUES (2655, 'I', 'I', '2861437', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 15:57:30.776', 'I5', 'green', 2654);
INSERT INTO component VALUES (2656, 'C', 'A', '2921197', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:32:25.797', 'A4', 'green', 2654);
INSERT INTO device VALUES (2657, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '7232268', '2013-06-13 07:52:55.992', false, 2653);
INSERT INTO component VALUES (2658, 'C', 'I', '21633749', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:43:06.728', 'D8', 'green', 2657);
INSERT INTO component VALUES (2659, 'D', 'E', '61551775', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 19:40:11.325', 'A3', 'red', 2657);
INSERT INTO line VALUES (2660, 'C9 PreSeries', 'Series 4', 52, 'polygon25', 2644);
INSERT INTO location VALUES (2661, 'CE3', 'transmission test', 'Franziska Schulze', 2660);
INSERT INTO device VALUES (2662, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '52866671', '2013-06-13 13:06:21.467', false, 2661);
INSERT INTO component VALUES (2663, 'G', 'I', '88685922', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 23:56:54.213', 'F2', 'green', 2662);
INSERT INTO component VALUES (2664, 'C', 'I', '56795918', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 14:47:54.562', 'E1', 'green', 2662);
INSERT INTO device VALUES (2665, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '67530709', '2013-06-12 17:41:36.236', false, 2661);
INSERT INTO component VALUES (2666, 'D', 'H', '83905879', 'Howard Joel Wolowitz', '2013-06-13 02:19:29.661', 'F2', 'green', 2665);
INSERT INTO component VALUES (2667, 'C', 'I', '99798945', 'Howard Joel Wolowitz', '2013-06-12 13:55:53.398', 'F9', 'green', 2665);
INSERT INTO location VALUES (2668, 'IA4', 'security test', 'Sarah Merkel', 2660);
INSERT INTO device VALUES (2669, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '11499499', '2013-06-12 23:10:59.943', false, 2668);
INSERT INTO component VALUES (2670, 'D', 'H', '95400603', 'Howard Joel Wolowitz', '2013-06-12 22:50:27.747', 'H4', 'green', 2669);
INSERT INTO component VALUES (2671, 'D', 'H', '52551223', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 08:33:22.141', 'A1', 'yellow', 2669);
INSERT INTO device VALUES (2672, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '60513561', '2013-06-12 16:35:30.411', false, 2668);
INSERT INTO component VALUES (2673, 'F', 'C', '5217492', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 00:43:18.356', 'I7', 'green', 2672);
INSERT INTO component VALUES (2674, 'C', 'G', '11588191', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:37:14.104', 'F3', 'green', 2672);
INSERT INTO line VALUES (2675, 'C9 Finish', 'Series 7', 42, 'rect497', 2644);
INSERT INTO location VALUES (2676, 'IA9', 'security test', 'Robert Schmitt', 2675);
INSERT INTO device VALUES (2677, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '43245372', '2013-06-13 10:15:46.677', false, 2676);
INSERT INTO component VALUES (2678, 'H', 'F', '50157528', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:25:51.419', 'F1', 'green', 2677);
INSERT INTO component VALUES (2679, 'E', 'A', '94051463', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:33:55.224', 'A3', 'green', 2677);
INSERT INTO device VALUES (2680, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '57090191', '2013-06-12 15:04:19.578', false, 2676);
INSERT INTO component VALUES (2681, 'E', 'B', '39886607', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 18:40:02.415', 'C7', 'green', 2680);
INSERT INTO component VALUES (2682, 'G', 'F', '72100685', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 13:22:41.058', 'H3', 'green', 2680);
INSERT INTO location VALUES (2683, 'HG7', 'motor test', 'Hans Mueller', 2675);
INSERT INTO device VALUES (2684, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '75479730', '2013-06-13 08:38:20.284', false, 2683);
INSERT INTO component VALUES (2685, 'D', 'E', '88085450', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 10:25:11.534', 'A6', 'green', 2684);
INSERT INTO component VALUES (2686, 'E', 'F', '74378341', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 06:44:20.614', 'H3', 'green', 2684);
INSERT INTO device VALUES (2687, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '62150389', '2013-06-13 00:39:41.921', false, 2683);
INSERT INTO component VALUES (2688, 'D', 'C', '93184594', 'Howard Joel Wolowitz', '2013-06-13 09:20:26.114', 'A7', 'red', 2687);
INSERT INTO component VALUES (2689, 'C', 'I', '68985545', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:52:29.792', 'E1', 'green', 2687);
INSERT INTO hall VALUES (2690, 'E8', 'Assembly+Finish', 678, 1666, 'Audi A4', 2, 'polygon249', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2691, 'E8 Assembly', 'Series 3', 90, 'rect217', 2690);
INSERT INTO location VALUES (2692, 'CI5', 'transmission test', 'Sarah Merkel', 2691);
INSERT INTO device VALUES (2693, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '17543623', '2013-06-12 19:18:43.348', false, 2692);
INSERT INTO component VALUES (2694, 'I', 'E', '70809180', 'Howard Joel Wolowitz', '2013-06-13 07:12:18.84', 'B8', 'green', 2693);
INSERT INTO component VALUES (2695, 'A', 'C', '99275086', 'Howard Joel Wolowitz', '2013-06-13 00:00:57.619', 'A4', 'green', 2693);
INSERT INTO device VALUES (2696, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '92972745', '2013-06-13 08:30:43.268', false, 2692);
INSERT INTO component VALUES (2697, 'A', 'G', '71563787', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:57:18.944', 'D1', 'green', 2696);
INSERT INTO component VALUES (2698, 'I', 'B', '97274477', 'Howard Joel Wolowitz', '2013-06-12 14:39:10.842', 'F5', 'green', 2696);
INSERT INTO location VALUES (2699, 'GG9', 'security test', 'Sarah Schmitt', 2691);
INSERT INTO device VALUES (2700, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '8497767', '2013-06-13 12:39:33.133', false, 2699);
INSERT INTO component VALUES (2701, 'B', 'G', '15578513', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 13:04:36.332', 'A9', 'green', 2700);
INSERT INTO component VALUES (2702, 'B', 'I', '79456353', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:34:58.913', 'E4', 'green', 2700);
INSERT INTO device VALUES (2703, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '78818870', '2013-06-13 12:18:33.214', false, 2699);
INSERT INTO component VALUES (2704, 'I', 'B', '50646344', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 03:08:14.978', 'A4', 'green', 2703);
INSERT INTO component VALUES (2705, 'F', 'H', '44465726', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:32:16.969', 'D2', 'green', 2703);
INSERT INTO line VALUES (2706, 'E8 PreSeries', 'Series 1', 31, 'polygon25', 2690);
INSERT INTO location VALUES (2707, 'II1', 'transmission test', 'Robert Schulze', 2706);
INSERT INTO device VALUES (2708, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'B', '3869669', '2013-06-12 22:23:20.317', false, 2707);
INSERT INTO component VALUES (2709, 'E', 'C', '15841991', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 07:56:20.986', 'D4', 'green', 2708);
INSERT INTO component VALUES (2710, 'I', 'H', '63992385', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 20:03:35.498', 'H1', 'green', 2708);
INSERT INTO device VALUES (2711, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '66484712', '2013-06-12 19:10:06.665', false, 2707);
INSERT INTO component VALUES (2712, 'F', 'A', '52149258', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 00:39:54.465', 'F2', 'green', 2711);
INSERT INTO component VALUES (2713, 'C', 'G', '25765174', 'Howard Joel Wolowitz', '2013-06-13 13:04:36.402', 'I6', 'green', 2711);
INSERT INTO location VALUES (2714, 'II9', 'ABS test', 'Robert Merkel', 2706);
INSERT INTO device VALUES (2715, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '21729655', '2013-06-13 08:39:33.502', false, 2714);
INSERT INTO component VALUES (2716, 'H', 'B', '17965475', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 02:57:48.814', 'I3', 'red', 2715);
INSERT INTO component VALUES (2717, 'F', 'D', '21699915', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:58:43.033', 'B9', 'green', 2715);
INSERT INTO device VALUES (2718, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '65239633', '2013-06-13 11:22:54.645', false, 2714);
INSERT INTO component VALUES (2719, 'B', 'E', '27396525', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 15:50:23.194', 'H1', 'green', 2718);
INSERT INTO component VALUES (2720, 'F', 'C', '42228956', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 10:35:13.778', 'A8', 'green', 2718);
INSERT INTO line VALUES (2721, 'E8 Finish', 'Series 5', 47, 'rect497', 2690);
INSERT INTO location VALUES (2722, 'ED1', 'multimedia test', 'Robert Schulze', 2721);
INSERT INTO device VALUES (2723, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '47834597', '2013-06-13 10:26:56.98', true, 2722);
INSERT INTO component VALUES (2724, 'I', 'A', '66621432', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:43:39.124', 'D9', 'green', 2723);
INSERT INTO component VALUES (2725, 'C', 'G', '42483416', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 22:53:28.455', 'G6', 'green', 2723);
INSERT INTO device VALUES (2726, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '66075129', '2013-06-12 16:04:05.307', false, 2722);
INSERT INTO component VALUES (2727, 'D', 'C', '30081576', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 05:51:33.285', 'G6', 'green', 2726);
INSERT INTO component VALUES (2728, 'H', 'E', '11858201', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 08:05:16.076', 'A1', 'green', 2726);
INSERT INTO location VALUES (2729, 'GI7', 'transmission test', 'Franziska Schulze', 2721);
INSERT INTO device VALUES (2730, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '40500008', '2013-06-12 14:09:26.587', true, 2729);
INSERT INTO component VALUES (2731, 'B', 'A', '12379986', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 13:28:55.734', 'D3', 'green', 2730);
INSERT INTO component VALUES (2732, 'I', 'B', '1973514', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 22:32:17.909', 'F1', 'green', 2730);
INSERT INTO device VALUES (2733, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '38947993', '2013-06-13 02:43:46.445', false, 2729);
INSERT INTO component VALUES (2734, 'G', 'C', '27959564', 'Howard Joel Wolowitz', '2013-06-12 20:42:43.378', 'F8', 'green', 2733);
INSERT INTO component VALUES (2735, 'G', 'G', '17123288', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:54:41.132', 'A3', 'green', 2733);
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
INSERT INTO hall VALUES (2736, 'C2', 'Assembly+Finish', 796, 4839, 'Audi A4', 2, 'path369', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2737, 'C2 Assembly', 'Series 9', 59, 'rect217', 2736);
INSERT INTO location VALUES (2738, 'HF1', 'motor test', 'Hans Schmitt', 2737);
INSERT INTO device VALUES (2739, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '28810418', '2013-06-13 02:35:30.6', false, 2738);
INSERT INTO component VALUES (2740, 'D', 'B', '92142590', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 21:32:53.392', 'C1', 'green', 2739);
INSERT INTO component VALUES (2741, 'E', 'I', '7952441', 'Howard Joel Wolowitz', '2013-06-13 09:25:23.645', 'C1', 'green', 2739);
INSERT INTO device VALUES (2742, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '44741111', '2013-06-12 20:49:26.61', true, 2738);
INSERT INTO component VALUES (2743, 'E', 'C', '90894754', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:02:33.799', 'F5', 'green', 2742);
INSERT INTO component VALUES (2744, 'I', 'G', '79945152', 'Howard Joel Wolowitz', '2013-06-13 00:46:48.759', 'A6', 'green', 2742);
INSERT INTO location VALUES (2745, 'AH6', 'security test', 'Hans Merkel', 2737);
INSERT INTO device VALUES (2746, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'B', '26598732', '2013-06-13 05:36:14.887', false, 2745);
INSERT INTO component VALUES (2747, 'E', 'C', '46603928', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:38:54.631', 'I3', 'green', 2746);
INSERT INTO component VALUES (2748, 'H', 'E', '35545958', 'Howard Joel Wolowitz', '2013-06-12 20:41:13.971', 'G3', 'green', 2746);
INSERT INTO device VALUES (2749, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '56445276', '2013-06-12 18:04:16.943', false, 2745);
INSERT INTO component VALUES (2750, 'G', 'H', '13249027', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 16:08:05.033', 'C9', 'green', 2749);
INSERT INTO component VALUES (2751, 'C', 'C', '3305546', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 23:47:57.646', 'C5', 'red', 2749);
INSERT INTO line VALUES (2752, 'C2 PreSeries', 'Series 3', 83, 'polygon25', 2736);
INSERT INTO location VALUES (2753, 'GH1', 'ABS test', 'Hans Mueller', 2752);
INSERT INTO device VALUES (2754, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '70960958', '2013-06-13 07:10:26.808', false, 2753);
INSERT INTO component VALUES (2755, 'B', 'A', '214714', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 05:29:22.125', 'D1', 'green', 2754);
INSERT INTO component VALUES (2756, 'F', 'A', '12090224', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 11:58:44.798', 'A2', 'green', 2754);
INSERT INTO device VALUES (2757, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '9858539', '2013-06-12 23:58:43.387', false, 2753);
INSERT INTO component VALUES (2758, 'H', 'E', '53242949', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 07:54:35.962', 'C9', 'yellow', 2757);
INSERT INTO component VALUES (2759, 'H', 'B', '14332097', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 11:25:15.823', 'I7', 'green', 2757);
INSERT INTO location VALUES (2760, 'DF3', 'security test', 'Franziska Meier', 2752);
INSERT INTO device VALUES (2761, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '31397868', '2013-06-12 19:44:01.249', false, 2760);
INSERT INTO component VALUES (2762, 'D', 'C', '45893376', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 12:05:12.658', 'I3', 'green', 2761);
INSERT INTO component VALUES (2763, 'C', 'E', '73010466', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:38:08.435', 'E5', 'green', 2761);
INSERT INTO device VALUES (2764, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '99991849', '2013-06-12 14:26:53.235', false, 2760);
INSERT INTO component VALUES (2765, 'B', 'E', '77439870', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 21:14:43.645', 'I2', 'green', 2764);
INSERT INTO component VALUES (2766, 'G', 'E', '42153865', 'Howard Joel Wolowitz', '2013-06-12 18:52:54.28', 'I5', 'green', 2764);
INSERT INTO line VALUES (2767, 'C2 Finish', 'Series 1', 3, 'rect497', 2736);
INSERT INTO location VALUES (2768, 'AI1', 'transmission test', 'Robert Merkel', 2767);
INSERT INTO device VALUES (2769, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '92010516', '2013-06-12 17:31:03.485', false, 2768);
INSERT INTO component VALUES (2770, 'H', 'I', '69370838', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:52:08.457', 'E1', 'green', 2769);
INSERT INTO component VALUES (2771, 'D', 'A', '26224740', 'Howard Joel Wolowitz', '2013-06-12 18:46:55.663', 'F5', 'green', 2769);
INSERT INTO device VALUES (2772, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '30058673', '2013-06-13 10:03:08.179', false, 2768);
INSERT INTO component VALUES (2773, 'I', 'H', '29447773', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 20:44:33.754', 'E2', 'green', 2772);
INSERT INTO component VALUES (2774, 'H', 'B', '33185135', 'Howard Joel Wolowitz', '2013-06-12 16:51:20.451', 'D7', 'green', 2772);
INSERT INTO location VALUES (2775, 'IE7', 'security test', 'Hans Merkel', 2767);
INSERT INTO device VALUES (2776, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '68130021', '2013-06-12 17:07:14.304', false, 2775);
INSERT INTO component VALUES (2777, 'C', 'B', '49524247', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:43:19.954', 'D7', 'red', 2776);
INSERT INTO component VALUES (2778, 'A', 'B', '50173621', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 16:23:05.676', 'H8', 'green', 2776);
INSERT INTO device VALUES (2779, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '63140603', '2013-06-12 16:30:23.654', false, 2775);
INSERT INTO component VALUES (2780, 'G', 'D', '82872955', 'Howard Joel Wolowitz', '2013-06-12 15:40:18.992', 'E6', 'green', 2779);
INSERT INTO component VALUES (2781, 'C', 'D', '59143489', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 08:27:01.964', 'H6', 'green', 2779);
INSERT INTO hall VALUES (2782, 'E7', 'Assembly+Finish', 726, 9137, 'Audi A4', 2, 'polygon249', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2783, 'E7 Assembly', 'Series 2', 30, 'rect217', 2782);
INSERT INTO location VALUES (2784, 'CD9', 'transmission test', 'Hans Merkel', 2783);
INSERT INTO device VALUES (2785, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '57741483', '2013-06-13 09:04:55.877', false, 2784);
INSERT INTO component VALUES (2786, 'H', 'F', '92356585', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 13:38:37.362', 'I7', 'green', 2785);
INSERT INTO component VALUES (2787, 'G', 'G', '82927714', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 00:30:44.747', 'A2', 'green', 2785);
INSERT INTO device VALUES (2788, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '60089407', '2013-06-13 13:07:48.495', true, 2784);
INSERT INTO component VALUES (2789, 'G', 'G', '9668947', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 21:40:55.897', 'D5', 'green', 2788);
INSERT INTO component VALUES (2790, 'I', 'I', '60352923', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 14:26:53.048', 'A3', 'green', 2788);
INSERT INTO location VALUES (2791, 'CE1', 'multimedia test', 'Robert Merkel', 2783);
INSERT INTO device VALUES (2792, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '41396217', '2013-06-12 21:51:11.336', false, 2791);
INSERT INTO component VALUES (2793, 'I', 'A', '58919695', 'Howard Joel Wolowitz', '2013-06-13 06:46:45.131', 'C6', 'green', 2792);
INSERT INTO component VALUES (2794, 'D', 'D', '3985087', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 22:42:04.625', 'G4', 'green', 2792);
INSERT INTO device VALUES (2795, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '54456869', '2013-06-13 07:07:48.319', false, 2791);
INSERT INTO component VALUES (2796, 'B', 'B', '71086962', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:46:14.305', 'D8', 'green', 2795);
INSERT INTO component VALUES (2797, 'H', 'E', '61074007', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 03:19:24.233', 'A3', 'green', 2795);
INSERT INTO line VALUES (2798, 'E7 PreSeries', 'Series 8', 80, 'polygon25', 2782);
INSERT INTO location VALUES (2799, 'EG5', 'motor test', 'Sarah Schulze', 2798);
INSERT INTO device VALUES (2800, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '61312889', '2013-06-13 01:30:22.25', false, 2799);
INSERT INTO component VALUES (2801, 'H', 'B', '78127158', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:06:34.927', 'I8', 'red', 2800);
INSERT INTO component VALUES (2802, 'H', 'C', '43085013', 'Howard Joel Wolowitz', '2013-06-12 15:10:52.876', 'D8', 'green', 2800);
INSERT INTO device VALUES (2803, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '93795422', '2013-06-13 11:57:48.495', false, 2799);
INSERT INTO component VALUES (2804, 'G', 'E', '5871568', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:19:07.973', 'G5', 'green', 2803);
INSERT INTO component VALUES (2805, 'A', 'H', '77116559', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 02:19:49.869', 'E3', 'green', 2803);
INSERT INTO location VALUES (2806, 'DF7', 'motor test', 'Peter Merkel', 2798);
INSERT INTO device VALUES (2807, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '18371006', '2013-06-12 20:36:55.702', false, 2806);
INSERT INTO component VALUES (2808, 'E', 'I', '47442681', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 23:58:22.137', 'B6', 'green', 2807);
INSERT INTO component VALUES (2809, 'B', 'F', '76423145', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 09:58:11.616', 'C2', 'green', 2807);
INSERT INTO device VALUES (2810, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'F', '43165245', '2013-06-13 05:53:03.962', true, 2806);
INSERT INTO component VALUES (2811, 'G', 'G', '71223033', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 17:47:16.221', 'G5', 'green', 2810);
INSERT INTO component VALUES (2812, 'A', 'G', '4159565', 'Howard Joel Wolowitz', '2013-06-13 11:53:30.683', 'C3', 'green', 2810);
INSERT INTO line VALUES (2813, 'E7 Finish', 'Series 4', 54, 'rect497', 2782);
INSERT INTO location VALUES (2814, 'BA9', 'motor test', 'Hans Schulze', 2813);
INSERT INTO device VALUES (2815, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '51359909', '2013-06-12 16:17:20.728', false, 2814);
INSERT INTO component VALUES (2816, 'H', 'G', '87214824', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 16:07:56.792', 'F9', 'yellow', 2815);
INSERT INTO component VALUES (2817, 'D', 'F', '95929561', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-13 01:40:36.021', 'F3', 'green', 2815);
INSERT INTO device VALUES (2818, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '1054457', '2013-06-12 18:45:08.263', false, 2814);
INSERT INTO component VALUES (2819, 'E', 'A', '78667415', 'Howard Joel Wolowitz', '2013-06-13 09:30:56.488', 'I4', 'green', 2818);
INSERT INTO component VALUES (2820, 'G', 'I', '51111812', 'Dr. Leonard Leakey Hofstadter', '2013-06-13 00:23:12.411', 'A4', 'yellow', 2818);
INSERT INTO location VALUES (2821, 'HG7', 'ABS test', 'Sarah Schmitt', 2813);
INSERT INTO device VALUES (2822, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '10327353', '2013-06-12 22:24:09.166', true, 2821);
INSERT INTO component VALUES (2823, 'B', 'B', '91948191', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 17:29:07.115', 'H3', 'green', 2822);
INSERT INTO component VALUES (2824, 'I', 'A', '41641095', 'Howard Joel Wolowitz', '2013-06-13 09:18:12.948', 'C8', 'green', 2822);
INSERT INTO device VALUES (2825, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '5369254', '2013-06-13 08:30:48.323', false, 2821);
INSERT INTO component VALUES (2826, 'E', 'E', '2080860', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-13 12:04:25.255', 'E2', 'green', 2825);
INSERT INTO component VALUES (2827, 'G', 'H', '40928447', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 14:05:47.478', 'G8', 'green', 2825);
