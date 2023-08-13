--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: dog_hire_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.dog_hire_status AS ENUM (
    'de_ferias',
    'inativo',
    'ativo'
);


--
-- Name: doguito_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.doguito_status AS ENUM (
    'ativo',
    'inativo',
    'de_ferias'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dog_hires; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dog_hires (
    id integer NOT NULL,
    dog_id integer,
    user_id integer,
    hire_date timestamp without time zone,
    hire_status public.dog_hire_status,
    created_at timestamp without time zone
);


--
-- Name: dog_hires_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dog_hires_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dog_hires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dog_hires_id_seq OWNED BY public.dog_hires.id;


--
-- Name: dog_photos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dog_photos (
    id integer NOT NULL,
    dog_id integer,
    photo_url text
);


--
-- Name: dog_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dog_photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dog_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dog_photos_id_seq OWNED BY public.dog_photos.id;


--
-- Name: doguitos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.doguitos (
    id integer NOT NULL,
    name text,
    photo_url text,
    characteristics text,
    contact_info character varying(255),
    active public.doguito_status,
    owner_id integer,
    hourly_rate numeric(10,2),
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: doguitos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.doguitos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: doguitos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.doguitos_id_seq OWNED BY public.doguitos.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    token_id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: tokens_token_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_token_id_seq OWNED BY public.tokens.token_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    cpf character varying(14),
    phone character varying(20),
    email character varying(255),
    password character varying(255),
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: dog_hires id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_hires ALTER COLUMN id SET DEFAULT nextval('public.dog_hires_id_seq'::regclass);


--
-- Name: dog_photos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_photos ALTER COLUMN id SET DEFAULT nextval('public.dog_photos_id_seq'::regclass);


--
-- Name: doguitos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doguitos ALTER COLUMN id SET DEFAULT nextval('public.doguitos_id_seq'::regclass);


--
-- Name: tokens token_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN token_id SET DEFAULT nextval('public.tokens_token_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: dog_hires; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dog_hires VALUES (1, 1, 1, '2023-08-12 00:00:00', 'de_ferias', '2023-08-12 18:22:46.163384');


--
-- Data for Name: dog_photos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dog_photos VALUES (1, 1, 'url_da_foto_do_doguito');


--
-- Data for Name: doguitos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.doguitos VALUES (1, 'Nome do Doguito', 'url_da_foto', 'Características do Doguito', 'Informações de Contato', 'ativo', 1, 10.00, '2023-08-12 18:22:27.10827');
INSERT INTO public.doguitos VALUES (2, 'cachorro comunista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, NULL);
INSERT INTO public.doguitos VALUES (3, 'cachorro comunista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, NULL);
INSERT INTO public.doguitos VALUES (4, 'cachorro ccapitalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, NULL);
INSERT INTO public.doguitos VALUES (5, 'cachorro anarquista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, NULL);
INSERT INTO public.doguitos VALUES (6, 'cachorro malabaristaista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, NULL);
INSERT INTO public.doguitos VALUES (7, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, NULL);
INSERT INTO public.doguitos VALUES (8, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 02:35:17.025482');
INSERT INTO public.doguitos VALUES (9, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 02:40:18.827392');
INSERT INTO public.doguitos VALUES (10, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:06:38.13357');
INSERT INTO public.doguitos VALUES (11, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:08:24.895836');
INSERT INTO public.doguitos VALUES (12, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:12:53.974237');
INSERT INTO public.doguitos VALUES (13, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:14:37.358584');
INSERT INTO public.doguitos VALUES (14, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:16:05.933708');
INSERT INTO public.doguitos VALUES (15, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:16:53.782934');
INSERT INTO public.doguitos VALUES (16, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:25:50.525724');
INSERT INTO public.doguitos VALUES (17, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:26:15.000021');
INSERT INTO public.doguitos VALUES (18, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:29:01.727842');
INSERT INTO public.doguitos VALUES (19, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:31:48.146216');
INSERT INTO public.doguitos VALUES (20, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:44:09.210349');
INSERT INTO public.doguitos VALUES (21, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:44:11.741429');
INSERT INTO public.doguitos VALUES (22, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:47:36.502612');
INSERT INTO public.doguitos VALUES (23, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:48:38.722677');
INSERT INTO public.doguitos VALUES (24, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:50:19.157389');
INSERT INTO public.doguitos VALUES (25, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:50:21.635713');
INSERT INTO public.doguitos VALUES (26, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:53:59.235687');
INSERT INTO public.doguitos VALUES (27, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:01.247658');
INSERT INTO public.doguitos VALUES (28, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:01.571606');
INSERT INTO public.doguitos VALUES (29, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:01.784997');
INSERT INTO public.doguitos VALUES (30, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:01.969213');
INSERT INTO public.doguitos VALUES (31, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:02.150577');
INSERT INTO public.doguitos VALUES (32, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:02.315523');
INSERT INTO public.doguitos VALUES (33, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:02.503091');
INSERT INTO public.doguitos VALUES (34, 'cachorro generalista', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'ativo', NULL, 10.40, '2023-08-13 03:54:02.694008');
INSERT INTO public.doguitos VALUES (36, 'cachorro pica-pau', 'https://img.freepik.com/fotos-gratis/close-up-em-lindo-cachorro-basse_23-2149202574.jpg?w=1380&t=st=1691896769~exp=1691897369~hmac=2fb3a55e26f19db76486a8fb58462287492389d039b86d84c385e90f0abf0d3c', 'linda cachorro caramelow de raca mas [e bem russo e brabo', 'favor ligarr para o numero 000000', 'de_ferias', 8, 10.40, '2023-08-13 04:02:25.616572');


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (1, NULL, 'ee158656-c853-4cff-9dc0-5a57b7929be7', '2023-08-12 20:18:04.154283');
INSERT INTO public.tokens VALUES (2, NULL, '9c3c33e2-b559-4dd5-9000-d411c9c885e8', '2023-08-12 20:20:29.799264');
INSERT INTO public.tokens VALUES (3, NULL, 'f9dfe8ef-7584-4e16-a68e-c7d4ad31e9ae', '2023-08-13 00:21:52.178825');
INSERT INTO public.tokens VALUES (4, NULL, '6057a0d0-8aa0-4668-8c39-6985d54ef77d', '2023-08-13 00:22:22.063822');
INSERT INTO public.tokens VALUES (5, NULL, '46dfe124-ce98-4038-b36c-fd1d4e42c38c', '2023-08-13 00:22:32.765279');
INSERT INTO public.tokens VALUES (6, NULL, 'a6efb2f0-bb43-4ad6-83db-500e7367ee40', '2023-08-13 00:22:40.587961');
INSERT INTO public.tokens VALUES (7, NULL, '23547b7d-148c-4828-a9cf-bbfcd816a70f', '2023-08-13 00:23:52.795275');
INSERT INTO public.tokens VALUES (8, NULL, 'a383036b-d373-4fcb-a15f-f3d0aed954b4', '2023-08-13 00:28:35.30433');
INSERT INTO public.tokens VALUES (9, NULL, '0d2e39d5-cafa-4c2e-994c-f37feefc89fa', '2023-08-13 00:33:04.896596');
INSERT INTO public.tokens VALUES (10, NULL, '890550eb-591e-4560-9b4b-a04f1a791994', '2023-08-13 00:35:04.543089');
INSERT INTO public.tokens VALUES (11, NULL, '49c6b39d-e7f8-4339-98ff-2e0ff3f8b45b', '2023-08-13 00:35:05.51347');
INSERT INTO public.tokens VALUES (12, NULL, 'c149b189-244d-468b-ae36-132a78456eb6', '2023-08-13 00:38:44.092505');
INSERT INTO public.tokens VALUES (13, NULL, 'c8f0ca55-fd91-4036-9d36-8518cf5cac4e', '2023-08-13 00:41:55.997151');
INSERT INTO public.tokens VALUES (14, NULL, 'dd843ce6-b086-44e0-b923-feec18805716', '2023-08-13 00:56:05.206403');
INSERT INTO public.tokens VALUES (15, NULL, '1963123a-e1fc-4d2e-9c24-36d2da1f28a1', '2023-08-13 01:00:13.750712');
INSERT INTO public.tokens VALUES (16, NULL, '50377726-524e-4c5b-a9ac-596a1746c584', '2023-08-13 01:00:30.307387');
INSERT INTO public.tokens VALUES (17, NULL, '27416090-0d7a-44ff-8d2c-92d335e6e633', '2023-08-13 01:02:49.162667');
INSERT INTO public.tokens VALUES (18, NULL, '7c0aee1d-a41a-4f2e-8a09-6568354916f1', '2023-08-13 01:02:56.697535');
INSERT INTO public.tokens VALUES (19, NULL, '22721b21-1878-4110-b814-2467c85cbd05', '2023-08-13 01:35:44.906327');
INSERT INTO public.tokens VALUES (20, NULL, 'a9568613-d595-46c7-9e2b-00a43ccd8089', '2023-08-13 01:36:22.455643');
INSERT INTO public.tokens VALUES (21, NULL, 'fb4e5641-ad6f-4265-ac20-246c530ea608', '2023-08-13 01:36:22.976938');
INSERT INTO public.tokens VALUES (22, NULL, '943fcc4b-4e17-40dc-8df1-780885773111', '2023-08-13 01:36:23.20424');
INSERT INTO public.tokens VALUES (23, NULL, 'a50e1a5a-954e-4eee-9d65-5fcdcaea5793', '2023-08-13 01:38:49.318959');
INSERT INTO public.tokens VALUES (24, NULL, 'd48d3b80-2c3a-4bcc-80f8-1f542f434d96', '2023-08-13 01:41:52.713864');
INSERT INTO public.tokens VALUES (25, NULL, 'bef69528-5eb5-49e0-8a43-93d26fef0394', '2023-08-13 03:14:23.117692');
INSERT INTO public.tokens VALUES (26, NULL, '3a8f494b-8124-404f-94d6-cf0df054a004', '2023-08-13 03:15:34.4781');
INSERT INTO public.tokens VALUES (27, NULL, 'efd11caf-6362-4d20-b2de-d35eb2eb26fb', '2023-08-13 03:16:33.530909');
INSERT INTO public.tokens VALUES (28, NULL, 'cc6900d3-01f6-45d4-83b7-e1e219c96140', '2023-08-13 03:23:34.222308');
INSERT INTO public.tokens VALUES (29, NULL, '5c95a2e4-f7e9-4285-888a-032b461cb33a', '2023-08-13 03:24:32.232077');
INSERT INTO public.tokens VALUES (30, NULL, '4bb072be-80b2-4a61-a29f-64bfbca13fcd', '2023-08-13 03:28:04.365313');
INSERT INTO public.tokens VALUES (31, NULL, '57e96e4d-8a86-4faa-b7d9-612afa4e4ab0', '2023-08-13 03:28:05.473711');
INSERT INTO public.tokens VALUES (32, NULL, '4af5fbfc-aa59-4244-8e7c-8a1dae361b3c', '2023-08-13 03:28:06.089389');
INSERT INTO public.tokens VALUES (33, NULL, '26c0fa0f-8dda-4941-a8c4-cfae41056755', '2023-08-13 03:28:06.248126');
INSERT INTO public.tokens VALUES (34, NULL, '2447d28d-c8f3-4598-ae7e-f98319db414d', '2023-08-13 03:38:26.787684');
INSERT INTO public.tokens VALUES (35, NULL, 'aa1befeb-16bd-4bad-a845-d8d380113995', '2023-08-13 03:39:24.621421');
INSERT INTO public.tokens VALUES (36, 8, '8b96c1e7-fc29-4dae-8957-21144737f062', '2023-08-13 03:43:56.64777');
INSERT INTO public.tokens VALUES (37, 8, '6a715ba9-292c-43a8-b54c-dbac1d80f378', '2023-08-13 03:57:54.941295');
INSERT INTO public.tokens VALUES (38, 8, 'd2e9758b-18e0-43e6-bca2-70111392a61f', '2023-08-13 04:18:00.448857');
INSERT INTO public.tokens VALUES (39, 8, 'daba2f57-0854-4f31-9ffe-187a22038c73', '2023-08-13 04:48:08.868905');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'claudia', '02260270077', '53984693364', 'claudia@email.com', '12345', '2023-08-12 18:22:14.215891');
INSERT INTO public.users VALUES (2, 'claudia', NULL, NULL, 'maila@gmail.com', '$2b$10$34V5d/ZGzB3IAptlq7PwzunpsWtAFQDPI4ObHsJaTjO8ieMCp1K8C', NULL);
INSERT INTO public.users VALUES (3, 'claudiretrea', '0227dssd007770', 'sdkjfkds', 'mretetrela@gmail.com', '$2b$10$q8MTsTYzl7QNnRDKm/ch6O5KRFsNqxqr19Kg9VgooVJcUYgyzsfMC', NULL);
INSERT INTO public.users VALUES (4, 'claudiretrea', '0227007770', 'sdkjfkds', 'ma@gmail.com', '$2b$10$fvCGd7t8/jJ87BLgvdVuoucrsJ03Z5I/HWs7J/vOsauQMrRbgkny.', '2023-08-12 19:30:09.953276');
INSERT INTO public.users VALUES (5, 'claudiretrea', '022.700.777-70', '53 8467-0840', 'merewrwea@gmail.com', '$2b$10$h8/PFC/g7SXubpgx9gIdgeO09fMqYRcX0ZPc0T7gmg/Etyi1Ss7De', '2023-08-12 20:20:41.827514');
INSERT INTO public.users VALUES (8, 'papaya', '032.700.777-70', '53 9167-0840', 'papaya@gmail.com', '$2b$10$vhOrMnGvFlUH1NMqRgoDxuwxNuxMO2sK0rKf2XrjjXyNWt4wd6AHe', '2023-08-13 00:32:56.783115');


--
-- Name: dog_hires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dog_hires_id_seq', 1, true);


--
-- Name: dog_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dog_photos_id_seq', 1, true);


--
-- Name: doguitos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.doguitos_id_seq', 37, true);


--
-- Name: tokens_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_token_id_seq', 39, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: dog_hires dog_hires_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_hires
    ADD CONSTRAINT dog_hires_pkey PRIMARY KEY (id);


--
-- Name: dog_photos dog_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_photos
    ADD CONSTRAINT dog_photos_pkey PRIMARY KEY (id);


--
-- Name: doguitos doguitos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doguitos
    ADD CONSTRAINT doguitos_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (token_id);


--
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: dog_hires dog_hires_dog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_hires
    ADD CONSTRAINT dog_hires_dog_id_fkey FOREIGN KEY (dog_id) REFERENCES public.doguitos(id);


--
-- Name: dog_hires dog_hires_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_hires
    ADD CONSTRAINT dog_hires_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: dog_photos dog_photos_dog_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dog_photos
    ADD CONSTRAINT dog_photos_dog_id_fkey FOREIGN KEY (dog_id) REFERENCES public.doguitos(id);


--
-- Name: doguitos doguitos_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.doguitos
    ADD CONSTRAINT doguitos_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: tokens tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

