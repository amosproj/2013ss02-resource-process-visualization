drop table if exists component;
drop table if exists device;
drop table if exists line;
drop table if exists location;
drop table if exists hall;
drop table if exists factory;



create table factory(
	id int ,
	name  character varying(50), 
	company  character varying(50), 
	city  character varying(50), 
	country  character varying(50), 				
	gpslatitude double precision , 
	gpslongitude double precision, 
	carmodels  character varying(512), 
	sizeofstaff int, 
	numofvehicles int 
);
						
						
						
CREATE TABLE hall (
    id integer ,
    name character varying(50),
    staff integer,
    capacity integer,
    path character varying(250),
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
						
/* ************************************************************************************************************* */				
/*Factories */


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

/* end of factories */
/* ************************************************************************************************************* */





/* ************************************************************************************************************* */
/* Halls */

/* factory 1 */
INSERT INTO hall VALUES (10, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);
INSERT INTO hall VALUES (11, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1);
INSERT INTO hall VALUES (12, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 1);

/* factory 2 */
INSERT INTO hall VALUES (20, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2);
INSERT INTO hall VALUES (21, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2);
INSERT INTO hall VALUES (22, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 2);

/* factory 3 */
INSERT INTO hall VALUES (30, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO hall VALUES (31, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO hall VALUES (32, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 3);

/* factory 4 */
INSERT INTO hall VALUES (40, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO hall VALUES (41, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO hall VALUES (42, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 4);

/* factory 5 */
INSERT INTO hall VALUES (50, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO hall VALUES (51, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO hall VALUES (52, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 5);

/* factory 6 */
INSERT INTO hall VALUES (60, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO hall VALUES (61, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO hall VALUES (62, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 6);

/* factory 7 */
INSERT INTO hall VALUES (70, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO hall VALUES (71, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO hall VALUES (72, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 7);

/* factory 8 */
INSERT INTO hall VALUES (80, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO hall VALUES (81, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO hall VALUES (82, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 8);

/* factory 9 */
INSERT INTO hall VALUES (90, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO hall VALUES (91, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO hall VALUES (92, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 9);

/* end of halls */
/* ************************************************************************************************************* */



/* ************************************************************************************************************* */
/* Lines */

/* factory 1 */
/* hall B5 */
INSERT INTO line VALUES (100, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 10);
INSERT INTO line VALUES (101, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 10);
/* hall B8 */
INSERT INTO line VALUES (110, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 11);
INSERT INTO line VALUES (111, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 11);
/* hall V1 */
INSERT INTO line VALUES (120, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 12);
INSERT INTO line VALUES (121, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 12);

/* factory 2 */
/* hall B5 */
INSERT INTO line VALUES (200, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 20);
INSERT INTO line VALUES (201, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 20);
/* hall B8 */
INSERT INTO line VALUES (210, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 21);
INSERT INTO line VALUES (211, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 21);
/* hall V1 */
INSERT INTO line VALUES (220, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 22);
INSERT INTO line VALUES (221, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 22);

/* factory 3 */
/* hall B5 */
INSERT INTO line VALUES (300, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 30);
INSERT INTO line VALUES (301, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 30);
/* hall B8 */
INSERT INTO line VALUES (310, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 31);
INSERT INTO line VALUES (311, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 31);
/* hall V1 */
INSERT INTO line VALUES (320, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 32);
INSERT INTO line VALUES (321, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 32);

/* factory 4 */
/* hall B5 */
INSERT INTO line VALUES (400, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 40);
INSERT INTO line VALUES (401, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 40);
/* hall B8 */
INSERT INTO line VALUES (410, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 41);
INSERT INTO line VALUES (411, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 41);
/* hall V1 */
INSERT INTO line VALUES (420, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 42);
INSERT INTO line VALUES (421, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 42);

/* factory 5 */
/* hall B5 */
INSERT INTO line VALUES (500, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 50);
INSERT INTO line VALUES (501, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 50);
/* hall B8 */
INSERT INTO line VALUES (510, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 51);
INSERT INTO line VALUES (511, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 51);
/* hall V1 */
INSERT INTO line VALUES (520, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 52);
INSERT INTO line VALUES (521, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 52);

/* factory 6 */
/* hall B5 */
INSERT INTO line VALUES (600, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 60);
INSERT INTO line VALUES (601, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 60);
/* hall B8 */
INSERT INTO line VALUES (610, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 61);
INSERT INTO line VALUES (611, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 61);
/* hall V1 */
INSERT INTO line VALUES (620, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 62);
INSERT INTO line VALUES (621, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 62);

/* factory 7 */
/* hall B5 */
INSERT INTO line VALUES (700, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 70);
INSERT INTO line VALUES (701, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 70);
/* hall B8 */
INSERT INTO line VALUES (710, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 71);
INSERT INTO line VALUES (711, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 71);
/* hall V1 */
INSERT INTO line VALUES (720, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 72);
INSERT INTO line VALUES (721, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 72);

/* factory 8 */
/* hall B5 */
INSERT INTO line VALUES (800, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 80);
INSERT INTO line VALUES (801, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 80);
/* hall B8 */
INSERT INTO line VALUES (810, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 81);
INSERT INTO line VALUES (811, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 81);
/* hall V1 */
INSERT INTO line VALUES (820, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 82);
INSERT INTO line VALUES (821, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 82);

/* factory 9 */
/* hall B5 */
INSERT INTO line VALUES (900, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 90);
INSERT INTO line VALUES (901, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 90);
/* hall B8 */
INSERT INTO line VALUES (910, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 91);
INSERT INTO line VALUES (911, 'B8 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 91);
/* hall V1 */
INSERT INTO line VALUES (920, 'V1 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 92);
INSERT INTO line VALUES (921, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 92);

/* end of Lines */
/* ************************************************************************************************************* */


/* ************************************************************************************************************* */
/* Locations */

/* factory 1 */
/* hall B5 */
/* Line 1 */
INSERT INTO location VALUES (1000, 'VP1', 100);
INSERT INTO location VALUES (1001, 'VP2', 100);
INSERT INTO location VALUES (1002, 'VP3', 100);
INSERT INTO location VALUES (1003, 'IBN', 100);
INSERT INTO location VALUES (1004, 'Rework', 100);
/* Line 2*/
INSERT INTO location VALUES (1010, 'BZD', 101);
INSERT INTO location VALUES (1011, 'VP1', 101);
INSERT INTO location VALUES (1012, 'VP3', 101);
INSERT INTO location VALUES (1013, 'IBN', 101);
INSERT INTO location VALUES (1014, 'PreSeries', 101);

/* hall B8 */
/* Line 1 */
INSERT INTO location VALUES (1100, 'VP1', 110);
INSERT INTO location VALUES (1101, 'VP2', 110);
INSERT INTO location VALUES (1102, 'VP3', 110);
INSERT INTO location VALUES (1103, 'IBN', 110);
INSERT INTO location VALUES (1104, 'Rework', 110);
/* Line 2*/
INSERT INTO location VALUES (1110, 'BZD', 111);
INSERT INTO location VALUES (1111, 'VP1', 111);
INSERT INTO location VALUES (1112, 'VP3', 111);
INSERT INTO location VALUES (1113, 'IBN', 111);
INSERT INTO location VALUES (1114, 'PreSeries', 111);

/* hall V1 */
/* Line 1 */
INSERT INTO location VALUES (1200, 'VP1', 120);
INSERT INTO location VALUES (1201, 'VP2', 120);
INSERT INTO location VALUES (1202, 'VP3', 120);
INSERT INTO location VALUES (1203, 'IBN', 120);
INSERT INTO location VALUES (1204, 'Rework', 120);
/* Line 2*/
INSERT INTO location VALUES (1210, 'BZD', 121);
INSERT INTO location VALUES (1211, 'VP1', 121);
INSERT INTO location VALUES (1212, 'VP3', 121);
INSERT INTO location VALUES (1213, 'IBN', 121);
INSERT INTO location VALUES (1214, 'PreSeries', 121);


/* end of Locations */
/* ************************************************************************************************************* */

				

insert into device values (10000, 'Bla', 'TestSector', '12345', '2013-05-28 07:37:16-08', false, 1000);
insert into component values(100000, 'TestSector', 'TestCategory','123ab45c', 'Sheldon Cooper', '2013-05-28 17:50:00-08', 'aa', 10000);

