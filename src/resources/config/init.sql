drop table if exists factory;
create table factory(id int , name char(25), company char(25), city char(25), country char(25), 
						gpslatitude double precision , gpslongitude double precision, 
						carmodels char(512), sizeofstaff int, numofvehicles int );
insert into factory values (1, 'Ingolstadt', 'Audi' ,'Ingolstadt', 'Germany', 48.762201, 11.425374, 
	'Audi A3, Audi A3 Sportback, Audi S3, Audi S3 Sportback, Audi A4, Audi A4 Avant, Audi S4, Audi S4 Avant, Audi A4 allroad quattro, Audi RS4 Avant, Audi A5 Sportback, Audi A5 Coupe, Audi S5 Sportback, Audi S5 Coupe, Audi RS 5 Coupe, Audi Q5, Audi Q5 hybrid quattro, Audi SQ5 TDI, Karosseriebau/Lackiererei des Audi TT Coupe, Audi TT Roadster, Audi TTS Coupe, Audi TTS Roadster, Audi TT RS Coupe, Audi TT RS Roadster, Audi A3 Cabriolet',
	35386, 551889
);
insert into factory values (2, 'Neackrsulm', 'Audi' , 'Neckarsulm', 'Germany', 49.194213, 9.221771, 
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