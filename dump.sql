--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.19
-- Dumped by pg_dump version 13.13 (Debian 13.13-0+deb11u1)

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
-- Name: projet; Type: SCHEMA; Schema: -; Owner: mariyaconsta02
--

CREATE SCHEMA projet;


ALTER SCHEMA projet OWNER TO mariyaconsta02;

SET default_tablespace = '';

--
-- Name: appartenir; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.appartenir (
    id_emp character varying(50) NOT NULL,
    num_service integer NOT NULL
);


ALTER TABLE projet.appartenir OWNER TO mariyaconsta02;

--
-- Name: article; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.article (
    nomart character varying(30) NOT NULL,
    nom_cat character varying(20) NOT NULL
);


ALTER TABLE projet.article OWNER TO mariyaconsta02;

--
-- Name: categorie; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.categorie (
    nom_cat character varying(20) NOT NULL
);


ALTER TABLE projet.categorie OWNER TO mariyaconsta02;

--
-- Name: client; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.client (
    codecli character(7) NOT NULL,
    nomcli character varying(50),
    prenomcli character varying(50),
    adresse character varying(50),
    telephone character(10),
    mot_de_passe character varying(50),
    nomtarif character varying(15) NOT NULL
);


ALTER TABLE projet.client OWNER TO mariyaconsta02;

--
-- Name: commande_num_com_seq; Type: SEQUENCE; Schema: projet; Owner: mariyaconsta02
--

CREATE SEQUENCE projet.commande_num_com_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projet.commande_num_com_seq OWNER TO mariyaconsta02;

--
-- Name: commande; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.commande (
    num_com integer DEFAULT nextval('projet.commande_num_com_seq'::regclass) NOT NULL,
    date_prevue date,
    date_saisie timestamp without time zone,
    codecli character(7) NOT NULL,
    id_emp character varying(50) NOT NULL
);


ALTER TABLE projet.commande OWNER TO mariyaconsta02;

--
-- Name: couter; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.couter (
    codevar character(8) NOT NULL,
    nom character varying(50) NOT NULL,
    nomtarif character varying(15) NOT NULL,
    prix numeric(15,2)
);


ALTER TABLE projet.couter OWNER TO mariyaconsta02;

--
-- Name: employe; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.employe (
    id_emp character varying(50) NOT NULL,
    prenom_emp character varying(50),
    nom_emp character varying(50),
    datenaissance date,
    date_fin_embauche date,
    date_embauche date,
    type_contrat character varying(15),
    mot_de_passe character varying(50)
);


ALTER TABLE projet.employe OWNER TO mariyaconsta02;

--
-- Name: images; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.images (
    id integer NOT NULL,
    image_path character varying(255),
    codevar character(8) NOT NULL
);


ALTER TABLE projet.images OWNER TO mariyaconsta02;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: projet; Owner: mariyaconsta02
--

CREATE SEQUENCE projet.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projet.images_id_seq OWNER TO mariyaconsta02;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: projet; Owner: mariyaconsta02
--

ALTER SEQUENCE projet.images_id_seq OWNED BY projet.images.id;


--
-- Name: posseder; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.posseder (
    codevar character(8) NOT NULL,
    num_com integer NOT NULL,
    quantite integer
);


ALTER TABLE projet.posseder OWNER TO mariyaconsta02;

--
-- Name: saison; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.saison (
    nom character varying(50) NOT NULL,
    date_debut date NOT NULL,
    date_fin date NOT NULL
);


ALTER TABLE projet.saison OWNER TO mariyaconsta02;

--
-- Name: service; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.service (
    num_service integer NOT NULL,
    libelle character varying(20)
);


ALTER TABLE projet.service OWNER TO mariyaconsta02;

--
-- Name: tarif; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.tarif (
    nomtarif character varying(15) NOT NULL
);


ALTER TABLE projet.tarif OWNER TO mariyaconsta02;

--
-- Name: variete; Type: TABLE; Schema: projet; Owner: mariyaconsta02
--

CREATE TABLE projet.variete (
    codevar character(8) NOT NULL,
    nomvar character varying(30),
    calibre integer,
    quantite character varying(50),
    nomart character varying(30) NOT NULL
);


ALTER TABLE projet.variete OWNER TO mariyaconsta02;

--
-- Name: images id; Type: DEFAULT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.images ALTER COLUMN id SET DEFAULT nextval('projet.images_id_seq'::regclass);


--
-- Data for Name: appartenir; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.appartenir VALUES ('LUCAS', 1);
INSERT INTO projet.appartenir VALUES ('MICHEL', 3);
INSERT INTO projet.appartenir VALUES ('MICHELJ', 3);
INSERT INTO projet.appartenir VALUES ('THAMIZ', 1);
INSERT INTO projet.appartenir VALUES ('THAMIZS', 3);


--
-- Data for Name: article; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.article VALUES ('Poire', 'Fruits à pépin');
INSERT INTO projet.article VALUES ('Pomme', 'Fruits à pépin');
INSERT INTO projet.article VALUES ('Litchi', 'Fruits Exotiques');
INSERT INTO projet.article VALUES ('Mangue', 'Fruits Exotiques');
INSERT INTO projet.article VALUES ('Cassis', 'Fruits rouges');
INSERT INTO projet.article VALUES ('Fraise', 'Fruits rouges');
INSERT INTO projet.article VALUES ('Groseille', 'Fruits rouges');
INSERT INTO projet.article VALUES ('Ail', 'Légumes à bulbe');
INSERT INTO projet.article VALUES ('Oignon', 'Légumes à bulbe');
INSERT INTO projet.article VALUES ('Épinard', 'Légumes-feuilles');
INSERT INTO projet.article VALUES ('Salade', 'Légumes-feuilles');
INSERT INTO projet.article VALUES ('Artichaut', 'Légumes-fleurs');
INSERT INTO projet.article VALUES ('Brocoli', 'Légumes-fleurs');
INSERT INTO projet.article VALUES ('Concombre', 'Légumes-fruits ');
INSERT INTO projet.article VALUES ('Tomate', 'Légumes-fruits ');


--
-- Data for Name: categorie; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.categorie VALUES ('Fruits à pépin');
INSERT INTO projet.categorie VALUES ('Fruits Exotiques');
INSERT INTO projet.categorie VALUES ('Fruits rouges');
INSERT INTO projet.categorie VALUES ('Légumes à bulbe');
INSERT INTO projet.categorie VALUES ('Légumes-feuilles');
INSERT INTO projet.categorie VALUES ('Légumes-fleurs');
INSERT INTO projet.categorie VALUES ('Légumes-fruits ');


--
-- Data for Name: client; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.client VALUES ('CDUPONT', 'Dupont', 'Jean', '2 Rue Des Anges', '0123456789', '81dc9bdb52d04dc20036dbd8313ed055', 'Particulier');
INSERT INTO projet.client VALUES ('CBERNAR', 'Bernard', 'Bastien', 'La rue du test', '0147852369', '81dc9bdb52d04dc20036dbd8313ed055', 'Collectivités');
INSERT INTO projet.client VALUES ('CSARBOU', 'sarboudine', 'Thamiz', '37 boulevard de friedberg', '0767558175', '093380458dd5a9ca33ab8f7def5a48ad', 'Boulangerie');
INSERT INTO projet.client VALUES ('CTEST  ', 'test', 'test', 'test', '0123456789', '098f6bcd4621d373cade4e832627b4f6', 'Boulangerie');
INSERT INTO projet.client VALUES ('CSERG  ', 'serg', 'qerg', 'qerg', 'qregg     ', '74b87337454200d4d33f80c4663dc5e5', 'Personnel');
INSERT INTO projet.client VALUES ('CA     ', 'a', 'a', 'a', 'a         ', '0cc175b9c0f1b6a831c399e269772661', 'Personnel');
INSERT INTO projet.client VALUES ('CABC   ', 'abc', 'abc', 'abc', 'abc       ', '900150983cd24fb0d6963f7d28e17f72', 'Boulangerie');


--
-- Data for Name: commande; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.commande VALUES (1, '2023-05-11', '2023-05-08 16:47:33.814849', 'CDUPONT', 'LUCAS');
INSERT INTO projet.commande VALUES (2, '2023-05-11', '2023-05-08 17:09:48.859133', 'CDUPONT', 'LUCAS');
INSERT INTO projet.commande VALUES (3, '2023-05-11', '2023-05-08 17:10:56.748999', 'CDUPONT', 'LUCAS');
INSERT INTO projet.commande VALUES (4, '2023-05-11', '2023-05-08 17:42:57.935035', 'CDUPONT', 'LUCAS');
INSERT INTO projet.commande VALUES (5, '2023-05-12', '2023-05-09 12:02:42.271781', 'CDUPONT', 'LUCAS');
INSERT INTO projet.commande VALUES (6, '2023-05-12', '2023-05-09 13:51:16.441346', 'CSARBOU', 'THAMIZ');
INSERT INTO projet.commande VALUES (7, '2023-05-12', '2023-05-09 14:54:33.851156', 'CSARBOU', 'LUCAS');
INSERT INTO projet.commande VALUES (8, '2023-05-12', '2023-05-09 15:42:04.849383', 'CSARBOU', 'LUCAS');
INSERT INTO projet.commande VALUES (9, '2023-05-13', '2023-05-10 08:45:09.284404', 'CSARBOU', 'THAMIZS');
INSERT INTO projet.commande VALUES (10, '2023-05-13', '2023-05-10 09:22:02.476807', 'CSARBOU', 'LUCAS');
INSERT INTO projet.commande VALUES (11, '2023-05-13', '2023-05-10 09:26:37.553692', 'CDUPONT', 'LUCAS');
INSERT INTO projet.commande VALUES (12, '2023-05-13', '2023-05-10 09:42:13.559414', 'CDUPONT', 'LUCAS');


--
-- Data for Name: couter; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.couter VALUES ('AIME6001', 'Hiver', 'Boulangerie', 1.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Hiver', 'Collectivités', 2.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Hiver', 'Particulier', 1.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Hiver', 'Personnel', 2.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Hiver', 'Restauration', 1.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Hiver', 'Traiteur', 2.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Printemps', 'Boulangerie', 2.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Printemps', 'Collectivités', 1.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Printemps', 'Particulier', 2.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Printemps', 'Personnel', 1.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Printemps', 'Restauration', 2.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Printemps', 'Traiteur', 1.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Été', 'Boulangerie', 1.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Été', 'Collectivités', 2.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Été', 'Particulier', 1.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Été', 'Personnel', 2.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Été', 'Restauration', 1.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Été', 'Traiteur', 2.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Automne', 'Boulangerie', 2.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Automne', 'Collectivités', 1.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Automne', 'Particulier', 2.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Automne', 'Personnel', 1.99);
INSERT INTO projet.couter VALUES ('AIME6001', 'Automne', 'Restauration', 2.49);
INSERT INTO projet.couter VALUES ('AIME6001', 'Automne', 'Traiteur', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Hiver', 'Boulangerie', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Hiver', 'Collectivités', 2.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Hiver', 'Particulier', 1.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Hiver', 'Personnel', 2.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Hiver', 'Restauration', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Hiver', 'Traiteur', 2.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Printemps', 'Boulangerie', 2.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Printemps', 'Collectivités', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Printemps', 'Particulier', 2.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Printemps', 'Personnel', 1.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Printemps', 'Restauration', 2.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Printemps', 'Traiteur', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Été', 'Boulangerie', 1.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Été', 'Collectivités', 2.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Été', 'Particulier', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Été', 'Personnel', 2.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Été', 'Restauration', 1.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Été', 'Traiteur', 2.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Automne', 'Boulangerie', 2.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Automne', 'Collectivités', 1.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Automne', 'Particulier', 2.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Automne', 'Personnel', 1.99);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Automne', 'Restauration', 2.49);
INSERT INTO projet.couter VALUES ('AIPR5002', 'Automne', 'Traiteur', 1.99);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Printemps', 'Boulangerie', 6.26);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Printemps', 'Collectivités', 6.39);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Printemps', 'Particulier', 7.54);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Printemps', 'Personnel', 6.54);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Printemps', 'Restauration', 6.85);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Printemps', 'Traiteur', 7.21);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Été', 'Boulangerie', 6.04);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Été', 'Collectivités', 6.16);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Été', 'Particulier', 7.28);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Été', 'Personnel', 6.28);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Été', 'Restauration', 6.59);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Été', 'Traiteur', 6.95);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Automne', 'Boulangerie', 6.01);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Automne', 'Collectivités', 6.13);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Automne', 'Particulier', 7.24);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Automne', 'Personnel', 6.24);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Automne', 'Restauration', 6.55);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Automne', 'Traiteur', 6.91);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Hiver', 'Boulangerie', 6.26);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Hiver', 'Collectivités', 6.39);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Hiver', 'Particulier', 7.54);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Hiver', 'Personnel', 6.54);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Hiver', 'Restauration', 6.85);
INSERT INTO projet.couter VALUES ('ARCB1201', 'Hiver', 'Traiteur', 7.21);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Printemps', 'Boulangerie', 3.50);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Printemps', 'Collectivités', 3.80);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Printemps', 'Particulier', 3.90);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Printemps', 'Personnel', 3.70);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Printemps', 'Restauration', 3.60);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Printemps', 'Traiteur', 3.85);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Été', 'Boulangerie', 3.80);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Été', 'Collectivités', 3.70);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Été', 'Particulier', 3.85);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Été', 'Personnel', 3.60);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Été', 'Restauration', 3.75);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Été', 'Traiteur', 3.95);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Automne', 'Boulangerie', 3.70);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Automne', 'Collectivités', 3.90);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Automne', 'Particulier', 3.75);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Automne', 'Personnel', 3.80);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Automne', 'Restauration', 3.65);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Automne', 'Traiteur', 3.85);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Hiver', 'Boulangerie', 3.80);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Hiver', 'Collectivités', 3.70);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Hiver', 'Particulier', 3.85);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Hiver', 'Personnel', 3.60);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Hiver', 'Restauration', 3.75);
INSERT INTO projet.couter VALUES ('ARVP1202', 'Hiver', 'Traiteur', 3.95);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Printemps', 'Collectivités', 3.47);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Printemps', 'Particulier', 3.50);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Printemps', 'Personnel', 3.50);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Printemps', 'Restauration', 3.40);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Printemps', 'Traiteur', 3.44);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Été', 'Boulangerie', 3.48);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Été', 'Collectivités', 3.49);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Été', 'Particulier', 3.42);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Été', 'Personnel', 3.45);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Été', 'Restauration', 3.46);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Été', 'Traiteur', 3.50);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Automne', 'Boulangerie', 3.42);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Automne', 'Collectivités', 3.42);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Automne', 'Particulier', 3.43);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Automne', 'Personnel', 3.47);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Automne', 'Restauration', 3.42);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Automne', 'Traiteur', 3.44);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Hiver', 'Boulangerie', 3.41);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Hiver', 'Collectivités', 3.43);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Hiver', 'Particulier', 3.48);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Hiver', 'Personnel', 3.49);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Hiver', 'Restauration', 3.49);
INSERT INTO projet.couter VALUES ('BRCA4001', 'Hiver', 'Traiteur', 3.49);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Printemps', 'Boulangerie', 3.47);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Printemps', 'Collectivités', 3.47);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Printemps', 'Particulier', 3.56);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Printemps', 'Personnel', 3.50);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Printemps', 'Restauration', 3.48);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Printemps', 'Traiteur', 3.54);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Été', 'Boulangerie', 3.54);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Été', 'Collectivités', 3.47);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Été', 'Particulier', 3.49);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Été', 'Personnel', 3.52);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Été', 'Restauration', 3.56);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Été', 'Traiteur', 3.49);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Automne', 'Boulangerie', 3.56);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Automne', 'Collectivités', 3.52);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Automne', 'Particulier', 3.47);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Automne', 'Personnel', 3.47);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Automne', 'Restauration', 3.57);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Automne', 'Traiteur', 3.53);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Hiver', 'Boulangerie', 3.57);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Hiver', 'Collectivités', 3.47);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Hiver', 'Particulier', 3.54);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Hiver', 'Personnel', 3.48);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Hiver', 'Restauration', 3.54);
INSERT INTO projet.couter VALUES ('BRJE6002', 'Hiver', 'Traiteur', 3.56);
INSERT INTO projet.couter VALUES ('CABL1502', 'Printemps', 'Boulangerie', 14.50);
INSERT INTO projet.couter VALUES ('CABL1502', 'Printemps', 'Collectivités', 15.25);
INSERT INTO projet.couter VALUES ('CABL1502', 'Printemps', 'Particulier', 14.75);
INSERT INTO projet.couter VALUES ('CABL1502', 'Printemps', 'Personnel', 15.50);
INSERT INTO projet.couter VALUES ('CABL1502', 'Printemps', 'Restauration', 15.00);
INSERT INTO projet.couter VALUES ('CABL1502', 'Printemps', 'Traiteur', 14.25);
INSERT INTO projet.couter VALUES ('CABL1502', 'Été', 'Boulangerie', 14.75);
INSERT INTO projet.couter VALUES ('CABL1502', 'Été', 'Collectivités', 15.50);
INSERT INTO projet.couter VALUES ('CABL1502', 'Été', 'Particulier', 15.00);
INSERT INTO projet.couter VALUES ('CABL1502', 'Été', 'Personnel', 14.50);
INSERT INTO projet.couter VALUES ('CABL1502', 'Été', 'Restauration', 15.25);
INSERT INTO projet.couter VALUES ('CABL1502', 'Été', 'Traiteur', 14.75);
INSERT INTO projet.couter VALUES ('CABL1502', 'Automne', 'Boulangerie', 15.75);
INSERT INTO projet.couter VALUES ('CABL1502', 'Automne', 'Collectivités', 16.00);
INSERT INTO projet.couter VALUES ('CABL1502', 'Automne', 'Particulier', 15.50);
INSERT INTO projet.couter VALUES ('CABL1502', 'Automne', 'Personnel', 16.25);
INSERT INTO projet.couter VALUES ('CABL1502', 'Automne', 'Restauration', 15.75);
INSERT INTO projet.couter VALUES ('CABL1502', 'Automne', 'Traiteur', 15.00);
INSERT INTO projet.couter VALUES ('CABL1502', 'Hiver', 'Boulangerie', 15.25);
INSERT INTO projet.couter VALUES ('CABL1502', 'Hiver', 'Collectivités', 15.50);
INSERT INTO projet.couter VALUES ('CABL1502', 'Hiver', 'Particulier', 15.00);
INSERT INTO projet.couter VALUES ('CABL1502', 'Hiver', 'Personnel', 15.75);
INSERT INTO projet.couter VALUES ('CABL1502', 'Hiver', 'Restauration', 15.25);
INSERT INTO projet.couter VALUES ('CABL1502', 'Hiver', 'Traiteur', 14.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Printemps', 'Boulangerie', 15.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Printemps', 'Collectivités', 14.75);
INSERT INTO projet.couter VALUES ('CANO1501', 'Printemps', 'Particulier', 15.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Printemps', 'Personnel', 15.00);
INSERT INTO projet.couter VALUES ('CANO1501', 'Printemps', 'Restauration', 14.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Printemps', 'Traiteur', 14.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Été', 'Boulangerie', 15.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Été', 'Collectivités', 14.75);
INSERT INTO projet.couter VALUES ('CANO1501', 'Été', 'Particulier', 15.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Été', 'Personnel', 15.00);
INSERT INTO projet.couter VALUES ('CANO1501', 'Été', 'Restauration', 14.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Été', 'Traiteur', 14.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Automne', 'Boulangerie', 15.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Automne', 'Collectivités', 14.75);
INSERT INTO projet.couter VALUES ('CANO1501', 'Automne', 'Particulier', 15.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Automne', 'Personnel', 15.00);
INSERT INTO projet.couter VALUES ('CANO1501', 'Automne', 'Restauration', 14.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Automne', 'Traiteur', 14.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Hiver', 'Boulangerie', 15.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Hiver', 'Collectivités', 14.75);
INSERT INTO projet.couter VALUES ('CANO1501', 'Hiver', 'Particulier', 15.50);
INSERT INTO projet.couter VALUES ('CANO1501', 'Hiver', 'Personnel', 15.00);
INSERT INTO projet.couter VALUES ('CANO1501', 'Hiver', 'Restauration', 14.25);
INSERT INTO projet.couter VALUES ('CANO1501', 'Hiver', 'Traiteur', 14.50);
INSERT INTO projet.couter VALUES ('COAR7001', 'Printemps', 'Boulangerie', 4.00);
INSERT INTO projet.couter VALUES ('COAR7001', 'Été', 'Boulangerie', 3.97);
INSERT INTO projet.couter VALUES ('COAR7001', 'Automne', 'Boulangerie', 3.94);
INSERT INTO projet.couter VALUES ('COAR7001', 'Hiver', 'Boulangerie', 3.97);
INSERT INTO projet.couter VALUES ('COAR7001', 'Printemps', 'Collectivités', 4.01);
INSERT INTO projet.couter VALUES ('COAR7001', 'Été', 'Collectivités', 3.94);
INSERT INTO projet.couter VALUES ('COAR7001', 'Automne', 'Collectivités', 3.96);
INSERT INTO projet.couter VALUES ('COAR7001', 'Hiver', 'Collectivités', 3.94);
INSERT INTO projet.couter VALUES ('COAR7001', 'Printemps', 'Particulier', 4.05);
INSERT INTO projet.couter VALUES ('COAR7001', 'Été', 'Particulier', 3.93);
INSERT INTO projet.couter VALUES ('COAR7001', 'Automne', 'Particulier', 3.94);
INSERT INTO projet.couter VALUES ('COAR7001', 'Hiver', 'Particulier', 4.01);
INSERT INTO projet.couter VALUES ('COAR7001', 'Printemps', 'Personnel', 4.03);
INSERT INTO projet.couter VALUES ('COAR7001', 'Été', 'Personnel', 4.01);
INSERT INTO projet.couter VALUES ('COAR7001', 'Automne', 'Personnel', 4.03);
INSERT INTO projet.couter VALUES ('COAR7001', 'Hiver', 'Personnel', 3.99);
INSERT INTO projet.couter VALUES ('COAR7001', 'Printemps', 'Restauration', 4.03);
INSERT INTO projet.couter VALUES ('COAR7001', 'Été', 'Restauration', 3.94);
INSERT INTO projet.couter VALUES ('COAR7001', 'Automne', 'Restauration', 3.96);
INSERT INTO projet.couter VALUES ('COAR7001', 'Hiver', 'Restauration', 3.97);
INSERT INTO projet.couter VALUES ('COAR7001', 'Printemps', 'Traiteur', 3.97);
INSERT INTO projet.couter VALUES ('COAR7001', 'Été', 'Traiteur', 3.99);
INSERT INTO projet.couter VALUES ('COAR7001', 'Automne', 'Traiteur', 4.04);
INSERT INTO projet.couter VALUES ('COAR7001', 'Hiver', 'Traiteur', 4.01);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Printemps', 'Boulangerie', 3.36);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Été', 'Boulangerie', 3.33);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Automne', 'Boulangerie', 3.31);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Hiver', 'Boulangerie', 3.40);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Printemps', 'Collectivités', 3.39);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Été', 'Collectivités', 3.43);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Automne', 'Collectivités', 3.38);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Hiver', 'Collectivités', 3.41);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Printemps', 'Particulier', 3.36);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Été', 'Particulier', 3.42);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Automne', 'Particulier', 3.34);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Hiver', 'Particulier', 3.35);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Printemps', 'Personnel', 3.32);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Été', 'Personnel', 3.36);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Automne', 'Personnel', 3.38);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Hiver', 'Personnel', 3.36);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Printemps', 'Restauration', 3.38);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Été', 'Restauration', 3.39);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Automne', 'Restauration', 3.36);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Hiver', 'Restauration', 3.43);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Printemps', 'Traiteur', 3.32);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Été', 'Traiteur', 3.37);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Automne', 'Traiteur', 3.32);
INSERT INTO projet.couter VALUES ('EPPO1602', 'Hiver', 'Traiteur', 3.40);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Printemps', 'Boulangerie', 3.33);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Été', 'Boulangerie', 3.36);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Automne', 'Boulangerie', 3.43);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Hiver', 'Boulangerie', 3.39);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Printemps', 'Collectivités', 3.34);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Été', 'Collectivités', 3.38);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Automne', 'Collectivités', 3.42);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Hiver', 'Collectivités', 3.38);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Printemps', 'Particulier', 3.34);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Été', 'Particulier', 3.40);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Automne', 'Particulier', 3.33);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Hiver', 'Particulier', 3.43);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Printemps', 'Personnel', 3.40);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Été', 'Personnel', 3.39);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Automne', 'Personnel', 3.41);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Hiver', 'Personnel', 3.32);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Printemps', 'Restauration', 3.38);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Été', 'Restauration', 3.32);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Automne', 'Restauration', 3.36);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Hiver', 'Restauration', 3.39);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Printemps', 'Traiteur', 3.36);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Été', 'Traiteur', 3.31);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Automne', 'Traiteur', 3.33);
INSERT INTO projet.couter VALUES ('EPSY1001', 'Hiver', 'Traiteur', 3.31);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Printemps', 'Boulangerie', 28.06);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Été', 'Boulangerie', 28.09);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Automne', 'Boulangerie', 28.12);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Hiver', 'Boulangerie', 28.08);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Printemps', 'Collectivités', 28.01);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Été', 'Collectivités', 28.03);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Automne', 'Collectivités', 28.12);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Hiver', 'Collectivités', 28.09);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Printemps', 'Particulier', 28.07);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Été', 'Particulier', 28.04);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Automne', 'Particulier', 28.11);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Hiver', 'Particulier', 28.11);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Printemps', 'Personnel', 28.00);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Été', 'Personnel', 28.01);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Automne', 'Personnel', 28.10);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Hiver', 'Personnel', 28.09);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Printemps', 'Restauration', 28.03);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Été', 'Restauration', 28.03);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Automne', 'Restauration', 28.12);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Hiver', 'Restauration', 28.06);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Printemps', 'Traiteur', 28.08);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Été', 'Traiteur', 28.01);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Automne', 'Traiteur', 28.09);
INSERT INTO projet.couter VALUES ('GRCA1003', 'Hiver', 'Traiteur', 28.11);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Printemps', 'Boulangerie', 28.06);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Été', 'Boulangerie', 28.08);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Automne', 'Boulangerie', 28.07);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Hiver', 'Boulangerie', 28.06);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Printemps', 'Collectivités', 28.03);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Été', 'Collectivités', 28.07);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Automne', 'Collectivités', 28.05);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Hiver', 'Collectivités', 28.09);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Printemps', 'Particulier', 28.04);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Été', 'Particulier', 28.04);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Automne', 'Particulier', 28.05);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Hiver', 'Particulier', 28.06);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Printemps', 'Personnel', 28.08);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Été', 'Personnel', 28.05);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Automne', 'Personnel', 28.02);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Hiver', 'Personnel', 28.02);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Printemps', 'Restauration', 28.09);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Été', 'Restauration', 28.01);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Automne', 'Restauration', 28.02);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Hiver', 'Restauration', 28.09);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Printemps', 'Traiteur', 28.02);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Été', 'Traiteur', 28.00);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Automne', 'Traiteur', 28.06);
INSERT INTO projet.couter VALUES ('GRMA1002', 'Hiver', 'Traiteur', 28.05);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Printemps', 'Boulangerie', 28.01);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Été', 'Boulangerie', 28.04);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Automne', 'Boulangerie', 28.08);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Hiver', 'Boulangerie', 28.02);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Printemps', 'Collectivités', 28.04);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Été', 'Collectivités', 28.02);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Automne', 'Collectivités', 28.07);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Hiver', 'Collectivités', 28.07);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Printemps', 'Particulier', 28.08);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Été', 'Particulier', 28.05);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Automne', 'Particulier', 28.05);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Hiver', 'Particulier', 28.03);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Printemps', 'Personnel', 28.12);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Été', 'Personnel', 28.03);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Automne', 'Personnel', 28.03);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Hiver', 'Personnel', 28.03);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Printemps', 'Restauration', 28.07);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Été', 'Restauration', 28.10);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Automne', 'Restauration', 28.10);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Hiver', 'Restauration', 28.06);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Printemps', 'Traiteur', 28.10);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Été', 'Traiteur', 28.02);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Automne', 'Traiteur', 28.10);
INSERT INTO projet.couter VALUES ('GRRO1001', 'Hiver', 'Traiteur', 28.02);
INSERT INTO projet.couter VALUES ('LICH1001', 'Printemps', 'Boulangerie', 13.10);
INSERT INTO projet.couter VALUES ('LICH1001', 'Été', 'Boulangerie', 13.07);
INSERT INTO projet.couter VALUES ('LICH1001', 'Automne', 'Boulangerie', 13.00);
INSERT INTO projet.couter VALUES ('LICH1001', 'Hiver', 'Boulangerie', 13.01);
INSERT INTO projet.couter VALUES ('LICH1001', 'Printemps', 'Collectivités', 13.06);
INSERT INTO projet.couter VALUES ('LICH1001', 'Été', 'Collectivités', 13.02);
INSERT INTO projet.couter VALUES ('LICH1001', 'Automne', 'Collectivités', 13.00);
INSERT INTO projet.couter VALUES ('LICH1001', 'Hiver', 'Collectivités', 13.07);
INSERT INTO projet.couter VALUES ('LICH1001', 'Printemps', 'Particulier', 13.05);
INSERT INTO projet.couter VALUES ('LICH1001', 'Été', 'Particulier', 13.08);
INSERT INTO projet.couter VALUES ('LICH1001', 'Automne', 'Particulier', 13.09);
INSERT INTO projet.couter VALUES ('LICH1001', 'Hiver', 'Particulier', 13.09);
INSERT INTO projet.couter VALUES ('LICH1001', 'Printemps', 'Personnel', 13.10);
INSERT INTO projet.couter VALUES ('LICH1001', 'Été', 'Personnel', 13.04);
INSERT INTO projet.couter VALUES ('LICH1001', 'Automne', 'Personnel', 13.03);
INSERT INTO projet.couter VALUES ('LICH1001', 'Hiver', 'Personnel', 13.06);
INSERT INTO projet.couter VALUES ('LICH1001', 'Printemps', 'Restauration', 13.09);
INSERT INTO projet.couter VALUES ('LICH1001', 'Été', 'Restauration', 13.09);
INSERT INTO projet.couter VALUES ('LICH1001', 'Automne', 'Restauration', 13.09);
INSERT INTO projet.couter VALUES ('LICH1001', 'Hiver', 'Restauration', 13.09);
INSERT INTO projet.couter VALUES ('LICH1001', 'Printemps', 'Traiteur', 13.00);
INSERT INTO projet.couter VALUES ('LICH1001', 'Été', 'Traiteur', 13.00);
INSERT INTO projet.couter VALUES ('LICH1001', 'Automne', 'Traiteur', 13.01);
INSERT INTO projet.couter VALUES ('LICH1001', 'Hiver', 'Traiteur', 13.06);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Printemps', 'Boulangerie', 13.10);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Été', 'Boulangerie', 13.11);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Automne', 'Boulangerie', 13.01);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Hiver', 'Boulangerie', 13.08);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Printemps', 'Collectivités', 13.00);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Été', 'Collectivités', 13.11);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Automne', 'Collectivités', 13.10);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Hiver', 'Collectivités', 13.00);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Printemps', 'Particulier', 13.06);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Été', 'Particulier', 13.11);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Automne', 'Particulier', 13.02);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Hiver', 'Particulier', 13.02);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Printemps', 'Personnel', 13.02);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Été', 'Personnel', 13.03);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Automne', 'Personnel', 13.09);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Hiver', 'Personnel', 13.08);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Printemps', 'Restauration', 13.00);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Été', 'Restauration', 13.07);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Automne', 'Restauration', 13.06);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Hiver', 'Restauration', 13.10);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Printemps', 'Traiteur', 13.01);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Été', 'Traiteur', 13.10);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Automne', 'Traiteur', 13.05);
INSERT INTO projet.couter VALUES ('LIPH1002', 'Hiver', 'Traiteur', 13.11);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Printemps', 'Boulangerie', 2.72);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Été', 'Boulangerie', 2.67);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Automne', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Hiver', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Printemps', 'Collectivités', 2.68);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Été', 'Collectivités', 2.75);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Automne', 'Collectivités', 2.68);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Hiver', 'Collectivités', 2.67);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Printemps', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Été', 'Particulier', 2.70);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Automne', 'Particulier', 2.65);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Hiver', 'Particulier', 2.64);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Printemps', 'Personnel', 2.69);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Été', 'Personnel', 2.63);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Automne', 'Personnel', 2.65);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Hiver', 'Personnel', 2.65);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Printemps', 'Restauration', 2.63);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Été', 'Restauration', 2.67);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Automne', 'Restauration', 2.67);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Hiver', 'Restauration', 2.66);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Printemps', 'Traiteur', 2.71);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Été', 'Traiteur', 2.66);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Automne', 'Traiteur', 2.75);
INSERT INTO projet.couter VALUES ('MAAM8001', 'Hiver', 'Traiteur', 2.71);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Printemps', 'Boulangerie', 2.74);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Été', 'Boulangerie', 2.70);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Automne', 'Boulangerie', 2.71);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Hiver', 'Boulangerie', 2.64);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Printemps', 'Collectivités', 2.69);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Été', 'Collectivités', 2.65);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Automne', 'Collectivités', 2.63);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Hiver', 'Collectivités', 2.66);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Printemps', 'Particulier', 2.69);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Été', 'Particulier', 2.73);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Automne', 'Particulier', 2.64);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Hiver', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Printemps', 'Personnel', 2.73);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Été', 'Personnel', 2.69);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Automne', 'Personnel', 2.66);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Hiver', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Printemps', 'Restauration', 2.63);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Été', 'Restauration', 2.68);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Automne', 'Restauration', 2.73);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Hiver', 'Restauration', 2.70);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Printemps', 'Traiteur', 2.68);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Été', 'Traiteur', 2.75);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Automne', 'Traiteur', 2.71);
INSERT INTO projet.couter VALUES ('MAHA8004', 'Hiver', 'Traiteur', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Printemps', 'Boulangerie', 2.67);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Été', 'Boulangerie', 2.64);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Automne', 'Boulangerie', 2.71);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Hiver', 'Boulangerie', 2.75);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Printemps', 'Collectivités', 2.66);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Été', 'Collectivités', 2.71);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Automne', 'Collectivités', 2.71);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Hiver', 'Collectivités', 2.65);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Printemps', 'Particulier', 2.66);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Été', 'Particulier', 2.67);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Automne', 'Particulier', 2.66);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Hiver', 'Particulier', 2.72);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Printemps', 'Personnel', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Été', 'Personnel', 2.66);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Automne', 'Personnel', 2.75);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Hiver', 'Personnel', 2.75);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Printemps', 'Restauration', 2.65);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Été', 'Restauration', 2.63);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Automne', 'Restauration', 2.74);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Hiver', 'Restauration', 2.75);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Printemps', 'Traiteur', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Été', 'Traiteur', 2.65);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Automne', 'Traiteur', 2.72);
INSERT INTO projet.couter VALUES ('MAKE8002', 'Hiver', 'Traiteur', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Printemps', 'Boulangerie', 2.70);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Été', 'Boulangerie', 2.70);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Automne', 'Boulangerie', 2.64);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Hiver', 'Boulangerie', 2.64);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Printemps', 'Collectivités', 2.70);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Été', 'Collectivités', 2.72);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Automne', 'Collectivités', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Hiver', 'Collectivités', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Printemps', 'Particulier', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Été', 'Particulier', 2.66);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Automne', 'Particulier', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Hiver', 'Particulier', 2.64);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Printemps', 'Personnel', 2.74);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Été', 'Personnel', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Automne', 'Personnel', 2.67);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Hiver', 'Personnel', 2.65);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Printemps', 'Restauration', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Été', 'Restauration', 2.69);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Automne', 'Restauration', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Hiver', 'Restauration', 2.67);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Printemps', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Été', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Automne', 'Traiteur', 2.67);
INSERT INTO projet.couter VALUES ('MAKE8006', 'Hiver', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('MATO8003', 'Printemps', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('MATO8003', 'Été', 'Boulangerie', 2.66);
INSERT INTO projet.couter VALUES ('MATO8003', 'Automne', 'Boulangerie', 2.74);
INSERT INTO projet.couter VALUES ('MATO8003', 'Hiver', 'Boulangerie', 2.67);
INSERT INTO projet.couter VALUES ('MATO8003', 'Printemps', 'Collectivités', 2.68);
INSERT INTO projet.couter VALUES ('MATO8003', 'Été', 'Collectivités', 2.71);
INSERT INTO projet.couter VALUES ('MATO8003', 'Automne', 'Collectivités', 2.73);
INSERT INTO projet.couter VALUES ('MATO8003', 'Hiver', 'Collectivités', 2.63);
INSERT INTO projet.couter VALUES ('MATO8003', 'Printemps', 'Particulier', 2.66);
INSERT INTO projet.couter VALUES ('MATO8003', 'Été', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('MATO8003', 'Automne', 'Particulier', 2.64);
INSERT INTO projet.couter VALUES ('MATO8003', 'Hiver', 'Particulier', 2.73);
INSERT INTO projet.couter VALUES ('MATO8003', 'Printemps', 'Personnel', 2.71);
INSERT INTO projet.couter VALUES ('MATO8003', 'Été', 'Personnel', 2.71);
INSERT INTO projet.couter VALUES ('MATO8003', 'Automne', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('MATO8003', 'Hiver', 'Personnel', 2.69);
INSERT INTO projet.couter VALUES ('MATO8003', 'Printemps', 'Restauration', 2.74);
INSERT INTO projet.couter VALUES ('MATO8003', 'Été', 'Restauration', 2.70);
INSERT INTO projet.couter VALUES ('MATO8003', 'Automne', 'Restauration', 2.70);
INSERT INTO projet.couter VALUES ('MATO8003', 'Hiver', 'Restauration', 2.73);
INSERT INTO projet.couter VALUES ('MATO8003', 'Printemps', 'Traiteur', 2.64);
INSERT INTO projet.couter VALUES ('MATO8003', 'Été', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('MATO8003', 'Automne', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('MATO8003', 'Hiver', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Printemps', 'Boulangerie', 2.68);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Été', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Automne', 'Boulangerie', 2.65);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Hiver', 'Boulangerie', 2.65);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Printemps', 'Collectivités', 2.71);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Été', 'Collectivités', 2.69);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Automne', 'Collectivités', 2.65);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Hiver', 'Collectivités', 2.70);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Printemps', 'Particulier', 2.72);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Été', 'Particulier', 2.64);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Automne', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Hiver', 'Particulier', 2.65);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Printemps', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Été', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Automne', 'Personnel', 2.65);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Hiver', 'Personnel', 2.63);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Printemps', 'Restauration', 2.71);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Été', 'Restauration', 2.66);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Automne', 'Restauration', 2.73);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Hiver', 'Restauration', 2.67);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Printemps', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Été', 'Traiteur', 2.70);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Automne', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('MAZI8005', 'Hiver', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Printemps', 'Boulangerie', 1.58);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Été', 'Boulangerie', 1.61);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Automne', 'Boulangerie', 1.64);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Hiver', 'Boulangerie', 1.58);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Printemps', 'Collectivités', 1.59);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Été', 'Collectivités', 1.63);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Automne', 'Collectivités', 1.57);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Hiver', 'Collectivités', 1.64);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Printemps', 'Particulier', 1.61);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Été', 'Particulier', 1.59);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Automne', 'Particulier', 1.66);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Hiver', 'Particulier', 1.57);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Printemps', 'Personnel', 1.65);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Été', 'Personnel', 1.68);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Automne', 'Personnel', 1.64);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Hiver', 'Personnel', 1.62);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Printemps', 'Restauration', 1.56);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Été', 'Restauration', 1.62);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Automne', 'Restauration', 1.63);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Hiver', 'Restauration', 1.65);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Printemps', 'Traiteur', 1.59);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Été', 'Traiteur', 1.65);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Automne', 'Traiteur', 1.66);
INSERT INTO projet.couter VALUES ('OIJA2001', 'Hiver', 'Traiteur', 1.67);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Printemps', 'Boulangerie', 1.57);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Été', 'Boulangerie', 1.64);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Automne', 'Boulangerie', 1.59);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Hiver', 'Boulangerie', 1.68);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Printemps', 'Collectivités', 1.59);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Été', 'Collectivités', 1.57);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Automne', 'Collectivités', 1.66);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Hiver', 'Collectivités', 1.61);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Printemps', 'Particulier', 1.61);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Été', 'Particulier', 1.61);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Automne', 'Particulier', 1.63);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Hiver', 'Particulier', 1.65);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Printemps', 'Personnel', 1.56);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Été', 'Personnel', 1.64);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Automne', 'Personnel', 1.60);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Hiver', 'Personnel', 1.61);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Printemps', 'Restauration', 1.67);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Été', 'Restauration', 1.59);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Automne', 'Restauration', 1.62);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Hiver', 'Restauration', 1.65);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Printemps', 'Traiteur', 1.59);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Été', 'Traiteur', 1.58);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Automne', 'Traiteur', 1.58);
INSERT INTO projet.couter VALUES ('OIRO4002', 'Hiver', 'Traiteur', 1.59);
INSERT INTO projet.couter VALUES ('PICO6001', 'Printemps', 'Boulangerie', 1.64);
INSERT INTO projet.couter VALUES ('PICO6001', 'Été', 'Boulangerie', 1.65);
INSERT INTO projet.couter VALUES ('PICO6001', 'Automne', 'Boulangerie', 1.56);
INSERT INTO projet.couter VALUES ('PICO6001', 'Hiver', 'Boulangerie', 1.67);
INSERT INTO projet.couter VALUES ('PICO6001', 'Printemps', 'Collectivités', 1.63);
INSERT INTO projet.couter VALUES ('PICO6001', 'Été', 'Collectivités', 1.66);
INSERT INTO projet.couter VALUES ('PICO6001', 'Automne', 'Collectivités', 1.67);
INSERT INTO projet.couter VALUES ('PICO6001', 'Hiver', 'Collectivités', 1.63);
INSERT INTO projet.couter VALUES ('PICO6001', 'Printemps', 'Particulier', 1.62);
INSERT INTO projet.couter VALUES ('PICO6001', 'Été', 'Particulier', 1.58);
INSERT INTO projet.couter VALUES ('PICO6001', 'Automne', 'Particulier', 1.63);
INSERT INTO projet.couter VALUES ('PICO6001', 'Hiver', 'Particulier', 1.65);
INSERT INTO projet.couter VALUES ('PICO6001', 'Printemps', 'Personnel', 1.59);
INSERT INTO projet.couter VALUES ('PICO6001', 'Été', 'Personnel', 1.61);
INSERT INTO projet.couter VALUES ('PICO6001', 'Automne', 'Personnel', 1.58);
INSERT INTO projet.couter VALUES ('PICO6001', 'Hiver', 'Personnel', 1.64);
INSERT INTO projet.couter VALUES ('PICO6001', 'Printemps', 'Restauration', 1.66);
INSERT INTO projet.couter VALUES ('PICO6001', 'Été', 'Restauration', 1.65);
INSERT INTO projet.couter VALUES ('PICO6001', 'Automne', 'Restauration', 1.61);
INSERT INTO projet.couter VALUES ('PICO6001', 'Hiver', 'Restauration', 1.66);
INSERT INTO projet.couter VALUES ('PICO6001', 'Printemps', 'Traiteur', 1.61);
INSERT INTO projet.couter VALUES ('PICO6001', 'Été', 'Traiteur', 1.65);
INSERT INTO projet.couter VALUES ('PICO6001', 'Automne', 'Traiteur', 1.59);
INSERT INTO projet.couter VALUES ('PICO6001', 'Hiver', 'Traiteur', 1.61);
INSERT INTO projet.couter VALUES ('PICO6502', 'Printemps', 'Boulangerie', 1.68);
INSERT INTO projet.couter VALUES ('PICO6502', 'Été', 'Boulangerie', 1.65);
INSERT INTO projet.couter VALUES ('PICO6502', 'Automne', 'Boulangerie', 1.57);
INSERT INTO projet.couter VALUES ('PICO6502', 'Hiver', 'Boulangerie', 1.58);
INSERT INTO projet.couter VALUES ('PICO6502', 'Printemps', 'Collectivités', 1.67);
INSERT INTO projet.couter VALUES ('PICO6502', 'Été', 'Collectivités', 1.60);
INSERT INTO projet.couter VALUES ('PICO6502', 'Automne', 'Collectivités', 1.61);
INSERT INTO projet.couter VALUES ('PICO6502', 'Hiver', 'Collectivités', 1.63);
INSERT INTO projet.couter VALUES ('PICO6502', 'Printemps', 'Particulier', 1.57);
INSERT INTO projet.couter VALUES ('PICO6502', 'Été', 'Particulier', 1.62);
INSERT INTO projet.couter VALUES ('PICO6502', 'Automne', 'Particulier', 1.62);
INSERT INTO projet.couter VALUES ('PICO6502', 'Hiver', 'Particulier', 1.64);
INSERT INTO projet.couter VALUES ('PICO6502', 'Printemps', 'Personnel', 1.60);
INSERT INTO projet.couter VALUES ('PICO6502', 'Été', 'Personnel', 1.61);
INSERT INTO projet.couter VALUES ('PICO6502', 'Automne', 'Personnel', 1.59);
INSERT INTO projet.couter VALUES ('PICO6502', 'Hiver', 'Personnel', 1.65);
INSERT INTO projet.couter VALUES ('PICO6502', 'Printemps', 'Restauration', 1.63);
INSERT INTO projet.couter VALUES ('PICO6502', 'Été', 'Restauration', 1.67);
INSERT INTO projet.couter VALUES ('PICO6502', 'Automne', 'Restauration', 1.62);
INSERT INTO projet.couter VALUES ('PICO6502', 'Hiver', 'Restauration', 1.65);
INSERT INTO projet.couter VALUES ('PICO6502', 'Printemps', 'Traiteur', 1.59);
INSERT INTO projet.couter VALUES ('PICO6502', 'Été', 'Traiteur', 1.64);
INSERT INTO projet.couter VALUES ('PICO6502', 'Automne', 'Traiteur', 1.61);
INSERT INTO projet.couter VALUES ('PICO6502', 'Hiver', 'Traiteur', 1.58);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Printemps', 'Boulangerie', 1.61);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Été', 'Boulangerie', 1.66);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Automne', 'Boulangerie', 1.68);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Hiver', 'Boulangerie', 1.66);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Printemps', 'Collectivités', 1.63);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Été', 'Collectivités', 1.59);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Automne', 'Collectivités', 1.59);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Hiver', 'Collectivités', 1.63);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Printemps', 'Particulier', 1.57);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Été', 'Particulier', 1.60);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Automne', 'Particulier', 1.65);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Hiver', 'Particulier', 1.68);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Printemps', 'Personnel', 1.64);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Été', 'Personnel', 1.58);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Automne', 'Personnel', 1.62);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Hiver', 'Personnel', 1.65);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Printemps', 'Restauration', 1.64);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Été', 'Restauration', 1.57);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Automne', 'Restauration', 1.61);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Hiver', 'Restauration', 1.68);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Printemps', 'Traiteur', 1.62);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Été', 'Traiteur', 1.64);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Automne', 'Traiteur', 1.65);
INSERT INTO projet.couter VALUES ('PIGU7504', 'Hiver', 'Traiteur', 1.56);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Printemps', 'Boulangerie', 1.63);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Été', 'Boulangerie', 1.59);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Automne', 'Boulangerie', 1.66);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Hiver', 'Boulangerie', 1.66);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Printemps', 'Collectivités', 1.67);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Été', 'Collectivités', 1.59);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Automne', 'Collectivités', 1.68);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Hiver', 'Collectivités', 1.60);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Printemps', 'Particulier', 1.57);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Été', 'Particulier', 1.68);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Automne', 'Particulier', 1.58);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Hiver', 'Particulier', 1.64);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Printemps', 'Personnel', 1.59);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Été', 'Personnel', 1.61);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Automne', 'Personnel', 1.58);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Hiver', 'Personnel', 1.59);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Printemps', 'Restauration', 1.66);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Été', 'Restauration', 1.67);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Automne', 'Restauration', 1.59);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Hiver', 'Restauration', 1.62);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Printemps', 'Traiteur', 1.58);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Été', 'Traiteur', 1.66);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Automne', 'Traiteur', 1.59);
INSERT INTO projet.couter VALUES ('PIWI7003', 'Hiver', 'Traiteur', 1.66);
INSERT INTO projet.couter VALUES ('POGO7001', 'Printemps', 'Boulangerie', 2.81);
INSERT INTO projet.couter VALUES ('POGO7001', 'Été', 'Boulangerie', 2.79);
INSERT INTO projet.couter VALUES ('POGO7001', 'Automne', 'Boulangerie', 2.81);
INSERT INTO projet.couter VALUES ('POGO7001', 'Hiver', 'Boulangerie', 2.75);
INSERT INTO projet.couter VALUES ('POGO7001', 'Printemps', 'Collectivités', 2.75);
INSERT INTO projet.couter VALUES ('POGO7001', 'Été', 'Collectivités', 2.78);
INSERT INTO projet.couter VALUES ('POGO7001', 'Automne', 'Collectivités', 2.75);
INSERT INTO projet.couter VALUES ('POGO7001', 'Hiver', 'Collectivités', 2.81);
INSERT INTO projet.couter VALUES ('POGO7001', 'Printemps', 'Particulier', 2.81);
INSERT INTO projet.couter VALUES ('POGO7001', 'Été', 'Particulier', 2.73);
INSERT INTO projet.couter VALUES ('POGO7001', 'Automne', 'Particulier', 2.80);
INSERT INTO projet.couter VALUES ('POGO7001', 'Hiver', 'Particulier', 2.80);
INSERT INTO projet.couter VALUES ('POGO7001', 'Printemps', 'Personnel', 2.76);
INSERT INTO projet.couter VALUES ('POGO7001', 'Été', 'Personnel', 2.79);
INSERT INTO projet.couter VALUES ('POGO7001', 'Automne', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('POGO7001', 'Hiver', 'Personnel', 2.76);
INSERT INTO projet.couter VALUES ('POGO7001', 'Printemps', 'Restauration', 2.79);
INSERT INTO projet.couter VALUES ('POGO7001', 'Été', 'Restauration', 2.75);
INSERT INTO projet.couter VALUES ('POGO7001', 'Automne', 'Restauration', 2.72);
INSERT INTO projet.couter VALUES ('POGO7001', 'Hiver', 'Restauration', 2.82);
INSERT INTO projet.couter VALUES ('POGO7001', 'Printemps', 'Traiteur', 2.80);
INSERT INTO projet.couter VALUES ('POGO7001', 'Été', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('POGO7001', 'Automne', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('POGO7001', 'Hiver', 'Traiteur', 2.78);
INSERT INTO projet.couter VALUES ('POGA7002', 'Printemps', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('POGA7002', 'Été', 'Boulangerie', 2.76);
INSERT INTO projet.couter VALUES ('POGA7002', 'Automne', 'Boulangerie', 2.72);
INSERT INTO projet.couter VALUES ('POGA7002', 'Hiver', 'Boulangerie', 2.75);
INSERT INTO projet.couter VALUES ('POGA7002', 'Printemps', 'Collectivités', 2.74);
INSERT INTO projet.couter VALUES ('POGA7002', 'Été', 'Collectivités', 2.74);
INSERT INTO projet.couter VALUES ('POGA7002', 'Automne', 'Collectivités', 2.73);
INSERT INTO projet.couter VALUES ('POGA7002', 'Hiver', 'Collectivités', 2.72);
INSERT INTO projet.couter VALUES ('POGA7002', 'Printemps', 'Particulier', 2.82);
INSERT INTO projet.couter VALUES ('POGA7002', 'Été', 'Particulier', 2.82);
INSERT INTO projet.couter VALUES ('POGA7002', 'Automne', 'Particulier', 2.76);
INSERT INTO projet.couter VALUES ('POGA7002', 'Hiver', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('POGA7002', 'Printemps', 'Personnel', 2.77);
INSERT INTO projet.couter VALUES ('POGA7002', 'Été', 'Personnel', 2.80);
INSERT INTO projet.couter VALUES ('POGA7002', 'Automne', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('POGA7002', 'Hiver', 'Personnel', 2.75);
INSERT INTO projet.couter VALUES ('POGA7002', 'Printemps', 'Restauration', 2.81);
INSERT INTO projet.couter VALUES ('POGA7002', 'Été', 'Restauration', 2.81);
INSERT INTO projet.couter VALUES ('POGA7002', 'Automne', 'Restauration', 2.72);
INSERT INTO projet.couter VALUES ('POGA7002', 'Hiver', 'Restauration', 2.74);
INSERT INTO projet.couter VALUES ('POGA7002', 'Printemps', 'Traiteur', 2.77);
INSERT INTO projet.couter VALUES ('POGA7002', 'Été', 'Traiteur', 2.74);
INSERT INTO projet.couter VALUES ('POGA7002', 'Automne', 'Traiteur', 2.79);
INSERT INTO projet.couter VALUES ('POGA7002', 'Hiver', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('POGR7003', 'Printemps', 'Boulangerie', 2.77);
INSERT INTO projet.couter VALUES ('POGR7003', 'Été', 'Boulangerie', 2.80);
INSERT INTO projet.couter VALUES ('POGR7003', 'Automne', 'Boulangerie', 2.71);
INSERT INTO projet.couter VALUES ('POGR7003', 'Hiver', 'Boulangerie', 2.74);
INSERT INTO projet.couter VALUES ('POGR7003', 'Printemps', 'Collectivités', 2.71);
INSERT INTO projet.couter VALUES ('POGR7003', 'Été', 'Collectivités', 2.74);
INSERT INTO projet.couter VALUES ('POGR7003', 'Automne', 'Collectivités', 2.81);
INSERT INTO projet.couter VALUES ('POGR7003', 'Hiver', 'Collectivités', 2.74);
INSERT INTO projet.couter VALUES ('POGR7003', 'Printemps', 'Particulier', 2.79);
INSERT INTO projet.couter VALUES ('POGR7003', 'Été', 'Particulier', 2.82);
INSERT INTO projet.couter VALUES ('POGR7003', 'Automne', 'Particulier', 2.78);
INSERT INTO projet.couter VALUES ('POGR7003', 'Hiver', 'Particulier', 2.82);
INSERT INTO projet.couter VALUES ('POGR7003', 'Printemps', 'Personnel', 2.73);
INSERT INTO projet.couter VALUES ('POGR7003', 'Été', 'Personnel', 2.80);
INSERT INTO projet.couter VALUES ('POGR7003', 'Automne', 'Personnel', 2.83);
INSERT INTO projet.couter VALUES ('POGR7003', 'Hiver', 'Personnel', 2.72);
INSERT INTO projet.couter VALUES ('POGR7003', 'Printemps', 'Restauration', 2.79);
INSERT INTO projet.couter VALUES ('POGR7003', 'Été', 'Restauration', 2.75);
INSERT INTO projet.couter VALUES ('POGR7003', 'Automne', 'Restauration', 2.75);
INSERT INTO projet.couter VALUES ('POGR7003', 'Hiver', 'Restauration', 2.73);
INSERT INTO projet.couter VALUES ('POGR7003', 'Printemps', 'Traiteur', 2.72);
INSERT INTO projet.couter VALUES ('POGR7003', 'Été', 'Traiteur', 2.76);
INSERT INTO projet.couter VALUES ('POGR7003', 'Automne', 'Traiteur', 2.77);
INSERT INTO projet.couter VALUES ('POGR7003', 'Hiver', 'Traiteur', 2.82);
INSERT INTO projet.couter VALUES ('PORE7004', 'Printemps', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('PORE7004', 'Été', 'Boulangerie', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Automne', 'Boulangerie', 2.73);
INSERT INTO projet.couter VALUES ('PORE7004', 'Hiver', 'Boulangerie', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Printemps', 'Collectivités', 2.81);
INSERT INTO projet.couter VALUES ('PORE7004', 'Été', 'Collectivités', 2.82);
INSERT INTO projet.couter VALUES ('PORE7004', 'Automne', 'Collectivités', 2.81);
INSERT INTO projet.couter VALUES ('PORE7004', 'Hiver', 'Collectivités', 2.75);
INSERT INTO projet.couter VALUES ('PORE7004', 'Printemps', 'Particulier', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Été', 'Particulier', 2.81);
INSERT INTO projet.couter VALUES ('PORE7004', 'Automne', 'Particulier', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Hiver', 'Particulier', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Printemps', 'Personnel', 2.71);
INSERT INTO projet.couter VALUES ('PORE7004', 'Été', 'Personnel', 2.77);
INSERT INTO projet.couter VALUES ('PORE7004', 'Automne', 'Personnel', 2.82);
INSERT INTO projet.couter VALUES ('PORE7004', 'Hiver', 'Personnel', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Printemps', 'Restauration', 2.76);
INSERT INTO projet.couter VALUES ('PORE7004', 'Été', 'Restauration', 2.77);
INSERT INTO projet.couter VALUES ('PORE7004', 'Automne', 'Restauration', 2.78);
INSERT INTO projet.couter VALUES ('PORE7004', 'Hiver', 'Restauration', 2.78);
INSERT INTO projet.couter VALUES ('PORE7004', 'Printemps', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('PORE7004', 'Été', 'Traiteur', 2.77);
INSERT INTO projet.couter VALUES ('PORE7004', 'Automne', 'Traiteur', 2.79);
INSERT INTO projet.couter VALUES ('PORE7004', 'Hiver', 'Traiteur', 2.82);
INSERT INTO projet.couter VALUES ('POFU7005', 'Printemps', 'Boulangerie', 2.82);
INSERT INTO projet.couter VALUES ('POFU7005', 'Été', 'Boulangerie', 2.83);
INSERT INTO projet.couter VALUES ('POFU7005', 'Automne', 'Boulangerie', 2.72);
INSERT INTO projet.couter VALUES ('POFU7005', 'Hiver', 'Boulangerie', 2.83);
INSERT INTO projet.couter VALUES ('POFU7005', 'Printemps', 'Collectivités', 2.76);
INSERT INTO projet.couter VALUES ('POFU7005', 'Été', 'Collectivités', 2.78);
INSERT INTO projet.couter VALUES ('POFU7005', 'Automne', 'Collectivités', 2.82);
INSERT INTO projet.couter VALUES ('POFU7005', 'Hiver', 'Collectivités', 2.78);
INSERT INTO projet.couter VALUES ('POFU7005', 'Printemps', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('POFU7005', 'Été', 'Particulier', 2.73);
INSERT INTO projet.couter VALUES ('POFU7005', 'Automne', 'Particulier', 2.74);
INSERT INTO projet.couter VALUES ('POFU7005', 'Hiver', 'Particulier', 2.72);
INSERT INTO projet.couter VALUES ('POFU7005', 'Printemps', 'Personnel', 2.71);
INSERT INTO projet.couter VALUES ('POFU7005', 'Été', 'Personnel', 2.71);
INSERT INTO projet.couter VALUES ('POFU7005', 'Automne', 'Personnel', 2.76);
INSERT INTO projet.couter VALUES ('POFU7005', 'Hiver', 'Personnel', 2.79);
INSERT INTO projet.couter VALUES ('POFU7005', 'Printemps', 'Restauration', 2.81);
INSERT INTO projet.couter VALUES ('POFU7005', 'Été', 'Restauration', 2.72);
INSERT INTO projet.couter VALUES ('POFU7005', 'Automne', 'Restauration', 2.75);
INSERT INTO projet.couter VALUES ('POFU7005', 'Hiver', 'Restauration', 2.81);
INSERT INTO projet.couter VALUES ('POFU7005', 'Printemps', 'Traiteur', 2.78);
INSERT INTO projet.couter VALUES ('POFU7005', 'Été', 'Traiteur', 2.73);
INSERT INTO projet.couter VALUES ('POFU7005', 'Automne', 'Traiteur', 2.78);
INSERT INTO projet.couter VALUES ('POFU7005', 'Hiver', 'Traiteur', 2.72);
INSERT INTO projet.couter VALUES ('SABA1501', 'Printemps', 'Boulangerie', 1.07);
INSERT INTO projet.couter VALUES ('SABA1501', 'Été', 'Boulangerie', 1.00);
INSERT INTO projet.couter VALUES ('SABA1501', 'Automne', 'Boulangerie', 1.07);
INSERT INTO projet.couter VALUES ('SABA1501', 'Hiver', 'Boulangerie', 1.09);
INSERT INTO projet.couter VALUES ('SABA1501', 'Printemps', 'Collectivités', 1.07);
INSERT INTO projet.couter VALUES ('SABA1501', 'Été', 'Collectivités', 1.03);
INSERT INTO projet.couter VALUES ('SABA1501', 'Automne', 'Collectivités', 1.08);
INSERT INTO projet.couter VALUES ('SABA1501', 'Hiver', 'Collectivités', 1.05);
INSERT INTO projet.couter VALUES ('SABA1501', 'Printemps', 'Particulier', 1.03);
INSERT INTO projet.couter VALUES ('SABA1501', 'Été', 'Particulier', 1.09);
INSERT INTO projet.couter VALUES ('SABA1501', 'Automne', 'Particulier', 1.05);
INSERT INTO projet.couter VALUES ('SABA1501', 'Hiver', 'Particulier', 1.08);
INSERT INTO projet.couter VALUES ('SABA1501', 'Printemps', 'Personnel', 1.04);
INSERT INTO projet.couter VALUES ('SABA1501', 'Été', 'Personnel', 1.04);
INSERT INTO projet.couter VALUES ('SABA1501', 'Automne', 'Personnel', 1.03);
INSERT INTO projet.couter VALUES ('SABA1501', 'Hiver', 'Personnel', 1.07);
INSERT INTO projet.couter VALUES ('SABA1501', 'Printemps', 'Restauration', 1.06);
INSERT INTO projet.couter VALUES ('SABA1501', 'Été', 'Restauration', 1.05);
INSERT INTO projet.couter VALUES ('SABA1501', 'Automne', 'Restauration', 1.08);
INSERT INTO projet.couter VALUES ('SABA1501', 'Hiver', 'Restauration', 1.06);
INSERT INTO projet.couter VALUES ('SABA1501', 'Printemps', 'Traiteur', 1.05);
INSERT INTO projet.couter VALUES ('SABA1501', 'Été', 'Traiteur', 1.01);
INSERT INTO projet.couter VALUES ('SABA1501', 'Automne', 'Traiteur', 1.02);
INSERT INTO projet.couter VALUES ('SABA1501', 'Hiver', 'Traiteur', 1.03);
INSERT INTO projet.couter VALUES ('SASC1502', 'Printemps', 'Boulangerie', 1.02);
INSERT INTO projet.couter VALUES ('SASC1502', 'Été', 'Boulangerie', 1.06);
INSERT INTO projet.couter VALUES ('SASC1502', 'Automne', 'Boulangerie', 1.02);
INSERT INTO projet.couter VALUES ('SASC1502', 'Hiver', 'Boulangerie', 1.10);
INSERT INTO projet.couter VALUES ('SASC1502', 'Printemps', 'Collectivités', 1.08);
INSERT INTO projet.couter VALUES ('SASC1502', 'Été', 'Collectivités', 1.08);
INSERT INTO projet.couter VALUES ('SASC1502', 'Automne', 'Collectivités', 1.10);
INSERT INTO projet.couter VALUES ('SASC1502', 'Hiver', 'Collectivités', 1.04);
INSERT INTO projet.couter VALUES ('SASC1502', 'Printemps', 'Particulier', 1.10);
INSERT INTO projet.couter VALUES ('SASC1502', 'Été', 'Particulier', 1.06);
INSERT INTO projet.couter VALUES ('SASC1502', 'Automne', 'Particulier', 1.02);
INSERT INTO projet.couter VALUES ('SASC1502', 'Hiver', 'Particulier', 1.06);
INSERT INTO projet.couter VALUES ('SASC1502', 'Printemps', 'Personnel', 1.10);
INSERT INTO projet.couter VALUES ('SASC1502', 'Été', 'Personnel', 0.99);
INSERT INTO projet.couter VALUES ('SASC1502', 'Automne', 'Personnel', 1.00);
INSERT INTO projet.couter VALUES ('SASC1502', 'Hiver', 'Personnel', 1.02);
INSERT INTO projet.couter VALUES ('SASC1502', 'Printemps', 'Restauration', 1.09);
INSERT INTO projet.couter VALUES ('SASC1502', 'Été', 'Restauration', 1.06);
INSERT INTO projet.couter VALUES ('SASC1502', 'Automne', 'Restauration', 0.99);
INSERT INTO projet.couter VALUES ('SASC1502', 'Hiver', 'Restauration', 1.02);
INSERT INTO projet.couter VALUES ('SASC1502', 'Printemps', 'Traiteur', 1.00);
INSERT INTO projet.couter VALUES ('SASC1502', 'Été', 'Traiteur', 1.03);
INSERT INTO projet.couter VALUES ('SASC1502', 'Automne', 'Traiteur', 1.10);
INSERT INTO projet.couter VALUES ('SASC1502', 'Hiver', 'Traiteur', 1.07);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Printemps', 'Boulangerie', 3.23);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Été', 'Boulangerie', 3.21);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Automne', 'Boulangerie', 3.16);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Hiver', 'Boulangerie', 3.17);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Printemps', 'Collectivités', 3.23);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Été', 'Collectivités', 3.19);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Automne', 'Collectivités', 3.22);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Hiver', 'Collectivités', 3.14);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Printemps', 'Particulier', 3.14);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Été', 'Particulier', 3.24);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Automne', 'Particulier', 3.25);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Hiver', 'Particulier', 3.23);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Printemps', 'Personnel', 3.22);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Été', 'Personnel', 3.24);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Automne', 'Personnel', 3.16);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Hiver', 'Personnel', 3.21);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Printemps', 'Restauration', 3.19);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Été', 'Restauration', 3.19);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Automne', 'Restauration', 3.15);
INSERT INTO projet.couter VALUES ('TOCE4001', 'Hiver', 'Restauration', 3.18);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Printemps', 'Boulangerie', 3.19);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Été', 'Boulangerie', 3.16);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Automne', 'Boulangerie', 3.21);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Hiver', 'Boulangerie', 3.17);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Printemps', 'Collectivités', 3.23);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Été', 'Collectivités', 3.21);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Automne', 'Collectivités', 3.21);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Hiver', 'Collectivités', 3.24);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Printemps', 'Particulier', 3.13);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Été', 'Particulier', 3.20);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Automne', 'Particulier', 3.20);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Hiver', 'Particulier', 3.23);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Printemps', 'Personnel', 3.16);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Été', 'Personnel', 3.23);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Automne', 'Personnel', 3.15);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Hiver', 'Personnel', 3.13);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Printemps', 'Restauration', 3.17);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Été', 'Restauration', 3.24);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Automne', 'Restauration', 3.15);
INSERT INTO projet.couter VALUES ('TOGR6702', 'Hiver', 'Restauration', 3.17);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Printemps', 'Boulangerie', 5.31);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Printemps', 'Collectivités', 5.36);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Printemps', 'Particulier', 5.31);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Printemps', 'Personnel', 5.30);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Printemps', 'Restauration', 5.35);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Printemps', 'Traiteur', 5.37);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Été', 'Boulangerie', 5.35);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Été', 'Collectivités', 5.38);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Été', 'Particulier', 5.33);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Été', 'Personnel', 5.31);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Été', 'Restauration', 5.42);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Été', 'Traiteur', 5.38);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Automne', 'Boulangerie', 5.40);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Automne', 'Collectivités', 5.40);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Automne', 'Particulier', 5.36);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Automne', 'Personnel', 5.38);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Automne', 'Restauration', 5.37);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Automne', 'Traiteur', 5.32);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Hiver', 'Boulangerie', 5.40);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Hiver', 'Collectivités', 5.39);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Hiver', 'Particulier', 5.36);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Hiver', 'Personnel', 5.34);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Hiver', 'Restauration', 5.31);
INSERT INTO projet.couter VALUES ('FRFA2400', 'Hiver', 'Traiteur', 5.30);


--
-- Data for Name: employe; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.employe VALUES ('LUCAS', 'Lucas', 'Pasteur', '2023-05-02', NULL, '2023-05-04', 'CDI', '4a7d1ed414474e4033ac29ccb8653d9b');
INSERT INTO projet.employe VALUES ('MICHEL', 'Michel', 'Jean', '2023-05-05', '2023-06-10', '2023-05-11', 'CDD', '4a7d1ed414474e4033ac29ccb8653d9b');
INSERT INTO projet.employe VALUES ('MICHELJ', 'Michel', 'Jean', '2023-05-05', '2023-06-10', '2023-05-11', 'CDD', '4a7d1ed414474e4033ac29ccb8653d9b');
INSERT INTO projet.employe VALUES ('THAMIZ', 'Thamiz', 'SARBOUDINE', '2003-05-16', NULL, '2023-05-20', 'stage', '4a7d1ed414474e4033ac29ccb8653d9b');
INSERT INTO projet.employe VALUES ('THAMIZS', 'Thamiz', 'SARBOUDINE', '2023-05-10', NULL, '2023-05-19', 'CDD', '4a7d1ed414474e4033ac29ccb8653d9b');


--
-- Data for Name: images; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.images VALUES (1, '../img/POGR7003.jpg', 'POGR7003');
INSERT INTO projet.images VALUES (2, '../img/POFU7005.jpg', 'POFU7005');
INSERT INTO projet.images VALUES (3, '../img/POGO7001.jpg', 'POGO7001');
INSERT INTO projet.images VALUES (6, '../img/POGA7002.jpg', 'POGA7002');
INSERT INTO projet.images VALUES (7, '../img/PORE7004.jpg', 'PORE7004');
INSERT INTO projet.images VALUES (8, '../img/AIME6001.jpg', 'AIME6001');
INSERT INTO projet.images VALUES (9, '../img/AIPR5002.jpg', 'AIPR5002');
INSERT INTO projet.images VALUES (10, '../img/ARCB1201.jpg', 'ARCB1201');
INSERT INTO projet.images VALUES (11, '../img/ARVP1202.jpg', 'ARVP1202');
INSERT INTO projet.images VALUES (13, '../img/BRCA4001.jpg', 'BRCA4001');
INSERT INTO projet.images VALUES (14, '../img/BRJE6002.jpg', 'BRJE6002');
INSERT INTO projet.images VALUES (15, '../img/CABL1502.jpg', 'CABL1502');
INSERT INTO projet.images VALUES (16, '../img/CANO1501.jpg', 'CANO1501');
INSERT INTO projet.images VALUES (17, '../img/COAR7001.jpg', 'COAR7001');
INSERT INTO projet.images VALUES (18, '../img/COHO7002.jpg', 'COHO7002');
INSERT INTO projet.images VALUES (19, '../img/EPPO1602.jpg', 'EPPO1602');
INSERT INTO projet.images VALUES (20, '../img/EPSY1001.jpg', 'EPSY1001');
INSERT INTO projet.images VALUES (21, '../img/FRFA2400.jpg', 'FRFA2400');
INSERT INTO projet.images VALUES (22, '../img/GRCA1003.jpg', 'GRCA1003');
INSERT INTO projet.images VALUES (23, '../img/GRMA1002.jpg', 'GRMA1002');
INSERT INTO projet.images VALUES (24, '../img/GRRO1001.jpg', 'GRRO1001');
INSERT INTO projet.images VALUES (25, '../img/LICH1001.jpg', 'LICH1001');
INSERT INTO projet.images VALUES (26, '../img/LIPH1002.jpg', 'LIPH1002');
INSERT INTO projet.images VALUES (27, '../img/MAAM8001.jpg', 'MAAM8001');
INSERT INTO projet.images VALUES (28, '../img/MAHA8004.jpg', 'MAHA8004');
INSERT INTO projet.images VALUES (29, '../img/MAKE8002.jpg', 'MAKE8002');
INSERT INTO projet.images VALUES (30, '../img/MAKE8006.jpg', 'MAKE8006');
INSERT INTO projet.images VALUES (31, '../img/MATO8003.jpg', 'MATO8003');
INSERT INTO projet.images VALUES (32, '../img/MAZI8005.jpg', 'MAZI8005');
INSERT INTO projet.images VALUES (33, '../img/OIJA2001.jpg', 'OIJA2001');
INSERT INTO projet.images VALUES (34, '../img/OIRO4002.jpg', 'OIRO4002');
INSERT INTO projet.images VALUES (35, '../img/PICO6001.jpg', 'PICO6001');
INSERT INTO projet.images VALUES (36, '../img/PICO6502.jpg', 'PICO6502');
INSERT INTO projet.images VALUES (37, '../img/PIGU7504.jpg', 'PIGU7504');
INSERT INTO projet.images VALUES (38, '../img/PIWI7003.jpg', 'PIWI7003');
INSERT INTO projet.images VALUES (39, '../img/SABA1501.jpg', 'SABA1501');
INSERT INTO projet.images VALUES (40, '../img/SASC1502.jpg', 'SASC1502');
INSERT INTO projet.images VALUES (41, '../img/TOCE4001.jpg', 'TOCE4001');
INSERT INTO projet.images VALUES (42, '../img/TOGR6702.jpg', 'TOGR6702');


--
-- Data for Name: posseder; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.posseder VALUES ('AIME6001', 4, 1);
INSERT INTO projet.posseder VALUES ('BRCA4001', 4, 1);
INSERT INTO projet.posseder VALUES ('CANO1501', 4, 1);
INSERT INTO projet.posseder VALUES ('AIME6001', 6, 3);
INSERT INTO projet.posseder VALUES ('PORE7004', 7, 10);
INSERT INTO projet.posseder VALUES ('AIME6001', 7, 5);
INSERT INTO projet.posseder VALUES ('FRFA2400', 7, 15);
INSERT INTO projet.posseder VALUES ('AIME6001', 8, 4);
INSERT INTO projet.posseder VALUES ('ARVP1202', 8, 1);
INSERT INTO projet.posseder VALUES ('ARCB1201', 10, 1);
INSERT INTO projet.posseder VALUES ('GRCA1003', 11, 12);
INSERT INTO projet.posseder VALUES ('CABL1502', 12, 6);


--
-- Data for Name: saison; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.saison VALUES ('Printemps', '2023-03-20', '2023-06-20');
INSERT INTO projet.saison VALUES ('Été', '2023-06-21', '2023-09-22');
INSERT INTO projet.saison VALUES ('Automne', '2023-09-23', '2023-12-20');
INSERT INTO projet.saison VALUES ('Hiver', '2023-12-21', '2024-03-19');


--
-- Data for Name: service; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.service VALUES (1, 'préparateur');
INSERT INTO projet.service VALUES (2, 'télévente');
INSERT INTO projet.service VALUES (3, 'livreur');


--
-- Data for Name: tarif; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.tarif VALUES ('Boulangerie');
INSERT INTO projet.tarif VALUES ('Collectivités');
INSERT INTO projet.tarif VALUES ('Particulier');
INSERT INTO projet.tarif VALUES ('Personnel');
INSERT INTO projet.tarif VALUES ('Restauration');
INSERT INTO projet.tarif VALUES ('Traiteur');


--
-- Data for Name: variete; Type: TABLE DATA; Schema: projet; Owner: mariyaconsta02
--

INSERT INTO projet.variete VALUES ('AIME6001', 'Messidrôme', 60, '63', 'Ail');
INSERT INTO projet.variete VALUES ('AIPR5002', 'Printanor', 50, '70', 'Ail');
INSERT INTO projet.variete VALUES ('ARCB1201', 'Camus breton', 120, NULL, 'Artichaut');
INSERT INTO projet.variete VALUES ('ARVP1202', 'Violet de Provence', 120, NULL, 'Artichaut');
INSERT INTO projet.variete VALUES ('BRCA4001', 'Calabrais', 40, '133', 'Brocoli');
INSERT INTO projet.variete VALUES ('BRJE6002', 'Brocoli à jets', 60, NULL, 'Brocoli');
INSERT INTO projet.variete VALUES ('CABL1502', 'Black Down', 15, '375', 'Cassis');
INSERT INTO projet.variete VALUES ('CANO1501', 'Noir de Bourgogne', 15, '750', 'Cassis');
INSERT INTO projet.variete VALUES ('COAR7001', 'Arménien', 70, '79', 'Concombre');
INSERT INTO projet.variete VALUES ('COHO7002', 'Hollandais', 70, '76', 'Concombre');
INSERT INTO projet.variete VALUES ('EPPO1602', 'Polka', 16, '45', 'Épinard');
INSERT INTO projet.variete VALUES ('EPSY1001', 'Symphony', 10, '15', 'Épinard');
INSERT INTO projet.variete VALUES ('FRFA2400', 'Favette', 24, '25', 'Fraise');
INSERT INTO projet.variete VALUES ('GRCA1003', 'Casseille', 10, '11', 'Groseille');
INSERT INTO projet.variete VALUES ('GRMA1002', 'Maquereau', 10, '22', 'Groseille');
INSERT INTO projet.variete VALUES ('GRRO1001', 'Rouge', 10, '45', 'Groseille');
INSERT INTO projet.variete VALUES ('LICH1001', 'Chinensis', 10, '45', 'Litchi');
INSERT INTO projet.variete VALUES ('LIPH1002', 'Philippinensis', 10, '17', 'Litchi');
INSERT INTO projet.variete VALUES ('MAAM8001', 'Amélie', 80, '96', 'Mangue');
INSERT INTO projet.variete VALUES ('MAHA8004', 'Haden', 80, '88', 'Mangue');
INSERT INTO projet.variete VALUES ('MAKE8002', 'Kent', 80, '123', 'Mangue');
INSERT INTO projet.variete VALUES ('MAKE8006', 'Keitt', 80, '106', 'Mangue');
INSERT INTO projet.variete VALUES ('MATO8003', 'Tommy Atkins', 80, '84', 'Mangue');
INSERT INTO projet.variete VALUES ('MAZI8005', 'Zill', 80, '94', 'Mangue');
INSERT INTO projet.variete VALUES ('OIJA2001', 'Jaune', 20, '63', 'Oignon');
INSERT INTO projet.variete VALUES ('OIRO4002', 'Rouge', 40, '15', 'Oignon');
INSERT INTO projet.variete VALUES ('PICO6001', 'Conférence', 60, '102', 'Poire');
INSERT INTO projet.variete VALUES ('PICO6502', 'Comice', 65, '93', 'Poire');
INSERT INTO projet.variete VALUES ('PIGU7504', 'Guyot', 75, '79', 'Poire');
INSERT INTO projet.variete VALUES ('PIWI7003', 'Williams', 70, '155', 'Poire');
INSERT INTO projet.variete VALUES ('POFU7005', 'Fuji', 70, '74', 'Pomme');
INSERT INTO projet.variete VALUES ('POGA7002', 'Gala', 70, '125', 'Pomme');
INSERT INTO projet.variete VALUES ('POGO7001', 'Golden', 70, '155', 'Pomme');
INSERT INTO projet.variete VALUES ('POGR7003', 'Granny Smith', 70, '89', 'Pomme');
INSERT INTO projet.variete VALUES ('PORE7004', 'Reinette grise du Canada', 70, '82', 'Pomme');
INSERT INTO projet.variete VALUES ('SABA1501', 'Batavias', 150, '22', 'Salade');
INSERT INTO projet.variete VALUES ('SASC1502', 'Scarole', 150, '4', 'Salade');
INSERT INTO projet.variete VALUES ('TOCE4001', 'Cerise', 40, '12', 'Tomate');
INSERT INTO projet.variete VALUES ('TOGR6702', 'Grappe', 67, '58', 'Tomate');


--
-- Name: commande_num_com_seq; Type: SEQUENCE SET; Schema: projet; Owner: mariyaconsta02
--

SELECT pg_catalog.setval('projet.commande_num_com_seq', 2, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: projet; Owner: mariyaconsta02
--

SELECT pg_catalog.setval('projet.images_id_seq', 42, true);


--
-- Name: appartenir appartenir_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.appartenir
    ADD CONSTRAINT appartenir_pkey PRIMARY KEY (id_emp, num_service);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (nomart);


--
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (nom_cat);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (codecli);


--
-- Name: commande commande_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (num_com);


--
-- Name: couter couter_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.couter
    ADD CONSTRAINT couter_pkey PRIMARY KEY (codevar, nom, nomtarif);


--
-- Name: employe employe_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.employe
    ADD CONSTRAINT employe_pkey PRIMARY KEY (id_emp);


--
-- Name: images images_codevar_key; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.images
    ADD CONSTRAINT images_codevar_key UNIQUE (codevar);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: posseder posseder_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.posseder
    ADD CONSTRAINT posseder_pkey PRIMARY KEY (codevar, num_com);


--
-- Name: saison saison_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.saison
    ADD CONSTRAINT saison_pkey PRIMARY KEY (nom);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (num_service);


--
-- Name: tarif tarif_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.tarif
    ADD CONSTRAINT tarif_pkey PRIMARY KEY (nomtarif);


--
-- Name: variete variete_pkey; Type: CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.variete
    ADD CONSTRAINT variete_pkey PRIMARY KEY (codevar);


--
-- Name: appartenir appartenir_id_emp_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.appartenir
    ADD CONSTRAINT appartenir_id_emp_fkey FOREIGN KEY (id_emp) REFERENCES projet.employe(id_emp);


--
-- Name: appartenir appartenir_num_service_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.appartenir
    ADD CONSTRAINT appartenir_num_service_fkey FOREIGN KEY (num_service) REFERENCES projet.service(num_service);


--
-- Name: article article_nom_cat_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.article
    ADD CONSTRAINT article_nom_cat_fkey FOREIGN KEY (nom_cat) REFERENCES projet.categorie(nom_cat);


--
-- Name: client client_nomtarif_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.client
    ADD CONSTRAINT client_nomtarif_fkey FOREIGN KEY (nomtarif) REFERENCES projet.tarif(nomtarif);


--
-- Name: commande commande_codecli_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.commande
    ADD CONSTRAINT commande_codecli_fkey FOREIGN KEY (codecli) REFERENCES projet.client(codecli);


--
-- Name: commande commande_id_emp_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.commande
    ADD CONSTRAINT commande_id_emp_fkey FOREIGN KEY (id_emp) REFERENCES projet.employe(id_emp);


--
-- Name: couter couter_codevar_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.couter
    ADD CONSTRAINT couter_codevar_fkey FOREIGN KEY (codevar) REFERENCES projet.variete(codevar);


--
-- Name: couter couter_nom_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.couter
    ADD CONSTRAINT couter_nom_fkey FOREIGN KEY (nom) REFERENCES projet.saison(nom);


--
-- Name: couter couter_nomtarif_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.couter
    ADD CONSTRAINT couter_nomtarif_fkey FOREIGN KEY (nomtarif) REFERENCES projet.tarif(nomtarif);


--
-- Name: images images_codevar_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.images
    ADD CONSTRAINT images_codevar_fkey FOREIGN KEY (codevar) REFERENCES projet.variete(codevar);


--
-- Name: posseder posseder_codevar_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.posseder
    ADD CONSTRAINT posseder_codevar_fkey FOREIGN KEY (codevar) REFERENCES projet.variete(codevar);


--
-- Name: posseder posseder_num_com_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.posseder
    ADD CONSTRAINT posseder_num_com_fkey FOREIGN KEY (num_com) REFERENCES projet.commande(num_com);


--
-- Name: variete variete_nomart_fkey; Type: FK CONSTRAINT; Schema: projet; Owner: mariyaconsta02
--

ALTER TABLE ONLY projet.variete
    ADD CONSTRAINT variete_nomart_fkey FOREIGN KEY (nomart) REFERENCES projet.article(nomart);


--
-- Name: SCHEMA projet; Type: ACL; Schema: -; Owner: mariyaconsta02
--

REVOKE ALL ON SCHEMA projet FROM PUBLIC;
GRANT ALL ON SCHEMA projet TO "thamiz.sarboudine" WITH GRANT OPTION;


--
-- Name: TABLE appartenir; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.appartenir FROM PUBLIC;
REVOKE ALL ON TABLE projet.appartenir FROM mariyaconsta02;
GRANT ALL ON TABLE projet.appartenir TO mariyaconsta02;
GRANT ALL ON TABLE projet.appartenir TO "thamiz.sarboudine";


--
-- Name: TABLE article; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.article FROM PUBLIC;
REVOKE ALL ON TABLE projet.article FROM mariyaconsta02;
GRANT ALL ON TABLE projet.article TO mariyaconsta02;
GRANT ALL ON TABLE projet.article TO "thamiz.sarboudine";


--
-- Name: TABLE categorie; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.categorie FROM PUBLIC;
REVOKE ALL ON TABLE projet.categorie FROM mariyaconsta02;
GRANT ALL ON TABLE projet.categorie TO mariyaconsta02;
GRANT ALL ON TABLE projet.categorie TO "thamiz.sarboudine";


--
-- Name: TABLE client; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.client FROM PUBLIC;
REVOKE ALL ON TABLE projet.client FROM mariyaconsta02;
GRANT ALL ON TABLE projet.client TO mariyaconsta02;
GRANT ALL ON TABLE projet.client TO "thamiz.sarboudine";


--
-- Name: TABLE commande; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.commande FROM PUBLIC;
REVOKE ALL ON TABLE projet.commande FROM mariyaconsta02;
GRANT ALL ON TABLE projet.commande TO mariyaconsta02;
GRANT ALL ON TABLE projet.commande TO "thamiz.sarboudine";


--
-- Name: TABLE couter; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.couter FROM PUBLIC;
REVOKE ALL ON TABLE projet.couter FROM mariyaconsta02;
GRANT ALL ON TABLE projet.couter TO mariyaconsta02;
GRANT ALL ON TABLE projet.couter TO "thamiz.sarboudine";


--
-- Name: TABLE employe; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.employe FROM PUBLIC;
REVOKE ALL ON TABLE projet.employe FROM mariyaconsta02;
GRANT ALL ON TABLE projet.employe TO mariyaconsta02;
GRANT ALL ON TABLE projet.employe TO "thamiz.sarboudine";


--
-- Name: TABLE images; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.images FROM PUBLIC;
REVOKE ALL ON TABLE projet.images FROM mariyaconsta02;
GRANT ALL ON TABLE projet.images TO mariyaconsta02;
GRANT ALL ON TABLE projet.images TO "thamiz.sarboudine";


--
-- Name: TABLE posseder; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.posseder FROM PUBLIC;
REVOKE ALL ON TABLE projet.posseder FROM mariyaconsta02;
GRANT ALL ON TABLE projet.posseder TO mariyaconsta02;
GRANT ALL ON TABLE projet.posseder TO "thamiz.sarboudine";


--
-- Name: TABLE saison; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.saison FROM PUBLIC;
REVOKE ALL ON TABLE projet.saison FROM mariyaconsta02;
GRANT ALL ON TABLE projet.saison TO mariyaconsta02;
GRANT ALL ON TABLE projet.saison TO "thamiz.sarboudine";


--
-- Name: TABLE service; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.service FROM PUBLIC;
REVOKE ALL ON TABLE projet.service FROM mariyaconsta02;
GRANT ALL ON TABLE projet.service TO mariyaconsta02;
GRANT ALL ON TABLE projet.service TO "thamiz.sarboudine";


--
-- Name: TABLE tarif; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.tarif FROM PUBLIC;
REVOKE ALL ON TABLE projet.tarif FROM mariyaconsta02;
GRANT ALL ON TABLE projet.tarif TO mariyaconsta02;
GRANT ALL ON TABLE projet.tarif TO "thamiz.sarboudine";


--
-- Name: TABLE variete; Type: ACL; Schema: projet; Owner: mariyaconsta02
--

REVOKE ALL ON TABLE projet.variete FROM PUBLIC;
REVOKE ALL ON TABLE projet.variete FROM mariyaconsta02;
GRANT ALL ON TABLE projet.variete TO mariyaconsta02;
GRANT ALL ON TABLE projet.variete TO "thamiz.sarboudine";


--
-- PostgreSQL database dump complete
--

