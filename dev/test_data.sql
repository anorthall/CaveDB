--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE cavedb;




--
-- Drop roles
--

DROP ROLE cavedb;


--
-- Roles
--

CREATE ROLE cavedb;
ALTER ROLE cavedb WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DmKVkF11tyAmitf8vbYguw==$hLmpqVUxvMjAN1frHfg1jSlz7hYZzV3A+Dl7fQkV77w=:fgiK243Yje7btTvk5q6U9a5HxHbHk6oUEQPajseP3tA=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: cavedb
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO cavedb;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: cavedb
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: cavedb
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: cavedb
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "cavedb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: cavedb; Type: DATABASE; Schema: -; Owner: cavedb
--

CREATE DATABASE cavedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE cavedb OWNER TO cavedb;

\connect cavedb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO cavedb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO cavedb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO cavedb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO cavedb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO cavedb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO cavedb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO cavedb;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO cavedb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO cavedb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO cavedb;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO cavedb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO cavedb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: database_cave; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.database_cave (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    added_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    location character varying(50) NOT NULL,
    latitude numeric(9,6),
    longitude numeric(9,6),
    length numeric(6,3),
    depth integer,
    wikipedia character varying(200),
    website character varying(200),
    description text NOT NULL,
    organisation_id bigint,
    region_id bigint NOT NULL,
    system_id bigint,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.database_cave OWNER TO cavedb;

--
-- Name: database_cave_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.database_cave_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_cave_id_seq OWNER TO cavedb;

--
-- Name: database_cave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.database_cave_id_seq OWNED BY public.database_cave.id;


--
-- Name: database_cavesystem; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.database_cavesystem (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    added_on timestamp with time zone NOT NULL,
    updated_on timestamp with time zone NOT NULL,
    location character varying(50) NOT NULL,
    latitude numeric(9,6),
    longitude numeric(9,6),
    length numeric(6,3),
    depth integer,
    wikipedia character varying(200),
    website character varying(200),
    description text NOT NULL,
    organisation_id bigint,
    region_id bigint NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.database_cavesystem OWNER TO cavedb;

--
-- Name: database_cavesystem_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.database_cavesystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_cavesystem_id_seq OWNER TO cavedb;

--
-- Name: database_cavesystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.database_cavesystem_id_seq OWNED BY public.database_cavesystem.id;


--
-- Name: database_club; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.database_club (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    location character varying(50) NOT NULL,
    website character varying(200),
    description text NOT NULL,
    country_id bigint NOT NULL,
    region_id bigint,
    abbreviation character varying(10) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.database_club OWNER TO cavedb;

--
-- Name: database_club_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.database_club_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_club_id_seq OWNER TO cavedb;

--
-- Name: database_club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.database_club_id_seq OWNED BY public.database_club.id;


--
-- Name: database_country; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.database_country (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.database_country OWNER TO cavedb;

--
-- Name: database_country_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.database_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_country_id_seq OWNER TO cavedb;

--
-- Name: database_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.database_country_id_seq OWNED BY public.database_country.id;


--
-- Name: database_organisation; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.database_organisation (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    website character varying(200),
    country_id bigint NOT NULL,
    region_id bigint,
    abbreviation character varying(10) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.database_organisation OWNER TO cavedb;

--
-- Name: database_organisation_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.database_organisation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_organisation_id_seq OWNER TO cavedb;

--
-- Name: database_organisation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.database_organisation_id_seq OWNED BY public.database_organisation.id;


--
-- Name: database_region; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.database_region (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    website character varying(200),
    wikipedia character varying(200),
    description text NOT NULL,
    country_id bigint NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.database_region OWNER TO cavedb;

--
-- Name: database_region_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.database_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.database_region_id_seq OWNER TO cavedb;

--
-- Name: database_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.database_region_id_seq OWNED BY public.database_region.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO cavedb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO cavedb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO cavedb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO cavedb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO cavedb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: cavedb
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO cavedb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cavedb
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: cavedb
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO cavedb;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: database_cave id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cave ALTER COLUMN id SET DEFAULT nextval('public.database_cave_id_seq'::regclass);


--
-- Name: database_cavesystem id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cavesystem ALTER COLUMN id SET DEFAULT nextval('public.database_cavesystem_id_seq'::regclass);


--
-- Name: database_club id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_club ALTER COLUMN id SET DEFAULT nextval('public.database_club_id_seq'::regclass);


--
-- Name: database_country id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_country ALTER COLUMN id SET DEFAULT nextval('public.database_country_id_seq'::regclass);


--
-- Name: database_organisation id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_organisation ALTER COLUMN id SET DEFAULT nextval('public.database_organisation_id_seq'::regclass);


--
-- Name: database_region id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_region ALTER COLUMN id SET DEFAULT nextval('public.database_region_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add country	1	add_country
2	Can change country	1	change_country
3	Can delete country	1	delete_country
4	Can view country	1	view_country
5	Can add region	2	add_region
6	Can change region	2	change_region
7	Can delete region	2	delete_region
8	Can view region	2	view_region
9	Can add organisation	3	add_organisation
10	Can change organisation	3	change_organisation
11	Can delete organisation	3	delete_organisation
12	Can view organisation	3	view_organisation
13	Can add club	4	add_club
14	Can change club	4	change_club
15	Can delete club	4	delete_club
16	Can view club	4	view_club
17	Can add cave system	5	add_cavesystem
18	Can change cave system	5	change_cavesystem
19	Can delete cave system	5	delete_cavesystem
20	Can view cave system	5	view_cavesystem
21	Can add cave	6	add_cave
22	Can change cave	6	change_cave
23	Can delete cave	6	delete_cave
24	Can view cave	6	view_cave
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add content type	11	add_contenttype
42	Can change content type	11	change_contenttype
43	Can delete content type	11	delete_contenttype
44	Can view content type	11	view_contenttype
45	Can add session	12	add_session
46	Can change session	12	change_session
47	Can delete session	12	delete_session
48	Can view session	12	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$nIoOMzuFiORqOEUhio1dTb$UphhFcSRsLnFk6b9CQFKI9A4fYqaM7XTZrfqwyYJRwA=	2022-03-05 03:10:20.040811+00	t	Administrator			administrator@cave.db	t	t	2022-03-05 03:09:55.527513+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: database_cave; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.database_cave (id, name, added_on, updated_on, location, latitude, longitude, length, depth, wikipedia, website, description, organisation_id, region_id, system_id, slug) FROM stdin;
1	Lancaster Hole	2022-03-05 04:03:04.324207+00	2022-03-05 15:48:59.169026+00	Casterton Fell	54.221430	-2.516353	15.057	78	https://en.wikipedia.org/wiki/Ease_Gill_Caverns	https://cncc.org.uk/cave/lancaster-hole	Lancaster Hole is the oldest known entrance to the Ease Gill Caverns cave system, which comprises a large part of the Three Counties System.	1	1	1	lancaster-hole
4	Boundary Pot	2022-03-05 12:58:28.06175+00	2022-03-05 14:25:49.327479+00	Ease Gill	\N	\N	0.851	58	\N	https://cncc.org.uk/cave/boundary-pot		1	1	1	boundary-pot
23	Jenga Pot	2022-03-05 14:01:37.851061+00	2022-03-05 14:23:49.666498+00	Hutton-le-Hole	54.278963	-0.907664	\N	\N	\N	https://cncc.org.uk/cave/jenga-pot	Part of the Excalibur/Jenga Pot system. No length data is available other than for the overall system, which is listed on the relevant pages.	1	2	2	jenga-pot
22	Excalibur Pot	2022-03-05 13:59:40.559206+00	2022-03-05 14:23:55.224436+00	Hutton-le-Hole	54.281000	-0.910237	2.840	30	https://en.wikipedia.org/wiki/Excalibur_Pot	https://cncc.org.uk/cave/excalibur-pot	A tight, muddy, and wet system in the southern North Yorkshire Moors. The cave was dug out extensively by members of the York Caving Club and North Yorkshire Moors Caving Club, and now extends to over 2,800 metres in length with a depth of at least 30 metres.\r\n\r\nDigging work is ongoing and the system is likely to be further extended.\r\n\r\nThe entire system floods heavily in wet weather.	1	2	2	excalibur-pot
21	Wretched Rabbit	2022-03-05 13:29:18.525096+00	2022-03-05 14:24:00.555166+00	Casterton Fell	54.220091	-2.498393	1.757	\N	\N	https://cncc.org.uk/cave/wretched-rabbit		1	1	1	wretched-rabbit
20	Witches Cave	2022-03-05 13:27:50.844139+00	2022-03-05 14:24:04.93993+00	Leck Fell	54.214595	-2.522862	0.653	2	\N	https://cncc.org.uk/cave/witches-cave		1	1	1	witches-cave
19	Top Sink	2022-03-05 13:26:58.020161+00	2022-03-05 14:24:16.922563+00	Casterton Fell	54.224748	-2.491470	4.653	77	\N	https://cncc.org.uk/cave/top-sink		1	1	1	top-sink
18	Sylvester Pot	2022-03-05 13:25:16.212774+00	2022-03-05 14:24:22.067674+00	Casterton Fell	54.219898	-2.501765	0.698	55	\N	https://cncc.org.uk/cave/sylvester-pot		1	1	1	sylvester-pot
17	Swindon Hole	2022-03-05 13:24:16.988186+00	2022-03-05 14:24:27.068782+00	Ease Gill	54.220100	-2.498840	0.234	18	\N	https://northerncaves.co.uk/caves/details.php?id=1732	An alternative entrance to County Pot, in the Trident Series.	1	1	1	swindon-hole
16	Shuttleworth Pot	2022-03-05 13:22:27.22311+00	2022-03-05 14:24:32.191057+00	Leck Fell	54.212569	-2.519570	1.506	67	\N	https://cncc.org.uk/cave/shuttleworth-pot		1	1	1	shuttleworth-pot
15	Pool Sink	2022-03-05 13:21:16.318696+00	2022-03-05 14:24:36.867498+00	Casterton Fell	54.221222	-2.496612	1.747	54	\N	https://cncc.org.uk/cave/pool-sink		1	1	1	pool-sink
14	Pippikin Pot	2022-03-05 13:20:16.156865+00	2022-03-05 14:24:42.442296+00	Leck Fell	54.214478	-2.512440	3.203	103	\N	https://cncc.org.uk/cave/pippikin-pot		1	1	1	pippikin-pot
13	Peterson Pot	2022-03-05 13:19:03.361566+00	2022-03-05 14:24:51.0871+00	Leck Fell	54.213743	-2.512117	0.299	65	\N	https://cncc.org.uk/cave/peterson-pot		1	1	1	peterson-pot
12	Peg Leg Pot	2022-03-05 13:18:19.121134+00	2022-03-05 14:25:01.317707+00	Leck Fell	54.216863	-2.517983	0.950	43	\N	https://cncc.org.uk/cave/peg-leg-pot		1	1	1	peg-leg-pot
11	Mistral Hole	2022-03-05 13:17:06.68094+00	2022-03-05 14:25:07.3598+00	Ease Gill	54.217603	-2.513085	1.159	28	\N	https://cncc.org.uk/cave/mistral-hole		1	1	1	mistral-hole
9	Kirk Pot	2022-03-05 13:12:15.634151+00	2022-03-05 14:25:16.541538+00	Leck Fell	54.216406	-2.519818	0.686	67	\N	https://cncc.org.uk/cave/kirk-pot-and-lower-kirk-caves		1	1	1	kirk-pot
8	Cow Pot	2022-03-05 13:10:12.863206+00	2022-03-05 14:25:20.155325+00	Casterton Fell	54.222325	-2.516411	0.802	83	\N	https://cncc.org.uk/cave/cow-pot	A challenging alternative entrance to Lancaster Hole in Ease Gill Caverns. The entrance is very SRT-intensive and is considered to be one of the most technical entrances to the system.	1	1	1	cow-pot
7	County Pot	2022-03-05 13:06:35.400546+00	2022-03-05 14:25:24.357546+00	Ease Gill	54.219186	-2.499916	6.381	70	\N	https://cncc.org.uk/cave/county-pot	County Pot is a major entrance to the Ease Gill Caverns/Three Counties systems.\r\n\r\nThe entrance does not require any single rope technique to be used. A small 8 metre pitch inside can be done on a ladder if desired, permitting an easy entrance to Ease Gill Caverns.\r\n\r\nA through trip can be made to several other entrances including Lancaster Hole, Boundary Pot, Pool Sink, and more.	1	1	1	county-pot
6	Bye George Pot	2022-03-05 13:01:08.006152+00	2022-03-05 14:25:30.192885+00	Leck Fell	\N	\N	1.996	95	\N	https://cncc.org.uk/cave/bye-george-pot		1	1	1	bye-george-pot
5	Bull Pot of the Witches	2022-03-05 13:00:14.00864+00	2022-03-05 14:25:44.006333+00	Casterton Fell	54.226386	-2.518946	2.500	35	\N	https://cncc.org.uk/cave/bull-pot-of-the-witches		1	1	1	bull-pot-of-the-witches
3	The Borehole	2022-03-05 12:57:33.138871+00	2022-03-05 14:25:54.330073+00	Ease Gill	\N	\N	0.880	55	\N	https://cncc.org.uk/cave/the-borehole		1	1	1	the-borehole
2	Aygill Caverns	2022-03-05 12:55:26.035895+00	2022-03-05 14:25:59.278562+00	Barbondale	54.231424	-2.517782	2.394	55	\N	https://cncc.org.uk/cave/aygill-caverns		1	1	1	aygill-caverns
25	Peak Cavern	2022-03-05 19:25:22.153956+00	2022-03-05 19:25:22.153964+00	Castleton	53.339900	-1.778200	6.026	130	https://en.wikipedia.org/wiki/Peak_Cavern	https://peakdistrictcaving.info/home/the-caves/castleton/peak-cavern	Part of the Peak-Speedwell system, the largest in the Peak District.\r\n\r\nAccess is restricted as the entrance is a show cave. Details of how to gain access can be found on the [Peak-Speedwell website](https://peakspeedwell.info/).	2	3	3	peak-cavern
24	Speedwell Cavern	2022-03-05 19:23:04.430807+00	2022-03-05 19:27:45.755267+00	Castleton	53.341500	-1.792200	6.929	235	https://en.wikipedia.org/wiki/Speedwell_Cavern	https://peakdistrictcaving.info/home/the-caves/castleton/speedwell-mine-and-cavern	Part of the Peak-Speedwell system, the largest in the Peak District.\r\n\r\nSpeedwell Cavern is part-mine and part-natural cave. Access is restricted as the entrance is a show cave. Details of how to gain access can be found on the [Peak-Speedwell website](https://peakspeedwell.info/).	2	3	3	speedwell
10	Link Pot	2022-03-05 13:15:54.206293+00	2022-03-05 15:51:32.3485+00	Ease Gill	54.217797	-2.509867	4.092	60	\N	https://cncc.org.uk/cave/link-pot	Link Pot joins the systems beneath Casterton Fell and Leck Fell, part of Ease Gill Caverns.\r\n\r\nIt is possible to travel southbound between the Stake Pot Series in Lancaster Hole, via Link Pot, towards Pippikin Pot. A northbound trip must be pre-rigged at the 88ft Pitch.	1	1	1	link-pot
26	Titan	2022-03-05 19:35:14.84669+00	2022-03-05 19:36:16.049936+00	Castleton	53.333300	-1.793200	2.086	196	https://en.wikipedia.org/wiki/Titan_(cave)	https://peakdistrictcaving.info/home/the-caves/castleton/titan-shaft	Titan is the largest natural cave shaft in the United Kingdom, with a continuous drop of 141.5 metres (according to Wikipedia). Access is by [permit only](https://www.peakspeedwell.info/index.php/access-information/titan-shaft-access) and the entrance is left locked.\r\n\r\nEntrance to the shaft is via a man-made entrance dropping some 50 metres from the top of Hurd Low, near Castleton. A short horizontal section of cave then leads to a window near the top of the shaft. The shaft is descended in two sections, the first being around 65 metres which immediately leads to the second 60 metre drop.\r\n\r\nFor more information on Titan, please see [this blog post](https://northall.me.uk/posts/titan/) or [this YouTube video](https://www.youtube.com/watch?v=Jp1Ak2l7bew).	2	3	3	titan
27	James Hall's Over Engine Mine	2022-03-05 19:41:44.21916+00	2022-03-05 19:41:44.219172+00	Castleton	53.334700	-1.798700	1.468	191	\N	https://peakdistrictcaving.info/home/the-caves/castleton/james-halls-over-engine-mine	James Hall's Over Engine Mine is a mine that intersects with a large natural cave system, Peak-Speedwell, the largest in the Peak District.\r\n\r\nAccess to the system is via a long series of pitches that drop almost 200 metres vertically - not for the faint hearted.	2	3	3	james-hall
28	Giant's Hole	2022-03-05 19:50:00.310563+00	2022-03-05 19:52:20.049149+00	Castleton	53.340900	-1.822100	2.298	140	https://en.wikipedia.org/wiki/Giant%27s_Hole	https://peakdistrictcaving.info/home/the-caves/castleton/giants-hole	Giant's Hole is a well-known cave in the Peak District that forms part of the larger Giants/Oxlow/Maskhill system. Giant's Hole is a natural cave.\r\n\r\nThe connection to Oxlow is quite an undertaking; however, the entrance to Giant's Hole is quite welcoming and popular with novices.	2	3	4	giants-hole
29	Oxlow Caverns	2022-03-05 19:53:47.059196+00	2022-03-05 19:53:47.059207+00	Castleton	53.336400	-1.815100	2.134	145	https://en.wikipedia.org/wiki/Oxlow_Cavern	https://peakdistrictcaving.info/home/the-caves/castleton/oxlow-caverns	Oxlow Cavern is a part-mine and part-natural cave system which forms part of the larger Giants/Oxlow/Maskhill system.	2	3	4	oxlow-caverns
30	Maskhill Mine	2022-03-05 20:00:27.270814+00	2022-03-05 20:00:27.270826+00	Castleton	53.336300	-1.817600	200.000	225	\N	https://peakdistrictcaving.info/home/the-caves/castleton/maskhill-mine	Maskhill Mine is part of the larger Giants-Oxlow-Maskhill system.	2	3	4	maskhill-mine
31	Bagshawe Cavern	2022-03-05 20:05:35.625239+00	2022-03-05 20:05:35.62525+00	Bradwell	53.324600	-1.743800	5.000	75	\N	https://peakdistrictcaving.info/home/the-caves/bradwell/bagshawe-cavern	Bagshawe Cavern is a (mostly) natural cave which was discovered by lead miners in the early 19th century. Further information is available on the [Eldon Pothole Club website](http://www.eldonpotholeclub.org.uk/homepage/bagshawe-cavern).	2	3	\N	bagshawe-cavern
\.


--
-- Data for Name: database_cavesystem; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.database_cavesystem (id, name, added_on, updated_on, location, latitude, longitude, length, depth, wikipedia, website, description, organisation_id, region_id, slug) FROM stdin;
2	Excalibur/Jenga Pot	2022-03-05 13:58:48.578869+00	2022-03-05 14:23:28.626028+00	Hutton-le-Hole	54.281000	-0.910237	2.840	30	https://en.wikipedia.org/wiki/Excalibur_Pot	https://cncc.org.uk/cave/excalibur-pot	A tight, muddy, and wet system in the southern North Yorkshire Moors. The cave was dug out extensively by members of the York Caving Club and North Yorkshire Moors Caving Club, and now extends to over 2,800 metres in length with a depth of at least 30 metres.\r\n\r\nDigging work is ongoing and the system is likely to be further extended.\r\n\r\nThe entire system floods heavily in wet weather.	1	2	excalibur-jenga
1	Three Counties	2022-03-05 03:49:03.611298+00	2022-03-05 19:13:08.935843+00	Cumbria, Lancashire and North Yorkshire	\N	\N	86.619	253	https://en.wikipedia.org/wiki/Three_Counties_System	\N	The Three Counties System is the largest interconnected cave system in the United Kingdom. It comprises several large systems in their own right, that have subsequently been joined together by way of diving. \r\n\r\nThe system comprises the caves under Leck Fell, Casterton Fell, and Ireby Fell. The most northerly entrance is Bull Pot of the Witches, which is almost three miles from the most southerly entrance, Large Pot. Parts of the system (such as Lancaster Hole) have been dated to being more than 350,000 years old.\r\n\r\nPart of the system is included in the Leck Beck Catchment Area Site of Special Scientific Interest (SSSI), due to the "scale and variety of the caves" which make "this a most important site for the study of surface and underground landform development over a long period of the recent past".	1	1	three-counties
3	Peak-Speedwell	2022-03-05 19:18:34.775146+00	2022-03-05 19:18:34.775157+00	Castleton	53.341500	-1.792200	17.750	248	https://en.wikipedia.org/wiki/Peak_Cavern	https://www.peakspeedwell.info/	The Peak-Speedwell system is the largest cave system in the Peak District. It has a [dedicated website](https://www.peakspeedwell.info/) to deal with access, as both Peak Cavern and Speedwell Cavern are show caves. Several other entrances exist, such as Titan, the largest natural shaft in the United Kingdom at 141 metres deep. \r\n\r\nFurther information on the system can be obtained from the [Peak District Caving website](https://peakdistrictcaving.info/home/the-caves/castleton/peak-speedwell).	2	3	peak-speedwell
4	Giants/Oxlow/Maskhill	2022-03-05 19:46:56.969733+00	2022-03-05 19:46:56.969742+00	Castleton	53.340900	-1.822100	5.184	242	https://en.wikipedia.org/wiki/Giant%27s_Hole	https://peakdistrictcaving.info/home/the-caves/castleton/giants-oxlow-maskhill	Giant's Hole is a well-known cave near Castleton in Derbyshire, consisting mostly of large passages. It is an active stream cave.\r\n\r\nThere is a complex system connecting the cave to Oxlow Cavern and Maskhill Mine to the south. The entrance series is easily accessible making it a favourite with novices and groups. The stream that flows into the entrance can be followed through the cave, bypassing three sumps, to the East Canal, Giant's Hole's terminal sump.	2	3	giants-oxlow-maskhill
\.


--
-- Data for Name: database_club; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.database_club (id, name, location, website, description, country_id, region_id, abbreviation, slug) FROM stdin;
2	North Yorkshire Moors Caving Club	Hutton-le-Hole	http://nymcc.org.uk/	A caving club that conducts regular sporting trips across the United Kingdom, as well as being involved in regular digging projects in the North Yorkshire Moors.	1	2	NYMCC	nymcc
1	Durham University Speleological Assocation	Durham University	https://speleologicalassociation.webspace.durham.ac.uk/	DUSA is a caving club based at Durham University. The majority of DUSA members are students, however studying at Durham University is not a requirement to join the club.	1	1	DUSA	dusa
\.


--
-- Data for Name: database_country; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.database_country (id, name, slug) FROM stdin;
1	England	england
\.


--
-- Data for Name: database_organisation; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.database_organisation (id, name, website, country_id, region_id, abbreviation, slug) FROM stdin;
1	Council of Northern Caving Clubs	https://cncc.org.uk/	1	1	CNCC	cncc
2	Derbyshire Caving Association	https://thedca.org.uk/	1	3	DCA	dca
\.


--
-- Data for Name: database_region; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.database_region (id, name, website, wikipedia, description, country_id, slug) FROM stdin;
2	North Yorkshire Moors	https://www.northyorkmoors.org.uk/	https://en.wikipedia.org/wiki/North_York_Moors	An area with a small amount of caves, with some very active digging teams working to uncover more.	1	north-york-moors
1	Yorkshire Dales	https://www.yorkshiredales.org.uk/	https://en.wikipedia.org/wiki/Yorkshire_Dales	The Yorkshire Dales is a large caving area in the North of England. Most of the caves in the area come under the jurisdiction of the Council of Northern Caving Clubs.	1	dales
3	Peak District	https://www.peakdistrict.gov.uk/	https://en.wikipedia.org/wiki/Peak_District	The Peak District is the second major caving area in the North of England, after the Yorkshire Dales. The biggest system in the area is the Peak-Speedwell system, at over 17 kilometres in length. The same system is also home to the deepest vertical shaft in the United Kingdom - Titan - at 141 metres.	1	peak-district
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-03-05 03:27:52.438099+00	1	England	1	[{"added": {}}]	1	1
2	2022-03-05 03:29:23.97002+00	1	Yorkshire Dales (England)	1	[{"added": {}}]	2	1
3	2022-03-05 03:30:27.226316+00	1	Council of Northern Caving Clubs	1	[{"added": {}}]	3	1
4	2022-03-05 03:32:12.844842+00	1	Durham University Speleological Assocation	1	[{"added": {}}]	4	1
5	2022-03-05 03:34:09.536031+00	1	Durham University Speleological Assocation	2	[{"changed": {"fields": ["Abbreviation"]}}]	4	1
6	2022-03-05 03:34:21.130733+00	1	Council of Northern Caving Clubs	2	[{"changed": {"fields": ["Abbreviation"]}}]	3	1
7	2022-03-05 03:49:03.614639+00	1	Three Counties System	1	[{"added": {}}]	5	1
8	2022-03-05 03:58:49.868754+00	1	Three Counties System	2	[{"changed": {"fields": ["Length in kilometres"]}}]	5	1
9	2022-03-05 04:03:04.327104+00	1	Lancaster Hole	1	[{"added": {}}]	6	1
10	2022-03-05 04:05:15.11804+00	1	Lancaster Hole	2	[]	6	1
11	2022-03-05 04:07:08.053781+00	1	Three Counties System	2	[{"changed": {"fields": ["Length in meters"]}}]	5	1
12	2022-03-05 04:07:16.611119+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Length in meters"]}}]	6	1
13	2022-03-05 04:10:22.983547+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Length in kilometres"]}}]	6	1
14	2022-03-05 04:10:27.965013+00	1	Three Counties System	2	[{"changed": {"fields": ["Length in kilometres"]}}]	5	1
15	2022-03-05 12:49:37.899475+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Length in kilometres"]}}]	6	1
16	2022-03-05 12:51:09.539892+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Length in kilometres"]}}]	6	1
17	2022-03-05 12:51:42.674846+00	1	Three Counties System	2	[{"changed": {"fields": ["Latitude", "Longitude", "Length in kilometres"]}}]	5	1
18	2022-03-05 12:55:26.039192+00	2	Aygill Caverns	1	[{"added": {}}]	6	1
19	2022-03-05 12:57:33.142084+00	3	The Borehole	1	[{"added": {}}]	6	1
20	2022-03-05 12:58:28.06438+00	4	Boundary Pot	1	[{"added": {}}]	6	1
21	2022-03-05 12:58:34.854713+00	4	Boundary Pot	2	[]	6	1
22	2022-03-05 13:00:14.011864+00	5	Bull Pot of the Witches	1	[{"added": {}}]	6	1
23	2022-03-05 13:01:08.009435+00	6	Bye George Pot	1	[{"added": {}}]	6	1
24	2022-03-05 13:01:11.726221+00	6	Bye George Pot	2	[]	6	1
25	2022-03-05 13:06:35.403412+00	7	County Pot	1	[{"added": {}}]	6	1
26	2022-03-05 13:10:12.866102+00	8	Cow Pot	1	[{"added": {}}]	6	1
27	2022-03-05 13:12:15.636881+00	9	Kirk Pot	1	[{"added": {}}]	6	1
28	2022-03-05 13:12:30.792346+00	9	Kirk Pot	2	[{"changed": {"fields": ["Organisation"]}}]	6	1
29	2022-03-05 13:15:54.208913+00	10	Link Pot	1	[{"added": {}}]	6	1
30	2022-03-05 13:17:06.683629+00	11	Mistral Hole	1	[{"added": {}}]	6	1
31	2022-03-05 13:18:19.123747+00	12	Peg Leg Pot	1	[{"added": {}}]	6	1
32	2022-03-05 13:19:03.364158+00	13	Peterson Pot	1	[{"added": {}}]	6	1
33	2022-03-05 13:20:16.159633+00	14	Pippikin Pot	1	[{"added": {}}]	6	1
34	2022-03-05 13:21:16.32117+00	15	Pool Sink	1	[{"added": {}}]	6	1
35	2022-03-05 13:22:27.225856+00	16	Shuttleworth Pot	1	[{"added": {}}]	6	1
36	2022-03-05 13:24:16.990549+00	17	Swindon Hole	1	[{"added": {}}]	6	1
37	2022-03-05 13:25:16.215555+00	18	Sylvester Pot	1	[{"added": {}}]	6	1
38	2022-03-05 13:26:58.022587+00	19	Top Sink	1	[{"added": {}}]	6	1
39	2022-03-05 13:27:50.849576+00	20	Witches Cave	1	[{"added": {}}]	6	1
40	2022-03-05 13:29:18.526872+00	21	Wretched Rabbit	1	[{"added": {}}]	6	1
41	2022-03-05 13:50:35.883952+00	2	North Yorkshire Moors (England)	1	[{"added": {}}]	2	1
42	2022-03-05 13:52:33.108478+00	2	North Yorkshire Moors Caving Club	1	[{"added": {}}]	4	1
43	2022-03-05 13:58:48.581335+00	2	Excalibur/Jenga Pot	1	[{"added": {}}]	5	1
44	2022-03-05 13:59:40.563054+00	22	Excalibur Pot	1	[{"added": {}}]	6	1
45	2022-03-05 14:01:37.855288+00	23	Jenga Pot	1	[{"added": {}}]	6	1
46	2022-03-05 14:23:28.628641+00	2	Excalibur/Jenga Pot	2	[{"changed": {"fields": ["Slug"]}}]	5	1
47	2022-03-05 14:23:35.233709+00	1	Three Counties System	2	[{"changed": {"fields": ["Slug"]}}]	5	1
48	2022-03-05 14:23:49.669429+00	23	Jenga Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
49	2022-03-05 14:23:55.226359+00	22	Excalibur Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
50	2022-03-05 14:24:00.557036+00	21	Wretched Rabbit	2	[{"changed": {"fields": ["Slug"]}}]	6	1
51	2022-03-05 14:24:04.942953+00	20	Witches Cave	2	[{"changed": {"fields": ["Slug"]}}]	6	1
52	2022-03-05 14:24:16.924753+00	19	Top Sink	2	[{"changed": {"fields": ["Slug"]}}]	6	1
53	2022-03-05 14:24:22.070061+00	18	Sylvester Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
54	2022-03-05 14:24:27.070631+00	17	Swindon Hole	2	[{"changed": {"fields": ["Slug"]}}]	6	1
55	2022-03-05 14:24:32.192926+00	16	Shuttleworth Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
56	2022-03-05 14:24:36.86928+00	15	Pool Sink	2	[{"changed": {"fields": ["Slug"]}}]	6	1
57	2022-03-05 14:24:42.445297+00	14	Pippikin Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
58	2022-03-05 14:24:51.088319+00	13	Peterson Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
59	2022-03-05 14:25:01.31958+00	12	Peg Leg Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
60	2022-03-05 14:25:07.362049+00	11	Mistral Hole	2	[{"changed": {"fields": ["Slug"]}}]	6	1
61	2022-03-05 14:25:12.120099+00	10	Link Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
62	2022-03-05 14:25:16.54339+00	9	Kirk Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
63	2022-03-05 14:25:20.157294+00	8	Cow Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
64	2022-03-05 14:25:24.360088+00	7	County Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
65	2022-03-05 14:25:30.193819+00	6	Bye George Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
66	2022-03-05 14:25:44.0081+00	5	Bull Pot of the Witches	2	[{"changed": {"fields": ["Slug"]}}]	6	1
67	2022-03-05 14:25:49.329889+00	4	Boundary Pot	2	[{"changed": {"fields": ["Slug"]}}]	6	1
68	2022-03-05 14:25:54.332024+00	3	The Borehole	2	[{"changed": {"fields": ["Slug"]}}]	6	1
69	2022-03-05 14:25:59.280375+00	2	Aygill Caverns	2	[{"changed": {"fields": ["Slug"]}}]	6	1
70	2022-03-05 14:26:05.381765+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Slug"]}}]	6	1
71	2022-03-05 14:26:49.733014+00	2	North Yorkshire Moors (England)	2	[{"changed": {"fields": ["Slug", "Website", "Wikipedia"]}}]	2	1
72	2022-03-05 14:26:58.566372+00	2	North Yorkshire Moors (England)	2	[{"changed": {"fields": ["Slug"]}}]	2	1
73	2022-03-05 14:27:21.700663+00	1	Yorkshire Dales (England)	2	[{"changed": {"fields": ["Slug"]}}]	2	1
74	2022-03-05 14:27:28.869795+00	1	Council of Northern Caving Clubs	2	[{"changed": {"fields": ["Slug"]}}]	3	1
75	2022-03-05 14:27:36.808276+00	2	North Yorkshire Moors Caving Club	2	[{"changed": {"fields": ["Slug"]}}]	4	1
76	2022-03-05 14:27:39.822238+00	1	Durham University Speleological Assocation	2	[{"changed": {"fields": ["Slug"]}}]	4	1
77	2022-03-05 14:30:33.308409+00	1	England	2	[{"changed": {"fields": ["Slug"]}}]	1	1
78	2022-03-05 15:47:02.206864+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
79	2022-03-05 15:47:20.76163+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
80	2022-03-05 15:47:30.827351+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
81	2022-03-05 15:47:38.768411+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
82	2022-03-05 15:48:31.341965+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
83	2022-03-05 15:48:59.171332+00	1	Lancaster Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
84	2022-03-05 15:50:04.371167+00	10	Link Pot	2	[{"changed": {"fields": ["Description"]}}]	6	1
85	2022-03-05 15:50:21.57866+00	10	Link Pot	2	[{"changed": {"fields": ["Description"]}}]	6	1
86	2022-03-05 15:51:11.960838+00	10	Link Pot	2	[{"changed": {"fields": ["Description"]}}]	6	1
87	2022-03-05 15:51:32.352243+00	10	Link Pot	2	[{"changed": {"fields": ["Description"]}}]	6	1
88	2022-03-05 19:09:25.603305+00	3	Peak District (England)	1	[{"added": {}}]	2	1
89	2022-03-05 19:10:57.700815+00	2	Derbyshire Caving Association	1	[{"added": {}}]	3	1
90	2022-03-05 19:13:08.939852+00	1	Three Counties	2	[{"changed": {"fields": ["Name"]}}]	5	1
91	2022-03-05 19:18:34.778147+00	3	Peak-Speedwell	1	[{"added": {}}]	5	1
92	2022-03-05 19:23:04.435124+00	24	Speedwell Mine and Cavern	1	[{"added": {}}]	6	1
93	2022-03-05 19:25:22.155306+00	25	Peak Cavern	1	[{"added": {}}]	6	1
94	2022-03-05 19:27:45.756359+00	24	Speedwell Cavern	2	[{"changed": {"fields": ["Name"]}}]	6	1
95	2022-03-05 19:35:14.853178+00	26	Titan	1	[{"added": {}}]	6	1
96	2022-03-05 19:35:47.709164+00	26	Titan	2	[{"changed": {"fields": ["Description"]}}]	6	1
97	2022-03-05 19:36:16.051524+00	26	Titan	2	[{"changed": {"fields": ["Description"]}}]	6	1
98	2022-03-05 19:41:44.224131+00	27	James Hall's Over Engine Mine	1	[{"added": {}}]	6	1
99	2022-03-05 19:46:56.977617+00	4	Giants/Oxlow/Maskhill	1	[{"added": {}}]	5	1
100	2022-03-05 19:50:00.313003+00	28	Giant's Hole	1	[{"added": {}}]	6	1
101	2022-03-05 19:51:10.153269+00	28	Giant's Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
102	2022-03-05 19:52:20.051001+00	28	Giant's Hole	2	[{"changed": {"fields": ["Description"]}}]	6	1
103	2022-03-05 19:53:47.061186+00	29	Oxlow Caverns	1	[{"added": {}}]	6	1
104	2022-03-05 20:00:27.278581+00	30	Maskhill Mine	1	[{"added": {}}]	6	1
105	2022-03-05 20:05:35.62754+00	31	Bagshawe Cavern	1	[{"added": {}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	database	country
2	database	region
3	database	organisation
4	database	club
5	database	cavesystem
6	database	cave
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-05 03:09:50.063298+00
2	auth	0001_initial	2022-03-05 03:09:50.114581+00
3	admin	0001_initial	2022-03-05 03:09:50.126488+00
4	admin	0002_logentry_remove_auto_add	2022-03-05 03:09:50.130794+00
5	admin	0003_logentry_add_action_flag_choices	2022-03-05 03:09:50.134786+00
6	contenttypes	0002_remove_content_type_name	2022-03-05 03:09:50.14233+00
7	auth	0002_alter_permission_name_max_length	2022-03-05 03:09:50.145836+00
8	auth	0003_alter_user_email_max_length	2022-03-05 03:09:50.149237+00
9	auth	0004_alter_user_username_opts	2022-03-05 03:09:50.152267+00
10	auth	0005_alter_user_last_login_null	2022-03-05 03:09:50.155776+00
11	auth	0006_require_contenttypes_0002	2022-03-05 03:09:50.156852+00
12	auth	0007_alter_validators_add_error_messages	2022-03-05 03:09:50.160637+00
13	auth	0008_alter_user_username_max_length	2022-03-05 03:09:50.166454+00
14	auth	0009_alter_user_last_name_max_length	2022-03-05 03:09:50.170035+00
15	auth	0010_alter_group_name_max_length	2022-03-05 03:09:50.174607+00
16	auth	0011_update_proxy_permissions	2022-03-05 03:09:50.177531+00
17	auth	0012_alter_user_first_name_max_length	2022-03-05 03:09:50.180555+00
18	database	0001_initial	2022-03-05 03:09:50.237829+00
19	sessions	0001_initial	2022-03-05 03:09:50.244576+00
20	database	0002_remove_cave_code_remove_country_code	2022-03-05 03:20:38.363444+00
21	database	0003_club_abbreviation_organisation_abbreviation	2022-03-05 03:34:00.117744+00
22	database	0004_alter_cave_length_alter_cavesystem_length	2022-03-05 04:04:50.979653+00
23	database	0005_alter_cave_length_alter_cavesystem_length	2022-03-05 04:06:51.327849+00
24	database	0006_alter_cave_length_alter_cavesystem_length	2022-03-05 04:10:36.451802+00
25	database	0007_alter_cave_length_alter_cavesystem_length	2022-03-05 12:50:58.520137+00
26	database	0008_cave_slug_cavesystem_slug_club_slug_country_slug_and_more	2022-03-05 14:23:10.032116+00
27	database	0009_alter_cave_slug_alter_cavesystem_slug_and_more	2022-03-05 14:30:41.776327+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: cavedb
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
y6ngxno58dn8gh8hik1ghn8mc8gvsv2s	.eJxVjDsOwjAQBe_iGlna-AslPWew1t41DiBbipMKcXccKQW0b2beWwTc1hK2zkuYSVwEiNPvFjE9ue6AHljvTaZW12WOclfkQbu8NeLX9XD_Dgr2MuoUwZE9aw0ua0aYjM-EaKLmKeaknM6slM8MbGwa1HlAymi1c6OI4vMF-Ho4cg:1nQKoG:MIdUx3ZlIvahaIZJM2nVkSIGPSm-Xer371hY6DgUhjM	2022-03-19 03:10:20.042184+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: database_cave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.database_cave_id_seq', 31, true);


--
-- Name: database_cavesystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.database_cavesystem_id_seq', 4, true);


--
-- Name: database_club_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.database_club_id_seq', 2, true);


--
-- Name: database_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.database_country_id_seq', 1, true);


--
-- Name: database_organisation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.database_organisation_id_seq', 2, true);


--
-- Name: database_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.database_region_id_seq', 3, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 105, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cavedb
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: database_cave database_cave_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cave
    ADD CONSTRAINT database_cave_pkey PRIMARY KEY (id);


--
-- Name: database_cave database_cave_slug_5f0bd621_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cave
    ADD CONSTRAINT database_cave_slug_5f0bd621_uniq UNIQUE (slug);


--
-- Name: database_cavesystem database_cavesystem_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cavesystem
    ADD CONSTRAINT database_cavesystem_pkey PRIMARY KEY (id);


--
-- Name: database_cavesystem database_cavesystem_slug_59958e12_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cavesystem
    ADD CONSTRAINT database_cavesystem_slug_59958e12_uniq UNIQUE (slug);


--
-- Name: database_club database_club_name_key; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_club
    ADD CONSTRAINT database_club_name_key UNIQUE (name);


--
-- Name: database_club database_club_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_club
    ADD CONSTRAINT database_club_pkey PRIMARY KEY (id);


--
-- Name: database_club database_club_slug_35d62893_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_club
    ADD CONSTRAINT database_club_slug_35d62893_uniq UNIQUE (slug);


--
-- Name: database_country database_country_name_key; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_country
    ADD CONSTRAINT database_country_name_key UNIQUE (name);


--
-- Name: database_country database_country_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_country
    ADD CONSTRAINT database_country_pkey PRIMARY KEY (id);


--
-- Name: database_country database_country_slug_97b6a999_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_country
    ADD CONSTRAINT database_country_slug_97b6a999_uniq UNIQUE (slug);


--
-- Name: database_organisation database_organisation_name_key; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_organisation
    ADD CONSTRAINT database_organisation_name_key UNIQUE (name);


--
-- Name: database_organisation database_organisation_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_organisation
    ADD CONSTRAINT database_organisation_pkey PRIMARY KEY (id);


--
-- Name: database_organisation database_organisation_slug_f3da4d41_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_organisation
    ADD CONSTRAINT database_organisation_slug_f3da4d41_uniq UNIQUE (slug);


--
-- Name: database_region database_region_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_region
    ADD CONSTRAINT database_region_pkey PRIMARY KEY (id);


--
-- Name: database_region database_region_slug_0da35194_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_region
    ADD CONSTRAINT database_region_slug_0da35194_uniq UNIQUE (slug);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: database_cave_organisation_id_e94df3b6; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cave_organisation_id_e94df3b6 ON public.database_cave USING btree (organisation_id);


--
-- Name: database_cave_region_id_77019509; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cave_region_id_77019509 ON public.database_cave USING btree (region_id);


--
-- Name: database_cave_slug_5f0bd621_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cave_slug_5f0bd621_like ON public.database_cave USING btree (slug varchar_pattern_ops);


--
-- Name: database_cave_system_id_5c995d09; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cave_system_id_5c995d09 ON public.database_cave USING btree (system_id);


--
-- Name: database_cavesystem_organisation_id_09e882bf; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cavesystem_organisation_id_09e882bf ON public.database_cavesystem USING btree (organisation_id);


--
-- Name: database_cavesystem_region_id_078f4032; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cavesystem_region_id_078f4032 ON public.database_cavesystem USING btree (region_id);


--
-- Name: database_cavesystem_slug_59958e12_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_cavesystem_slug_59958e12_like ON public.database_cavesystem USING btree (slug varchar_pattern_ops);


--
-- Name: database_club_country_id_6dffb3f5; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_club_country_id_6dffb3f5 ON public.database_club USING btree (country_id);


--
-- Name: database_club_name_ddd23c0d_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_club_name_ddd23c0d_like ON public.database_club USING btree (name varchar_pattern_ops);


--
-- Name: database_club_region_id_f7b3720b; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_club_region_id_f7b3720b ON public.database_club USING btree (region_id);


--
-- Name: database_club_slug_35d62893_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_club_slug_35d62893_like ON public.database_club USING btree (slug varchar_pattern_ops);


--
-- Name: database_country_name_c3f402b6_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_country_name_c3f402b6_like ON public.database_country USING btree (name varchar_pattern_ops);


--
-- Name: database_country_slug_97b6a999_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_country_slug_97b6a999_like ON public.database_country USING btree (slug varchar_pattern_ops);


--
-- Name: database_organisation_country_id_539f4661; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_organisation_country_id_539f4661 ON public.database_organisation USING btree (country_id);


--
-- Name: database_organisation_name_303ccab1_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_organisation_name_303ccab1_like ON public.database_organisation USING btree (name varchar_pattern_ops);


--
-- Name: database_organisation_region_id_9cd46539; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_organisation_region_id_9cd46539 ON public.database_organisation USING btree (region_id);


--
-- Name: database_organisation_slug_f3da4d41_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_organisation_slug_f3da4d41_like ON public.database_organisation USING btree (slug varchar_pattern_ops);


--
-- Name: database_region_country_id_908fac07; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_region_country_id_908fac07 ON public.database_region USING btree (country_id);


--
-- Name: database_region_slug_0da35194_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX database_region_slug_0da35194_like ON public.database_region USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: cavedb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_cave database_cave_organisation_id_e94df3b6_fk_database_; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cave
    ADD CONSTRAINT database_cave_organisation_id_e94df3b6_fk_database_ FOREIGN KEY (organisation_id) REFERENCES public.database_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_cave database_cave_region_id_77019509_fk_database_region_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cave
    ADD CONSTRAINT database_cave_region_id_77019509_fk_database_region_id FOREIGN KEY (region_id) REFERENCES public.database_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_cave database_cave_system_id_5c995d09_fk_database_cavesystem_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cave
    ADD CONSTRAINT database_cave_system_id_5c995d09_fk_database_cavesystem_id FOREIGN KEY (system_id) REFERENCES public.database_cavesystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_cavesystem database_cavesystem_organisation_id_09e882bf_fk_database_; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cavesystem
    ADD CONSTRAINT database_cavesystem_organisation_id_09e882bf_fk_database_ FOREIGN KEY (organisation_id) REFERENCES public.database_organisation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_cavesystem database_cavesystem_region_id_078f4032_fk_database_region_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_cavesystem
    ADD CONSTRAINT database_cavesystem_region_id_078f4032_fk_database_region_id FOREIGN KEY (region_id) REFERENCES public.database_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_club database_club_country_id_6dffb3f5_fk_database_country_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_club
    ADD CONSTRAINT database_club_country_id_6dffb3f5_fk_database_country_id FOREIGN KEY (country_id) REFERENCES public.database_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_club database_club_region_id_f7b3720b_fk_database_region_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_club
    ADD CONSTRAINT database_club_region_id_f7b3720b_fk_database_region_id FOREIGN KEY (region_id) REFERENCES public.database_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_organisation database_organisatio_country_id_539f4661_fk_database_; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_organisation
    ADD CONSTRAINT database_organisatio_country_id_539f4661_fk_database_ FOREIGN KEY (country_id) REFERENCES public.database_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_organisation database_organisation_region_id_9cd46539_fk_database_region_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_organisation
    ADD CONSTRAINT database_organisation_region_id_9cd46539_fk_database_region_id FOREIGN KEY (region_id) REFERENCES public.database_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: database_region database_region_country_id_908fac07_fk_database_country_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.database_region
    ADD CONSTRAINT database_region_country_id_908fac07_fk_database_country_id FOREIGN KEY (country_id) REFERENCES public.database_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: cavedb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: cavedb
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO cavedb;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: cavedb
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--
