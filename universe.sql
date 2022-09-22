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
    description character varying(255),
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    number_of_stars integer,
    name character varying(255) NOT NULL
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
    is_only boolean,
    planet_id integer NOT NULL,
    description text,
    name character varying(255) NOT NULL
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
    age_in_millions_of_years integer,
    distance_from_earth integer,
    star_id integer NOT NULL,
    description text,
    name character varying(255) NOT NULL,
    planet_sizes_id integer NOT NULL
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
-- Name: planet_sizes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_sizes (
    description character varying(255),
    size_in_km numeric(12,2) NOT NULL,
    planet_sizes_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.planet_sizes OWNER TO freecodecamp;

--
-- Name: planet_sizes_size_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_sizes_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_sizes_size_id_seq OWNER TO freecodecamp;

--
-- Name: planet_sizes_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_sizes_size_id_seq OWNED BY public.planet_sizes.planet_sizes_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    name character varying(255) NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_sizes planet_sizes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_sizes ALTER COLUMN planet_sizes_id SET DEFAULT nextval('public.planet_sizes_size_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'ITS GALAXY 1', true, 12, 100, 28282, 'GALAXY 1');
INSERT INTO public.galaxy VALUES (2, 'ITS GALAXY ', false, 122, 1100, 284282, 'GALAXY 2');
INSERT INTO public.galaxy VALUES (4, 'ITS GALAXY 3', false, 126312, 123600, 282, 'GALAXY 3');
INSERT INTO public.galaxy VALUES (3, 'TO GALAKTYKA 4', false, 912, 23512, 523623, 'GALAKTYKA 4');
INSERT INTO public.galaxy VALUES (6, 'TO GALAKTYKA 5', true, 912312, 238562, 12323, 'GALAKTYKA 5');
INSERT INTO public.galaxy VALUES (5, 'TO GALAKTYKA 6', true, 2312, 2382, 323, 'GALAKTYKA 6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, 1, 'a', 'a');
INSERT INTO public.moon VALUES (2, true, 2, 'ab', 'ab');
INSERT INTO public.moon VALUES (3, true, 3, 'abd', 'abc');
INSERT INTO public.moon VALUES (4, true, 4, 'abcd', 'abcq');
INSERT INTO public.moon VALUES (5, true, 5, 'abcdf', 'abcqe');
INSERT INTO public.moon VALUES (6, true, 6, 'abcdqf', 'abcqeq');
INSERT INTO public.moon VALUES (7, true, 6, 'abcdqf', 'abcqeqq');
INSERT INTO public.moon VALUES (8, true, 6, 'abcdqf', 'abcqeqqs');
INSERT INTO public.moon VALUES (9, true, 6, 'abcdqf', 'abcqeqqsv');
INSERT INTO public.moon VALUES (10, true, 6, 'abcdqf', 'abcqeqqsvb');
INSERT INTO public.moon VALUES (11, true, 6, 'abcdqf', 'abcqeqqsvtb');
INSERT INTO public.moon VALUES (12, true, 6, 'abcdqf', 'abcqeqqxasvtb');
INSERT INTO public.moon VALUES (13, true, 6, 'abcdqf', 'abcqeqqxasvtbsab');
INSERT INTO public.moon VALUES (14, true, 6, 'abcdqf', 'absdcqeqqxasvtbsab');
INSERT INTO public.moon VALUES (15, true, 6, 'abcdqf', 'absdcqeqqxasvtbsabx');
INSERT INTO public.moon VALUES (16, true, 6, 'abcdqf', 'absdcqeqqxasvtbsabxqwe');
INSERT INTO public.moon VALUES (17, true, 6, 'abcdqf', 'absdcqeqqxasvtbsabxqweqdf');
INSERT INTO public.moon VALUES (18, true, 6, 'abcdqf', 'sabxqweqdf');
INSERT INTO public.moon VALUES (19, true, 6, 'abcdqf', 'sabxqweqdfq');
INSERT INTO public.moon VALUES (20, true, 6, 'abcdqf', 'sabxqweqdfqs');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 1, 1, 'to planeta nr 1', 'planeta 1', 1);
INSERT INTO public.planet VALUES (2, 2, 2, 2, 'to planeta nr 2', 'planeta 2', 2);
INSERT INTO public.planet VALUES (3, 3, 3, 3, 'to planeta nr 3', 'planeta 3', 3);
INSERT INTO public.planet VALUES (4, 4, 4, 4, 'to planeta nr 4', 'planeta 4', 1);
INSERT INTO public.planet VALUES (5, 5, 5, 5, 'to planeta nr 5', 'planeta 5', 2);
INSERT INTO public.planet VALUES (6, 4, 4, 4, 'to planeta anr 4', 'plansdeta 4', 1);
INSERT INTO public.planet VALUES (7, 4, 4, 4, 'to plaaneta anr 4', 'plansddsdeta 4', 2);
INSERT INTO public.planet VALUES (8, 4, 4, 4, 'to plaaneta anr 41', 'plansddsdeta 45', 2);
INSERT INTO public.planet VALUES (9, 4, 4, 4, 'to plaanetda anr 41', 'plansdsddsdeta 45', 2);
INSERT INTO public.planet VALUES (10, 4, 4, 4, 'to plaanetda anr 41', 'plansdsdddsdeta 45', 3);
INSERT INTO public.planet VALUES (114, 4, 4, 4, 'to planetsxa nr 4', 'planexta 4', 1);
INSERT INTO public.planet VALUES (12, 4, 4, 4, 'to planetssxa nr 4', 'planexxta 4', 1);


--
-- Data for Name: planet_sizes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_sizes VALUES ('rozmiar 1', 100.52, 1, NULL);
INSERT INTO public.planet_sizes VALUES ('rozmiar 2', 5100.52, 2, NULL);
INSERT INTO public.planet_sizes VALUES ('rozmiar 3', 125100.20, 3, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'to ksiezyc 1', 1, 1, 'ksiezyc 1');
INSERT INTO public.star VALUES (2, 2, 'to ksiezyc 12', 12, 12, 'ksiezyc 2');
INSERT INTO public.star VALUES (3, 3, 'to ksiezyc 123', 123, 123, 'ksiezyc 3');
INSERT INTO public.star VALUES (4, 4, 'to ksiezyc 1234', 1234, 1234, 'ksiezyc 4');
INSERT INTO public.star VALUES (5, 5, 'to ksiezyc 12345', 12345, 12345, 'ksiezyc 5');
INSERT INTO public.star VALUES (6, 6, 'to ksiezyc 123456', 123456, 123456, 'ksiezyc 6');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_sizes_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_sizes_size_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: planet_sizes planet_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_sizes
    ADD CONSTRAINT planet_sizes_pkey PRIMARY KEY (planet_sizes_id);


--
-- Name: planet_sizes planet_sizes_size_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_sizes
    ADD CONSTRAINT planet_sizes_size_id_key UNIQUE (planet_sizes_id);


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
-- Name: planet planet_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_size_id_fkey FOREIGN KEY (planet_sizes_id) REFERENCES public.planet_sizes(planet_sizes_id);


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

