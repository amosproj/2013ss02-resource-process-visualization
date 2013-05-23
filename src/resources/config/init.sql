--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: ids; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ids
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: factory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE factory (
    id integer DEFAULT nextval('ids'::regclass) NOT NULL,
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


--
-- Name: hall; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE hall (
    id integer DEFAULT nextval('ids'::regclass) NOT NULL,
    name character varying(50),
    staff integer,
    capacity integer,
    path character varying(250),
    parent integer
);


--
-- Name: line; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE line (
    id integer DEFAULT nextval('ids'::regclass) NOT NULL,
    name character varying(50),
    series character varying(50),
    capacity integer,
    path character varying(250),
    parent integer
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE location (
    id integer DEFAULT nextval('ids'::regclass) NOT NULL,
    name character varying(50),
    parent integer
);


--
-- Data for Name: factory; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO factory VALUES (1, 'Audi', 'German1', '', '', 48.7622009999999975, 11.4253739999999997, NULL, 15000, 0);
INSERT INTO factory VALUES (19, 'Audi', 'German2', '', '', 53.0147830000000013, 8.74511700000000047, NULL, 15000, 0);


--
-- Data for Name: hall; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO hall VALUES (2, 'B5', 0, 0, 'm 74.509956,5.35737 33.928574,0 0,62.14286 -33.928574,0 z', 1);
INSERT INTO hall VALUES (11, 'B8', 0, 0, 'm 103.79566,89.64308 28.21429,0 0,14.99995 -28.21429,0 z', 1);
INSERT INTO hall VALUES (16, 'V1', 0, 0, 'm 132.36711,101.42883 14.28572,0 0,30.7143 -14.28572,0 z', 1);


--
-- Name: ids; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('ids', 19, true);


--
-- Data for Name: line; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO line VALUES (3, 'B5 Assembly', 'Test Series', 0, 'm 117.38822,36.114366 143.94673,0 0,27.27411 -143.94673,0 z', 2);
INSERT INTO line VALUES (9, 'B5 Finish', 'Test Series', 0, 'm 352.24158,86.109936 0,1.03125 -74.75,0 0,44.437504 74.75,0 0,54.03125 72.21875,0 0,-99.500004 -72.21875,0 z', 2);
INSERT INTO line VALUES (12, 'B8 Assembly', 'Test Series', 0, 'm 276.48725,31.568676 152.02795,0 0,41.92133 -152.02795,0 z', 11);
INSERT INTO line VALUES (17, 'V1 PreSeries', 'Test Series', 0, 'm 118.39838,113.39104 143.94673,0 0,27.27412 -143.94673,0 z', 16);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO location VALUES (4, 'VP1', 3);
INSERT INTO location VALUES (5, 'VP2', 3);
INSERT INTO location VALUES (6, 'VP3', 3);
INSERT INTO location VALUES (7, 'IBN', 3);
INSERT INTO location VALUES (8, 'Rework', 3);
INSERT INTO location VALUES (10, 'BZD', 9);
INSERT INTO location VALUES (13, 'VP1', 12);
INSERT INTO location VALUES (14, 'VP3', 12);
INSERT INTO location VALUES (15, 'IBN', 12);
INSERT INTO location VALUES (18, 'PreSeries', 17);


--
-- Name: factory_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY factory
    ADD CONSTRAINT factory_pkey PRIMARY KEY (id);


--
-- Name: hall_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (id);


--
-- Name: line_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY line
    ADD CONSTRAINT line_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: hall_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hall
    ADD CONSTRAINT hall_parent_fkey FOREIGN KEY (parent) REFERENCES factory(id) ON DELETE CASCADE;


--
-- Name: line_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY line
    ADD CONSTRAINT line_parent_fkey FOREIGN KEY (parent) REFERENCES hall(id) ON DELETE CASCADE;


--
-- Name: location_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_parent_fkey FOREIGN KEY (parent) REFERENCES line(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

