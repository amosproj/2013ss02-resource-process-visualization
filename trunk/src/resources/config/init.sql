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

/*
SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';

SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE TABLE factory (
    id integer NOT NULL,
    company character varying(50),
    name character varying(25),
    city character varying(50),
    country character varying(50),
    gpslatitude double precision,
    gpslongitude double precision,
    carmodels character varying(512),
    sizeofstaff integer,
    numofvehicles integer
);

CREATE SEQUENCE factory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE factory_id_seq OWNED BY factory.id;

CREATE TABLE hall (
    id integer NOT NULL,
    name character varying(50),
    staff integer,
    capacity integer,
    path character varying(250),
    parent integer
);

CREATE SEQUENCE hall_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE hall_id_seq OWNED BY hall.id;

CREATE TABLE line (
    id integer NOT NULL,
    name character varying(50),
    series character varying(50),
    capacity integer,
    path character varying(250),
    parent integer
);

CREATE SEQUENCE line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE line_id_seq OWNED BY line.id;

CREATE TABLE location (
    id integer NOT NULL,
    name character varying(50),
    parent integer
);

CREATE SEQUENCE location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE location_id_seq OWNED BY location.id;

ALTER TABLE ONLY factory ALTER COLUMN id SET DEFAULT nextval('factory_id_seq'::regclass);

ALTER TABLE ONLY hall ALTER COLUMN id SET DEFAULT nextval('hall_id_seq'::regclass);

ALTER TABLE ONLY line ALTER COLUMN id SET DEFAULT nextval('line_id_seq'::regclass);

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('location_id_seq'::regclass);

COPY factory (id, company, name, city, country, gpslatitude, gpslongitude, carmodels, sizeofstaff, numofvehicles) FROM stdin;
1	Audi	German1			48.7622009999999975	11.4253739999999997	\N	15000	0
2	Audi	German2			53.0147830000000013	8.74511700000000047	\N	15000	0
\.

SELECT pg_catalog.setval('factory_id_seq', 2, true);

COPY hall (id, name, staff, capacity, path, parent) FROM stdin;
1	B5	0	0	m 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z	1
2	B8	0	0	m 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z	1
3	V1	0	0	m 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z	1
\.

SELECT pg_catalog.setval('hall_id_seq', 3, true);

COPY line (id, name, series, capacity, path, parent) FROM stdin;
1	B5 Assembly	Test Series	0	m 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z	1
2	B5 Finish	Test Series	0	m 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z	1
3	B8 Assembly	Test Series	0	m 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z	2
4	V1 PreSeries	Test Series	0	m 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z	3
\.

SELECT pg_catalog.setval('line_id_seq', 4, true);

COPY location (id, name, parent) FROM stdin;
1	VP1	1
2	VP2	1
3	VP3	1
4	IBN	1
5	Rework	1
6	BZD	2
7	VP1	3
8	VP3	3
9	IBN	3
10	PreSeries	4
\.

SELECT pg_catalog.setval('location_id_seq', 10, true);

ALTER TABLE ONLY factory
    ADD CONSTRAINT factory_pkey PRIMARY KEY (id);

ALTER TABLE ONLY hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (id);

ALTER TABLE ONLY line
    ADD CONSTRAINT line_pkey PRIMARY KEY (id);

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);

ALTER TABLE ONLY hall
    ADD CONSTRAINT hall_parent_fkey FOREIGN KEY (parent) REFERENCES factory(id) ON DELETE CASCADE;

ALTER TABLE ONLY line
    ADD CONSTRAINT line_parent_fkey FOREIGN KEY (parent) REFERENCES hall(id) ON DELETE CASCADE;

ALTER TABLE ONLY location
    ADD CONSTRAINT location_parent_fkey FOREIGN KEY (parent) REFERENCES line(id) ON DELETE CASCADE;

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
 */