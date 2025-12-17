--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_km numeric(15,2),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer,
    distance_from_planet_in_km numeric(10,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km integer,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_billions_of_years numeric(10,2),
    diameter_in_light_years integer
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_id_seq OWNED BY public.universe.universe_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2500, 220000.00, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (2, 'Triangulum', 3000, 50000.00, 'Third largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 13600, 100000.00, 'Our galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 2000, 76000.00, 'Beautiful spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 2400, 50000.00, 'Notable for its prominent dust lane');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 2100, 170000.00, 'Face-on spiral galaxy');
INSERT INTO public.galaxy VALUES (7, 'Black Eye', 2500, 53000.00, 'Dark dust lane across its center');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9376.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 13, 23463.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 421700.00);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 671100.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1070400.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882600.00);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 396, 185520.00);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 237948.00);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1062, 294619.00);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1122, 377396.00);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, 527108.00);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 5150, 1222000.00);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, 3560820.00);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 471, 129390.00);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 1158, 191020.00);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 1169, 266300.00);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1578, 435910.00);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1523, 584700.00);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 354800.00);
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, 5513400.00);
INSERT INTO public.moon VALUES (22, 'Proteus', 8, 210, 117647.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 3879, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244, false, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 12000, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 24000, false, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 4, 11000, false, true);
INSERT INTO public.planet VALUES (12, 'Gliese 667c', 5, 14000, false, true);
INSERT INTO public.planet VALUES (13, 'Gliese 581d', 6, 15000, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 3, 237, 8.60);
INSERT INTO public.star VALUES (2, 'Canopus', 3, 8600, 310.00);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 3, 5800, 4.37);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 10, 700.00);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 8, 860.00);
INSERT INTO public.star VALUES (6, 'Vega', 3, 455, 25.04);
INSERT INTO public.star VALUES (7, 'Altair', 3, 1200, 16.73);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Observable Universe', 13.80, 930000000);
INSERT INTO public.universe VALUES (2, 'Local Universe', 10.00, 500000000);
INSERT INTO public.universe VALUES (3, 'Hubble Volume', 13.80, 93000000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: universe_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universe universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_name_key UNIQUE (name);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

