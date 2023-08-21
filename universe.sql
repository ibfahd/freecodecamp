--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    distance_ly integer,
    size_ly integer,
    redshift numeric(8,7),
    ascension numeric(8,4),
    declination numeric(8,4),
    magnitude numeric(8,4),
    notes text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    distance_au numeric(8,4),
    mass_em numeric(8,2),
    radius_er numeric(8,2),
    gravity numeric(8,2)
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    terrestrial boolean,
    distance_au numeric(8,4),
    mass_em numeric(8,2),
    radius_er numeric(8,2),
    gravity numeric(8,2)
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_mo numeric(8,2),
    temperature_k integer,
    luminosity_so numeric(8,4),
    binary_system boolean
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 100000, 0.0000000, 17.7611, -29.0078, -20.9000, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 220000, 0.0012000, 0.7122, 41.2692, 3.4400, 'Nearest spiral galaxy.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2730000, 60000, 0.0004500, 1.5642, 30.6597, 5.7200, 'Third-largest galaxy in Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 53500000, 120000, 0.0043600, 12.5138, 12.3911, 9.5900, 'Contains a supermassive black hole.');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic', 158200, 14000, 0.0000520, 5.3928, -69.7561, 0.9000, 'Satellite of Milky Way.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 29000000, 50000, 0.0039800, 12.8159, -11.7560, 8.9900, 'Known for its prominent dust lane.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 0.0026, 0.01, 0.27, 0.17);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.0000, 0.00, 0.01, 0.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.0000, 0.00, 0.00, 0.00);
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.0028, 0.02, 0.29, 0.18);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.0045, 0.01, 0.25, 0.13);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0.0072, 0.03, 0.41, 0.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.0126, 0.02, 0.38, 0.13);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 0.0082, 0.02, 0.40, 0.14);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 0.0016, 0.00, 0.03, 0.01);
INSERT INTO public.moon VALUES (10, 'Miranda', 7, 0.0000, 0.00, 0.04, 0.01);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 0.0024, 0.00, 0.21, 0.08);
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 0.0029, 0.00, 0.02, 0.00);
INSERT INTO public.moon VALUES (13, 'Charon', 9, 0.0013, 0.00, 0.16, 0.03);
INSERT INTO public.moon VALUES (14, 'Amalthea', 5, 0.0019, 0.00, 0.08, 0.01);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, 0.0000, 0.00, 0.14, 0.01);
INSERT INTO public.moon VALUES (16, 'Pandora', 6, 0.0000, 0.00, 0.02, 0.00);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, 0.0000, 0.00, 0.15, 0.03);
INSERT INTO public.moon VALUES (18, 'Rhea', 6, 0.0015, 0.02, 0.30, 0.27);
INSERT INTO public.moon VALUES (19, 'Dione', 6, 0.0025, 0.00, 0.23, 0.07);
INSERT INTO public.moon VALUES (20, 'Tethys', 6, 0.0020, 0.00, 0.19, 0.01);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 1);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 1);
INSERT INTO public.nebula VALUES (3, 'Eagle Nebula', 1);
INSERT INTO public.nebula VALUES (4, 'Andromeda Nebula', 2);
INSERT INTO public.nebula VALUES (5, 'Triangulum Nebula', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 1.0000, 1.00, 1.00, 1.00);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, true, 0.3900, 0.06, 0.38, 0.38);
INSERT INTO public.planet VALUES (3, 'Venus', 1, true, 0.7200, 0.82, 0.95, 0.91);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 1.5200, 0.11, 0.53, 0.38);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 5.2000, 317.83, 11.21, 2.36);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 9.5800, 95.16, 9.45, 0.92);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 19.1800, 14.54, 4.01, 0.89);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 30.0500, 17.15, 3.88, 1.12);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, true, 0.0500, 0.01, 0.94, 0.23);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 3, true, 0.1700, 2.34, 1.31, 1.09);
INSERT INTO public.planet VALUES (11, 'HAT-P-26b', 4, false, 0.0420, 0.09, 0.23, 0.90);
INSERT INTO public.planet VALUES (12, 'WASP-39b', 5, false, 0.0820, 0.22, 0.90, 0.64);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 5778, 1.0000, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 1.10, 5790, 1.5200, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 0.90, 5260, 0.5000, true);
INSERT INTO public.star VALUES (4, 'Andromeda Star 1', 2, 2.50, 9000, 5.4000, false);
INSERT INTO public.star VALUES (5, 'Triangulum Star 1', 3, 1.80, 7500, 3.2000, false);
INSERT INTO public.star VALUES (6, 'Sombrero Star', 6, 3.60, 6500, 8.9000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

