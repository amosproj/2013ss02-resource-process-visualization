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
INSERT INTO hall VALUES (10, 'G5', 934, 2663, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);
INSERT INTO line VALUES (11, 'G5 Assembly', 'Series 6', 46, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 10);
INSERT INTO location VALUES (12, 'EE3', 11);
INSERT INTO device VALUES (13, 'G6', 'G', '63741330', '2013-05-28 17:07:43.586', false, 12);
INSERT INTO component VALUES (14, 'I', 'H9', '80218833', 'Howard Joel Wolowitz', '2013-05-28 13:44:52.786', 'F', 13);
INSERT INTO component VALUES (15, 'H', 'D1', '11803254', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:23:14.584', 'D', 13);
INSERT INTO device VALUES (16, 'I7', 'E', '25239759', '2013-05-28 14:08:16.482', true, 12);
INSERT INTO component VALUES (17, 'B', 'B7', '88754638', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 12:11:31.995', 'D', 16);
INSERT INTO component VALUES (18, 'D', 'C9', '1195899', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:19:30.319', 'E', 16);
INSERT INTO location VALUES (19, 'GD4', 11);
INSERT INTO device VALUES (20, 'A8', 'E', '47883955', '2013-05-28 12:16:40.82', false, 19);
INSERT INTO component VALUES (21, 'D', 'H8', '16924257', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:59:32.403', 'C', 20);
INSERT INTO component VALUES (22, 'C', 'G4', '26370373', 'Howard Joel Wolowitz', '2013-05-28 05:41:58.081', 'H', 20);
INSERT INTO device VALUES (23, 'B7', 'D', '74053143', '2013-05-28 19:52:53.307', false, 19);
INSERT INTO component VALUES (24, 'D', 'F6', '77964036', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:32:22.888', 'E', 23);
INSERT INTO component VALUES (25, 'F', 'E6', '61385485', 'Howard Joel Wolowitz', '2013-05-28 00:23:09.372', 'D', 23);
INSERT INTO line VALUES (26, 'G5 PreSeries', 'Series 4', 13, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 10);
INSERT INTO location VALUES (27, 'CD3', 26);
INSERT INTO device VALUES (28, 'D3', 'I', '13379687', '2013-05-28 16:09:15.352', false, 27);
INSERT INTO component VALUES (29, 'E', 'A7', '93367303', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:38:49.984', 'G', 28);
INSERT INTO component VALUES (30, 'C', 'I6', '79297021', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:11:19.675', 'F', 28);
INSERT INTO device VALUES (31, 'C4', 'E', '12522648', '2013-05-28 14:07:19.27', false, 27);
INSERT INTO component VALUES (32, 'A', 'I8', '42767886', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:47:20.27', 'I', 31);
INSERT INTO component VALUES (33, 'H', 'B8', '19229296', 'Howard Joel Wolowitz', '2013-05-27 22:08:08.453', 'I', 31);
INSERT INTO location VALUES (34, 'GE9', 26);
INSERT INTO device VALUES (35, 'I8', 'D', '20897997', '2013-05-28 17:01:50.14', false, 34);
INSERT INTO component VALUES (36, 'I', 'H7', '60820820', 'Howard Joel Wolowitz', '2013-05-28 19:45:31.13', 'D', 35);
INSERT INTO component VALUES (37, 'H', 'H5', '66009877', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:52:32.723', 'I', 35);
INSERT INTO device VALUES (38, 'I6', 'G', '47605670', '2013-05-28 21:23:23.612', false, 34);
INSERT INTO component VALUES (39, 'H', 'F8', '94174248', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 08:37:44.333', 'D', 38);
INSERT INTO component VALUES (40, 'G', 'G3', '64505233', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:33:14.242', 'G', 38);
INSERT INTO hall VALUES (41, 'E5', 333, 1918, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1);
INSERT INTO line VALUES (42, 'E5 Assembly', 'Series 1', 65, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 41);
INSERT INTO location VALUES (43, 'GH3', 42);
INSERT INTO device VALUES (44, 'H9', 'E', '65700977', '2013-05-28 00:22:44.263', false, 43);
INSERT INTO component VALUES (45, 'D', 'H9', '85240479', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:58:33.159', 'H', 44);
INSERT INTO component VALUES (46, 'B', 'E1', '80481607', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:24:24.505', 'H', 44);
INSERT INTO device VALUES (47, 'D3', 'B', '54367087', '2013-05-28 12:51:40.432', false, 43);
INSERT INTO component VALUES (48, 'G', 'C4', '36940777', 'Howard Joel Wolowitz', '2013-05-28 17:00:46.11', 'E', 47);
INSERT INTO component VALUES (49, 'I', 'G1', '54873764', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 21:49:45.429', 'G', 47);
INSERT INTO location VALUES (50, 'EF3', 42);
INSERT INTO device VALUES (51, 'I2', 'E', '68756264', '2013-05-28 20:31:34.64', true, 50);
INSERT INTO component VALUES (52, 'I', 'A4', '55109192', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:00:20.747', 'B', 51);
INSERT INTO component VALUES (53, 'E', 'F6', '29783566', 'Howard Joel Wolowitz', '2013-05-28 12:44:28.006', 'F', 51);
INSERT INTO device VALUES (54, 'F5', 'A', '84748755', '2013-05-28 16:51:59.881', false, 50);
INSERT INTO component VALUES (55, 'D', 'G4', '20858796', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:04:25.337', 'H', 54);
INSERT INTO component VALUES (56, 'I', 'B7', '891878', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:11:05.004', 'A', 54);
INSERT INTO line VALUES (57, 'E5 PreSeries', 'Series 2', 76, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 41);
INSERT INTO location VALUES (58, 'CI3', 57);
INSERT INTO device VALUES (59, 'H6', 'G', '58892134', '2013-05-28 00:24:15.665', false, 58);
INSERT INTO component VALUES (60, 'D', 'I5', '62635408', 'Howard Joel Wolowitz', '2013-05-28 09:36:11.643', 'F', 59);
INSERT INTO component VALUES (61, 'F', 'D2', '36012871', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 01:27:29.618', 'C', 59);
INSERT INTO device VALUES (62, 'G3', 'H', '4359050', '2013-05-28 15:31:37.142', false, 58);
INSERT INTO component VALUES (63, 'G', 'C7', '35664936', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:14:44.777', 'G', 62);
INSERT INTO component VALUES (64, 'E', 'I2', '41343809', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 00:12:32.299', 'F', 62);
INSERT INTO location VALUES (65, 'AB5', 57);
INSERT INTO device VALUES (66, 'H2', 'H', '65658005', '2013-05-28 16:26:24.978', false, 65);
INSERT INTO component VALUES (67, 'B', 'E3', '1919993', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:30:30.346', 'I', 66);
INSERT INTO component VALUES (68, 'H', 'A8', '18860296', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:02:21.339', 'I', 66);
INSERT INTO device VALUES (69, 'A4', 'A', '26957636', '2013-05-28 00:45:31.522', false, 65);
INSERT INTO component VALUES (70, 'E', 'B9', '27454226', 'Howard Joel Wolowitz', '2013-05-28 17:02:16.013', 'C', 69);
INSERT INTO component VALUES (71, 'E', 'D8', '63305952', 'Howard Joel Wolowitz', '2013-05-27 23:54:16.376', 'I', 69);
INSERT INTO hall VALUES (72, 'A7', 678, 4352, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 2);
INSERT INTO line VALUES (73, 'A7 Assembly', 'Series 5', 50, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 72);
INSERT INTO location VALUES (74, 'DG4', 73);
INSERT INTO device VALUES (75, 'A6', 'H', '17598093', '2013-05-28 13:09:44.748', false, 74);
INSERT INTO component VALUES (76, 'F', 'F7', '74157095', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 21:35:07.485', 'B', 75);
INSERT INTO component VALUES (77, 'D', 'E1', '4487665', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:30:11.897', 'I', 75);
INSERT INTO device VALUES (78, 'C5', 'A', '11281292', '2013-05-28 02:10:30.066', false, 74);
INSERT INTO component VALUES (79, 'D', 'E6', '36986886', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 05:20:56.748', 'C', 78);
INSERT INTO component VALUES (80, 'D', 'C7', '45700737', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 09:57:49.706', 'F', 78);
INSERT INTO location VALUES (81, 'IC5', 73);
INSERT INTO device VALUES (82, 'E8', 'F', '37214908', '2013-05-28 12:41:42.28', false, 81);
INSERT INTO component VALUES (83, 'B', 'D3', '70874076', 'Howard Joel Wolowitz', '2013-05-28 01:31:36.501', 'B', 82);
INSERT INTO component VALUES (84, 'C', 'A7', '86213936', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:53:58.075', 'G', 82);
INSERT INTO device VALUES (85, 'C5', 'C', '19000253', '2013-05-28 21:09:56.327', true, 81);
INSERT INTO component VALUES (86, 'A', 'I2', '22663964', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:28:06.542', 'G', 85);
INSERT INTO component VALUES (87, 'I', 'E3', '56453857', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:23:58.306', 'G', 85);
INSERT INTO line VALUES (88, 'A7 PreSeries', 'Series 2', 57, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 72);
INSERT INTO location VALUES (89, 'AH6', 88);
INSERT INTO device VALUES (90, 'G1', 'G', '44022192', '2013-05-28 15:21:18.31', false, 89);
INSERT INTO component VALUES (91, 'I', 'H5', '35175308', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:06:17.923', 'I', 90);
INSERT INTO component VALUES (92, 'H', 'I3', '36009179', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 12:35:52.134', 'D', 90);
INSERT INTO device VALUES (93, 'F4', 'H', '74542170', '2013-05-27 23:35:42.591', false, 89);
INSERT INTO component VALUES (94, 'C', 'E9', '99608826', 'Howard Joel Wolowitz', '2013-05-28 10:20:34.5', 'F', 93);
INSERT INTO component VALUES (95, 'D', 'I5', '3841816', 'Howard Joel Wolowitz', '2013-05-28 12:09:47.004', 'H', 93);
INSERT INTO location VALUES (96, 'GA9', 88);
INSERT INTO device VALUES (97, 'A3', 'I', '83836478', '2013-05-28 02:05:06.521', false, 96);
INSERT INTO component VALUES (98, 'A', 'B1', '27823529', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 22:01:28.388', 'F', 97);
INSERT INTO component VALUES (99, 'C', 'D7', '22548600', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:46:29.032', 'I', 97);
INSERT INTO device VALUES (100, 'G6', 'E', '59470541', '2013-05-28 04:16:01.343', false, 96);
INSERT INTO component VALUES (101, 'B', 'F8', '96569084', 'Howard Joel Wolowitz', '2013-05-28 20:24:10.691', 'G', 100);
INSERT INTO component VALUES (102, 'C', 'I5', '64552257', 'Howard Joel Wolowitz', '2013-05-28 20:50:31.016', 'H', 100);
INSERT INTO hall VALUES (103, 'B3', 998, 2566, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 2);
INSERT INTO line VALUES (104, 'B3 Assembly', 'Series 9', 66, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 103);
INSERT INTO location VALUES (105, 'HE3', 104);
INSERT INTO device VALUES (106, 'F3', 'E', '15768531', '2013-05-28 07:48:14.655', false, 105);
INSERT INTO component VALUES (107, 'H', 'F1', '9033131', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:30:09.787', 'G', 106);
INSERT INTO component VALUES (108, 'A', 'D9', '2458047', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 05:29:05.014', 'B', 106);
INSERT INTO device VALUES (109, 'H8', 'A', '12942337', '2013-05-28 01:25:34.6', false, 105);
INSERT INTO component VALUES (110, 'A', 'H5', '80043597', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 20:34:34.916', 'E', 109);
INSERT INTO component VALUES (111, 'G', 'H1', '49036870', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 10:15:51.181', 'B', 109);
INSERT INTO location VALUES (112, 'GB5', 104);
INSERT INTO device VALUES (113, 'A7', 'E', '29286787', '2013-05-28 07:54:32.025', true, 112);
INSERT INTO component VALUES (114, 'G', 'H8', '58690', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:53:00.73', 'E', 113);
INSERT INTO component VALUES (115, 'D', 'I2', '93574198', 'Howard Joel Wolowitz', '2013-05-28 17:01:43.8', 'G', 113);
INSERT INTO device VALUES (116, 'A4', 'H', '49965767', '2013-05-27 21:47:16.274', false, 112);
INSERT INTO component VALUES (117, 'G', 'D6', '35844552', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:26:14.131', 'A', 116);
INSERT INTO component VALUES (118, 'G', 'D6', '62999912', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:48:20.663', 'H', 116);
INSERT INTO line VALUES (119, 'B3 PreSeries', 'Series 9', 92, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 103);
INSERT INTO location VALUES (120, 'GC3', 119);
INSERT INTO device VALUES (121, 'F4', 'E', '71378562', '2013-05-28 17:02:01.937', false, 120);
INSERT INTO component VALUES (122, 'C', 'A3', '91031308', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:45:51.652', 'A', 121);
INSERT INTO component VALUES (123, 'A', 'F7', '79362404', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:10:49.985', 'D', 121);
INSERT INTO device VALUES (124, 'F7', 'G', '35170072', '2013-05-28 06:19:04.259', false, 120);
INSERT INTO component VALUES (125, 'I', 'D3', '89104545', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:41:51.273', 'G', 124);
INSERT INTO component VALUES (126, 'A', 'B8', '32476619', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:35:38.992', 'E', 124);
INSERT INTO location VALUES (127, 'FG4', 119);
INSERT INTO device VALUES (128, 'F8', 'H', '47743697', '2013-05-28 02:36:58.84', false, 127);
INSERT INTO component VALUES (129, 'B', 'G7', '14067936', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:37:33.106', 'F', 128);
INSERT INTO component VALUES (130, 'F', 'A1', '2812411', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:28:20.528', 'B', 128);
INSERT INTO device VALUES (131, 'B4', 'F', '73360467', '2013-05-28 19:53:30.662', true, 127);
INSERT INTO component VALUES (132, 'E', 'F9', '91529425', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 08:19:48.85', 'H', 131);
INSERT INTO component VALUES (133, 'D', 'H1', '77253212', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 02:07:04.525', 'B', 131);
INSERT INTO hall VALUES (134, 'D3', 54, 71, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 3);
INSERT INTO line VALUES (135, 'D3 Assembly', 'Series 4', 12, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 134);
INSERT INTO location VALUES (136, 'BF3', 135);
INSERT INTO device VALUES (137, 'E9', 'A', '38419941', '2013-05-28 13:20:47.447', false, 136);
INSERT INTO component VALUES (138, 'A', 'H9', '40628716', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:14:38.374', 'C', 137);
INSERT INTO component VALUES (139, 'C', 'G1', '72774757', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 16:11:11.883', 'D', 137);
INSERT INTO device VALUES (140, 'H8', 'D', '81364816', '2013-05-28 01:49:18.449', false, 136);
INSERT INTO component VALUES (141, 'E', 'E8', '5926310', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:01:59.335', 'A', 140);
INSERT INTO component VALUES (142, 'A', 'H5', '22587108', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:34:38.023', 'G', 140);
INSERT INTO location VALUES (143, 'EG5', 135);
INSERT INTO device VALUES (144, 'C9', 'B', '4299998', '2013-05-28 04:31:00.539', false, 143);
INSERT INTO component VALUES (145, 'A', 'H9', '32464311', 'Howard Joel Wolowitz', '2013-05-28 12:46:37.804', 'D', 144);
INSERT INTO component VALUES (146, 'A', 'B5', '27010476', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:58:27.864', 'C', 144);
INSERT INTO device VALUES (147, 'F3', 'C', '24250564', '2013-05-28 18:30:09.088', false, 143);
INSERT INTO component VALUES (148, 'F', 'C6', '8371743', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:55:13.663', 'B', 147);
INSERT INTO component VALUES (149, 'B', 'D6', '62040607', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:39:04.519', 'G', 147);
INSERT INTO line VALUES (150, 'D3 PreSeries', 'Series 2', 47, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 134);
INSERT INTO location VALUES (151, 'EB6', 150);
INSERT INTO device VALUES (152, 'H4', 'A', '33166586', '2013-05-28 02:45:04.174', false, 151);
INSERT INTO component VALUES (153, 'B', 'F6', '50950113', 'Howard Joel Wolowitz', '2013-05-28 10:09:50.332', 'F', 152);
INSERT INTO component VALUES (154, 'I', 'G1', '54907919', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 21:53:56.336', 'I', 152);
INSERT INTO device VALUES (155, 'H4', 'G', '19501473', '2013-05-28 18:30:26.755', false, 151);
INSERT INTO component VALUES (156, 'B', 'H1', '5799458', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:16:28.134', 'F', 155);
INSERT INTO component VALUES (157, 'F', 'A5', '8089625', 'Howard Joel Wolowitz', '2013-05-28 16:00:01.577', 'A', 155);
INSERT INTO location VALUES (158, 'DH7', 150);
INSERT INTO device VALUES (159, 'H6', 'C', '84808306', '2013-05-28 19:01:50.412', false, 158);
INSERT INTO component VALUES (160, 'F', 'E6', '10918965', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:13:42.41', 'H', 159);
INSERT INTO component VALUES (161, 'I', 'A8', '18458519', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:21:05.126', 'A', 159);
INSERT INTO device VALUES (162, 'B6', 'E', '11595178', '2013-05-28 10:21:31.139', false, 158);
INSERT INTO component VALUES (163, 'E', 'H8', '99261288', 'Howard Joel Wolowitz', '2013-05-28 04:20:41.686', 'H', 162);
INSERT INTO component VALUES (164, 'D', 'C8', '63972550', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:18:23.683', 'F', 162);
INSERT INTO hall VALUES (165, 'G8', 298, 1822, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 3);
INSERT INTO line VALUES (166, 'G8 Assembly', 'Series 3', 19, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 165);
INSERT INTO location VALUES (167, 'AD6', 166);
INSERT INTO device VALUES (168, 'H4', 'D', '1150256', '2013-05-28 06:25:46.544', false, 167);
INSERT INTO component VALUES (169, 'F', 'G3', '28724142', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 11:34:26.151', 'C', 168);
INSERT INTO component VALUES (170, 'C', 'C1', '76116750', 'Howard Joel Wolowitz', '2013-05-28 06:42:37.953', 'G', 168);
INSERT INTO device VALUES (171, 'B4', 'F', '79495953', '2013-05-28 03:21:06.868', false, 167);
INSERT INTO component VALUES (172, 'D', 'B8', '43296012', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:43:01.476', 'D', 171);
INSERT INTO component VALUES (173, 'D', 'D9', '73347199', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 19:36:40.177', 'B', 171);
INSERT INTO location VALUES (174, 'DI5', 166);
INSERT INTO device VALUES (175, 'A1', 'B', '86280802', '2013-05-28 03:05:52.73', false, 174);
INSERT INTO component VALUES (176, 'D', 'B6', '79446827', 'Howard Joel Wolowitz', '2013-05-28 19:33:01.031', 'H', 175);
INSERT INTO component VALUES (177, 'G', 'H6', '91647690', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:09:32.333', 'H', 175);
INSERT INTO device VALUES (178, 'F9', 'G', '98908813', '2013-05-28 12:00:15.783', false, 174);
INSERT INTO component VALUES (179, 'I', 'B9', '68674112', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:20:31.363', 'C', 178);
INSERT INTO component VALUES (180, 'I', 'D1', '86764763', 'Howard Joel Wolowitz', '2013-05-28 05:35:18.12', 'B', 178);
INSERT INTO line VALUES (181, 'G8 PreSeries', 'Series 7', 51, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 165);
INSERT INTO location VALUES (182, 'AA6', 181);
INSERT INTO device VALUES (183, 'B3', 'I', '87740949', '2013-05-28 00:29:41.268', false, 182);
INSERT INTO component VALUES (184, 'C', 'H1', '75002910', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 07:10:52.089', 'B', 183);
INSERT INTO component VALUES (185, 'C', 'C5', '95948678', 'Howard Joel Wolowitz', '2013-05-28 18:29:06.336', 'I', 183);
INSERT INTO device VALUES (186, 'F8', 'F', '57052437', '2013-05-28 06:26:54.052', false, 182);
INSERT INTO component VALUES (187, 'D', 'I4', '4904796', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:47:13.64', 'I', 186);
INSERT INTO component VALUES (188, 'C', 'F4', '84471178', 'Howard Joel Wolowitz', '2013-05-28 20:49:42.502', 'H', 186);
INSERT INTO location VALUES (189, 'EE4', 181);
INSERT INTO device VALUES (190, 'H3', 'D', '372478', '2013-05-28 05:22:39.356', false, 189);
INSERT INTO component VALUES (191, 'H', 'B7', '36558090', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:24:51.042', 'F', 190);
INSERT INTO component VALUES (192, 'A', 'B9', '27288783', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:43:19.43', 'I', 190);
INSERT INTO device VALUES (193, 'A4', 'G', '30294370', '2013-05-28 04:50:14.964', false, 189);
INSERT INTO component VALUES (194, 'I', 'E2', '83133229', 'Howard Joel Wolowitz', '2013-05-28 00:24:36.496', 'G', 193);
INSERT INTO component VALUES (195, 'H', 'G3', '93337222', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:46:27.839', 'E', 193);
INSERT INTO hall VALUES (196, 'F5', 425, 2539, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 4);
INSERT INTO line VALUES (197, 'F5 Assembly', 'Series 5', 82, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 196);
INSERT INTO location VALUES (198, 'HD7', 197);
INSERT INTO device VALUES (199, 'F5', 'G', '93770058', '2013-05-28 04:12:23.464', true, 198);
INSERT INTO component VALUES (200, 'C', 'H3', '91949996', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:17:41.401', 'I', 199);
INSERT INTO component VALUES (201, 'F', 'C6', '21042378', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:42:01.745', 'F', 199);
INSERT INTO device VALUES (202, 'F6', 'H', '58885324', '2013-05-27 21:44:20.851', false, 198);
INSERT INTO component VALUES (203, 'B', 'B8', '36243465', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:15:55.892', 'I', 202);
INSERT INTO component VALUES (204, 'D', 'B1', '37108821', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 03:34:15.352', 'A', 202);
INSERT INTO location VALUES (205, 'BA9', 197);
INSERT INTO device VALUES (206, 'H8', 'A', '35756324', '2013-05-27 21:56:57.243', false, 205);
INSERT INTO component VALUES (207, 'G', 'I5', '60427426', 'Howard Joel Wolowitz', '2013-05-28 04:15:13.892', 'B', 206);
INSERT INTO component VALUES (208, 'H', 'G1', '80607335', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:46:52.987', 'I', 206);
INSERT INTO device VALUES (209, 'C4', 'A', '77671465', '2013-05-28 09:04:11.567', false, 205);
INSERT INTO component VALUES (210, 'I', 'F2', '63076476', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 02:44:43.582', 'D', 209);
INSERT INTO component VALUES (211, 'A', 'A8', '50229843', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:46:34.442', 'G', 209);
INSERT INTO line VALUES (212, 'F5 PreSeries', 'Series 2', 15, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 196);
INSERT INTO location VALUES (213, 'FA7', 212);
INSERT INTO device VALUES (214, 'B8', 'G', '90683851', '2013-05-28 07:49:59.855', false, 213);
INSERT INTO component VALUES (215, 'G', 'D8', '42224468', 'Howard Joel Wolowitz', '2013-05-28 20:38:06.644', 'E', 214);
INSERT INTO component VALUES (216, 'A', 'A8', '29977569', 'Howard Joel Wolowitz', '2013-05-28 13:56:34.794', 'F', 214);
INSERT INTO device VALUES (217, 'G4', 'E', '62667548', '2013-05-28 10:28:23.722', false, 213);
INSERT INTO component VALUES (218, 'G', 'A3', '99303631', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:04:58.918', 'B', 217);
INSERT INTO component VALUES (219, 'G', 'H6', '53861341', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 12:20:03.991', 'C', 217);
INSERT INTO location VALUES (220, 'AF2', 212);
INSERT INTO device VALUES (221, 'H8', 'I', '46890305', '2013-05-28 01:58:06.627', true, 220);
INSERT INTO component VALUES (222, 'A', 'I7', '86266758', 'Howard Joel Wolowitz', '2013-05-28 14:19:12.25', 'D', 221);
INSERT INTO component VALUES (223, 'G', 'H8', '54299313', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:19:46.958', 'H', 221);
INSERT INTO device VALUES (224, 'E9', 'D', '81412332', '2013-05-28 19:37:02.462', true, 220);
INSERT INTO component VALUES (225, 'E', 'D2', '71139398', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 02:38:31.563', 'F', 224);
INSERT INTO component VALUES (226, 'C', 'B6', '41524060', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 03:13:25.655', 'I', 224);
INSERT INTO hall VALUES (227, 'B3', 833, 2899, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 4);
INSERT INTO line VALUES (228, 'B3 Assembly', 'Series 2', 11, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 227);
INSERT INTO location VALUES (229, 'HB4', 228);
INSERT INTO device VALUES (230, 'C1', 'E', '54944323', '2013-05-28 15:58:51.646', true, 229);
INSERT INTO component VALUES (231, 'D', 'B3', '10264391', 'Howard Joel Wolowitz', '2013-05-27 21:33:41.956', 'B', 230);
INSERT INTO component VALUES (232, 'I', 'B8', '59362345', 'Howard Joel Wolowitz', '2013-05-28 17:23:27.863', 'G', 230);
INSERT INTO device VALUES (233, 'F8', 'B', '90578783', '2013-05-28 01:11:15.279', false, 229);
INSERT INTO component VALUES (234, 'B', 'E4', '25999311', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 19:08:44.221', 'H', 233);
INSERT INTO component VALUES (235, 'C', 'A9', '8216203', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:54:20.434', 'H', 233);
INSERT INTO location VALUES (236, 'BF2', 228);
INSERT INTO device VALUES (237, 'B3', 'A', '16867187', '2013-05-28 16:20:40.869', false, 236);
INSERT INTO component VALUES (238, 'C', 'G3', '92741597', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:53:19.491', 'E', 237);
INSERT INTO component VALUES (239, 'C', 'F6', '16102204', 'Howard Joel Wolowitz', '2013-05-28 15:29:47.333', 'E', 237);
INSERT INTO device VALUES (240, 'H9', 'G', '20518241', '2013-05-28 12:48:16.238', false, 236);
INSERT INTO component VALUES (241, 'E', 'E4', '95650142', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:25:58.577', 'F', 240);
INSERT INTO component VALUES (242, 'F', 'D3', '5930598', 'Howard Joel Wolowitz', '2013-05-27 23:17:15.019', 'F', 240);
INSERT INTO line VALUES (243, 'B3 PreSeries', 'Series 3', 20, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 227);
INSERT INTO location VALUES (244, 'AF5', 243);
INSERT INTO device VALUES (245, 'D4', 'E', '5063788', '2013-05-27 22:53:35.495', false, 244);
INSERT INTO component VALUES (246, 'H', 'B2', '7433193', 'Howard Joel Wolowitz', '2013-05-28 12:13:20.341', 'G', 245);
INSERT INTO component VALUES (247, 'H', 'H7', '68015887', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 09:50:56.702', 'G', 245);
INSERT INTO device VALUES (248, 'E6', 'B', '89098650', '2013-05-28 20:06:20.919', false, 244);
INSERT INTO component VALUES (249, 'C', 'H5', '33363760', 'Howard Joel Wolowitz', '2013-05-28 08:29:25.61', 'F', 248);
INSERT INTO component VALUES (250, 'C', 'D1', '24711589', 'Howard Joel Wolowitz', '2013-05-28 11:55:07.446', 'I', 248);
INSERT INTO location VALUES (251, 'FF1', 243);
INSERT INTO device VALUES (252, 'A9', 'E', '5932608', '2013-05-27 21:36:08.982', false, 251);
INSERT INTO component VALUES (253, 'F', 'H8', '61536068', 'Howard Joel Wolowitz', '2013-05-28 15:38:10.611', 'A', 252);
INSERT INTO component VALUES (254, 'H', 'H6', '53409636', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 19:16:01.024', 'G', 252);
INSERT INTO device VALUES (255, 'B7', 'D', '9655994', '2013-05-28 17:49:04.42', false, 251);
INSERT INTO component VALUES (256, 'A', 'H1', '61817638', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:59:33.556', 'A', 255);
INSERT INTO component VALUES (257, 'I', 'B6', '47921760', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:55:05.766', 'F', 255);
INSERT INTO hall VALUES (258, 'E1', 806, 5197, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 5);
INSERT INTO line VALUES (259, 'E1 Assembly', 'Series 6', 44, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 258);
INSERT INTO location VALUES (260, 'DE2', 259);
INSERT INTO device VALUES (261, 'C8', 'E', '76813591', '2013-05-28 20:00:27.625', true, 260);
INSERT INTO component VALUES (262, 'D', 'B4', '53707074', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 01:07:33.871', 'A', 261);
INSERT INTO component VALUES (263, 'I', 'F8', '44644865', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:06:19.885', 'H', 261);
INSERT INTO device VALUES (264, 'F5', 'E', '24594842', '2013-05-27 21:46:47.532', false, 260);
INSERT INTO component VALUES (265, 'I', 'C8', '39012134', 'Howard Joel Wolowitz', '2013-05-28 17:17:54.433', 'B', 264);
INSERT INTO component VALUES (266, 'I', 'D5', '79629763', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:57:17.525', 'A', 264);
INSERT INTO location VALUES (267, 'IH4', 259);
INSERT INTO device VALUES (268, 'G2', 'C', '8151281', '2013-05-28 17:44:23.259', false, 267);
INSERT INTO component VALUES (269, 'B', 'E2', '65048052', 'Howard Joel Wolowitz', '2013-05-28 07:19:48.995', 'D', 268);
INSERT INTO component VALUES (270, 'I', 'B4', '80807172', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:31:00.927', 'D', 268);
INSERT INTO device VALUES (271, 'B7', 'G', '94950108', '2013-05-28 05:16:36.818', false, 267);
INSERT INTO component VALUES (272, 'C', 'I3', '60730234', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:10:39.371', 'B', 271);
INSERT INTO component VALUES (273, 'D', 'F7', '67705796', 'Howard Joel Wolowitz', '2013-05-28 12:50:07.614', 'I', 271);
INSERT INTO line VALUES (274, 'E1 PreSeries', 'Series 3', 29, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 258);
INSERT INTO location VALUES (275, 'HG9', 274);
INSERT INTO device VALUES (276, 'B2', 'G', '73830911', '2013-05-28 04:47:45.782', true, 275);
INSERT INTO component VALUES (277, 'C', 'B3', '23290614', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:46:17.418', 'A', 276);
INSERT INTO component VALUES (278, 'E', 'F1', '35908602', 'Howard Joel Wolowitz', '2013-05-28 10:58:55.394', 'D', 276);
INSERT INTO device VALUES (279, 'E9', 'F', '95456244', '2013-05-28 21:02:39.147', false, 275);
INSERT INTO component VALUES (280, 'C', 'D3', '78649722', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 23:59:11.152', 'C', 279);
INSERT INTO component VALUES (281, 'G', 'D4', '15097930', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:24:48.123', 'B', 279);
INSERT INTO location VALUES (282, 'EH3', 274);
INSERT INTO device VALUES (283, 'I9', 'F', '78014641', '2013-05-28 20:16:06.749', false, 282);
INSERT INTO component VALUES (284, 'C', 'I2', '22736473', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:11:45.347', 'E', 283);
INSERT INTO component VALUES (285, 'G', 'B3', '56029345', 'Howard Joel Wolowitz', '2013-05-27 22:34:15.378', 'C', 283);
INSERT INTO device VALUES (286, 'E2', 'I', '79235919', '2013-05-28 11:57:20.822', true, 282);
INSERT INTO component VALUES (287, 'C', 'C8', '57469849', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:40:38.433', 'H', 286);
INSERT INTO component VALUES (288, 'E', 'F3', '26747284', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 18:38:33.87', 'A', 286);
INSERT INTO hall VALUES (289, 'B7', 481, 6296, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 5);
INSERT INTO line VALUES (290, 'B7 Assembly', 'Series 5', 35, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 289);
INSERT INTO location VALUES (291, 'HI5', 290);
INSERT INTO device VALUES (292, 'D2', 'E', '64274120', '2013-05-28 20:24:19.393', true, 291);
INSERT INTO component VALUES (293, 'I', 'C5', '83423475', 'Howard Joel Wolowitz', '2013-05-28 02:40:13.781', 'I', 292);
INSERT INTO component VALUES (294, 'E', 'G9', '651708', 'Howard Joel Wolowitz', '2013-05-27 21:34:38.688', 'G', 292);
INSERT INTO device VALUES (295, 'A7', 'H', '69142620', '2013-05-28 00:11:16.84', false, 291);
INSERT INTO component VALUES (296, 'B', 'H8', '12031096', 'Howard Joel Wolowitz', '2013-05-28 18:33:09.981', 'B', 295);
INSERT INTO component VALUES (297, 'I', 'D5', '97590589', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:47:11.917', 'C', 295);
INSERT INTO location VALUES (298, 'AA3', 290);
INSERT INTO device VALUES (299, 'D7', 'B', '95691896', '2013-05-28 08:43:31.432', false, 298);
INSERT INTO component VALUES (300, 'A', 'F3', '42194866', 'Howard Joel Wolowitz', '2013-05-28 20:19:37.954', 'E', 299);
INSERT INTO component VALUES (301, 'E', 'E3', '72974653', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:53:49.87', 'D', 299);
INSERT INTO device VALUES (302, 'I6', 'C', '53431785', '2013-05-28 15:46:49.849', false, 298);
INSERT INTO component VALUES (303, 'B', 'A8', '45562896', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 05:16:19.518', 'A', 302);
INSERT INTO component VALUES (304, 'D', 'E4', '65493666', 'Howard Joel Wolowitz', '2013-05-27 22:28:14.681', 'D', 302);
INSERT INTO line VALUES (305, 'B7 PreSeries', 'Series 8', 69, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 289);
INSERT INTO location VALUES (306, 'FI4', 305);
INSERT INTO device VALUES (307, 'B8', 'G', '67480626', '2013-05-28 04:30:38.944', false, 306);
INSERT INTO component VALUES (308, 'A', 'F1', '4428299', 'Howard Joel Wolowitz', '2013-05-28 11:40:32.786', 'F', 307);
INSERT INTO component VALUES (309, 'D', 'A6', '28530423', 'Howard Joel Wolowitz', '2013-05-28 04:48:11.313', 'I', 307);
INSERT INTO device VALUES (310, 'A2', 'H', '33605697', '2013-05-28 12:38:32.899', false, 306);
INSERT INTO component VALUES (311, 'F', 'B1', '55778935', 'Howard Joel Wolowitz', '2013-05-28 08:40:45.919', 'H', 310);
INSERT INTO component VALUES (312, 'A', 'C1', '820449', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:22:18.175', 'B', 310);
INSERT INTO location VALUES (313, 'DG4', 305);
INSERT INTO device VALUES (314, 'A6', 'C', '25751439', '2013-05-28 07:28:44.433', false, 313);
INSERT INTO component VALUES (315, 'H', 'H1', '15564224', 'Howard Joel Wolowitz', '2013-05-28 06:35:06.623', 'E', 314);
INSERT INTO component VALUES (316, 'I', 'F9', '73695504', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:00:25.283', 'F', 314);
INSERT INTO device VALUES (317, 'E1', 'D', '28567300', '2013-05-28 01:41:25.838', false, 313);
INSERT INTO component VALUES (318, 'B', 'F4', '56615147', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 23:53:05.13', 'I', 317);
INSERT INTO component VALUES (319, 'I', 'D3', '79852949', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:08:51.836', 'G', 317);
INSERT INTO hall VALUES (320, 'D4', 634, 6611, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 6);
INSERT INTO line VALUES (321, 'D4 Assembly', 'Series 6', 47, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 320);
INSERT INTO location VALUES (322, 'GG8', 321);
INSERT INTO device VALUES (323, 'D1', 'I', '2991126', '2013-05-28 14:23:29.867', false, 322);
INSERT INTO component VALUES (324, 'I', 'A4', '65189944', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 15:54:02.251', 'C', 323);
INSERT INTO component VALUES (325, 'F', 'F8', '86835875', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 11:54:54.97', 'F', 323);
INSERT INTO device VALUES (326, 'E3', 'I', '98416140', '2013-05-28 00:56:07.802', false, 322);
INSERT INTO component VALUES (327, 'C', 'G3', '61099261', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:56:36.629', 'C', 326);
INSERT INTO component VALUES (328, 'A', 'D8', '1292896', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 22:46:47.473', 'E', 326);
INSERT INTO location VALUES (329, 'FB3', 321);
INSERT INTO device VALUES (330, 'B2', 'G', '24530481', '2013-05-28 19:55:11.74', false, 329);
INSERT INTO component VALUES (331, 'B', 'B1', '88990974', 'Howard Joel Wolowitz', '2013-05-28 00:35:57.498', 'G', 330);
INSERT INTO component VALUES (332, 'H', 'D3', '41907897', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:19:50.315', 'F', 330);
INSERT INTO device VALUES (333, 'D1', 'C', '59462231', '2013-05-27 22:39:34.022', false, 329);
INSERT INTO component VALUES (334, 'G', 'F1', '14627178', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 20:37:26.779', 'C', 333);
INSERT INTO component VALUES (335, 'D', 'G1', '74872457', 'Howard Joel Wolowitz', '2013-05-28 06:16:47.807', 'D', 333);
INSERT INTO line VALUES (336, 'D4 PreSeries', 'Series 2', 69, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 320);
INSERT INTO location VALUES (337, 'BF3', 336);
INSERT INTO device VALUES (338, 'A4', 'F', '22167983', '2013-05-28 19:23:51.951', false, 337);
INSERT INTO component VALUES (339, 'D', 'C1', '96114741', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:55:24.747', 'F', 338);
INSERT INTO component VALUES (340, 'F', 'C7', '68344897', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:18:52.45', 'I', 338);
INSERT INTO device VALUES (341, 'A1', 'E', '51162460', '2013-05-28 16:40:45.471', false, 337);
INSERT INTO component VALUES (342, 'G', 'D8', '10592734', 'Howard Joel Wolowitz', '2013-05-28 11:28:54.816', 'G', 341);
INSERT INTO component VALUES (343, 'E', 'H2', '89743909', 'Howard Joel Wolowitz', '2013-05-28 19:43:49.616', 'F', 341);
INSERT INTO location VALUES (344, 'EB9', 336);
INSERT INTO device VALUES (345, 'A7', 'G', '88208879', '2013-05-28 03:50:05.475', false, 344);
INSERT INTO component VALUES (346, 'I', 'C8', '14938226', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:53:50.413', 'I', 345);
INSERT INTO component VALUES (347, 'B', 'E5', '67814870', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 11:40:19.752', 'C', 345);
INSERT INTO device VALUES (348, 'F3', 'D', '30432546', '2013-05-28 18:19:57.008', false, 344);
INSERT INTO component VALUES (349, 'H', 'E8', '81844666', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:48:39.291', 'A', 348);
INSERT INTO component VALUES (350, 'D', 'H8', '46292401', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 21:16:17.556', 'G', 348);
INSERT INTO hall VALUES (351, 'A4', 959, 9440, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 6);
INSERT INTO line VALUES (352, 'A4 Assembly', 'Series 9', 94, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 351);
INSERT INTO location VALUES (353, 'FE5', 352);
INSERT INTO device VALUES (354, 'C6', 'C', '16488721', '2013-05-28 10:03:11.6', false, 353);
INSERT INTO component VALUES (355, 'G', 'C2', '51784896', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:19:23.613', 'D', 354);
INSERT INTO component VALUES (356, 'G', 'H1', '35238691', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:13:27.813', 'F', 354);
INSERT INTO device VALUES (357, 'E6', 'D', '87350630', '2013-05-28 06:46:04.579', false, 353);
INSERT INTO component VALUES (358, 'A', 'F6', '74508277', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:38:27.908', 'D', 357);
INSERT INTO component VALUES (359, 'F', 'G6', '5959802', 'Howard Joel Wolowitz', '2013-05-28 12:30:32.984', 'H', 357);
INSERT INTO location VALUES (360, 'DF5', 352);
INSERT INTO device VALUES (361, 'H8', 'A', '68326373', '2013-05-28 04:07:15.012', false, 360);
INSERT INTO component VALUES (362, 'A', 'B1', '11756928', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 22:26:25.55', 'A', 361);
INSERT INTO component VALUES (363, 'G', 'C6', '80424819', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:06:39.075', 'I', 361);
INSERT INTO device VALUES (364, 'D4', 'F', '44594229', '2013-05-28 04:04:46.802', false, 360);
INSERT INTO component VALUES (365, 'G', 'E8', '68133410', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 21:48:12.782', 'F', 364);
INSERT INTO component VALUES (366, 'B', 'F8', '91623305', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:15:01.364', 'G', 364);
INSERT INTO line VALUES (367, 'A4 PreSeries', 'Series 9', 39, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 351);
INSERT INTO location VALUES (368, 'ID7', 367);
INSERT INTO device VALUES (369, 'A3', 'G', '57381089', '2013-05-28 09:47:25.347', false, 368);
INSERT INTO component VALUES (370, 'B', 'G1', '92454270', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:28:29.195', 'E', 369);
INSERT INTO component VALUES (371, 'B', 'I3', '72122103', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:34:55.632', 'G', 369);
INSERT INTO device VALUES (372, 'F2', 'C', '53197445', '2013-05-27 23:05:13.299', false, 368);
INSERT INTO component VALUES (373, 'F', 'B9', '68613870', 'Howard Joel Wolowitz', '2013-05-28 01:58:54.112', 'C', 372);
INSERT INTO component VALUES (374, 'B', 'F7', '23328423', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 18:17:01.863', 'E', 372);
INSERT INTO location VALUES (375, 'CB3', 367);
INSERT INTO device VALUES (376, 'E1', 'D', '78556764', '2013-05-27 22:37:05.44', false, 375);
INSERT INTO component VALUES (377, 'A', 'E4', '70353069', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:12:00.691', 'I', 376);
INSERT INTO component VALUES (378, 'F', 'E8', '17220783', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 01:56:03.838', 'G', 376);
INSERT INTO device VALUES (379, 'I3', 'I', '11386590', '2013-05-28 05:42:14.671', false, 375);
INSERT INTO component VALUES (380, 'I', 'E5', '85360093', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 17:19:12.53', 'E', 379);
INSERT INTO component VALUES (381, 'F', 'H5', '61420761', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 11:07:47.38', 'G', 379);
INSERT INTO hall VALUES (382, 'C8', 962, 5265, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 7);
INSERT INTO line VALUES (383, 'C8 Assembly', 'Series 5', 32, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 382);
INSERT INTO location VALUES (384, 'BD2', 383);
INSERT INTO device VALUES (385, 'C9', 'A', '15804731', '2013-05-27 23:37:36.845', false, 384);
INSERT INTO component VALUES (386, 'I', 'F4', '28538628', 'Howard Joel Wolowitz', '2013-05-28 10:38:35.798', 'I', 385);
INSERT INTO component VALUES (387, 'G', 'D2', '67206085', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 03:50:44.259', 'H', 385);
INSERT INTO device VALUES (388, 'D8', 'A', '33152215', '2013-05-28 12:45:35.472', false, 384);
INSERT INTO component VALUES (389, 'C', 'C3', '79784602', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 14:31:03.211', 'E', 388);
INSERT INTO component VALUES (390, 'E', 'D5', '97581114', 'Howard Joel Wolowitz', '2013-05-28 07:15:01.157', 'F', 388);
INSERT INTO location VALUES (391, 'DB5', 383);
INSERT INTO device VALUES (392, 'G7', 'D', '8202750', '2013-05-28 02:55:08.851', false, 391);
INSERT INTO component VALUES (393, 'G', 'H7', '99829578', 'Howard Joel Wolowitz', '2013-05-28 08:22:01.368', 'G', 392);
INSERT INTO component VALUES (394, 'B', 'I1', '67839555', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 22:58:42.521', 'H', 392);
INSERT INTO device VALUES (395, 'I5', 'F', '60462536', '2013-05-28 13:19:21.995', false, 391);
INSERT INTO component VALUES (396, 'H', 'E7', '95031946', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:23:29.94', 'B', 395);
INSERT INTO component VALUES (397, 'F', 'C3', '27728329', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:20:56.788', 'H', 395);
INSERT INTO line VALUES (398, 'C8 PreSeries', 'Series 4', 16, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 382);
INSERT INTO location VALUES (399, 'AD1', 398);
INSERT INTO device VALUES (400, 'B9', 'H', '8082623', '2013-05-27 21:46:55.059', false, 399);
INSERT INTO component VALUES (401, 'A', 'B3', '28504608', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 21:47:49.988', 'B', 400);
INSERT INTO component VALUES (402, 'I', 'H9', '73858761', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:42:56.058', 'F', 400);
INSERT INTO device VALUES (403, 'E6', 'H', '55095864', '2013-05-28 01:56:46.403', false, 399);
INSERT INTO component VALUES (404, 'H', 'G3', '59437791', 'Howard Joel Wolowitz', '2013-05-28 15:24:12.418', 'A', 403);
INSERT INTO component VALUES (405, 'A', 'I9', '32568903', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 13:13:51.689', 'A', 403);
INSERT INTO location VALUES (406, 'AD8', 398);
INSERT INTO device VALUES (407, 'B9', 'F', '93243503', '2013-05-28 02:09:11.185', false, 406);
INSERT INTO component VALUES (408, 'F', 'G8', '23900991', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:28:50.794', 'G', 407);
INSERT INTO component VALUES (409, 'G', 'I9', '3805303', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 21:51:28.024', 'H', 407);
INSERT INTO device VALUES (410, 'F6', 'B', '57330602', '2013-05-28 03:42:05.896', false, 406);
INSERT INTO component VALUES (411, 'A', 'D4', '62466312', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 03:32:30.806', 'I', 410);
INSERT INTO component VALUES (412, 'C', 'G1', '82386253', 'Howard Joel Wolowitz', '2013-05-28 14:42:26.213', 'H', 410);
INSERT INTO hall VALUES (413, 'G6', 653, 602, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 7);
INSERT INTO line VALUES (414, 'G6 Assembly', 'Series 4', 67, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 413);
INSERT INTO location VALUES (415, 'GA2', 414);
INSERT INTO device VALUES (416, 'I1', 'I', '65218080', '2013-05-28 20:46:15.409', false, 415);
INSERT INTO component VALUES (417, 'D', 'E8', '76258074', 'Howard Joel Wolowitz', '2013-05-28 15:28:21.943', 'A', 416);
INSERT INTO component VALUES (418, 'B', 'I5', '79300912', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:51:58.049', 'C', 416);
INSERT INTO device VALUES (419, 'A8', 'A', '56713197', '2013-05-28 01:36:20.687', false, 415);
INSERT INTO component VALUES (420, 'B', 'B7', '1671988', 'Howard Joel Wolowitz', '2013-05-28 20:26:45.729', 'C', 419);
INSERT INTO component VALUES (421, 'G', 'F5', '39310079', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 23:55:50.15', 'F', 419);
INSERT INTO location VALUES (422, 'GI8', 414);
INSERT INTO device VALUES (423, 'H1', 'I', '89550245', '2013-05-28 11:36:48.953', false, 422);
INSERT INTO component VALUES (424, 'I', 'C1', '4371176', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:14:04.683', 'C', 423);
INSERT INTO component VALUES (425, 'D', 'E7', '70758565', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:23:43.979', 'I', 423);
INSERT INTO device VALUES (426, 'I9', 'F', '93493325', '2013-05-28 03:07:28.111', false, 422);
INSERT INTO component VALUES (427, 'D', 'B5', '15573166', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 22:10:39.951', 'H', 426);
INSERT INTO component VALUES (428, 'I', 'G5', '82267779', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:29:46.961', 'D', 426);
INSERT INTO line VALUES (429, 'G6 PreSeries', 'Series 6', 73, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 413);
INSERT INTO location VALUES (430, 'HD3', 429);
INSERT INTO device VALUES (431, 'C1', 'G', '23904288', '2013-05-27 22:57:14.622', true, 430);
INSERT INTO component VALUES (432, 'F', 'F2', '46969157', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 21:11:53.232', 'A', 431);
INSERT INTO component VALUES (433, 'G', 'G8', '18057852', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 03:21:30.429', 'B', 431);
INSERT INTO device VALUES (434, 'G7', 'B', '96219750', '2013-05-28 01:26:02.472', false, 430);
INSERT INTO component VALUES (435, 'C', 'H9', '42255856', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:11:02.782', 'D', 434);
INSERT INTO component VALUES (436, 'I', 'G2', '98706383', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 05:37:36.448', 'G', 434);
INSERT INTO location VALUES (437, 'GE5', 429);
INSERT INTO device VALUES (438, 'C9', 'D', '98900350', '2013-05-28 14:22:16.543', false, 437);
INSERT INTO component VALUES (439, 'C', 'I8', '6257569', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:46:38.919', 'F', 438);
INSERT INTO component VALUES (440, 'I', 'B7', '97913054', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 19:38:39.807', 'H', 438);
INSERT INTO device VALUES (441, 'G8', 'B', '2199246', '2013-05-28 20:24:55.168', false, 437);
INSERT INTO component VALUES (442, 'E', 'H3', '13151852', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 09:28:13.562', 'C', 441);
INSERT INTO component VALUES (443, 'F', 'D1', '67827609', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:52:53.202', 'B', 441);
INSERT INTO hall VALUES (444, 'D3', 89, 640, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 8);
INSERT INTO line VALUES (445, 'D3 Assembly', 'Series 6', 33, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 444);
INSERT INTO location VALUES (446, 'EG5', 445);
INSERT INTO device VALUES (447, 'D5', 'G', '4450920', '2013-05-28 00:34:00.621', false, 446);
INSERT INTO component VALUES (448, 'D', 'G7', '87460886', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 04:33:03.512', 'G', 447);
INSERT INTO component VALUES (449, 'C', 'D4', '15620173', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:00:08.677', 'E', 447);
INSERT INTO device VALUES (450, 'D2', 'I', '82200870', '2013-05-28 07:06:49.136', true, 446);
INSERT INTO component VALUES (451, 'A', 'A9', '91844492', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:15:00.493', 'B', 450);
INSERT INTO component VALUES (452, 'H', 'F3', '43129304', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 10:36:25.519', 'F', 450);
INSERT INTO location VALUES (453, 'AD2', 445);
INSERT INTO device VALUES (454, 'B1', 'I', '50266579', '2013-05-28 17:38:39.748', false, 453);
INSERT INTO component VALUES (455, 'G', 'G6', '18884099', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 13:52:39.09', 'B', 454);
INSERT INTO component VALUES (456, 'I', 'G2', '19632474', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:21:33.15', 'B', 454);
INSERT INTO device VALUES (457, 'F9', 'D', '35455949', '2013-05-28 05:16:30.77', true, 453);
INSERT INTO component VALUES (458, 'H', 'A7', '30041665', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 00:41:41.349', 'G', 457);
INSERT INTO component VALUES (459, 'C', 'B3', '89605672', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 06:29:48.35', 'C', 457);
INSERT INTO line VALUES (460, 'D3 PreSeries', 'Series 6', 45, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 444);
INSERT INTO location VALUES (461, 'AF9', 460);
INSERT INTO device VALUES (462, 'I2', 'B', '77529825', '2013-05-28 05:06:14.334', false, 461);
INSERT INTO component VALUES (463, 'D', 'D7', '13264730', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 14:09:26.45', 'H', 462);
INSERT INTO component VALUES (464, 'C', 'E1', '25513130', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:44:47.321', 'D', 462);
INSERT INTO device VALUES (465, 'D1', 'A', '68106480', '2013-05-28 20:32:50.43', false, 461);
INSERT INTO component VALUES (466, 'F', 'A7', '75134358', 'Howard Joel Wolowitz', '2013-05-28 11:04:11.053', 'I', 465);
INSERT INTO component VALUES (467, 'E', 'E2', '89093944', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:53:14.641', 'G', 465);
INSERT INTO location VALUES (468, 'HH8', 460);
INSERT INTO device VALUES (469, 'D8', 'H', '23046273', '2013-05-28 10:27:48.312', false, 468);
INSERT INTO component VALUES (470, 'H', 'C4', '96882989', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 14:54:15.884', 'G', 469);
INSERT INTO component VALUES (471, 'D', 'D5', '58483914', 'Dr. Leonard Leakey Hofstadter', '2013-05-27 22:45:30.741', 'G', 469);
INSERT INTO device VALUES (472, 'I1', 'A', '63601263', '2013-05-28 16:55:12.338', false, 468);
INSERT INTO component VALUES (473, 'D', 'C7', '23629063', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 04:08:33.499', 'H', 472);
INSERT INTO component VALUES (474, 'B', 'C6', '77423648', 'Howard Joel Wolowitz', '2013-05-28 20:21:14.427', 'H', 472);
INSERT INTO hall VALUES (475, 'E5', 357, 9251, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 8);
INSERT INTO line VALUES (476, 'E5 Assembly', 'Series 4', 11, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 475);
INSERT INTO location VALUES (477, 'FF4', 476);
INSERT INTO device VALUES (478, 'H7', 'D', '81517350', '2013-05-28 13:59:52.1', false, 477);
INSERT INTO component VALUES (479, 'G', 'D7', '75466589', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 02:56:02.953', 'A', 478);
INSERT INTO component VALUES (480, 'D', 'E6', '18433011', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:09:05.188', 'F', 478);
INSERT INTO device VALUES (481, 'A1', 'H', '70158613', '2013-05-28 07:14:23.382', false, 477);
INSERT INTO component VALUES (482, 'B', 'H6', '71728793', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 12:47:25.938', 'F', 481);
INSERT INTO component VALUES (483, 'C', 'B1', '35884385', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:33:48.678', 'E', 481);
INSERT INTO location VALUES (484, 'FH1', 476);
INSERT INTO device VALUES (485, 'F4', 'C', '85492630', '2013-05-27 23:53:52.474', false, 484);
INSERT INTO component VALUES (486, 'H', 'A2', '24758275', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 13:42:37.214', 'E', 485);
INSERT INTO component VALUES (487, 'A', 'A6', '86524549', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 08:11:14.006', 'C', 485);
INSERT INTO device VALUES (488, 'D3', 'B', '50381267', '2013-05-28 18:08:45.245', false, 484);
INSERT INTO component VALUES (489, 'G', 'I1', '58744579', 'Howard Joel Wolowitz', '2013-05-28 08:16:46.767', 'B', 488);
INSERT INTO component VALUES (490, 'F', 'I6', '68054301', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 01:07:26.678', 'A', 488);
INSERT INTO line VALUES (491, 'E5 PreSeries', 'Series 4', 74, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 475);
INSERT INTO location VALUES (492, 'HF4', 491);
INSERT INTO device VALUES (493, 'C4', 'G', '85827973', '2013-05-28 20:05:57.064', false, 492);
INSERT INTO component VALUES (494, 'B', 'I2', '22784866', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 06:11:16.638', 'E', 493);
INSERT INTO component VALUES (495, 'E', 'I7', '43607237', 'Howard Joel Wolowitz', '2013-05-28 16:09:06.477', 'G', 493);
INSERT INTO device VALUES (496, 'E8', 'E', '41892640', '2013-05-28 17:18:17.35', true, 492);
INSERT INTO component VALUES (497, 'C', 'I2', '53974043', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:46:23.796', 'E', 496);
INSERT INTO component VALUES (498, 'F', 'B7', '55494457', 'Howard Joel Wolowitz', '2013-05-28 01:34:21.013', 'B', 496);
INSERT INTO location VALUES (499, 'CH6', 491);
INSERT INTO device VALUES (500, 'I1', 'E', '56402982', '2013-05-28 12:41:39.378', false, 499);
INSERT INTO component VALUES (501, 'F', 'G2', '62522721', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:37:06.372', 'B', 500);
INSERT INTO component VALUES (502, 'C', 'C5', '68107518', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 16:16:50.37', 'H', 500);
INSERT INTO device VALUES (503, 'B7', 'C', '53022587', '2013-05-28 09:51:36.367', false, 499);
INSERT INTO component VALUES (504, 'F', 'G2', '93319250', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:13:34.912', 'H', 503);
INSERT INTO component VALUES (505, 'A', 'A5', '81648408', 'Howard Joel Wolowitz', '2013-05-28 01:09:36.82', 'F', 503);
INSERT INTO hall VALUES (506, 'D3', 862, 8998, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 9);
INSERT INTO line VALUES (507, 'D3 Assembly', 'Series 5', 96, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 506);
INSERT INTO location VALUES (508, 'CB8', 507);
INSERT INTO device VALUES (509, 'A1', 'F', '61034903', '2013-05-28 12:24:31.941', false, 508);
INSERT INTO component VALUES (510, 'I', 'H9', '41380836', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 08:37:11.916', 'F', 509);
INSERT INTO component VALUES (511, 'F', 'E8', '70637437', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 07:51:02.165', 'D', 509);
INSERT INTO device VALUES (512, 'H8', 'E', '28383822', '2013-05-28 15:04:24.882', false, 508);
INSERT INTO component VALUES (513, 'I', 'F3', '87334104', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-27 23:59:45.569', 'C', 512);
INSERT INTO component VALUES (514, 'G', 'E9', '46147010', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 01:52:26.088', 'E', 512);
INSERT INTO location VALUES (515, 'BG2', 507);
INSERT INTO device VALUES (516, 'C4', 'C', '32362420', '2013-05-28 15:07:07.202', false, 515);
INSERT INTO component VALUES (517, 'G', 'D4', '35979065', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:51:43.481', 'A', 516);
INSERT INTO component VALUES (518, 'D', 'C2', '93951115', 'Howard Joel Wolowitz', '2013-05-28 03:46:40.894', 'B', 516);
INSERT INTO device VALUES (519, 'I6', 'H', '47609181', '2013-05-28 05:59:48.631', false, 515);
INSERT INTO component VALUES (520, 'A', 'H5', '73666020', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-27 22:17:23.574', 'A', 519);
INSERT INTO component VALUES (521, 'B', 'A4', '84883644', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 01:26:19.981', 'D', 519);
INSERT INTO line VALUES (522, 'D3 PreSeries', 'Series 9', 38, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 506);
INSERT INTO location VALUES (523, 'EC1', 522);
INSERT INTO device VALUES (524, 'F9', 'C', '80597584', '2013-05-28 19:48:23.439', false, 523);
INSERT INTO component VALUES (525, 'A', 'H9', '11073481', 'Howard Joel Wolowitz', '2013-05-28 08:49:14.409', 'G', 524);
INSERT INTO component VALUES (526, 'F', 'B6', '24870286', 'Howard Joel Wolowitz', '2013-05-28 10:02:16.84', 'H', 524);
INSERT INTO device VALUES (527, 'A1', 'C', '57484565', '2013-05-27 23:45:50.702', false, 523);
INSERT INTO component VALUES (528, 'F', 'B4', '2250609', 'Dr. Rajesh Ramayan Koothrappali', '2013-05-28 20:06:57.119', 'C', 527);
INSERT INTO component VALUES (529, 'B', 'C2', '95856874', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 08:29:06.427', 'D', 527);
INSERT INTO location VALUES (530, 'EG2', 522);
INSERT INTO device VALUES (531, 'C4', 'G', '78242807', '2013-05-27 22:24:08.937', false, 530);
INSERT INTO component VALUES (532, 'F', 'B4', '62798536', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 02:16:28.01', 'B', 531);
INSERT INTO component VALUES (533, 'B', 'F1', '203354', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 09:40:16.501', 'A', 531);
INSERT INTO device VALUES (534, 'D5', 'F', '48845799', '2013-05-28 04:42:21.602', false, 530);
INSERT INTO component VALUES (535, 'E', 'D5', '8256302', 'Howard Joel Wolowitz', '2013-05-28 00:51:36.676', 'I', 534);
INSERT INTO component VALUES (536, 'G', 'D8', '43667256', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 07:22:20.868', 'D', 534);
INSERT INTO hall VALUES (537, 'F1', 766, 7475, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 9);
INSERT INTO line VALUES (538, 'F1 Assembly', 'Series 5', 72, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 537);
INSERT INTO location VALUES (539, 'EB6', 538);
INSERT INTO device VALUES (540, 'C5', 'D', '80334690', '2013-05-28 11:57:39.192', false, 539);
INSERT INTO component VALUES (541, 'F', 'F2', '11372017', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:49:49.259', 'D', 540);
INSERT INTO component VALUES (542, 'H', 'G7', '11990722', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 11:34:58.514', 'D', 540);
INSERT INTO device VALUES (543, 'C5', 'H', '45647934', '2013-05-28 08:00:04.808', false, 539);
INSERT INTO component VALUES (544, 'C', 'H2', '29382578', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 00:42:59.339', 'E', 543);
INSERT INTO component VALUES (545, 'D', 'E6', '57607638', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 17:47:21.478', 'A', 543);
INSERT INTO location VALUES (546, 'CF5', 538);
INSERT INTO device VALUES (547, 'A6', 'B', '23616483', '2013-05-28 15:17:43.212', false, 546);
INSERT INTO component VALUES (548, 'G', 'A7', '19799223', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:17:48.339', 'E', 547);
INSERT INTO component VALUES (549, 'G', 'G6', '85918789', 'Howard Joel Wolowitz', '2013-05-28 12:40:05.592', 'D', 547);
INSERT INTO device VALUES (550, 'C2', 'F', '61841163', '2013-05-28 01:52:23.99', false, 546);
INSERT INTO component VALUES (551, 'E', 'D2', '84406690', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:18:14.792', 'E', 550);
INSERT INTO component VALUES (552, 'E', 'B6', '18092609', 'Howard Joel Wolowitz', '2013-05-28 18:03:01.107', 'D', 550);
INSERT INTO line VALUES (553, 'F1 PreSeries', 'Series 1', 60, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 537);
INSERT INTO location VALUES (554, 'DH9', 553);
INSERT INTO device VALUES (555, 'C4', 'A', '70962824', '2013-05-28 20:36:52.389', false, 554);
INSERT INTO component VALUES (556, 'F', 'A1', '41393105', 'Howard Joel Wolowitz', '2013-05-28 03:07:44.496', 'D', 555);
INSERT INTO component VALUES (557, 'A', 'D8', '31159236', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 15:30:31.275', 'E', 555);
INSERT INTO device VALUES (558, 'F6', 'C', '61703970', '2013-05-28 16:34:26.12', false, 554);
INSERT INTO component VALUES (559, 'G', 'H8', '19687392', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 20:12:25.927', 'D', 558);
INSERT INTO component VALUES (560, 'A', 'G9', '91262388', 'Howard Joel Wolowitz', '2013-05-27 21:42:05.985', 'G', 558);
INSERT INTO location VALUES (561, 'GG9', 553);
INSERT INTO device VALUES (562, 'B8', 'F', '41680426', '2013-05-28 11:54:12.976', false, 561);
INSERT INTO component VALUES (563, 'A', 'E7', '33262758', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 12:57:35.782', 'B', 562);
INSERT INTO component VALUES (564, 'A', 'I3', '64465932', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:30:29.504', 'D', 562);
INSERT INTO device VALUES (565, 'D9', 'I', '77959231', '2013-05-28 03:04:21.376', false, 561);
INSERT INTO component VALUES (566, 'F', 'A7', '59245570', 'Dr. Dr. Sheldon Lee Cooper', '2013-05-28 10:20:34.058', 'A', 565);
INSERT INTO component VALUES (567, 'G', 'G9', '53766438', 'Dr. Leonard Leakey Hofstadter', '2013-05-28 04:18:32.667', 'I', 565);
