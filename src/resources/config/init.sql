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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2000, 'E4', 'Assembly+Finish', 944, 7713, 'Audi A4', 2, 'path369', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2001, 'E4 Assembly', 'Series 2', 2, 'rect217', 2000);
INSERT INTO location VALUES (2002, 'BG3', 'multimedia test', 'Robert Merkel', 2001);
INSERT INTO device VALUES (2003, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '97888970', '2013-06-11 21:41:21.997', false, 2002);
INSERT INTO component VALUES (2004, 'C', 'B', '77304949', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 14:14:50.578', 'I2', 'green', 2003);
INSERT INTO component VALUES (2005, 'B', 'C', '17914480', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:18:51.815', 'E8', 'yellow', 2003);
INSERT INTO device VALUES (2006, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '90356124', '2013-06-11 11:00:15.31', false, 2002);
INSERT INTO component VALUES (2007, 'B', 'C', '10247598', 'Howard Joel Wolowitz', '2013-06-11 13:27:46.541', 'G5', 'green', 2006);
INSERT INTO component VALUES (2008, 'G', 'G', '5017869', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:42:37.472', 'C4', 'green', 2006);
INSERT INTO location VALUES (2009, 'EF6', 'motor test', 'Peter Mueller', 2001);
INSERT INTO device VALUES (2010, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '67917135', '2013-06-12 03:14:49.803', false, 2009);
INSERT INTO component VALUES (2011, 'B', 'H', '7445370', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 00:32:48.499', 'E9', 'red', 2010);
INSERT INTO component VALUES (2012, 'D', 'B', '70912907', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 15:44:36.346', 'C2', 'green', 2010);
INSERT INTO device VALUES (2013, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '26499902', '2013-06-11 10:26:37.517', false, 2009);
INSERT INTO component VALUES (2014, 'G', 'B', '85706645', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 11:45:16.193', 'E8', 'green', 2013);
INSERT INTO component VALUES (2015, 'F', 'C', '32391051', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 15:48:31.588', 'G1', 'green', 2013);
INSERT INTO line VALUES (2016, 'E4 PreSeries', 'Series 2', 87, 'polygon25', 2000);
INSERT INTO location VALUES (2017, 'AG5', 'ABS test', 'Robert Merkel', 2016);
INSERT INTO device VALUES (2018, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '961698', '2013-06-11 06:46:22.017', false, 2017);
INSERT INTO component VALUES (2019, 'I', 'G', '97465170', 'Howard Joel Wolowitz', '2013-06-11 19:23:48.453', 'A9', 'green', 2018);
INSERT INTO component VALUES (2020, 'G', 'I', '16109446', 'Howard Joel Wolowitz', '2013-06-12 02:10:33.542', 'G9', 'green', 2018);
INSERT INTO device VALUES (2021, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '77399161', '2013-06-11 07:39:08.064', false, 2017);
INSERT INTO component VALUES (2022, 'D', 'F', '48973872', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:46:53.343', 'C3', 'green', 2021);
INSERT INTO component VALUES (2023, 'B', 'B', '76099655', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:18:15.319', 'C6', 'green', 2021);
INSERT INTO location VALUES (2024, 'HF9', 'multimedia test', 'Hans Meier', 2016);
INSERT INTO device VALUES (2025, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '225421', '2013-06-11 05:47:36.931', false, 2024);
INSERT INTO component VALUES (2026, 'H', 'G', '82232058', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 14:15:19.036', 'G9', 'red', 2025);
INSERT INTO component VALUES (2027, 'A', 'G', '27542358', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:30:27.237', 'B1', 'green', 2025);
INSERT INTO device VALUES (2028, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '64234277', '2013-06-12 00:09:24.138', false, 2024);
INSERT INTO component VALUES (2029, 'E', 'I', '57629503', 'Howard Joel Wolowitz', '2013-06-11 10:31:47.901', 'H5', 'green', 2028);
INSERT INTO component VALUES (2030, 'F', 'E', '76131451', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 23:17:46.717', 'C5', 'green', 2028);
INSERT INTO line VALUES (2031, 'E4 Finish', 'Series 5', 32, 'rect497', 2000);
INSERT INTO location VALUES (2032, 'CH5', 'security test', 'Robert Mueller', 2031);
INSERT INTO device VALUES (2033, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'I', '39910137', '2013-06-12 03:27:38.353', false, 2032);
INSERT INTO component VALUES (2034, 'H', 'C', '56789116', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 19:07:11.876', 'F2', 'green', 2033);
INSERT INTO component VALUES (2035, 'H', 'H', '82134604', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 06:43:06.281', 'D7', 'green', 2033);
INSERT INTO device VALUES (2036, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'C', '85769529', '2013-06-11 22:14:47.194', false, 2032);
INSERT INTO component VALUES (2037, 'A', 'E', '6125276', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 01:03:42.928', 'B4', 'green', 2036);
INSERT INTO component VALUES (2038, 'I', 'H', '62161534', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 06:25:55.825', 'D4', 'green', 2036);
INSERT INTO location VALUES (2039, 'IA7', 'security test', 'Hans Merkel', 2031);
INSERT INTO device VALUES (2040, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '93486604', '2013-06-11 04:46:35.193', false, 2039);
INSERT INTO component VALUES (2041, 'D', 'G', '926235', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:53:42.443', 'I5', 'green', 2040);
INSERT INTO component VALUES (2042, 'F', 'I', '76761672', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:19:56.415', 'I1', 'green', 2040);
INSERT INTO device VALUES (2043, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '17223939', '2013-06-11 22:08:54.612', false, 2039);
INSERT INTO component VALUES (2044, 'F', 'A', '78174504', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 07:32:29.34', 'I7', 'green', 2043);
INSERT INTO component VALUES (2045, 'H', 'E', '48512352', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 07:36:47.284', 'B7', 'green', 2043);
INSERT INTO hall VALUES (2046, 'I6', 'Assembly+Finish', 264, 7071, 'Audi A4', 2, 'polygon249', 1, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2047, 'I6 Assembly', 'Series 6', 14, 'rect217', 2046);
INSERT INTO location VALUES (2048, 'HA3', 'motor test', 'Franziska Mueller', 2047);
INSERT INTO device VALUES (2049, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '95356394', '2013-06-11 14:31:35.968', false, 2048);
INSERT INTO component VALUES (2050, 'F', 'E', '89100351', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 03:36:18.122', 'H1', 'green', 2049);
INSERT INTO component VALUES (2051, 'H', 'G', '83633009', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:22:57.952', 'A9', 'green', 2049);
INSERT INTO device VALUES (2052, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '32768618', '2013-06-12 02:38:32.435', false, 2048);
INSERT INTO component VALUES (2053, 'D', 'G', '2538627', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:47:06.289', 'C8', 'green', 2052);
INSERT INTO component VALUES (2054, 'H', 'D', '66099685', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:43:59.611', 'A3', 'green', 2052);
INSERT INTO location VALUES (2055, 'CI3', 'multimedia test', 'Sarah Schmitt', 2047);
INSERT INTO device VALUES (2056, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '3272091', '2013-06-11 16:52:16.102', false, 2055);
INSERT INTO component VALUES (2057, 'H', 'A', '31052177', 'Howard Joel Wolowitz', '2013-06-11 23:33:56.361', 'H9', 'green', 2056);
INSERT INTO component VALUES (2058, 'F', 'D', '69854622', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 11:29:46.467', 'F1', 'green', 2056);
INSERT INTO device VALUES (2059, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '32673651', '2013-06-11 06:21:43.0', false, 2055);
INSERT INTO component VALUES (2060, 'D', 'B', '30831106', 'Howard Joel Wolowitz', '2013-06-11 11:24:41.697', 'B1', 'green', 2059);
INSERT INTO component VALUES (2061, 'B', 'E', '78830305', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:08:44.905', 'C3', 'yellow', 2059);
INSERT INTO line VALUES (2062, 'I6 PreSeries', 'Series 1', 8, 'polygon25', 2046);
INSERT INTO location VALUES (2063, 'EF2', 'transmission test', 'Franziska Merkel', 2062);
INSERT INTO device VALUES (2064, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '81985056', '2013-06-12 00:15:16.214', true, 2063);
INSERT INTO component VALUES (2065, 'A', 'F', '4017369', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 04:57:20.972', 'F7', 'green', 2064);
INSERT INTO component VALUES (2066, 'F', 'B', '9888937', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 19:20:28.73', 'A5', 'green', 2064);
INSERT INTO device VALUES (2067, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '38626576', '2013-06-11 23:33:00.212', false, 2063);
INSERT INTO component VALUES (2068, 'B', 'I', '84540068', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 12:35:06.805', 'F5', 'yellow', 2067);
INSERT INTO component VALUES (2069, 'H', 'D', '65991114', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 10:27:17.07', 'G7', 'yellow', 2067);
INSERT INTO location VALUES (2070, 'DF8', 'multimedia test', 'Robert Meier', 2062);
INSERT INTO device VALUES (2071, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '91814387', '2013-06-11 15:18:04.936', false, 2070);
INSERT INTO component VALUES (2072, 'B', 'A', '95115683', 'Howard Joel Wolowitz', '2013-06-11 17:52:30.757', 'E4', 'green', 2071);
INSERT INTO component VALUES (2073, 'D', 'D', '6404996', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 07:43:39.512', 'E7', 'green', 2071);
INSERT INTO device VALUES (2074, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '21473019', '2013-06-11 09:01:05.818', false, 2070);
INSERT INTO component VALUES (2075, 'B', 'H', '71049247', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 19:33:33.195', 'F5', 'green', 2074);
INSERT INTO component VALUES (2076, 'G', 'H', '61653797', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 02:14:24.484', 'C3', 'green', 2074);
INSERT INTO line VALUES (2077, 'I6 Finish', 'Series 7', 14, 'rect497', 2046);
INSERT INTO location VALUES (2078, 'FB3', 'security test', 'Sarah Merkel', 2077);
INSERT INTO device VALUES (2079, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '34695543', '2013-06-11 13:45:07.482', false, 2078);
INSERT INTO component VALUES (2080, 'C', 'I', '70990561', 'Howard Joel Wolowitz', '2013-06-11 16:58:28.286', 'H9', 'green', 2079);
INSERT INTO component VALUES (2081, 'A', 'H', '2993770', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 04:46:49.795', 'I7', 'green', 2079);
INSERT INTO device VALUES (2082, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '57879166', '2013-06-12 01:27:42.56', false, 2078);
INSERT INTO component VALUES (2083, 'D', 'E', '41523681', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:48:28.252', 'D5', 'green', 2082);
INSERT INTO component VALUES (2084, 'F', 'I', '70938784', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 08:47:46.735', 'C3', 'green', 2082);
INSERT INTO location VALUES (2085, 'HG1', 'transmission test', 'Hans Schulze', 2077);
INSERT INTO device VALUES (2086, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '7534401', '2013-06-11 19:50:05.017', false, 2085);
INSERT INTO component VALUES (2087, 'H', 'E', '66131440', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 03:52:52.989', 'G4', 'green', 2086);
INSERT INTO component VALUES (2088, 'A', 'I', '61874786', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 10:58:49.022', 'H5', 'red', 2086);
INSERT INTO device VALUES (2089, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '36405118', '2013-06-11 12:59:52.123', false, 2085);
INSERT INTO component VALUES (2090, 'H', 'A', '77101924', 'Howard Joel Wolowitz', '2013-06-11 17:06:12.197', 'H1', 'green', 2089);
INSERT INTO component VALUES (2091, 'B', 'A', '49601689', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 15:22:29.304', 'H2', 'red', 2089);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2092, 'G5', 'Assembly+Finish', 242, 8787, 'Audi A4', 2, 'path369', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2093, 'G5 Assembly', 'Series 2', 4, 'rect217', 2092);
INSERT INTO location VALUES (2094, 'BI2', 'motor test', 'Peter Schulze', 2093);
INSERT INTO device VALUES (2095, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '45868670', '2013-06-11 05:49:08.396', true, 2094);
INSERT INTO component VALUES (2096, 'G', 'H', '97145115', 'Howard Joel Wolowitz', '2013-06-12 02:35:17.646', 'H3', 'yellow', 2095);
INSERT INTO component VALUES (2097, 'G', 'E', '69013604', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 20:49:49.026', 'A2', 'green', 2095);
INSERT INTO device VALUES (2098, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '3137650', '2013-06-11 22:56:49.392', false, 2094);
INSERT INTO component VALUES (2099, 'F', 'C', '68201035', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:30:01.038', 'G6', 'green', 2098);
INSERT INTO component VALUES (2100, 'E', 'D', '22361857', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:21:31.005', 'F2', 'green', 2098);
INSERT INTO location VALUES (2101, 'CA8', 'motor test', 'Robert Meier', 2093);
INSERT INTO device VALUES (2102, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '67112820', '2013-06-11 10:48:13.325', false, 2101);
INSERT INTO component VALUES (2103, 'F', 'I', '42139242', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 07:26:13.055', 'B7', 'green', 2102);
INSERT INTO component VALUES (2104, 'D', 'A', '36791476', 'Howard Joel Wolowitz', '2013-06-11 10:55:09.272', 'I6', 'green', 2102);
INSERT INTO device VALUES (2105, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '59662287', '2013-06-12 03:10:53.768', false, 2101);
INSERT INTO component VALUES (2106, 'C', 'I', '12382760', 'Howard Joel Wolowitz', '2013-06-11 15:22:14.587', 'A5', 'green', 2105);
INSERT INTO component VALUES (2107, 'I', 'H', '98781242', 'Howard Joel Wolowitz', '2013-06-11 19:36:37.708', 'D8', 'green', 2105);
INSERT INTO line VALUES (2108, 'G5 PreSeries', 'Series 6', 57, 'polygon25', 2092);
INSERT INTO location VALUES (2109, 'GE4', 'security test', 'Franziska Mueller', 2108);
INSERT INTO device VALUES (2110, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'B', '94264082', '2013-06-11 15:09:39.188', false, 2109);
INSERT INTO component VALUES (2111, 'E', 'A', '13596234', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 03:45:33.459', 'G2', 'green', 2110);
INSERT INTO component VALUES (2112, 'B', 'E', '23824156', 'Howard Joel Wolowitz', '2013-06-11 21:32:59.209', 'H7', 'green', 2110);
INSERT INTO device VALUES (2113, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '64383188', '2013-06-11 04:38:21.975', false, 2109);
INSERT INTO component VALUES (2114, 'H', 'G', '78737361', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 13:11:40.845', 'A3', 'green', 2113);
INSERT INTO component VALUES (2115, 'I', 'D', '89854893', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:23:54.429', 'D3', 'green', 2113);
INSERT INTO location VALUES (2116, 'HC1', 'transmission test', 'Peter Mueller', 2108);
INSERT INTO device VALUES (2117, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '3550155', '2013-06-11 05:02:39.812', true, 2116);
INSERT INTO component VALUES (2118, 'F', 'F', '28305262', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:04:36.967', 'D1', 'green', 2117);
INSERT INTO component VALUES (2119, 'I', 'E', '63730070', 'Howard Joel Wolowitz', '2013-06-11 11:33:55.103', 'A5', 'green', 2117);
INSERT INTO device VALUES (2120, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '78018237', '2013-06-11 22:12:20.707', false, 2116);
INSERT INTO component VALUES (2121, 'H', 'B', '59193757', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 17:01:27.855', 'E8', 'green', 2120);
INSERT INTO component VALUES (2122, 'C', 'E', '71484281', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 08:12:57.388', 'H9', 'yellow', 2120);
INSERT INTO line VALUES (2123, 'G5 Finish', 'Series 6', 91, 'rect497', 2092);
INSERT INTO location VALUES (2124, 'GA4', 'ABS test', 'Hans Meier', 2123);
INSERT INTO device VALUES (2125, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '86581065', '2013-06-11 21:36:42.766', false, 2124);
INSERT INTO component VALUES (2126, 'H', 'A', '19322245', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 01:38:50.653', 'A2', 'green', 2125);
INSERT INTO component VALUES (2127, 'D', 'H', '8635986', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 21:44:17.771', 'I1', 'green', 2125);
INSERT INTO device VALUES (2128, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '42140728', '2013-06-11 17:08:39.687', false, 2124);
INSERT INTO component VALUES (2129, 'B', 'D', '3543045', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 00:30:47.105', 'I3', 'green', 2128);
INSERT INTO component VALUES (2130, 'H', 'H', '78988098', 'Howard Joel Wolowitz', '2013-06-11 13:17:04.604', 'I7', 'green', 2128);
INSERT INTO location VALUES (2131, 'GE1', 'motor test', 'Franziska Merkel', 2123);
INSERT INTO device VALUES (2132, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '54817990', '2013-06-12 01:53:01.762', false, 2131);
INSERT INTO component VALUES (2133, 'C', 'I', '58648653', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 03:54:22.754', 'F3', 'green', 2132);
INSERT INTO component VALUES (2134, 'C', 'E', '99025237', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 02:39:07.47', 'I1', 'green', 2132);
INSERT INTO device VALUES (2135, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '71940145', '2013-06-12 02:01:36.66', false, 2131);
INSERT INTO component VALUES (2136, 'H', 'H', '38248524', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 01:18:56.804', 'C1', 'green', 2135);
INSERT INTO component VALUES (2137, 'C', 'D', '51546765', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 17:52:18.971', 'E3', 'green', 2135);
INSERT INTO hall VALUES (2138, 'D9', 'Assembly+Finish', 989, 2176, 'Audi A4', 2, 'polygon249', 2, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2139, 'D9 Assembly', 'Series 5', 57, 'rect217', 2138);
INSERT INTO location VALUES (2140, 'DI3', 'multimedia test', 'Hans Schulze', 2139);
INSERT INTO device VALUES (2141, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '48978112', '2013-06-11 05:51:58.427', false, 2140);
INSERT INTO component VALUES (2142, 'B', 'C', '93913640', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 04:28:41.807', 'E7', 'green', 2141);
INSERT INTO component VALUES (2143, 'G', 'B', '6761185', 'Howard Joel Wolowitz', '2013-06-11 04:07:34.3', 'G7', 'green', 2141);
INSERT INTO device VALUES (2144, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '23026685', '2013-06-11 05:33:04.069', false, 2140);
INSERT INTO component VALUES (2145, 'D', 'E', '9716870', 'Howard Joel Wolowitz', '2013-06-12 01:20:37.99', 'C3', 'green', 2144);
INSERT INTO component VALUES (2146, 'A', 'B', '3135093', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 20:32:41.585', 'I5', 'green', 2144);
INSERT INTO location VALUES (2147, 'GE5', 'multimedia test', 'Franziska Meier', 2139);
INSERT INTO device VALUES (2148, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '97936954', '2013-06-11 19:29:14.661', false, 2147);
INSERT INTO component VALUES (2149, 'G', 'B', '78788088', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 10:26:01.399', 'F5', 'green', 2148);
INSERT INTO component VALUES (2150, 'B', 'C', '61032361', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 17:49:04.029', 'A7', 'green', 2148);
INSERT INTO device VALUES (2151, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'F', '80129858', '2013-06-12 02:45:25.163', true, 2147);
INSERT INTO component VALUES (2152, 'A', 'H', '98106899', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:34:14.656', 'G9', 'green', 2151);
INSERT INTO component VALUES (2153, 'I', 'F', '32520859', 'Howard Joel Wolowitz', '2013-06-11 03:43:18.046', 'A6', 'green', 2151);
INSERT INTO line VALUES (2154, 'D9 PreSeries', 'Series 6', 32, 'polygon25', 2138);
INSERT INTO location VALUES (2155, 'AI7', 'security test', 'Franziska Mueller', 2154);
INSERT INTO device VALUES (2156, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '83295261', '2013-06-12 00:12:24.13', false, 2155);
INSERT INTO component VALUES (2157, 'I', 'G', '33632772', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 05:16:37.635', 'I4', 'green', 2156);
INSERT INTO component VALUES (2158, 'A', 'I', '3808438', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 14:06:22.01', 'B9', 'green', 2156);
INSERT INTO device VALUES (2159, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '41317583', '2013-06-12 02:13:20.215', false, 2155);
INSERT INTO component VALUES (2160, 'H', 'C', '75184740', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 21:24:56.173', 'G2', 'green', 2159);
INSERT INTO component VALUES (2161, 'C', 'B', '67425158', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 03:16:03.73', 'D3', 'green', 2159);
INSERT INTO location VALUES (2162, 'DF4', 'multimedia test', 'Sarah Merkel', 2154);
INSERT INTO device VALUES (2163, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '92539535', '2013-06-11 20:36:39.722', false, 2162);
INSERT INTO component VALUES (2164, 'C', 'I', '40339638', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 22:26:22.089', 'F8', 'red', 2163);
INSERT INTO component VALUES (2165, 'G', 'B', '38413051', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:02:56.314', 'I7', 'green', 2163);
INSERT INTO device VALUES (2166, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '67232501', '2013-06-11 16:20:48.859', false, 2162);
INSERT INTO component VALUES (2167, 'E', 'D', '86032920', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 23:33:53.795', 'I1', 'green', 2166);
INSERT INTO component VALUES (2168, 'F', 'E', '66520937', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 00:51:48.835', 'I4', 'green', 2166);
INSERT INTO line VALUES (2169, 'D9 Finish', 'Series 3', 26, 'rect497', 2138);
INSERT INTO location VALUES (2170, 'CH5', 'security test', 'Peter Mueller', 2169);
INSERT INTO device VALUES (2171, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '49581350', '2013-06-11 12:26:11.092', true, 2170);
INSERT INTO component VALUES (2172, 'G', 'B', '35295577', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 15:02:58.053', 'D7', 'green', 2171);
INSERT INTO component VALUES (2173, 'E', 'E', '56846039', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 05:18:10.141', 'B9', 'green', 2171);
INSERT INTO device VALUES (2174, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'A', '97436329', '2013-06-11 08:26:45.498', false, 2170);
INSERT INTO component VALUES (2175, 'D', 'G', '24234767', 'Howard Joel Wolowitz', '2013-06-11 17:40:37.969', 'F8', 'green', 2174);
INSERT INTO component VALUES (2176, 'A', 'F', '1552610', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 14:26:44.284', 'C8', 'green', 2174);
INSERT INTO location VALUES (2177, 'CD2', 'transmission test', 'Peter Mueller', 2169);
INSERT INTO device VALUES (2178, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '93720691', '2013-06-11 06:44:41.573', false, 2177);
INSERT INTO component VALUES (2179, 'H', 'B', '93879155', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 22:22:19.836', 'E6', 'green', 2178);
INSERT INTO component VALUES (2180, 'F', 'G', '79117705', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 06:14:28.736', 'G4', 'green', 2178);
INSERT INTO device VALUES (2181, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '50024289', '2013-06-11 04:20:35.418', false, 2177);
INSERT INTO component VALUES (2182, 'G', 'D', '98617776', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 19:07:15.94', 'B9', 'green', 2181);
INSERT INTO component VALUES (2183, 'F', 'F', '40841139', 'Howard Joel Wolowitz', '2013-06-11 11:11:21.085', 'C2', 'green', 2181);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2184, 'B4', 'Assembly+Finish', 101, 5368, 'Audi A4', 2, 'path369', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2185, 'B4 Assembly', 'Series 2', 80, 'rect217', 2184);
INSERT INTO location VALUES (2186, 'HE6', 'multimedia test', 'Sarah Meier', 2185);
INSERT INTO device VALUES (2187, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '68401138', '2013-06-11 06:35:15.268', false, 2186);
INSERT INTO component VALUES (2188, 'D', 'G', '52026358', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 00:48:12.875', 'E6', 'green', 2187);
INSERT INTO component VALUES (2189, 'D', 'G', '36463662', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 00:47:37.012', 'B3', 'green', 2187);
INSERT INTO device VALUES (2190, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '37451357', '2013-06-11 06:17:22.141', false, 2186);
INSERT INTO component VALUES (2191, 'E', 'A', '2978101', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 15:47:42.304', 'A5', 'green', 2190);
INSERT INTO component VALUES (2192, 'I', 'B', '20748976', 'Howard Joel Wolowitz', '2013-06-11 15:49:34.81', 'C8', 'green', 2190);
INSERT INTO location VALUES (2193, 'HC8', 'security test', 'Hans Schmitt', 2185);
INSERT INTO device VALUES (2194, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '38296924', '2013-06-11 20:46:10.66', false, 2193);
INSERT INTO component VALUES (2195, 'D', 'F', '62482164', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 18:00:53.147', 'B4', 'green', 2194);
INSERT INTO component VALUES (2196, 'A', 'D', '15816024', 'Howard Joel Wolowitz', '2013-06-12 02:41:03.35', 'E6', 'green', 2194);
INSERT INTO device VALUES (2197, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '70153606', '2013-06-12 03:12:18.51', false, 2193);
INSERT INTO component VALUES (2198, 'I', 'A', '98705382', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 18:51:22.46', 'H9', 'green', 2197);
INSERT INTO component VALUES (2199, 'F', 'I', '46177740', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 01:41:15.586', 'H4', 'green', 2197);
INSERT INTO line VALUES (2200, 'B4 PreSeries', 'Series 6', 94, 'polygon25', 2184);
INSERT INTO location VALUES (2201, 'AD8', 'ABS test', 'Sarah Mueller', 2200);
INSERT INTO device VALUES (2202, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '83888813', '2013-06-11 19:53:02.393', false, 2201);
INSERT INTO component VALUES (2203, 'B', 'G', '5921659', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 06:55:28.266', 'B5', 'green', 2202);
INSERT INTO component VALUES (2204, 'B', 'D', '22709650', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 12:48:00.833', 'F6', 'green', 2202);
INSERT INTO device VALUES (2205, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '39557356', '2013-06-11 06:06:29.121', false, 2201);
INSERT INTO component VALUES (2206, 'I', 'A', '51942258', 'Howard Joel Wolowitz', '2013-06-12 01:32:57.505', 'C9', 'green', 2205);
INSERT INTO component VALUES (2207, 'D', 'B', '92168367', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 23:59:18.422', 'I8', 'green', 2205);
INSERT INTO location VALUES (2208, 'GB7', 'security test', 'Franziska Schmitt', 2200);
INSERT INTO device VALUES (2209, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '88209768', '2013-06-11 11:05:01.996', true, 2208);
INSERT INTO component VALUES (2210, 'C', 'A', '55876347', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 20:19:53.04', 'F6', 'green', 2209);
INSERT INTO component VALUES (2211, 'C', 'F', '2644472', 'Howard Joel Wolowitz', '2013-06-11 22:14:01.017', 'G4', 'green', 2209);
INSERT INTO device VALUES (2212, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '49655812', '2013-06-11 12:17:04.998', false, 2208);
INSERT INTO component VALUES (2213, 'B', 'H', '71935092', 'Howard Joel Wolowitz', '2013-06-12 01:37:28.978', 'G2', 'green', 2212);
INSERT INTO component VALUES (2214, 'I', 'G', '41811128', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 05:14:36.105', 'E6', 'green', 2212);
INSERT INTO line VALUES (2215, 'B4 Finish', 'Series 8', 6, 'rect497', 2184);
INSERT INTO location VALUES (2216, 'GH4', 'multimedia test', 'Robert Merkel', 2215);
INSERT INTO device VALUES (2217, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '23528758', '2013-06-11 15:31:14.726', false, 2216);
INSERT INTO component VALUES (2218, 'F', 'C', '65081044', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 05:22:11.209', 'G5', 'yellow', 2217);
INSERT INTO component VALUES (2219, 'A', 'F', '10329295', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 04:43:55.927', 'B4', 'green', 2217);
INSERT INTO device VALUES (2220, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '57120365', '2013-06-11 21:14:40.907', false, 2216);
INSERT INTO component VALUES (2221, 'H', 'A', '59612745', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 02:46:19.726', 'I3', 'green', 2220);
INSERT INTO component VALUES (2222, 'E', 'G', '63178728', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:20:56.146', 'D5', 'yellow', 2220);
INSERT INTO location VALUES (2223, 'ED1', 'security test', 'Robert Meier', 2215);
INSERT INTO device VALUES (2224, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '28771056', '2013-06-11 21:42:50.224', false, 2223);
INSERT INTO component VALUES (2225, 'I', 'A', '32983036', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 04:49:39.584', 'H2', 'green', 2224);
INSERT INTO component VALUES (2226, 'B', 'H', '46144576', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 00:14:58.885', 'A2', 'green', 2224);
INSERT INTO device VALUES (2227, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '19298291', '2013-06-12 03:31:15.887', false, 2223);
INSERT INTO component VALUES (2228, 'E', 'E', '61268757', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:00:13.373', 'E3', 'green', 2227);
INSERT INTO component VALUES (2229, 'G', 'I', '47600894', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 15:51:01.262', 'E1', 'green', 2227);
INSERT INTO hall VALUES (2230, 'C7', 'Assembly+Finish', 660, 5250, 'Audi A4', 2, 'polygon249', 3, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2231, 'C7 Assembly', 'Series 6', 23, 'rect217', 2230);
INSERT INTO location VALUES (2232, 'HF8', 'motor test', 'Peter Merkel', 2231);
INSERT INTO device VALUES (2233, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '11704897', '2013-06-11 05:29:30.331', false, 2232);
INSERT INTO component VALUES (2234, 'I', 'H', '5318492', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 18:27:16.841', 'D4', 'green', 2233);
INSERT INTO component VALUES (2235, 'D', 'D', '9076618', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 17:02:18.662', 'A9', 'green', 2233);
INSERT INTO device VALUES (2236, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '37990938', '2013-06-12 03:23:54.531', false, 2232);
INSERT INTO component VALUES (2237, 'G', 'C', '92449231', 'Howard Joel Wolowitz', '2013-06-11 12:24:59.145', 'H3', 'red', 2236);
INSERT INTO component VALUES (2238, 'E', 'D', '20942268', 'Howard Joel Wolowitz', '2013-06-12 02:54:20.738', 'F2', 'green', 2236);
INSERT INTO location VALUES (2239, 'ED8', 'multimedia test', 'Hans Mueller', 2231);
INSERT INTO device VALUES (2240, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '14425165', '2013-06-11 09:44:23.124', false, 2239);
INSERT INTO component VALUES (2241, 'C', 'B', '85862359', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 03:59:08.402', 'H8', 'green', 2240);
INSERT INTO component VALUES (2242, 'D', 'H', '79031427', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 08:49:09.717', 'A6', 'green', 2240);
INSERT INTO device VALUES (2243, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '16463660', '2013-06-11 23:41:04.13', false, 2239);
INSERT INTO component VALUES (2244, 'F', 'D', '65682265', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 00:52:59.496', 'D6', 'green', 2243);
INSERT INTO component VALUES (2245, 'D', 'G', '21258426', 'Howard Joel Wolowitz', '2013-06-11 15:34:25.837', 'D6', 'green', 2243);
INSERT INTO line VALUES (2246, 'C7 PreSeries', 'Series 6', 52, 'polygon25', 2230);
INSERT INTO location VALUES (2247, 'BE7', 'motor test', 'Franziska Schulze', 2246);
INSERT INTO device VALUES (2248, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '42240482', '2013-06-11 18:25:38.6', false, 2247);
INSERT INTO component VALUES (2249, 'B', 'H', '34619549', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 01:45:51.522', 'H4', 'green', 2248);
INSERT INTO component VALUES (2250, 'H', 'B', '77231837', 'Howard Joel Wolowitz', '2013-06-11 09:31:44.875', 'C8', 'green', 2248);
INSERT INTO device VALUES (2251, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '32020701', '2013-06-11 19:21:53.977', false, 2247);
INSERT INTO component VALUES (2252, 'C', 'E', '92920113', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 07:57:06.822', 'G9', 'green', 2251);
INSERT INTO component VALUES (2253, 'I', 'B', '27211135', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 08:39:38.925', 'C6', 'green', 2251);
INSERT INTO location VALUES (2254, 'AB4', 'transmission test', 'Robert Schulze', 2246);
INSERT INTO device VALUES (2255, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '89232241', '2013-06-11 16:22:59.072', false, 2254);
INSERT INTO component VALUES (2256, 'E', 'H', '46073319', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 11:05:14.542', 'H1', 'green', 2255);
INSERT INTO component VALUES (2257, 'I', 'B', '71201134', 'Howard Joel Wolowitz', '2013-06-11 19:35:27.95', 'F8', 'green', 2255);
INSERT INTO device VALUES (2258, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '23800148', '2013-06-11 09:09:03.752', false, 2254);
INSERT INTO component VALUES (2259, 'I', 'D', '96769456', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 11:44:22.951', 'F1', 'yellow', 2258);
INSERT INTO component VALUES (2260, 'C', 'I', '18307744', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 18:06:38.093', 'H2', 'green', 2258);
INSERT INTO line VALUES (2261, 'C7 Finish', 'Series 2', 58, 'rect497', 2230);
INSERT INTO location VALUES (2262, 'IE8', 'multimedia test', 'Hans Meier', 2261);
INSERT INTO device VALUES (2263, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '59578018', '2013-06-11 08:48:04.229', false, 2262);
INSERT INTO component VALUES (2264, 'C', 'H', '92690153', 'Howard Joel Wolowitz', '2013-06-11 11:32:16.284', 'F4', 'green', 2263);
INSERT INTO component VALUES (2265, 'A', 'F', '95504014', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 18:11:54.93', 'C6', 'green', 2263);
INSERT INTO device VALUES (2266, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '33930962', '2013-06-11 13:31:12.257', false, 2262);
INSERT INTO component VALUES (2267, 'C', 'A', '5589866', 'Howard Joel Wolowitz', '2013-06-11 10:34:16.884', 'E8', 'yellow', 2266);
INSERT INTO component VALUES (2268, 'E', 'I', '23086237', 'Howard Joel Wolowitz', '2013-06-12 00:20:21.989', 'H4', 'green', 2266);
INSERT INTO location VALUES (2269, 'GF8', 'motor test', 'Sarah Schulze', 2261);
INSERT INTO device VALUES (2270, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '42080006', '2013-06-11 15:55:42.736', false, 2269);
INSERT INTO component VALUES (2271, 'B', 'C', '32147648', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 14:00:04.672', 'C3', 'green', 2270);
INSERT INTO component VALUES (2272, 'H', 'I', '69626760', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 21:01:39.143', 'G5', 'green', 2270);
INSERT INTO device VALUES (2273, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '60878428', '2013-06-11 21:02:04.943', false, 2269);
INSERT INTO component VALUES (2274, 'H', 'D', '70931213', 'Howard Joel Wolowitz', '2013-06-11 22:46:01.051', 'B3', 'green', 2273);
INSERT INTO component VALUES (2275, 'F', 'H', '46266860', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 07:21:34.625', 'C9', 'green', 2273);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2276, 'A6', 'Assembly+Finish', 538, 2707, 'Audi A4', 2, 'path369', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2277, 'A6 Assembly', 'Series 1', 38, 'rect217', 2276);
INSERT INTO location VALUES (2278, 'EC9', 'transmission test', 'Peter Merkel', 2277);
INSERT INTO device VALUES (2279, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '78757204', '2013-06-11 04:16:38.019', false, 2278);
INSERT INTO component VALUES (2280, 'G', 'F', '74561764', 'Howard Joel Wolowitz', '2013-06-12 02:51:36.924', 'A9', 'red', 2279);
INSERT INTO component VALUES (2281, 'D', 'I', '6814517', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 22:58:50.842', 'G1', 'red', 2279);
INSERT INTO device VALUES (2282, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '81306732', '2013-06-11 12:26:59.723', false, 2278);
INSERT INTO component VALUES (2283, 'D', 'B', '4457390', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:26:30.791', 'D8', 'green', 2282);
INSERT INTO component VALUES (2284, 'I', 'D', '5857844', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 02:45:19.629', 'D9', 'green', 2282);
INSERT INTO location VALUES (2285, 'ID4', 'multimedia test', 'Robert Merkel', 2277);
INSERT INTO device VALUES (2286, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '62855624', '2013-06-11 08:12:55.393', false, 2285);
INSERT INTO component VALUES (2287, 'G', 'A', '98554690', 'Howard Joel Wolowitz', '2013-06-11 19:42:50.106', 'H9', 'green', 2286);
INSERT INTO component VALUES (2288, 'C', 'H', '43215647', 'Howard Joel Wolowitz', '2013-06-11 04:49:57.663', 'B8', 'green', 2286);
INSERT INTO device VALUES (2289, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '24720126', '2013-06-11 18:15:11.094', false, 2285);
INSERT INTO component VALUES (2290, 'H', 'D', '72936309', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 04:46:11.823', 'C8', 'green', 2289);
INSERT INTO component VALUES (2291, 'F', 'C', '79071945', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 17:06:44.057', 'B1', 'yellow', 2289);
INSERT INTO line VALUES (2292, 'A6 PreSeries', 'Series 1', 37, 'polygon25', 2276);
INSERT INTO location VALUES (2293, 'EF2', 'motor test', 'Franziska Mueller', 2292);
INSERT INTO device VALUES (2294, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '9770709', '2013-06-11 21:09:07.381', false, 2293);
INSERT INTO component VALUES (2295, 'I', 'A', '87952830', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 07:40:16.092', 'E6', 'green', 2294);
INSERT INTO component VALUES (2296, 'H', 'F', '77060610', 'Howard Joel Wolowitz', '2013-06-11 14:07:43.029', 'A3', 'green', 2294);
INSERT INTO device VALUES (2297, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '55330222', '2013-06-11 20:40:08.3', false, 2293);
INSERT INTO component VALUES (2298, 'B', 'G', '8451109', 'Howard Joel Wolowitz', '2013-06-11 19:03:12.636', 'A5', 'green', 2297);
INSERT INTO component VALUES (2299, 'D', 'D', '89676554', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 02:42:46.008', 'G1', 'green', 2297);
INSERT INTO location VALUES (2300, 'HD1', 'motor test', 'Peter Schmitt', 2292);
INSERT INTO device VALUES (2301, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '10234689', '2013-06-11 11:47:28.154', false, 2300);
INSERT INTO component VALUES (2302, 'B', 'B', '25445765', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 18:01:54.424', 'D9', 'green', 2301);
INSERT INTO component VALUES (2303, 'A', 'E', '1523562', 'Howard Joel Wolowitz', '2013-06-11 16:37:50.278', 'D5', 'green', 2301);
INSERT INTO device VALUES (2304, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '85889769', '2013-06-11 17:59:13.191', false, 2300);
INSERT INTO component VALUES (2305, 'E', 'F', '2232557', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 14:02:22.279', 'I6', 'green', 2304);
INSERT INTO component VALUES (2306, 'A', 'A', '30300732', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 08:28:23.714', 'I9', 'green', 2304);
INSERT INTO line VALUES (2307, 'A6 Finish', 'Series 9', 31, 'rect497', 2276);
INSERT INTO location VALUES (2308, 'GI3', 'ABS test', 'Peter Mueller', 2307);
INSERT INTO device VALUES (2309, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '61292856', '2013-06-12 02:05:13.529', false, 2308);
INSERT INTO component VALUES (2310, 'C', 'I', '58898558', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 07:56:53.678', 'A4', 'green', 2309);
INSERT INTO component VALUES (2311, 'H', 'D', '35850480', 'Howard Joel Wolowitz', '2013-06-11 19:37:46.215', 'E8', 'green', 2309);
INSERT INTO device VALUES (2312, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '3224169', '2013-06-11 16:02:29.936', false, 2308);
INSERT INTO component VALUES (2313, 'B', 'E', '40860524', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 08:37:37.848', 'C9', 'green', 2312);
INSERT INTO component VALUES (2314, 'A', 'E', '6030967', 'Howard Joel Wolowitz', '2013-06-11 16:02:21.487', 'A9', 'green', 2312);
INSERT INTO location VALUES (2315, 'DB8', 'transmission test', 'Sarah Mueller', 2307);
INSERT INTO device VALUES (2316, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'I', '26103095', '2013-06-11 11:12:41.744', true, 2315);
INSERT INTO component VALUES (2317, 'A', 'I', '25711314', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:15:16.548', 'C8', 'green', 2316);
INSERT INTO component VALUES (2318, 'D', 'H', '27323613', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 16:23:21.39', 'C7', 'green', 2316);
INSERT INTO device VALUES (2319, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '88086944', '2013-06-11 07:58:23.011', false, 2315);
INSERT INTO component VALUES (2320, 'G', 'H', '58868915', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:58:00.641', 'B5', 'green', 2319);
INSERT INTO component VALUES (2321, 'F', 'F', '16108633', 'Howard Joel Wolowitz', '2013-06-11 12:32:36.87', 'F6', 'green', 2319);
INSERT INTO hall VALUES (2322, 'A5', 'Assembly+Finish', 333, 2514, 'Audi A4', 2, 'polygon249', 4, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2323, 'A5 Assembly', 'Series 8', 71, 'rect217', 2322);
INSERT INTO location VALUES (2324, 'GI9', 'transmission test', 'Peter Schmitt', 2323);
INSERT INTO device VALUES (2325, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '61262740', '2013-06-11 03:41:17.641', false, 2324);
INSERT INTO component VALUES (2326, 'B', 'E', '41909220', 'Howard Joel Wolowitz', '2013-06-11 04:34:16.771', 'E6', 'green', 2325);
INSERT INTO component VALUES (2327, 'H', 'E', '8217650', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 20:02:55.934', 'H3', 'yellow', 2325);
INSERT INTO device VALUES (2328, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '1756666', '2013-06-11 22:58:56.153', true, 2324);
INSERT INTO component VALUES (2329, 'B', 'G', '57565714', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 02:24:00.007', 'F7', 'green', 2328);
INSERT INTO component VALUES (2330, 'I', 'F', '72960610', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 08:46:00.995', 'E9', 'green', 2328);
INSERT INTO location VALUES (2331, 'GE7', 'motor test', 'Franziska Meier', 2323);
INSERT INTO device VALUES (2332, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '6241422', '2013-06-11 19:29:39.842', false, 2331);
INSERT INTO component VALUES (2333, 'A', 'C', '31731454', 'Howard Joel Wolowitz', '2013-06-11 07:26:18.772', 'H4', 'green', 2332);
INSERT INTO component VALUES (2334, 'H', 'C', '52340033', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 01:07:03.134', 'F6', 'green', 2332);
INSERT INTO device VALUES (2335, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '23445358', '2013-06-11 13:07:24.585', false, 2331);
INSERT INTO component VALUES (2336, 'H', 'G', '34597354', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 03:57:42.121', 'D5', 'green', 2335);
INSERT INTO component VALUES (2337, 'C', 'G', '58225686', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 13:59:15.311', 'H2', 'green', 2335);
INSERT INTO line VALUES (2338, 'A5 PreSeries', 'Series 6', 89, 'polygon25', 2322);
INSERT INTO location VALUES (2339, 'BA6', 'multimedia test', 'Hans Schmitt', 2338);
INSERT INTO device VALUES (2340, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '81207218', '2013-06-11 07:39:06.611', false, 2339);
INSERT INTO component VALUES (2341, 'I', 'B', '35259729', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:36:10.383', 'A6', 'green', 2340);
INSERT INTO component VALUES (2342, 'I', 'D', '4952206', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:08:46.614', 'F7', 'green', 2340);
INSERT INTO device VALUES (2343, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '65652795', '2013-06-11 17:45:48.895', false, 2339);
INSERT INTO component VALUES (2344, 'A', 'B', '41949401', 'Howard Joel Wolowitz', '2013-06-11 15:17:04.02', 'E1', 'green', 2343);
INSERT INTO component VALUES (2345, 'I', 'A', '51149271', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 23:46:13.288', 'H5', 'red', 2343);
INSERT INTO location VALUES (2346, 'EI8', 'multimedia test', 'Hans Schmitt', 2338);
INSERT INTO device VALUES (2347, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '77188839', '2013-06-12 02:57:03.973', false, 2346);
INSERT INTO component VALUES (2348, 'B', 'A', '32348733', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 21:51:05.396', 'C6', 'green', 2347);
INSERT INTO component VALUES (2349, 'C', 'I', '2612800', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 20:44:24.163', 'C5', 'green', 2347);
INSERT INTO device VALUES (2350, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '27251097', '2013-06-11 22:33:25.03', false, 2346);
INSERT INTO component VALUES (2351, 'I', 'B', '89445253', 'Howard Joel Wolowitz', '2013-06-11 23:21:38.962', 'I4', 'green', 2350);
INSERT INTO component VALUES (2352, 'E', 'E', '81028975', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 18:01:32.071', 'I2', 'green', 2350);
INSERT INTO line VALUES (2353, 'A5 Finish', 'Series 4', 40, 'rect497', 2322);
INSERT INTO location VALUES (2354, 'AB4', 'security test', 'Peter Merkel', 2353);
INSERT INTO device VALUES (2355, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '20014902', '2013-06-11 04:55:46.405', false, 2354);
INSERT INTO component VALUES (2356, 'H', 'F', '62324349', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:20:07.139', 'H8', 'yellow', 2355);
INSERT INTO component VALUES (2357, 'A', 'E', '59737178', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 00:57:34.456', 'G8', 'green', 2355);
INSERT INTO device VALUES (2358, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '86910649', '2013-06-11 22:26:31.84', false, 2354);
INSERT INTO component VALUES (2359, 'B', 'H', '26581834', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 08:56:04.074', 'F5', 'green', 2358);
INSERT INTO component VALUES (2360, 'A', 'B', '39943379', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 08:06:26.299', 'A3', 'green', 2358);
INSERT INTO location VALUES (2361, 'CC9', 'security test', 'Hans Meier', 2353);
INSERT INTO device VALUES (2362, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '92217844', '2013-06-11 21:47:56.21', false, 2361);
INSERT INTO component VALUES (2363, 'I', 'B', '92159289', 'Howard Joel Wolowitz', '2013-06-12 02:20:18.455', 'A9', 'green', 2362);
INSERT INTO component VALUES (2364, 'A', 'A', '20962952', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 03:34:37.821', 'C1', 'green', 2362);
INSERT INTO device VALUES (2365, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '53427647', '2013-06-11 20:47:23.11', false, 2361);
INSERT INTO component VALUES (2366, 'H', 'D', '6207940', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 21:59:06.552', 'A2', 'green', 2365);
INSERT INTO component VALUES (2367, 'G', 'F', '34174155', 'Howard Joel Wolowitz', '2013-06-11 18:33:59.961', 'B7', 'yellow', 2365);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2368, 'B9', 'Assembly+Finish', 374, 6757, 'Audi A4', 2, 'path369', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2369, 'B9 Assembly', 'Series 5', 83, 'rect217', 2368);
INSERT INTO location VALUES (2370, 'FE8', 'transmission test', 'Franziska Schmitt', 2369);
INSERT INTO device VALUES (2371, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '31742425', '2013-06-11 09:43:55.837', true, 2370);
INSERT INTO component VALUES (2372, 'H', 'B', '25132623', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 04:01:18.805', 'C8', 'green', 2371);
INSERT INTO component VALUES (2373, 'C', 'E', '78683837', 'Howard Joel Wolowitz', '2013-06-12 02:02:47.57', 'D3', 'green', 2371);
INSERT INTO device VALUES (2374, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '62629331', '2013-06-12 03:10:06.125', false, 2370);
INSERT INTO component VALUES (2375, 'F', 'I', '53737430', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:32:56.819', 'D1', 'green', 2374);
INSERT INTO component VALUES (2376, 'I', 'A', '13199092', 'Howard Joel Wolowitz', '2013-06-11 08:15:29.678', 'G5', 'green', 2374);
INSERT INTO location VALUES (2377, 'EC3', 'multimedia test', 'Sarah Schulze', 2369);
INSERT INTO device VALUES (2378, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '77740135', '2013-06-12 01:49:21.109', true, 2377);
INSERT INTO component VALUES (2379, 'H', 'D', '38470975', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 08:39:13.686', 'I8', 'green', 2378);
INSERT INTO component VALUES (2380, 'E', 'D', '33486241', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 22:44:43.143', 'G2', 'green', 2378);
INSERT INTO device VALUES (2381, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '73691097', '2013-06-11 21:03:11.364', false, 2377);
INSERT INTO component VALUES (2382, 'C', 'F', '92461221', 'Howard Joel Wolowitz', '2013-06-11 22:10:51.802', 'I7', 'green', 2381);
INSERT INTO component VALUES (2383, 'F', 'C', '15976055', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 02:39:05.914', 'H7', 'green', 2381);
INSERT INTO line VALUES (2384, 'B9 PreSeries', 'Series 5', 15, 'polygon25', 2368);
INSERT INTO location VALUES (2385, 'CD3', 'ABS test', 'Robert Meier', 2384);
INSERT INTO device VALUES (2386, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '89103612', '2013-06-11 19:23:24.593', false, 2385);
INSERT INTO component VALUES (2387, 'A', 'A', '62500402', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 11:58:54.68', 'A4', 'yellow', 2386);
INSERT INTO component VALUES (2388, 'I', 'E', '4687697', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 13:13:40.445', 'E9', 'green', 2386);
INSERT INTO device VALUES (2389, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '22138989', '2013-06-11 20:10:06.675', false, 2385);
INSERT INTO component VALUES (2390, 'A', 'H', '35124236', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:29:19.493', 'C4', 'green', 2389);
INSERT INTO component VALUES (2391, 'G', 'B', '56178387', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 12:29:03.485', 'C1', 'green', 2389);
INSERT INTO location VALUES (2392, 'AI3', 'motor test', 'Hans Schulze', 2384);
INSERT INTO device VALUES (2393, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '66555402', '2013-06-11 15:06:32.673', false, 2392);
INSERT INTO component VALUES (2394, 'G', 'B', '15756252', 'Howard Joel Wolowitz', '2013-06-12 03:04:38.615', 'C6', 'green', 2393);
INSERT INTO component VALUES (2395, 'A', 'I', '67170975', 'Howard Joel Wolowitz', '2013-06-11 20:26:43.86', 'I8', 'green', 2393);
INSERT INTO device VALUES (2396, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '74647251', '2013-06-11 10:04:31.663', false, 2392);
INSERT INTO component VALUES (2397, 'A', 'F', '36653456', 'Howard Joel Wolowitz', '2013-06-11 19:36:10.6', 'I6', 'green', 2396);
INSERT INTO component VALUES (2398, 'I', 'H', '43876137', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 17:22:40.657', 'H3', 'green', 2396);
INSERT INTO line VALUES (2399, 'B9 Finish', 'Series 6', 67, 'rect497', 2368);
INSERT INTO location VALUES (2400, 'GB4', 'motor test', 'Peter Merkel', 2399);
INSERT INTO device VALUES (2401, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '59249301', '2013-06-11 22:41:42.012', false, 2400);
INSERT INTO component VALUES (2402, 'I', 'B', '35408214', 'Howard Joel Wolowitz', '2013-06-11 12:23:17.504', 'E2', 'green', 2401);
INSERT INTO component VALUES (2403, 'B', 'A', '64037903', 'Howard Joel Wolowitz', '2013-06-11 21:44:27.023', 'A1', 'green', 2401);
INSERT INTO device VALUES (2404, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '2232494', '2013-06-11 13:09:04.391', false, 2400);
INSERT INTO component VALUES (2405, 'H', 'H', '85120755', 'Howard Joel Wolowitz', '2013-06-11 15:55:40.104', 'B9', 'red', 2404);
INSERT INTO component VALUES (2406, 'D', 'E', '11146029', 'Howard Joel Wolowitz', '2013-06-11 19:21:34.434', 'I8', 'green', 2404);
INSERT INTO location VALUES (2407, 'GF1', 'ABS test', 'Robert Schulze', 2399);
INSERT INTO device VALUES (2408, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '36394814', '2013-06-11 20:01:18.016', false, 2407);
INSERT INTO component VALUES (2409, 'D', 'G', '98973160', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:47:06.333', 'B7', 'yellow', 2408);
INSERT INTO component VALUES (2410, 'D', 'I', '56763769', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 02:26:58.012', 'A8', 'red', 2408);
INSERT INTO device VALUES (2411, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '30617921', '2013-06-12 01:10:30.082', false, 2407);
INSERT INTO component VALUES (2412, 'D', 'C', '41224213', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 01:42:01.93', 'E5', 'green', 2411);
INSERT INTO component VALUES (2413, 'I', 'F', '90404449', 'Howard Joel Wolowitz', '2013-06-11 08:51:06.736', 'E3', 'green', 2411);
INSERT INTO hall VALUES (2414, 'I3', 'Assembly+Finish', 855, 9181, 'Audi A4', 2, 'polygon249', 5, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2415, 'I3 Assembly', 'Series 2', 100, 'rect217', 2414);
INSERT INTO location VALUES (2416, 'BF9', 'motor test', 'Robert Merkel', 2415);
INSERT INTO device VALUES (2417, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '96162283', '2013-06-11 03:46:35.147', false, 2416);
INSERT INTO component VALUES (2418, 'C', 'E', '15792073', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 17:16:30.717', 'C7', 'green', 2417);
INSERT INTO component VALUES (2419, 'C', 'D', '62254986', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 08:31:15.395', 'E9', 'green', 2417);
INSERT INTO device VALUES (2420, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'C', '42348538', '2013-06-11 22:33:03.118', false, 2416);
INSERT INTO component VALUES (2421, 'I', 'F', '65127394', 'Howard Joel Wolowitz', '2013-06-11 17:31:29.296', 'A1', 'green', 2420);
INSERT INTO component VALUES (2422, 'B', 'I', '19989643', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 00:58:28.353', 'D5', 'green', 2420);
INSERT INTO location VALUES (2423, 'DE1', 'motor test', 'Sarah Schmitt', 2415);
INSERT INTO device VALUES (2424, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '70348358', '2013-06-11 22:58:10.14', false, 2423);
INSERT INTO component VALUES (2425, 'D', 'I', '94723314', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 10:39:35.976', 'I4', 'green', 2424);
INSERT INTO component VALUES (2426, 'I', 'D', '11659506', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 15:47:48.188', 'A5', 'green', 2424);
INSERT INTO device VALUES (2427, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '99686432', '2013-06-11 20:56:26.705', false, 2423);
INSERT INTO component VALUES (2428, 'D', 'C', '79005332', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 16:33:44.576', 'H1', 'green', 2427);
INSERT INTO component VALUES (2429, 'H', 'C', '45694792', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:19:40.599', 'D9', 'green', 2427);
INSERT INTO line VALUES (2430, 'I3 PreSeries', 'Series 3', 27, 'polygon25', 2414);
INSERT INTO location VALUES (2431, 'DE9', 'transmission test', 'Sarah Mueller', 2430);
INSERT INTO device VALUES (2432, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '9173123', '2013-06-11 14:24:57.523', false, 2431);
INSERT INTO component VALUES (2433, 'D', 'F', '51687513', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 11:35:45.66', 'B8', 'green', 2432);
INSERT INTO component VALUES (2434, 'A', 'I', '25985922', 'Howard Joel Wolowitz', '2013-06-11 19:40:34.15', 'B6', 'green', 2432);
INSERT INTO device VALUES (2435, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '51406157', '2013-06-11 05:13:48.973', false, 2431);
INSERT INTO component VALUES (2436, 'G', 'G', '55536050', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:21:58.041', 'D1', 'green', 2435);
INSERT INTO component VALUES (2437, 'B', 'A', '102506', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:28:42.124', 'A4', 'green', 2435);
INSERT INTO location VALUES (2438, 'BB6', 'transmission test', 'Hans Schulze', 2430);
INSERT INTO device VALUES (2439, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '20864110', '2013-06-12 00:52:12.556', false, 2438);
INSERT INTO component VALUES (2440, 'B', 'A', '49315306', 'Howard Joel Wolowitz', '2013-06-11 22:14:01.847', 'C7', 'green', 2439);
INSERT INTO component VALUES (2441, 'I', 'I', '6398085', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 10:44:21.118', 'B3', 'green', 2439);
INSERT INTO device VALUES (2442, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '24210161', '2013-06-11 04:21:23.675', false, 2438);
INSERT INTO component VALUES (2443, 'B', 'B', '27932608', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 12:38:19.728', 'D2', 'green', 2442);
INSERT INTO component VALUES (2444, 'I', 'H', '49912372', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 08:56:22.284', 'A5', 'green', 2442);
INSERT INTO line VALUES (2445, 'I3 Finish', 'Series 1', 100, 'rect497', 2414);
INSERT INTO location VALUES (2446, 'FE6', 'motor test', 'Robert Meier', 2445);
INSERT INTO device VALUES (2447, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '6951548', '2013-06-12 00:39:41.304', false, 2446);
INSERT INTO component VALUES (2448, 'C', 'B', '27919117', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 07:53:27.643', 'B7', 'yellow', 2447);
INSERT INTO component VALUES (2449, 'E', 'H', '43960065', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 19:47:57.037', 'G8', 'green', 2447);
INSERT INTO device VALUES (2450, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '68770001', '2013-06-11 12:42:21.589', false, 2446);
INSERT INTO component VALUES (2451, 'I', 'F', '11626959', 'Howard Joel Wolowitz', '2013-06-12 01:03:10.277', 'C8', 'green', 2450);
INSERT INTO component VALUES (2452, 'H', 'C', '91442730', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 05:12:58.502', 'G5', 'green', 2450);
INSERT INTO location VALUES (2453, 'CA3', 'security test', 'Peter Schulze', 2445);
INSERT INTO device VALUES (2454, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '88151264', '2013-06-11 05:12:03.971', false, 2453);
INSERT INTO component VALUES (2455, 'C', 'A', '25842066', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 19:38:35.816', 'H7', 'green', 2454);
INSERT INTO component VALUES (2456, 'A', 'C', '53850786', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 01:48:54.115', 'H7', 'red', 2454);
INSERT INTO device VALUES (2457, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'E', '63122051', '2013-06-11 14:46:45.633', false, 2453);
INSERT INTO component VALUES (2458, 'D', 'H', '32321673', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 04:57:35.836', 'B6', 'green', 2457);
INSERT INTO component VALUES (2459, 'H', 'H', '54543898', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 19:20:29.089', 'D2', 'green', 2457);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2460, 'D1', 'Assembly+Finish', 912, 9531, 'Audi A4', 2, 'path369', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2461, 'D1 Assembly', 'Series 3', 40, 'rect217', 2460);
INSERT INTO location VALUES (2462, 'AC5', 'multimedia test', 'Sarah Merkel', 2461);
INSERT INTO device VALUES (2463, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'G', '8276208', '2013-06-11 14:11:48.578', false, 2462);
INSERT INTO component VALUES (2464, 'D', 'H', '9651171', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 14:22:12.084', 'A8', 'green', 2463);
INSERT INTO component VALUES (2465, 'D', 'G', '60744481', 'Howard Joel Wolowitz', '2013-06-11 14:31:48.371', 'E9', 'green', 2463);
INSERT INTO device VALUES (2466, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '96686040', '2013-06-11 12:03:43.994', false, 2462);
INSERT INTO component VALUES (2467, 'H', 'I', '99735725', 'Howard Joel Wolowitz', '2013-06-12 00:43:55.969', 'D8', 'green', 2466);
INSERT INTO component VALUES (2468, 'A', 'B', '86797064', 'Howard Joel Wolowitz', '2013-06-11 08:26:09.948', 'E5', 'green', 2466);
INSERT INTO location VALUES (2469, 'CG8', 'motor test', 'Sarah Meier', 2461);
INSERT INTO device VALUES (2470, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '54779989', '2013-06-11 03:52:37.715', false, 2469);
INSERT INTO component VALUES (2471, 'C', 'I', '76171025', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 13:24:27.909', 'E9', 'green', 2470);
INSERT INTO component VALUES (2472, 'I', 'E', '21561423', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 01:10:20.256', 'F6', 'green', 2470);
INSERT INTO device VALUES (2473, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '47559784', '2013-06-11 09:58:18.461', false, 2469);
INSERT INTO component VALUES (2474, 'E', 'E', '80538750', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 18:15:02.567', 'F5', 'green', 2473);
INSERT INTO component VALUES (2475, 'G', 'B', '6670437', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 21:26:19.332', 'I5', 'green', 2473);
INSERT INTO line VALUES (2476, 'D1 PreSeries', 'Series 5', 57, 'polygon25', 2460);
INSERT INTO location VALUES (2477, 'DI6', 'security test', 'Sarah Mueller', 2476);
INSERT INTO device VALUES (2478, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '36402975', '2013-06-11 23:43:44.937', false, 2477);
INSERT INTO component VALUES (2479, 'C', 'D', '77132230', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 03:04:59.788', 'B7', 'green', 2478);
INSERT INTO component VALUES (2480, 'G', 'I', '5484772', 'Howard Joel Wolowitz', '2013-06-12 03:09:21.647', 'G7', 'yellow', 2478);
INSERT INTO device VALUES (2481, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '34306608', '2013-06-11 17:08:02.905', false, 2477);
INSERT INTO component VALUES (2482, 'H', 'I', '93013122', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:36:50.183', 'E7', 'yellow', 2481);
INSERT INTO component VALUES (2483, 'F', 'E', '26564328', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:46:39.234', 'D2', 'green', 2481);
INSERT INTO location VALUES (2484, 'GA5', 'security test', 'Franziska Schmitt', 2476);
INSERT INTO device VALUES (2485, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'F', '65863313', '2013-06-11 16:04:10.579', false, 2484);
INSERT INTO component VALUES (2486, 'I', 'I', '20407961', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 10:45:36.425', 'C1', 'green', 2485);
INSERT INTO component VALUES (2487, 'F', 'E', '80063884', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 01:36:11.879', 'D7', 'green', 2485);
INSERT INTO device VALUES (2488, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '36222190', '2013-06-11 19:58:51.769', false, 2484);
INSERT INTO component VALUES (2489, 'H', 'A', '46268615', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 16:55:35.828', 'F5', 'green', 2488);
INSERT INTO component VALUES (2490, 'B', 'D', '27376186', 'Howard Joel Wolowitz', '2013-06-11 23:55:27.329', 'F8', 'green', 2488);
INSERT INTO line VALUES (2491, 'D1 Finish', 'Series 2', 27, 'rect497', 2460);
INSERT INTO location VALUES (2492, 'BC4', 'multimedia test', 'Sarah Mueller', 2491);
INSERT INTO device VALUES (2493, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '39352557', '2013-06-11 05:05:37.475', false, 2492);
INSERT INTO component VALUES (2494, 'A', 'A', '50387773', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 20:52:02.002', 'D2', 'green', 2493);
INSERT INTO component VALUES (2495, 'I', 'D', '54241243', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 05:06:34.843', 'A3', 'green', 2493);
INSERT INTO device VALUES (2496, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '86522913', '2013-06-12 03:30:08.148', false, 2492);
INSERT INTO component VALUES (2497, 'B', 'D', '27124843', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 03:29:40.06', 'F3', 'green', 2496);
INSERT INTO component VALUES (2498, 'H', 'H', '31604843', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 10:51:47.29', 'I8', 'green', 2496);
INSERT INTO location VALUES (2499, 'DI9', 'motor test', 'Sarah Merkel', 2491);
INSERT INTO device VALUES (2500, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '23331802', '2013-06-11 05:58:21.117', false, 2499);
INSERT INTO component VALUES (2501, 'C', 'F', '54887419', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 05:14:47.942', 'I5', 'green', 2500);
INSERT INTO component VALUES (2502, 'B', 'F', '94206941', 'Howard Joel Wolowitz', '2013-06-11 16:16:06.576', 'F6', 'green', 2500);
INSERT INTO device VALUES (2503, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '4364735', '2013-06-11 16:03:56.265', false, 2499);
INSERT INTO component VALUES (2504, 'H', 'F', '99881294', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 06:18:40.504', 'D2', 'green', 2503);
INSERT INTO component VALUES (2505, 'H', 'A', '58036094', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 20:10:12.744', 'E2', 'green', 2503);
INSERT INTO hall VALUES (2506, 'H8', 'Assembly+Finish', 918, 6421, 'Audi A4', 2, 'polygon249', 6, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2507, 'H8 Assembly', 'Series 3', 89, 'rect217', 2506);
INSERT INTO location VALUES (2508, 'IB6', 'security test', 'Robert Merkel', 2507);
INSERT INTO device VALUES (2509, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '50106407', '2013-06-11 14:32:21.288', false, 2508);
INSERT INTO component VALUES (2510, 'D', 'G', '89798540', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:20:08.101', 'G1', 'green', 2509);
INSERT INTO component VALUES (2511, 'I', 'D', '25020597', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 17:14:05.578', 'I4', 'green', 2509);
INSERT INTO device VALUES (2512, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '31756481', '2013-06-11 11:29:01.788', false, 2508);
INSERT INTO component VALUES (2513, 'E', 'H', '83870581', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 02:37:33.812', 'I8', 'yellow', 2512);
INSERT INTO component VALUES (2514, 'D', 'H', '9981699', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 10:28:12.987', 'A4', 'green', 2512);
INSERT INTO location VALUES (2515, 'FC5', 'security test', 'Franziska Meier', 2507);
INSERT INTO device VALUES (2516, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'C', '19536088', '2013-06-11 09:48:51.619', false, 2515);
INSERT INTO component VALUES (2517, 'H', 'E', '98406718', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 14:58:49.369', 'E1', 'green', 2516);
INSERT INTO component VALUES (2518, 'E', 'F', '35856747', 'Howard Joel Wolowitz', '2013-06-11 23:21:24.16', 'A6', 'green', 2516);
INSERT INTO device VALUES (2519, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '34477076', '2013-06-12 01:10:47.286', false, 2515);
INSERT INTO component VALUES (2520, 'H', 'G', '96455119', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 15:48:01.073', 'A6', 'green', 2519);
INSERT INTO component VALUES (2521, 'I', 'A', '48713483', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 13:29:15.212', 'I3', 'green', 2519);
INSERT INTO line VALUES (2522, 'H8 PreSeries', 'Series 3', 76, 'polygon25', 2506);
INSERT INTO location VALUES (2523, 'AC3', 'transmission test', 'Sarah Schulze', 2522);
INSERT INTO device VALUES (2524, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '72271954', '2013-06-12 00:06:13.19', false, 2523);
INSERT INTO component VALUES (2525, 'F', 'D', '23624803', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 00:39:34.297', 'G1', 'yellow', 2524);
INSERT INTO component VALUES (2526, 'F', 'G', '6439563', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 00:32:15.219', 'I5', 'green', 2524);
INSERT INTO device VALUES (2527, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '39114955', '2013-06-11 15:08:14.632', false, 2523);
INSERT INTO component VALUES (2528, 'B', 'E', '99932177', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 17:24:58.768', 'D7', 'green', 2527);
INSERT INTO component VALUES (2529, 'A', 'D', '91272849', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 15:58:31.581', 'C8', 'green', 2527);
INSERT INTO location VALUES (2530, 'HC5', 'ABS test', 'Sarah Mueller', 2522);
INSERT INTO device VALUES (2531, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '88219375', '2013-06-11 12:23:53.925', false, 2530);
INSERT INTO component VALUES (2532, 'I', 'I', '7284221', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 18:07:29.011', 'F1', 'green', 2531);
INSERT INTO component VALUES (2533, 'B', 'H', '43534809', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 08:11:16.494', 'A4', 'green', 2531);
INSERT INTO device VALUES (2534, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'I', '22922292', '2013-06-11 07:58:46.766', false, 2530);
INSERT INTO component VALUES (2535, 'H', 'F', '83566629', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:13:38.824', 'A1', 'red', 2534);
INSERT INTO component VALUES (2536, 'H', 'E', '40194525', 'Howard Joel Wolowitz', '2013-06-11 18:28:49.407', 'C5', 'green', 2534);
INSERT INTO line VALUES (2537, 'H8 Finish', 'Series 4', 85, 'rect497', 2506);
INSERT INTO location VALUES (2538, 'GF2', 'ABS test', 'Sarah Merkel', 2537);
INSERT INTO device VALUES (2539, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '17294906', '2013-06-11 12:54:00.375', false, 2538);
INSERT INTO component VALUES (2540, 'F', 'F', '38374716', 'Howard Joel Wolowitz', '2013-06-11 08:46:01.972', 'F8', 'green', 2539);
INSERT INTO component VALUES (2541, 'A', 'A', '92625364', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:55:24.634', 'H5', 'green', 2539);
INSERT INTO device VALUES (2542, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'B', '88207891', '2013-06-11 13:40:28.776', false, 2538);
INSERT INTO component VALUES (2543, 'H', 'H', '47469943', 'Howard Joel Wolowitz', '2013-06-11 16:07:41.435', 'G3', 'green', 2542);
INSERT INTO component VALUES (2544, 'I', 'E', '59529540', 'Howard Joel Wolowitz', '2013-06-11 09:16:56.778', 'A3', 'green', 2542);
INSERT INTO location VALUES (2545, 'BG2', 'transmission test', 'Hans Mueller', 2537);
INSERT INTO device VALUES (2546, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '71328817', '2013-06-11 07:14:55.783', false, 2545);
INSERT INTO component VALUES (2547, 'C', 'I', '64197088', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 09:39:17.452', 'H7', 'green', 2546);
INSERT INTO component VALUES (2548, 'I', 'E', '13787426', 'Howard Joel Wolowitz', '2013-06-11 16:13:28.701', 'D7', 'green', 2546);
INSERT INTO device VALUES (2549, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'H', '47725239', '2013-06-11 04:37:39.647', false, 2545);
INSERT INTO component VALUES (2550, 'E', 'D', '71529013', 'Howard Joel Wolowitz', '2013-06-11 14:08:28.609', 'E4', 'green', 2549);
INSERT INTO component VALUES (2551, 'D', 'D', '47311121', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 11:14:43.7', 'G4', 'green', 2549);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2552, 'E2', 'Assembly+Finish', 273, 2856, 'Audi A4', 2, 'path369', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2553, 'E2 Assembly', 'Series 8', 83, 'rect217', 2552);
INSERT INTO location VALUES (2554, 'GD7', 'transmission test', 'Robert Meier', 2553);
INSERT INTO device VALUES (2555, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '67805977', '2013-06-11 10:35:48.155', false, 2554);
INSERT INTO component VALUES (2556, 'C', 'C', '78096162', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:43:25.545', 'I3', 'green', 2555);
INSERT INTO component VALUES (2557, 'B', 'C', '46444075', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 10:19:50.387', 'F4', 'green', 2555);
INSERT INTO device VALUES (2558, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '5111376', '2013-06-11 14:56:13.126', false, 2554);
INSERT INTO component VALUES (2559, 'F', 'A', '40418852', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 16:43:26.435', 'H1', 'green', 2558);
INSERT INTO component VALUES (2560, 'C', 'G', '35410836', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 08:37:36.73', 'F8', 'green', 2558);
INSERT INTO location VALUES (2561, 'EF1', 'ABS test', 'Sarah Mueller', 2553);
INSERT INTO device VALUES (2562, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '77768611', '2013-06-11 15:51:10.424', false, 2561);
INSERT INTO component VALUES (2563, 'C', 'I', '18535512', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 19:22:05.976', 'A4', 'green', 2562);
INSERT INTO component VALUES (2564, 'G', 'A', '61879538', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 15:23:05.285', 'E5', 'green', 2562);
INSERT INTO device VALUES (2565, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '88575684', '2013-06-12 03:17:09.951', false, 2561);
INSERT INTO component VALUES (2566, 'A', 'G', '46490218', 'Howard Joel Wolowitz', '2013-06-11 18:13:24.191', 'H5', 'green', 2565);
INSERT INTO component VALUES (2567, 'B', 'H', '50983125', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 21:07:11.759', 'B3', 'green', 2565);
INSERT INTO line VALUES (2568, 'E2 PreSeries', 'Series 9', 90, 'polygon25', 2552);
INSERT INTO location VALUES (2569, 'CC6', 'ABS test', 'Robert Mueller', 2568);
INSERT INTO device VALUES (2570, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '31586274', '2013-06-11 09:02:00.855', false, 2569);
INSERT INTO component VALUES (2571, 'H', 'G', '77420542', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 15:06:41.922', 'E3', 'green', 2570);
INSERT INTO component VALUES (2572, 'H', 'C', '89931795', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 12:02:44.118', 'B4', 'green', 2570);
INSERT INTO device VALUES (2573, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '75907104', '2013-06-11 11:41:57.077', false, 2569);
INSERT INTO component VALUES (2574, 'F', 'I', '15309699', 'Howard Joel Wolowitz', '2013-06-11 20:35:06.471', 'A6', 'green', 2573);
INSERT INTO component VALUES (2575, 'A', 'A', '64531610', 'Howard Joel Wolowitz', '2013-06-11 20:35:26.658', 'A7', 'yellow', 2573);
INSERT INTO location VALUES (2576, 'HF4', 'motor test', 'Sarah Mueller', 2568);
INSERT INTO device VALUES (2577, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '57352529', '2013-06-11 17:56:48.383', false, 2576);
INSERT INTO component VALUES (2578, 'D', 'I', '79886539', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 17:23:17.023', 'E8', 'green', 2577);
INSERT INTO component VALUES (2579, 'C', 'D', '37793979', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:33:00.869', 'C8', 'green', 2577);
INSERT INTO device VALUES (2580, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '97175548', '2013-06-11 03:43:12.742', false, 2576);
INSERT INTO component VALUES (2581, 'A', 'A', '14929238', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:31:44.321', 'I2', 'green', 2580);
INSERT INTO component VALUES (2582, 'I', 'H', '668209', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:33:39.001', 'B8', 'green', 2580);
INSERT INTO line VALUES (2583, 'E2 Finish', 'Series 8', 50, 'rect497', 2552);
INSERT INTO location VALUES (2584, 'FG5', 'security test', 'Peter Merkel', 2583);
INSERT INTO device VALUES (2585, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'E', '1738403', '2013-06-12 01:58:46.957', false, 2584);
INSERT INTO component VALUES (2586, 'F', 'G', '31484363', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 19:50:48.924', 'A8', 'green', 2585);
INSERT INTO component VALUES (2587, 'C', 'I', '22744010', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 22:52:01.698', 'F1', 'yellow', 2585);
INSERT INTO device VALUES (2588, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '26205237', '2013-06-12 00:02:16.153', false, 2584);
INSERT INTO component VALUES (2589, 'H', 'D', '58519990', 'Howard Joel Wolowitz', '2013-06-11 15:02:54.264', 'G7', 'green', 2588);
INSERT INTO component VALUES (2590, 'I', 'E', '43247369', 'Howard Joel Wolowitz', '2013-06-11 11:42:41.856', 'H9', 'green', 2588);
INSERT INTO location VALUES (2591, 'DE4', 'multimedia test', 'Sarah Meier', 2583);
INSERT INTO device VALUES (2592, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '48333647', '2013-06-12 02:09:25.181', false, 2591);
INSERT INTO component VALUES (2593, 'C', 'C', '18427644', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:04:29.769', 'H5', 'red', 2592);
INSERT INTO component VALUES (2594, 'I', 'A', '25348580', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 03:01:41.357', 'C6', 'green', 2592);
INSERT INTO device VALUES (2595, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '69693929', '2013-06-11 05:09:44.27', false, 2591);
INSERT INTO component VALUES (2596, 'I', 'E', '31212422', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 12:13:18.426', 'E9', 'green', 2595);
INSERT INTO component VALUES (2597, 'E', 'E', '31559866', 'Howard Joel Wolowitz', '2013-06-11 15:43:08.913', 'G9', 'green', 2595);
INSERT INTO hall VALUES (2598, 'E4', 'Assembly+Finish', 712, 1705, 'Audi A4', 2, 'polygon249', 7, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2599, 'E4 Assembly', 'Series 8', 23, 'rect217', 2598);
INSERT INTO location VALUES (2600, 'HG6', 'motor test', 'Hans Schmitt', 2599);
INSERT INTO device VALUES (2601, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '99655203', '2013-06-11 23:58:24.026', false, 2600);
INSERT INTO component VALUES (2602, 'B', 'G', '46865804', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 18:54:36.355', 'I8', 'yellow', 2601);
INSERT INTO component VALUES (2603, 'C', 'H', '56823780', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 05:42:55.809', 'A3', 'green', 2601);
INSERT INTO device VALUES (2604, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '53962139', '2013-06-11 21:57:57.272', false, 2600);
INSERT INTO component VALUES (2605, 'A', 'A', '23522940', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 05:03:30.332', 'E1', 'green', 2604);
INSERT INTO component VALUES (2606, 'D', 'I', '73219541', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 21:35:09.943', 'C3', 'green', 2604);
INSERT INTO location VALUES (2607, 'AD6', 'transmission test', 'Peter Mueller', 2599);
INSERT INTO device VALUES (2608, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '65574407', '2013-06-11 20:21:37.818', false, 2607);
INSERT INTO component VALUES (2609, 'D', 'B', '40053597', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 14:59:52.902', 'H5', 'green', 2608);
INSERT INTO component VALUES (2610, 'I', 'G', '13084449', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 06:40:04.737', 'H8', 'green', 2608);
INSERT INTO device VALUES (2611, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'E', '52973115', '2013-06-11 08:00:54.909', true, 2607);
INSERT INTO component VALUES (2612, 'H', 'C', '57144343', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 01:39:09.272', 'C9', 'green', 2611);
INSERT INTO component VALUES (2613, 'C', 'I', '4005868', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 10:11:48.957', 'I3', 'green', 2611);
INSERT INTO line VALUES (2614, 'E4 PreSeries', 'Series 5', 48, 'polygon25', 2598);
INSERT INTO location VALUES (2615, 'BH9', 'multimedia test', 'Sarah Meier', 2614);
INSERT INTO device VALUES (2616, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '88693950', '2013-06-11 15:48:37.942', false, 2615);
INSERT INTO component VALUES (2617, 'H', 'H', '67291406', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 21:33:06.514', 'G6', 'green', 2616);
INSERT INTO component VALUES (2618, 'C', 'D', '78495289', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 15:57:43.161', 'E4', 'green', 2616);
INSERT INTO device VALUES (2619, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '30646821', '2013-06-11 09:37:23.627', false, 2615);
INSERT INTO component VALUES (2620, 'H', 'I', '16732764', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 13:21:26.715', 'I1', 'yellow', 2619);
INSERT INTO component VALUES (2621, 'G', 'G', '56236376', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 18:01:31.395', 'D1', 'green', 2619);
INSERT INTO location VALUES (2622, 'II9', 'motor test', 'Hans Meier', 2614);
INSERT INTO device VALUES (2623, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'G', '17111107', '2013-06-11 22:35:19.842', false, 2622);
INSERT INTO component VALUES (2624, 'E', 'H', '77731168', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 06:12:15.062', 'B3', 'green', 2623);
INSERT INTO component VALUES (2625, 'A', 'I', '27080698', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 12:28:12.137', 'E8', 'green', 2623);
INSERT INTO device VALUES (2626, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '85650442', '2013-06-11 11:12:37.861', false, 2622);
INSERT INTO component VALUES (2627, 'D', 'F', '33397086', 'Howard Joel Wolowitz', '2013-06-11 06:47:10.504', 'B1', 'green', 2626);
INSERT INTO component VALUES (2628, 'C', 'E', '91178012', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:08:42.507', 'C6', 'green', 2626);
INSERT INTO line VALUES (2629, 'E4 Finish', 'Series 4', 75, 'rect497', 2598);
INSERT INTO location VALUES (2630, 'EH8', 'motor test', 'Franziska Merkel', 2629);
INSERT INTO device VALUES (2631, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '94127498', '2013-06-12 02:43:23.007', false, 2630);
INSERT INTO component VALUES (2632, 'B', 'I', '55611358', 'Howard Joel Wolowitz', '2013-06-11 05:04:28.5', 'G2', 'yellow', 2631);
INSERT INTO component VALUES (2633, 'G', 'G', '64332867', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 20:12:47.848', 'A6', 'green', 2631);
INSERT INTO device VALUES (2634, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '76699356', '2013-06-11 17:18:11.155', false, 2630);
INSERT INTO component VALUES (2635, 'C', 'E', '55579338', 'Howard Joel Wolowitz', '2013-06-11 18:14:47.459', 'D4', 'green', 2634);
INSERT INTO component VALUES (2636, 'I', 'B', '84966973', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 02:24:37.281', 'B2', 'green', 2634);
INSERT INTO location VALUES (2637, 'GA7', 'transmission test', 'Robert Mueller', 2629);
INSERT INTO device VALUES (2638, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '95543046', '2013-06-11 11:26:28.593', false, 2637);
INSERT INTO component VALUES (2639, 'B', 'H', '60526842', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 03:51:04.506', 'D7', 'green', 2638);
INSERT INTO component VALUES (2640, 'F', 'C', '74622257', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 02:20:45.168', 'F5', 'green', 2638);
INSERT INTO device VALUES (2641, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '35330651', '2013-06-11 07:25:45.972', false, 2637);
INSERT INTO component VALUES (2642, 'C', 'G', '63669615', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 08:14:18.37', 'C4', 'green', 2641);
INSERT INTO component VALUES (2643, 'I', 'H', '5773934', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 05:59:24.069', 'I5', 'green', 2641);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2644, 'B3', 'Assembly+Finish', 811, 158, 'Audi A4', 2, 'path369', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2645, 'B3 Assembly', 'Series 4', 33, 'rect217', 2644);
INSERT INTO location VALUES (2646, 'ID6', 'motor test', 'Sarah Schmitt', 2645);
INSERT INTO device VALUES (2647, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'D', '57259376', '2013-06-11 03:51:40.733', false, 2646);
INSERT INTO component VALUES (2648, 'F', 'A', '42422179', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:14:45.505', 'C8', 'green', 2647);
INSERT INTO component VALUES (2649, 'I', 'I', '42417442', 'Howard Joel Wolowitz', '2013-06-11 09:45:37.472', 'I4', 'green', 2647);
INSERT INTO device VALUES (2650, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'D', '95091003', '2013-06-12 00:15:51.067', false, 2646);
INSERT INTO component VALUES (2651, 'D', 'F', '27588141', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 04:52:37.762', 'G9', 'green', 2650);
INSERT INTO component VALUES (2652, 'B', 'C', '23279818', 'Howard Joel Wolowitz', '2013-06-11 08:49:15.537', 'I2', 'green', 2650);
INSERT INTO location VALUES (2653, 'AH4', 'transmission test', 'Hans Schmitt', 2645);
INSERT INTO device VALUES (2654, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'H', '3848032', '2013-06-11 15:00:44.811', false, 2653);
INSERT INTO component VALUES (2655, 'E', 'H', '3703593', 'Howard Joel Wolowitz', '2013-06-11 10:50:11.941', 'D1', 'green', 2654);
INSERT INTO component VALUES (2656, 'D', 'E', '68159087', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 13:34:27.103', 'A2', 'green', 2654);
INSERT INTO device VALUES (2657, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '76224054', '2013-06-12 01:51:27.85', false, 2653);
INSERT INTO component VALUES (2658, 'I', 'I', '23436824', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 08:35:05.033', 'A8', 'green', 2657);
INSERT INTO component VALUES (2659, 'H', 'I', '95120272', 'Howard Joel Wolowitz', '2013-06-11 16:48:57.503', 'A3', 'green', 2657);
INSERT INTO line VALUES (2660, 'B3 PreSeries', 'Series 5', 41, 'polygon25', 2644);
INSERT INTO location VALUES (2661, 'GG3', 'multimedia test', 'Robert Meier', 2660);
INSERT INTO device VALUES (2662, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '56753777', '2013-06-11 20:56:21.295', false, 2661);
INSERT INTO component VALUES (2663, 'E', 'G', '62175524', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 12:09:56.228', 'C7', 'green', 2662);
INSERT INTO component VALUES (2664, 'D', 'C', '39354231', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 09:24:33.865', 'D5', 'green', 2662);
INSERT INTO device VALUES (2665, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'D', '74747300', '2013-06-11 10:01:57.878', false, 2661);
INSERT INTO component VALUES (2666, 'F', 'F', '18190986', 'Howard Joel Wolowitz', '2013-06-11 06:38:52.537', 'F7', 'green', 2665);
INSERT INTO component VALUES (2667, 'H', 'I', '29457951', 'Howard Joel Wolowitz', '2013-06-11 21:04:38.293', 'F1', 'green', 2665);
INSERT INTO location VALUES (2668, 'GC5', 'multimedia test', 'Peter Schmitt', 2660);
INSERT INTO device VALUES (2669, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '34226927', '2013-06-12 00:16:34.306', false, 2668);
INSERT INTO component VALUES (2670, 'G', 'H', '18459837', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 20:08:44.461', 'C3', 'green', 2669);
INSERT INTO component VALUES (2671, 'A', 'E', '26682443', 'Howard Joel Wolowitz', '2013-06-12 02:54:55.4', 'H1', 'green', 2669);
INSERT INTO device VALUES (2672, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '93888881', '2013-06-12 00:18:00.166', false, 2668);
INSERT INTO component VALUES (2673, 'E', 'B', '34900330', 'Howard Joel Wolowitz', '2013-06-12 02:50:44.48', 'C1', 'green', 2672);
INSERT INTO component VALUES (2674, 'A', 'B', '71251263', 'Howard Joel Wolowitz', '2013-06-11 17:14:35.631', 'F5', 'red', 2672);
INSERT INTO line VALUES (2675, 'B3 Finish', 'Series 2', 67, 'rect497', 2644);
INSERT INTO location VALUES (2676, 'AA9', 'ABS test', 'Peter Meier', 2675);
INSERT INTO device VALUES (2677, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '47496838', '2013-06-11 14:20:50.767', false, 2676);
INSERT INTO component VALUES (2678, 'B', 'A', '88957117', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 14:28:07.231', 'E7', 'green', 2677);
INSERT INTO component VALUES (2679, 'D', 'A', '11446846', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 19:11:04.975', 'G5', 'green', 2677);
INSERT INTO device VALUES (2680, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '82315164', '2013-06-11 22:04:46.679', false, 2676);
INSERT INTO component VALUES (2681, 'H', 'A', '33874270', 'Howard Joel Wolowitz', '2013-06-12 00:03:13.782', 'I4', 'green', 2680);
INSERT INTO component VALUES (2682, 'B', 'A', '82249056', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 05:32:45.352', 'F4', 'green', 2680);
INSERT INTO location VALUES (2683, 'II7', 'motor test', 'Peter Schmitt', 2675);
INSERT INTO device VALUES (2684, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '86860972', '2013-06-11 23:58:18.147', false, 2683);
INSERT INTO component VALUES (2685, 'D', 'E', '25339514', 'Howard Joel Wolowitz', '2013-06-11 12:24:14.64', 'D4', 'green', 2684);
INSERT INTO component VALUES (2686, 'F', 'D', '63729640', 'Howard Joel Wolowitz', '2013-06-11 05:16:10.155', 'C6', 'green', 2684);
INSERT INTO device VALUES (2687, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'H', '17654670', '2013-06-11 06:27:54.092', true, 2683);
INSERT INTO component VALUES (2688, 'I', 'A', '49757717', 'Howard Joel Wolowitz', '2013-06-11 22:00:47.459', 'C9', 'green', 2687);
INSERT INTO component VALUES (2689, 'B', 'E', '38965432', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 07:19:48.203', 'E6', 'green', 2687);
INSERT INTO hall VALUES (2690, 'H2', 'Assembly+Finish', 607, 4283, 'Audi A4', 2, 'polygon249', 8, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2691, 'H2 Assembly', 'Series 1', 13, 'rect217', 2690);
INSERT INTO location VALUES (2692, 'CD1', 'multimedia test', 'Sarah Schmitt', 2691);
INSERT INTO device VALUES (2693, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'H', '30204905', '2013-06-11 20:10:24.465', false, 2692);
INSERT INTO component VALUES (2694, 'G', 'B', '5787875', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 13:41:34.9', 'H3', 'red', 2693);
INSERT INTO component VALUES (2695, 'E', 'I', '93446093', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 04:17:26.642', 'G4', 'green', 2693);
INSERT INTO device VALUES (2696, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '32786257', '2013-06-11 09:56:30.983', false, 2692);
INSERT INTO component VALUES (2697, 'D', 'C', '5700314', 'Howard Joel Wolowitz', '2013-06-11 17:30:37.961', 'G3', 'green', 2696);
INSERT INTO component VALUES (2698, 'F', 'F', '56775745', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 12:47:31.153', 'F5', 'green', 2696);
INSERT INTO location VALUES (2699, 'HG7', 'transmission test', 'Hans Schulze', 2691);
INSERT INTO device VALUES (2700, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '8012048', '2013-06-11 07:44:55.25', false, 2699);
INSERT INTO component VALUES (2701, 'I', 'F', '90414625', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 12:12:01.552', 'D4', 'green', 2700);
INSERT INTO component VALUES (2702, 'A', 'A', '80879710', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:45:26.753', 'D9', 'green', 2700);
INSERT INTO device VALUES (2703, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '64437428', '2013-06-11 10:48:34.169', true, 2699);
INSERT INTO component VALUES (2704, 'B', 'D', '12775422', 'Howard Joel Wolowitz', '2013-06-11 10:54:58.687', 'C6', 'green', 2703);
INSERT INTO component VALUES (2705, 'F', 'H', '95105739', 'Howard Joel Wolowitz', '2013-06-11 13:08:48.062', 'I2', 'green', 2703);
INSERT INTO line VALUES (2706, 'H2 PreSeries', 'Series 4', 89, 'polygon25', 2690);
INSERT INTO location VALUES (2707, 'AG6', 'transmission test', 'Peter Merkel', 2706);
INSERT INTO device VALUES (2708, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'F', '20327323', '2013-06-11 08:19:45.257', false, 2707);
INSERT INTO component VALUES (2709, 'H', 'C', '92077627', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 04:00:05.587', 'G7', 'green', 2708);
INSERT INTO component VALUES (2710, 'H', 'G', '17036909', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 04:00:32.041', 'B4', 'green', 2708);
INSERT INTO device VALUES (2711, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '81203742', '2013-06-11 21:33:37.093', false, 2707);
INSERT INTO component VALUES (2712, 'B', 'G', '23441031', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:11:38.235', 'D3', 'green', 2711);
INSERT INTO component VALUES (2713, 'E', 'D', '11349207', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 07:22:18.175', 'D3', 'green', 2711);
INSERT INTO location VALUES (2714, 'IA1', 'security test', 'Peter Schulze', 2706);
INSERT INTO device VALUES (2715, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '70373729', '2013-06-11 08:22:07.599', false, 2714);
INSERT INTO component VALUES (2716, 'D', 'I', '61407135', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 15:58:59.924', 'G3', 'green', 2715);
INSERT INTO component VALUES (2717, 'C', 'H', '41966437', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 06:30:36.142', 'D8', 'green', 2715);
INSERT INTO device VALUES (2718, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'G', '27881422', '2013-06-11 19:15:51.018', false, 2714);
INSERT INTO component VALUES (2719, 'C', 'H', '81197510', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 11:22:19.069', 'G8', 'green', 2718);
INSERT INTO component VALUES (2720, 'C', 'E', '78045518', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 01:37:39.106', 'B3', 'green', 2718);
INSERT INTO line VALUES (2721, 'H2 Finish', 'Series 1', 47, 'rect497', 2690);
INSERT INTO location VALUES (2722, 'CF7', 'transmission test', 'Franziska Schulze', 2721);
INSERT INTO device VALUES (2723, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'N/A', 'N/A', ' ', 'A', '29133698', '2013-06-11 15:18:16.391', false, 2722);
INSERT INTO component VALUES (2724, 'G', 'D', '8063159', 'Howard Joel Wolowitz', '2013-06-11 22:35:01.65', 'I9', 'green', 2723);
INSERT INTO component VALUES (2725, 'C', 'E', '44144957', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 04:31:35.958', 'I3', 'green', 2723);
INSERT INTO device VALUES (2726, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '61223697', '2013-06-11 10:07:37.632', false, 2722);
INSERT INTO component VALUES (2727, 'E', 'A', '18145004', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 02:08:06.134', 'G6', 'green', 2726);
INSERT INTO component VALUES (2728, 'G', 'C', '75207634', 'Howard Joel Wolowitz', '2013-06-12 00:19:36.667', 'H4', 'green', 2726);
INSERT INTO location VALUES (2729, 'AI2', 'security test', 'Sarah Mueller', 2721);
INSERT INTO device VALUES (2730, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '1036539', '2013-06-12 00:18:49.808', false, 2729);
INSERT INTO component VALUES (2731, 'G', 'I', '68969607', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:25:16.146', 'G7', 'green', 2730);
INSERT INTO component VALUES (2732, 'I', 'F', '27855995', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 07:32:21.552', 'H5', 'green', 2730);
INSERT INTO device VALUES (2733, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '69321399', '2013-06-11 20:27:04.266', false, 2729);
INSERT INTO component VALUES (2734, 'C', 'G', '69236580', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 13:34:44.491', 'E8', 'red', 2733);
INSERT INTO component VALUES (2735, 'G', 'I', '93511809', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 23:27:20.907', 'D5', 'green', 2733);
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
   id="SVGPlan">
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
INSERT INTO hall VALUES (2736, 'G7', 'Assembly+Finish', 227, 395, 'Audi A4', 2, 'path369', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2737, 'G7 Assembly', 'Series 3', 26, 'rect217', 2736);
INSERT INTO location VALUES (2738, 'FA9', 'multimedia test', 'Franziska Schmitt', 2737);
INSERT INTO device VALUES (2739, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'H', '43907504', '2013-06-11 10:28:43.959', false, 2738);
INSERT INTO component VALUES (2740, 'A', 'C', '71283984', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 16:27:36.035', 'G8', 'green', 2739);
INSERT INTO component VALUES (2741, 'E', 'B', '54266651', 'Howard Joel Wolowitz', '2013-06-12 03:20:41.631', 'E8', 'green', 2739);
INSERT INTO device VALUES (2742, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'A', '60304524', '2013-06-11 19:11:23.023', false, 2738);
INSERT INTO component VALUES (2743, 'B', 'E', '78606522', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 00:34:27.254', 'H6', 'green', 2742);
INSERT INTO component VALUES (2744, 'G', 'G', '30670889', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 07:14:54.182', 'D1', 'red', 2742);
INSERT INTO location VALUES (2745, 'HI3', 'security test', 'Peter Merkel', 2737);
INSERT INTO device VALUES (2746, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'A', '37759465', '2013-06-11 06:45:15.515', false, 2745);
INSERT INTO component VALUES (2747, 'H', 'B', '63976299', 'Howard Joel Wolowitz', '2013-06-11 07:40:35.232', 'G9', 'green', 2746);
INSERT INTO component VALUES (2748, 'E', 'A', '54840027', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 21:32:11.362', 'E7', 'green', 2746);
INSERT INTO device VALUES (2749, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '11147196', '2013-06-11 19:13:35.166', false, 2745);
INSERT INTO component VALUES (2750, 'A', 'A', '49975161', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 02:18:13.603', 'C9', 'green', 2749);
INSERT INTO component VALUES (2751, 'E', 'I', '80356881', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 11:35:34.361', 'C2', 'green', 2749);
INSERT INTO line VALUES (2752, 'G7 PreSeries', 'Series 3', 71, 'polygon25', 2736);
INSERT INTO location VALUES (2753, 'CC3', 'transmission test', 'Hans Meier', 2752);
INSERT INTO device VALUES (2754, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '7281436', '2013-06-11 19:36:26.698', true, 2753);
INSERT INTO component VALUES (2755, 'C', 'A', '13638687', 'Howard Joel Wolowitz', '2013-06-11 20:16:00.8', 'A4', 'green', 2754);
INSERT INTO component VALUES (2756, 'D', 'G', '95765148', 'Howard Joel Wolowitz', '2013-06-11 06:36:58.978', 'A3', 'green', 2754);
INSERT INTO device VALUES (2757, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'I', '58396534', '2013-06-11 23:37:36.175', false, 2753);
INSERT INTO component VALUES (2758, 'H', 'D', '85465617', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:35:40.515', 'B9', 'green', 2757);
INSERT INTO component VALUES (2759, 'A', 'H', '10852949', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 06:45:57.135', 'C6', 'green', 2757);
INSERT INTO location VALUES (2760, 'BA1', 'transmission test', 'Robert Meier', 2752);
INSERT INTO device VALUES (2761, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'F', '41096371', '2013-06-11 10:07:25.183', false, 2760);
INSERT INTO component VALUES (2762, 'H', 'C', '89254004', 'Dr. Leonard Leakey Hofstadter', '2013-06-12 00:59:08.992', 'I2', 'green', 2761);
INSERT INTO component VALUES (2763, 'E', 'C', '8857200', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 15:47:36.956', 'C2', 'green', 2761);
INSERT INTO device VALUES (2764, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '20688967', '2013-06-11 07:13:48.687', false, 2760);
INSERT INTO component VALUES (2765, 'I', 'B', '83151193', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 08:33:10.823', 'E3', 'green', 2764);
INSERT INTO component VALUES (2766, 'G', 'B', '99113944', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 07:11:58.905', 'C9', 'green', 2764);
INSERT INTO line VALUES (2767, 'G7 Finish', 'Series 9', 68, 'rect497', 2736);
INSERT INTO location VALUES (2768, 'HG7', 'transmission test', 'Franziska Merkel', 2767);
INSERT INTO device VALUES (2769, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '77891244', '2013-06-11 06:32:35.807', true, 2768);
INSERT INTO component VALUES (2770, 'E', 'E', '6337883', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 04:21:57.701', 'A6', 'green', 2769);
INSERT INTO component VALUES (2771, 'C', 'B', '77213557', 'Howard Joel Wolowitz', '2013-06-11 13:05:59.424', 'A6', 'green', 2769);
INSERT INTO device VALUES (2772, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'N/A', 'N/A', ' ', 'C', '35866225', '2013-06-11 05:27:53.325', false, 2768);
INSERT INTO component VALUES (2773, 'H', 'D', '20701000', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:24:22.917', 'G5', 'green', 2772);
INSERT INTO component VALUES (2774, 'C', 'C', '94050012', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 00:32:41.131', 'F4', 'green', 2772);
INSERT INTO location VALUES (2775, 'EE2', 'motor test', 'Peter Mueller', 2767);
INSERT INTO device VALUES (2776, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '40737070', '2013-06-11 17:58:00.421', false, 2775);
INSERT INTO component VALUES (2777, 'H', 'G', '57124096', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 00:07:54.385', 'C1', 'green', 2776);
INSERT INTO component VALUES (2778, 'E', 'H', '86150178', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 18:04:50.006', 'E8', 'green', 2776);
INSERT INTO device VALUES (2779, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'D', '84622335', '2013-06-12 00:19:19.455', false, 2775);
INSERT INTO component VALUES (2780, 'I', 'E', '10438484', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 23:09:43.035', 'E8', 'green', 2779);
INSERT INTO component VALUES (2781, 'F', 'F', '63595059', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 11:07:25.26', 'F9', 'green', 2779);
INSERT INTO hall VALUES (2782, 'E3', 'Assembly+Finish', 587, 1396, 'Audi A4', 2, 'polygon249', 9, '<?xml version="1.0" encoding="UTF-8" standalone="no"?>
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
INSERT INTO line VALUES (2783, 'E3 Assembly', 'Series 4', 14, 'rect217', 2782);
INSERT INTO location VALUES (2784, 'FF4', 'security test', 'Franziska Merkel', 2783);
INSERT INTO device VALUES (2785, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '7019601', '2013-06-11 09:13:06.546', true, 2784);
INSERT INTO component VALUES (2786, 'I', 'I', '59046699', 'Howard Joel Wolowitz', '2013-06-12 02:35:53.196', 'H5', 'green', 2785);
INSERT INTO component VALUES (2787, 'B', 'H', '23635418', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 18:46:51.335', 'F9', 'green', 2785);
INSERT INTO device VALUES (2788, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'reachable', '10.xxx.xxx.xxx', ' ', 'E', '22049678', '2013-06-11 23:01:40.799', false, 2784);
INSERT INTO component VALUES (2789, 'D', 'B', '9988208', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 21:12:37.012', 'C9', 'green', 2788);
INSERT INTO component VALUES (2790, 'C', 'A', '48669191', 'Howard Joel Wolowitz', '2013-06-11 11:06:52.826', 'F2', 'green', 2788);
INSERT INTO location VALUES (2791, 'AI9', 'multimedia test', 'Peter Merkel', 2783);
INSERT INTO device VALUES (2792, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '54940808', '2013-06-11 10:05:24.766', false, 2791);
INSERT INTO component VALUES (2793, 'G', 'B', '3386551', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 09:08:55.279', 'H3', 'green', 2792);
INSERT INTO component VALUES (2794, 'D', 'B', '30345815', 'Howard Joel Wolowitz', '2013-06-12 00:25:20.832', 'F2', 'green', 2792);
INSERT INTO device VALUES (2795, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '52710470', '2013-06-11 12:10:46.934', false, 2791);
INSERT INTO component VALUES (2796, 'D', 'G', '49141968', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 09:10:25.15', 'B8', 'green', 2795);
INSERT INTO component VALUES (2797, 'F', 'H', '38627682', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 03:12:10.76', 'B3', 'green', 2795);
INSERT INTO line VALUES (2798, 'E3 PreSeries', 'Series 4', 74, 'polygon25', 2782);
INSERT INTO location VALUES (2799, 'GE9', 'security test', 'Robert Meier', 2798);
INSERT INTO device VALUES (2800, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'B', '15555364', '2013-06-11 09:46:06.126', false, 2799);
INSERT INTO component VALUES (2801, 'H', 'I', '10537012', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-12 01:18:28.427', 'F1', 'green', 2800);
INSERT INTO component VALUES (2802, 'C', 'C', '91243474', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 19:41:20.963', 'I4', 'green', 2800);
INSERT INTO device VALUES (2803, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'C', '8900363', '2013-06-11 07:02:00.929', false, 2799);
INSERT INTO component VALUES (2804, 'A', 'A', '80924023', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 18:55:36.87', 'G6', 'green', 2803);
INSERT INTO component VALUES (2805, 'I', 'H', '76009329', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 11:57:47.643', 'C7', 'green', 2803);
INSERT INTO location VALUES (2806, 'CA2', 'motor test', 'Hans Merkel', 2798);
INSERT INTO device VALUES (2807, 'UPS MFT Cradle', 'DSA MFT Cradle for Power Supply and LAN connection', 'IBNA-LS3X2', 'reachable', '10.xxx.xxx.xxx', ' ', 'D', '98571905', '2013-06-11 22:55:19.986', false, 2806);
INSERT INTO component VALUES (2808, 'C', 'C', '46735108', 'Howard Joel Wolowitz', '2013-06-11 10:44:04.543', 'A9', 'green', 2807);
INSERT INTO component VALUES (2809, 'D', 'C', '96959470', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-12 01:01:37.292', 'B9', 'green', 2807);
INSERT INTO device VALUES (2810, 'UPS Printer', 'DSA Print Server Station', 'IBNA-PS1', 'N/A', 'N/A', ' ', 'E', '56551973', '2013-06-11 21:16:38.086', false, 2806);
INSERT INTO component VALUES (2811, 'A', 'A', '7923703', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 10:24:30.674', 'B8', 'green', 2810);
INSERT INTO component VALUES (2812, 'A', 'G', '64678665', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 17:22:56.234', 'H3', 'green', 2810);
INSERT INTO line VALUES (2813, 'E3 Finish', 'Series 7', 62, 'rect497', 2782);
INSERT INTO location VALUES (2814, 'ID3', 'motor test', 'Franziska Meier', 2813);
INSERT INTO device VALUES (2815, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'N/A', 'N/A', ' ', 'G', '88773235', '2013-06-11 11:51:17.305', false, 2814);
INSERT INTO component VALUES (2816, 'E', 'F', '95693530', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 09:01:21.226', 'E3', 'green', 2815);
INSERT INTO component VALUES (2817, 'A', 'G', '37048664', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 23:04:52.594', 'F3', 'green', 2815);
INSERT INTO device VALUES (2818, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'I', '3074364', '2013-06-11 10:06:36.627', true, 2814);
INSERT INTO component VALUES (2819, 'G', 'D', '48732893', 'Howard Joel Wolowitz', '2013-06-11 16:16:38.351', 'E3', 'red', 2818);
INSERT INTO component VALUES (2820, 'G', 'H', '64830171', 'Dr. Dr. Sheldon Lee Cooper', '2013-06-11 15:48:16.902', 'E6', 'green', 2818);
INSERT INTO location VALUES (2821, 'AF7', 'ABS test', 'Robert Meier', 2813);
INSERT INTO device VALUES (2822, 'UPS Printer', 'EPSON Printer TN-220B', 'IBNA-PR1', 'reachable', '10.xxx.xxx.xxx', ' ', 'G', '79196321', '2013-06-11 14:32:42.967', false, 2821);
INSERT INTO component VALUES (2823, 'B', 'G', '37160816', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 20:44:51.798', 'A7', 'green', 2822);
INSERT INTO component VALUES (2824, 'F', 'B', '21837025', 'Dr. Leonard Leakey Hofstadter', '2013-06-11 04:23:22.371', 'B3', 'green', 2822);
INSERT INTO device VALUES (2825, 'UPS MFTD2X', 'DSA Multifunction-tester Gen. 2', 'MFTD2XI1-052', 'reachable', '10.xxx.xxx.xxx', ' ', 'A', '40585405', '2013-06-11 14:05:46.988', false, 2821);
INSERT INTO component VALUES (2826, 'G', 'F', '10515368', 'Dr. Rajesh Ramayan Koothrappali', '2013-06-11 23:51:18.074', 'D9', 'green', 2825);
INSERT INTO component VALUES (2827, 'I', 'G', '19983442', 'Howard Joel Wolowitz', '2013-06-11 06:26:37.375', 'C5', 'green', 2825);
