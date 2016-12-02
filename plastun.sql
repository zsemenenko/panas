--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE group_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "group" (
    id integer DEFAULT nextval('group_id_seq'::regclass) NOT NULL,
    name text,
    frequencies text DEFAULT '[]'::text
);


ALTER TABLE "group" OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history (
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    type text,
    json jsonb
);


ALTER TABLE history OWNER TO postgres;

--
-- Name: linking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE linking_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE linking_id_seq OWNER TO postgres;

--
-- Name: linking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE linking (
    name text,
    "IP" text,
    id integer DEFAULT nextval('linking_id_seq'::regclass) NOT NULL
);


ALTER TABLE linking OWNER TO postgres;

--
-- Name: network_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE network_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE network_id_seq OWNER TO postgres;

--
-- Name: network; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE network (
    id integer DEFAULT nextval('network_id_seq'::regclass) NOT NULL,
    name text,
    created_at timestamp with time zone,
    frequency real,
    direction real,
    lat real,
    lng real,
    power real
);


ALTER TABLE network OWNER TO postgres;

--
-- Name: pelengs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pelengs (
    frequency real NOT NULL,
    line_wide real NOT NULL,
    direction real NOT NULL,
    direction_offset real NOT NULL,
    power real NOT NULL,
    id integer NOT NULL,
    vkf text NOT NULL,
    "time" text NOT NULL,
    pid text NOT NULL,
    cluster integer
);


ALTER TABLE pelengs OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE settings (
    param text NOT NULL,
    value text NOT NULL
);


ALTER TABLE settings OWNER TO postgres;

--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "group" (id, name, frequencies) FROM stdin;
79	21313	[["123","12"],["234234","123"],["123123","11111"],["123123",""],["1","2"],["3","4"]]
128	1111	[["12","1"],["12",""],["123123",""],["1111",""],["1212",""],["1211212","1212"],["121212",""]]
39	11	[["444",12.5],["123","12"],["123",""],["1232","12"],["111","12"],["","12"],["","12"]]
11	12	[["ass","asd"],["","45"],["aasdasdasdasd","12.9"],["asd","300"],["asdasdasdasd","100"],["",12.5],["",12.5]]
12	Hellasd	[["2123","12"],["sdfsdf","123"],["asd",12.5],["asd","asd"],["asd",12.5],["asd","asd"],["asd","asd"],["asd",12.5],["asd","asd"],["asd","asd"],["123",12.5],["123",12.5],["444",12.5],["123",12.5],["123",12.5],["222",12.5],["222",12.5]]
43	asdasdad	[["123","12"],["123","123"],["123","123"],["123","12"]]
13	sdfl'sdfl	[]
80	fghfgh	[]
\.


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_id_seq', 128, true);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY history ("createdAt", type, json) FROM stdin;
2016-11-25 13:48:27.9745+00	calibration	-56.26539227548691
2016-11-25 13:49:46.56247+00	calibration	-52.58610771445819
2016-11-25 13:50:18.681788+00	calibration	51.49638580663162
2016-11-25 13:50:34.873606+00	calibration	-43.152393088104304
2016-11-25 13:56:04.100095+00	calibration	152.12062615951473
2016-11-25 14:00:56.046835+00	calibration	-32.75798345312985
2016-11-25 14:03:35.178614+00	calibration	57.86299161679896
2016-11-25 14:04:03.723547+00	calibration	-33.10129085458016
2016-11-25 14:04:24.224855+00	calibration	129.0452070366418
2016-11-25 14:06:27.671363+00	calibration	-52.650166537523205
2016-11-25 14:07:58.41193+00	calibration	-74.63921249942365
2016-11-25 14:20:21.546939+00	calibration	-75.86462914859834
2016-11-25 14:22:29.420872+00	calibration	-75.35866834741047
2016-11-25 14:48:10.852017+00	calibration	-7.236489223470173
2016-11-25 14:48:26.936494+00	calibration	235.45867235595117
2016-11-25 14:48:49.206461+00	calibration	137.77224348198595
2016-11-25 14:49:11.75761+00	calibration	-93.19576579048925
2016-11-25 14:49:26.089081+00	calibration	164.34013935543885
2016-11-25 14:49:42.447643+00	calibration	111.49732914874704
2016-11-25 14:49:52.638957+00	calibration	66.02560202620649
2016-11-25 14:50:02.851112+00	calibration	-45.45469564302053
2016-11-25 14:50:23.522469+00	calibration	-77.19951151246707
2016-11-25 14:50:37.760216+00	calibration	-42.634587579818124
2016-11-25 14:50:52.025806+00	calibration	159.28964919078163
2016-11-25 14:51:30.696026+00	calibration	-77.79696368168393
2016-11-25 14:51:46.990377+00	calibration	-17.79550468521741
2016-11-25 14:52:11.503782+00	calibration	-75.32638491550469
2016-11-25 14:55:10.981496+00	calibration	-106.65237447284987
2016-11-25 14:55:21.006514+00	calibration	55.285692278666005
2016-11-25 14:55:31.020855+00	calibration	178.0417576114081
\.


--
-- Data for Name: linking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY linking (name, "IP", id) FROM stdin;
slava	192.168.21.52	26
\.


--
-- Name: linking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('linking_id_seq', 42, true);


--
-- Data for Name: network; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY network (id, name, created_at, frequency, direction, lat, lng, power) FROM stdin;
55	TT	2016-11-25 13:43:30.394474+00	105.5	74.5631104	50.451828	30.3634949	-50
\.


--
-- Name: network_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('network_id_seq', 57, true);


--
-- Data for Name: pelengs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pelengs (frequency, line_wide, direction, direction_offset, power, id, vkf, "time", pid, cluster) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY settings (param, value) FROM stdin;
udpTo	
frequency	[423.8,"105.5",104.7,423.6,100]
hwHost	192.168.21.30
bandwidth	[10,20000,2000,20]
currentBandwidth	20
currentFrequency	105.5
correctionAngle	-81.02990347806247
hwPort	3020
hwWritingPort	3021
id	5555
ip	192.168.21.106
long	30.363353
lat	50.451949
height	0
azimut	0
\.


--
-- Name: pelengs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pelengs
    ADD CONSTRAINT pelengs_pkey PRIMARY KEY (pid);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (param);


--
-- Name: createdIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "createdIndex" ON history USING btree ("createdAt");


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

