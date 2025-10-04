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
    name character varying(30) NOT NULL,
    galaxy_types character varying(40) NOT NULL,
    distance_from_earth_in_million_ly numeric(12,4),
    age_in_millions_of_year integer
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
-- Name: galaxy_star_planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star_planet_moon (
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    galaxy_star_planet_moon_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_star_planet_moon OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq OWNED BY public.galaxy_star_planet_moon.galaxy_star_planet_moon_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    moon_types character varying(20) NOT NULL,
    is_moon_spherical boolean,
    moon_area_in_km2 integer,
    planet_id integer,
    description_of_moon text
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
    name character varying(20) NOT NULL,
    planet_type text NOT NULL,
    planet_radius_in_ro numeric(10,2),
    planet_mass_in_mo numeric(10,2),
    planet_orbital_period_in_days numeric(10,2),
    planet_has_life boolean,
    star_id integer
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
    name character varying(20) NOT NULL,
    star_type character varying(20) NOT NULL,
    star_mass_in_mo numeric(10,2),
    star_radius_in_ro numeric(10,2),
    galaxy_id integer
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
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon ALTER COLUMN galaxy_star_planet_moon_id SET DEFAULT nextval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.0000, 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537.0000, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000.0000, 12000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 31.0000, 13000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'Elliptical', 53500.0000, 13000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 0.1630, 13500);


--
-- Data for Name: galaxy_star_planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star_planet_moon VALUES (1, 1, 1, 1, 1, 'link_1');
INSERT INTO public.galaxy_star_planet_moon VALUES (2, 2, 2, 2, 2, 'link_2');
INSERT INTO public.galaxy_star_planet_moon VALUES (3, 3, 3, 3, 3, 'link_3');
INSERT INTO public.galaxy_star_planet_moon VALUES (4, 4, 4, 4, 4, 'link3');
INSERT INTO public.galaxy_star_planet_moon VALUES (5, 5, 5, 5, 5, 'link_5');
INSERT INTO public.galaxy_star_planet_moon VALUES (6, 6, 6, 6, 6, 'link_6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural', true, 37936694, 1, 'Earth''s only natural satellite; affects tides.');
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural', false, 1550, 2, 'Small irregular moon orbiting Mars closely.');
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural', false, 495, 2, 'Outer and smaller Martian moon, rocky and irregular.');
INSERT INTO public.moon VALUES (4, 'Europa', 'Icy', true, 30900000, 8, 'Icy surface with possible subsurface ocean.');
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Icy', true, 87000000, 8, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (6, 'Callisto', 'Icy', true, 73000000, 8, 'Ancient, heavily cratered surface.');
INSERT INTO public.moon VALUES (7, 'Io', 'Volcanic', true, 41000000, 8, 'Most volcanically active body in the Solar System.');
INSERT INTO public.moon VALUES (8, 'Titan', 'Icy', true, 83000000, 9, 'Thick atmosphere and methane lakes.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy', true, 8000000, 9, 'Geysers eject water into space.');
INSERT INTO public.moon VALUES (10, 'Rhea', 'Icy', true, 15000000, 9, 'Second-largest moon of Saturn, icy and reflective.');
INSERT INTO public.moon VALUES (11, 'Dione', 'Icy', true, 11000000, 9, 'Features ice cliffs and smooth plains.');
INSERT INTO public.moon VALUES (12, 'Vega I', 'Artificial', false, 120000, 6, 'Artificial satellite built by an advanced species.');
INSERT INTO public.moon VALUES (13, 'Vega II', 'Artificial', false, 150000, 6, 'Companion moon orbiting Vega b.');
INSERT INTO public.moon VALUES (14, 'Kepler-22b-1', 'Natural', false, 4200000, 7, 'Small rocky moon orbiting Kepler-22b.');
INSERT INTO public.moon VALUES (15, 'Kepler-22b-2', 'Icy', false, 5100000, 7, 'Frozen moon with thin atmosphere.');
INSERT INTO public.moon VALUES (16, 'Gliese-581g-1', 'Natural', false, 3500000, 10, 'Moon with potential subsurface ice.');
INSERT INTO public.moon VALUES (17, 'Gliese-581g-2', 'Artificial', false, 2800000, 10, 'Constructed observation moon.');
INSERT INTO public.moon VALUES (18, 'Andromeda-b-1', 'Natural', true, 10000000, 11, 'Large natural moon in Andromeda system.');
INSERT INTO public.moon VALUES (19, 'Andromeda-b-2', 'Natural', false, 8900000, 11, 'Smaller rocky moon orbiting Andromeda-b.');
INSERT INTO public.moon VALUES (20, 'Sirius Ab-1', 'Gas Moon', true, 12000000, 5, 'Gaseous moon orbiting the giant Sirius Ab.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1.00, 1.00, 365.00, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0.53, 0.11, 687.00, false, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'Terrestrial', 1.10, 1.30, 11.20, false, 2);
INSERT INTO public.planet VALUES (4, 'Alpha Cen Bb', 'Terrestrial', 1.20, 1.10, 3.24, false, 3);
INSERT INTO public.planet VALUES (5, 'Sirius Ab', 'Gas Giant', 11.20, 317.80, 4332.00, false, 5);
INSERT INTO public.planet VALUES (6, 'Vega b', 'Gas Giant', 10.50, 300.00, 5200.00, false, 6);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 'Super-Earth', 2.40, 6.40, 289.00, false, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Gas Giant', 11.20, 317.80, 4332.00, false, 1);
INSERT INTO public.planet VALUES (9, 'Saturn', 'Gas Giant', 9.40, 95.20, 10759.00, false, 1);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Super-Earth', 1.50, 3.10, 37.00, false, 2);
INSERT INTO public.planet VALUES (11, 'Andromeda b', 'Gas Giant', 12.00, 400.00, 6000.00, false, 4);
INSERT INTO public.planet VALUES (12, 'Vega c', 'Terrestrial', 0.90, 0.80, 4200.00, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1.00, 1.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-type', 0.12, 0.15, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-type', 1.10, 1.20, 1);
INSERT INTO public.star VALUES (4, 'Andromeda Star 1', 'O-type', 15.00, 6.00, 2);
INSERT INTO public.star VALUES (5, 'Sirius A', 'A-type', 2.10, 1.70, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A-type', 2.30, 2.36, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_planet_moon_galaxy_star_planet_moon_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_pkey PRIMARY KEY (galaxy_star_planet_moon_id);


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
-- Name: galaxy_star_planet_moon unique_galaxy_star_planet_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT unique_galaxy_star_planet_moon UNIQUE (name);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_star_planet_moon galaxy_star_planet_moon_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star_planet_moon
    ADD CONSTRAINT galaxy_star_planet_moon_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

