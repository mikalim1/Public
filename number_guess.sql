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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    gameid integer NOT NULL,
    userid integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_gameid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_gameid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_gameid_seq OWNER TO freecodecamp;

--
-- Name: games_gameid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_gameid_seq OWNED BY public.games.gameid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO freecodecamp;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: games gameid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN gameid SET DEFAULT nextval('public.games_gameid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (27, 12, 100);
INSERT INTO public.games VALUES (28, 12, 993);
INSERT INTO public.games VALUES (29, 13, 106);
INSERT INTO public.games VALUES (30, 13, 762);
INSERT INTO public.games VALUES (31, 12, 333);
INSERT INTO public.games VALUES (32, 12, 215);
INSERT INTO public.games VALUES (33, 12, 818);
INSERT INTO public.games VALUES (34, 14, 1);
INSERT INTO public.games VALUES (35, 14, 1);
INSERT INTO public.games VALUES (36, 14, 2);
INSERT INTO public.games VALUES (37, 15, 996);
INSERT INTO public.games VALUES (38, 15, 975);
INSERT INTO public.games VALUES (39, 16, 742);
INSERT INTO public.games VALUES (40, 16, 513);
INSERT INTO public.games VALUES (41, 15, 618);
INSERT INTO public.games VALUES (42, 15, 978);
INSERT INTO public.games VALUES (43, 15, 799);
INSERT INTO public.games VALUES (44, 17, 136);
INSERT INTO public.games VALUES (45, 17, 496);
INSERT INTO public.games VALUES (46, 18, 261);
INSERT INTO public.games VALUES (47, 18, 579);
INSERT INTO public.games VALUES (48, 17, 188);
INSERT INTO public.games VALUES (49, 17, 243);
INSERT INTO public.games VALUES (50, 17, 222);
INSERT INTO public.games VALUES (51, 14, 2);
INSERT INTO public.games VALUES (52, 19, 243);
INSERT INTO public.games VALUES (53, 19, 758);
INSERT INTO public.games VALUES (54, 20, 108);
INSERT INTO public.games VALUES (55, 20, 981);
INSERT INTO public.games VALUES (56, 19, 303);
INSERT INTO public.games VALUES (57, 19, 784);
INSERT INTO public.games VALUES (58, 19, 938);
INSERT INTO public.games VALUES (59, 21, 261);
INSERT INTO public.games VALUES (60, 21, 400);
INSERT INTO public.games VALUES (61, 22, 359);
INSERT INTO public.games VALUES (62, 22, 530);
INSERT INTO public.games VALUES (63, 21, 299);
INSERT INTO public.games VALUES (64, 21, 110);
INSERT INTO public.games VALUES (65, 21, 632);
INSERT INTO public.games VALUES (66, 14, 1);
INSERT INTO public.games VALUES (67, 23, 748);
INSERT INTO public.games VALUES (68, 23, 436);
INSERT INTO public.games VALUES (69, 24, 350);
INSERT INTO public.games VALUES (70, 24, 962);
INSERT INTO public.games VALUES (71, 23, 695);
INSERT INTO public.games VALUES (72, 23, 836);
INSERT INTO public.games VALUES (73, 23, 233);
INSERT INTO public.games VALUES (74, 25, 302);
INSERT INTO public.games VALUES (75, 25, 787);
INSERT INTO public.games VALUES (76, 26, 655);
INSERT INTO public.games VALUES (77, 26, 950);
INSERT INTO public.games VALUES (78, 25, 108);
INSERT INTO public.games VALUES (79, 25, 999);
INSERT INTO public.games VALUES (80, 25, 299);
INSERT INTO public.games VALUES (81, 27, 439);
INSERT INTO public.games VALUES (82, 27, 611);
INSERT INTO public.games VALUES (83, 28, 789);
INSERT INTO public.games VALUES (84, 28, 687);
INSERT INTO public.games VALUES (85, 27, 162);
INSERT INTO public.games VALUES (86, 27, 655);
INSERT INTO public.games VALUES (87, 27, 823);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (12, 'user_1775299229042');
INSERT INTO public.users VALUES (13, 'user_1775299229041');
INSERT INTO public.users VALUES (14, 'bob');
INSERT INTO public.users VALUES (15, 'user_1775300188159');
INSERT INTO public.users VALUES (16, 'user_1775300188158');
INSERT INTO public.users VALUES (17, 'user_1775300287564');
INSERT INTO public.users VALUES (18, 'user_1775300287563');
INSERT INTO public.users VALUES (19, 'user_1775300374179');
INSERT INTO public.users VALUES (20, 'user_1775300374178');
INSERT INTO public.users VALUES (21, 'user_1775300410202');
INSERT INTO public.users VALUES (22, 'user_1775300410201');
INSERT INTO public.users VALUES (23, 'user_1775300637443');
INSERT INTO public.users VALUES (24, 'user_1775300637442');
INSERT INTO public.users VALUES (25, 'user_1775300705627');
INSERT INTO public.users VALUES (26, 'user_1775300705626');
INSERT INTO public.users VALUES (27, 'user_1775300772182');
INSERT INTO public.users VALUES (28, 'user_1775300772181');


--
-- Name: games_gameid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_gameid_seq', 87, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_userid_seq', 28, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (gameid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- PostgreSQL database dump complete
--

