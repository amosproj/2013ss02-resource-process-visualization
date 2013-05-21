drop table factory;
create table factory(id int , name char(25), company char(25), city char(25), country char(25), 
						gpslatitude double precision , gpslongitude double precision, 
						carmodels char(512), sizeofstaff int, numofvehicles int );
insert into factory values (1, 'German1', 'Audi' ,'Ingolstadt', 'Germany', 48.762201d, 11.425374d, 
	'Audi A3, Audi A3 Sportback, Audi S3, Audi S3 Sportback, Audi A4, Audi A4 Avant, Audi S4, Audi S4 Avant, Audi A4 allroad quattro, Audi RS4 Avant, Audi A5 Sportback, Audi A5 Coupé, Audi S5 Sportback, Audi S5 Coupé, Audi RS 5 Coupé, Audi Q5, Audi Q5 hybrid quattro, Audi SQ5 TDI, Karosseriebau/Lackiererei des Audi TT Coupé, Audi TT Roadster, Audi TTS Coupé, Audi TTS Roadster, Audi TT RS Coupé, Audi TT RS Roadster, Audi A3 Cabriolet',
	35386, 551889
);
insert into factory values (2, 'German2', 'Audi' , 'Neckarsulm', 'Germany', 49.194213d, 9.221771d, 
	'Audi A4, Audi A5 Cabriolet, Audi S5 Cabriolet, Audi RS 5 Cabriolet, Audi A6, Audi A6 hybrid, Audi A6 Avant, Audi S6, Audi A6 allroad quattro, Audi RS 6 Avant, Audi A7, Audi S7, Audi RS7, Audi A8, Audi A8 L, Audi A8 hybrid, Audi S8, Audi R8, Audi R8 Spyder, Audi R8 GT, Audi R8 GT Spyder',
		14764, 262965
);