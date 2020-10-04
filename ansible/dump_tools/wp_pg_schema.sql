--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

-- Started on 2020-10-03 08:43:49 MSK

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

DROP DATABASE "wordpress";
--
-- TOC entry 3890 (class 1262 OID 16751)
-- Name: wordpress; Type: DATABASE; Schema: -; Owner: wordpress
--

CREATE DATABASE "wordpress" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE "wordpress" OWNER TO "wordpress";

\connect "wordpress"

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
-- TOC entry 1 (class 3079 OID 13794)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


--
-- TOC entry 221 (class 1255 OID 17806)
-- Name: field("anyelement", "anyarray"); Type: FUNCTION; Schema: public; Owner: wordpress
--

CREATE FUNCTION "wordpress"."field"("anyelement", VARIADIC "anyarray") RETURNS bigint
    LANGUAGE "sql" IMMUTABLE
    AS $_$
SELECT rownum
FROM (SELECT ROW_NUMBER() OVER () AS rownum, elem
	FROM unnest($2) elem) numbered
WHERE numbered.elem = $1
UNION ALL
SELECT 0
$_$;


ALTER FUNCTION "wordpress"."field"("anyelement", VARIADIC "anyarray") OWNER TO "wordpress";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16755)
-- Name: wp_commentmeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_commentmeta" (
    "meta_id" bigint NOT NULL,
    "comment_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_commentmeta" OWNER TO "wordpress";

--
-- TOC entry 198 (class 1259 OID 16753)
-- Name: wp_commentmeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_commentmeta_seq"
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_commentmeta_seq" OWNER TO "wordpress";

--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 198
-- Name: wp_commentmeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_commentmeta_seq" OWNED BY "wordpress"."wp_commentmeta"."meta_id";


--
-- TOC entry 201 (class 1259 OID 16765)
-- Name: wp_comments; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_comments" (
    "comment_ID" bigint NOT NULL,
    "comment_post_ID" bigint DEFAULT '0'::bigint NOT NULL,
    "comment_author" "text" NOT NULL,
    "comment_author_email" character varying(100) DEFAULT ''::character varying NOT NULL,
    "comment_author_url" character varying(200) DEFAULT ''::character varying NOT NULL,
    "comment_author_ip" character varying(100) DEFAULT ''::character varying NOT NULL,
    "comment_date" timestamp without time zone DEFAULT "now"() NOT NULL,
    "comment_date_gmt" timestamp without time zone DEFAULT "now"() NOT NULL,
    "comment_content" "text" NOT NULL,
    "comment_karma" integer DEFAULT 0 NOT NULL,
    "comment_approved" character varying(20) DEFAULT '1'::character varying NOT NULL,
    "comment_agent" character varying(255) DEFAULT ''::character varying NOT NULL,
    "comment_type" character varying(20) DEFAULT ''::character varying NOT NULL,
    "comment_parent" bigint DEFAULT '0'::bigint NOT NULL,
    "user_id" bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE "wordpress"."wp_comments" OWNER TO "wordpress";

--
-- TOC entry 200 (class 1259 OID 16763)
-- Name: wp_comments_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_comments_seq"
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_comments_seq" OWNER TO "wordpress";

--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 200
-- Name: wp_comments_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_comments_seq" OWNED BY "wordpress"."wp_comments"."comment_ID";


--
-- TOC entry 203 (class 1259 OID 16784)
-- Name: wp_links; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_links" (
    "link_id" bigint NOT NULL,
    "link_url" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_name" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_image" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_target" character varying(25) DEFAULT ''::character varying NOT NULL,
    "link_description" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_visible" character varying(20) DEFAULT 'Y'::character varying NOT NULL,
    "link_owner" bigint DEFAULT '1'::bigint NOT NULL,
    "link_rating" integer DEFAULT 0 NOT NULL,
    "link_updated" timestamp without time zone DEFAULT "now"() NOT NULL,
    "link_rel" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_notes" "text" NOT NULL,
    "link_rss" character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "wordpress"."wp_links" OWNER TO "wordpress";

--
-- TOC entry 202 (class 1259 OID 16782)
-- Name: wp_links_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_links_seq"
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_links_seq" OWNER TO "wordpress";

--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 202
-- Name: wp_links_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_links_seq" OWNED BY "wordpress"."wp_links"."link_id";


--
-- TOC entry 205 (class 1259 OID 16803)
-- Name: wp_options; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_options" (
    "option_id" bigint NOT NULL,
    "option_name" character varying(191) DEFAULT ''::character varying NOT NULL,
    "option_value" "text" NOT NULL,
    "autoload" character varying(20) DEFAULT 'yes'::character varying NOT NULL
);


ALTER TABLE "wordpress"."wp_options" OWNER TO "wordpress";

--
-- TOC entry 204 (class 1259 OID 16801)
-- Name: wp_options_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_options_seq"
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_options_seq" OWNER TO "wordpress";

--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 204
-- Name: wp_options_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_options_seq" OWNED BY "wordpress"."wp_options"."option_id";


--
-- TOC entry 207 (class 1259 OID 16814)
-- Name: wp_postmeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_postmeta" (
    "meta_id" bigint NOT NULL,
    "post_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_postmeta" OWNER TO "wordpress";

--
-- TOC entry 206 (class 1259 OID 16812)
-- Name: wp_postmeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_postmeta_seq"
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_postmeta_seq" OWNER TO "wordpress";

--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 206
-- Name: wp_postmeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_postmeta_seq" OWNED BY "wordpress"."wp_postmeta"."meta_id";


--
-- TOC entry 209 (class 1259 OID 16824)
-- Name: wp_posts; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_posts" (
    "ID" bigint NOT NULL,
    "post_author" bigint DEFAULT '0'::bigint NOT NULL,
    "post_date" timestamp without time zone DEFAULT "now"() NOT NULL,
    "post_date_gmt" timestamp without time zone DEFAULT "now"() NOT NULL,
    "post_content" "text" NOT NULL,
    "post_title" "text" NOT NULL,
    "post_excerpt" "text" NOT NULL,
    "post_status" character varying(20) DEFAULT 'publish'::character varying NOT NULL,
    "comment_status" character varying(20) DEFAULT 'open'::character varying NOT NULL,
    "ping_status" character varying(20) DEFAULT 'open'::character varying NOT NULL,
    "post_password" character varying(255) DEFAULT ''::character varying NOT NULL,
    "post_name" character varying(200) DEFAULT ''::character varying NOT NULL,
    "to_ping" "text" NOT NULL,
    "pinged" "text" NOT NULL,
    "post_modified" timestamp without time zone DEFAULT "now"() NOT NULL,
    "post_modified_gmt" timestamp without time zone DEFAULT "now"() NOT NULL,
    "post_content_filtered" "text" NOT NULL,
    "post_parent" bigint DEFAULT '0'::bigint NOT NULL,
    "guid" character varying(255) DEFAULT ''::character varying NOT NULL,
    "menu_order" integer DEFAULT 0 NOT NULL,
    "post_type" character varying(20) DEFAULT 'post'::character varying NOT NULL,
    "post_mime_type" character varying(100) DEFAULT ''::character varying NOT NULL,
    "comment_count" bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE "wordpress"."wp_posts" OWNER TO "wordpress";

--
-- TOC entry 208 (class 1259 OID 16822)
-- Name: wp_posts_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_posts_seq"
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_posts_seq" OWNER TO "wordpress";

--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 208
-- Name: wp_posts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_posts_seq" OWNED BY "wordpress"."wp_posts"."ID";


--
-- TOC entry 214 (class 1259 OID 16862)
-- Name: wp_term_relationships; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_term_relationships" (
    "object_id" bigint DEFAULT 0 NOT NULL,
    "term_taxonomy_id" bigint DEFAULT 0 NOT NULL,
    "term_order" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "wordpress"."wp_term_relationships" OWNER TO "wordpress";

--
-- TOC entry 216 (class 1259 OID 16873)
-- Name: wp_term_taxonomy; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_term_taxonomy" (
    "term_taxonomy_id" bigint NOT NULL,
    "term_id" bigint DEFAULT 0 NOT NULL,
    "taxonomy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "description" "text" NOT NULL,
    "parent" bigint DEFAULT 0 NOT NULL,
    "count" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE "wordpress"."wp_term_taxonomy" OWNER TO "wordpress";

--
-- TOC entry 215 (class 1259 OID 16871)
-- Name: wp_term_taxonomy_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_term_taxonomy_seq"
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_term_taxonomy_seq" OWNER TO "wordpress";

--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 215
-- Name: wp_term_taxonomy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_term_taxonomy_seq" OWNED BY "wordpress"."wp_term_taxonomy"."term_taxonomy_id";


--
-- TOC entry 211 (class 1259 OID 16845)
-- Name: wp_termmeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_termmeta" (
    "meta_id" bigint NOT NULL,
    "term_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_termmeta" OWNER TO "wordpress";

--
-- TOC entry 210 (class 1259 OID 16843)
-- Name: wp_termmeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_termmeta_seq"
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_termmeta_seq" OWNER TO "wordpress";

--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 210
-- Name: wp_termmeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_termmeta_seq" OWNED BY "wordpress"."wp_termmeta"."meta_id";


--
-- TOC entry 213 (class 1259 OID 16855)
-- Name: wp_terms; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_terms" (
    "term_id" bigint NOT NULL,
    "name" character varying(200) DEFAULT ''::character varying NOT NULL,
    "slug" character varying(200) DEFAULT ''::character varying NOT NULL,
    "term_group" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "wordpress"."wp_terms" OWNER TO "wordpress";

--
-- TOC entry 212 (class 1259 OID 16853)
-- Name: wp_terms_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_terms_seq"
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_terms_seq" OWNER TO "wordpress";

--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 212
-- Name: wp_terms_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_terms_seq" OWNED BY "wordpress"."wp_terms"."term_id";


--
-- TOC entry 218 (class 1259 OID 16886)
-- Name: wp_usermeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_usermeta" (
    "umeta_id" bigint NOT NULL,
    "user_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_usermeta" OWNER TO "wordpress";

--
-- TOC entry 217 (class 1259 OID 16884)
-- Name: wp_usermeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_usermeta_seq"
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_usermeta_seq" OWNER TO "wordpress";

--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 217
-- Name: wp_usermeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_usermeta_seq" OWNED BY "wordpress"."wp_usermeta"."umeta_id";


--
-- TOC entry 220 (class 1259 OID 16896)
-- Name: wp_users; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "wordpress"."wp_users" (
    "ID" bigint NOT NULL,
    "user_login" character varying(60) DEFAULT ''::character varying NOT NULL,
    "user_pass" character varying(255) DEFAULT ''::character varying NOT NULL,
    "user_nicename" character varying(50) DEFAULT ''::character varying NOT NULL,
    "user_email" character varying(100) DEFAULT ''::character varying NOT NULL,
    "user_url" character varying(100) DEFAULT ''::character varying NOT NULL,
    "user_registered" timestamp without time zone DEFAULT "now"() NOT NULL,
    "user_activation_key" character varying(255) DEFAULT ''::character varying NOT NULL,
    "user_status" integer DEFAULT 0 NOT NULL,
    "display_name" character varying(250) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "wordpress"."wp_users" OWNER TO "wordpress";

--
-- TOC entry 219 (class 1259 OID 16894)
-- Name: wp_users_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "wordpress"."wp_users_seq"
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_users_seq" OWNER TO "wordpress";

--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 219
-- Name: wp_users_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "wordpress"."wp_users_seq" OWNED BY "wordpress"."wp_users"."ID";


--
-- TOC entry 3615 (class 2604 OID 24234)
-- Name: wp_commentmeta meta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_commentmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"wordpress"."wp_commentmeta_seq"'::"regclass");


--
-- TOC entry 3617 (class 2604 OID 24235)
-- Name: wp_comments comment_ID; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_comments" ALTER COLUMN "comment_ID" SET DEFAULT "nextval"('"wordpress"."wp_comments_seq"'::"regclass");


--
-- TOC entry 3630 (class 2604 OID 24236)
-- Name: wp_links link_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_links" ALTER COLUMN "link_id" SET DEFAULT "nextval"('"wordpress"."wp_links_seq"'::"regclass");


--
-- TOC entry 3642 (class 2604 OID 24237)
-- Name: wp_options option_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_options" ALTER COLUMN "option_id" SET DEFAULT "nextval"('"wordpress"."wp_options_seq"'::"regclass");


--
-- TOC entry 3645 (class 2604 OID 24238)
-- Name: wp_postmeta meta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_postmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"wordpress"."wp_postmeta_seq"'::"regclass");


--
-- TOC entry 3647 (class 2604 OID 24239)
-- Name: wp_posts ID; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_posts" ALTER COLUMN "ID" SET DEFAULT "nextval"('"wordpress"."wp_posts_seq"'::"regclass");


--
-- TOC entry 3673 (class 2604 OID 24240)
-- Name: wp_term_taxonomy term_taxonomy_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_term_taxonomy" ALTER COLUMN "term_taxonomy_id" SET DEFAULT "nextval"('"wordpress"."wp_term_taxonomy_seq"'::"regclass");


--
-- TOC entry 3664 (class 2604 OID 24241)
-- Name: wp_termmeta meta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_termmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"wordpress"."wp_termmeta_seq"'::"regclass");


--
-- TOC entry 3666 (class 2604 OID 24242)
-- Name: wp_terms term_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_terms" ALTER COLUMN "term_id" SET DEFAULT "nextval"('"wordpress"."wp_terms_seq"'::"regclass");


--
-- TOC entry 3678 (class 2604 OID 24243)
-- Name: wp_usermeta umeta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_usermeta" ALTER COLUMN "umeta_id" SET DEFAULT "nextval"('"wordpress"."wp_usermeta_seq"'::"regclass");


--
-- TOC entry 3680 (class 2604 OID 24244)
-- Name: wp_users ID; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_users" ALTER COLUMN "ID" SET DEFAULT "nextval"('"wordpress"."wp_users_seq"'::"regclass");


--
-- TOC entry 3863 (class 0 OID 16755)
-- Dependencies: 199
-- Data for Name: wp_commentmeta; Type: TABLE DATA; Schema: public; Owner: wordpress
--

--
-- TOC entry 3691 (class 2606 OID 17780)
-- Name: wp_commentmeta idx_16755_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_commentmeta"
    ADD CONSTRAINT "idx_16755_primary" PRIMARY KEY ("meta_id");


--
-- TOC entry 3695 (class 2606 OID 17781)
-- Name: wp_comments idx_16765_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_comments"
    ADD CONSTRAINT "idx_16765_primary" PRIMARY KEY ("comment_ID");


--
-- TOC entry 3702 (class 2606 OID 17779)
-- Name: wp_links idx_16784_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_links"
    ADD CONSTRAINT "idx_16784_primary" PRIMARY KEY ("link_id");


--
-- TOC entry 3705 (class 2606 OID 17782)
-- Name: wp_options idx_16803_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_options"
    ADD CONSTRAINT "idx_16803_primary" PRIMARY KEY ("option_id");


--
-- TOC entry 3708 (class 2606 OID 17783)
-- Name: wp_postmeta idx_16814_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_postmeta"
    ADD CONSTRAINT "idx_16814_primary" PRIMARY KEY ("meta_id");


--
-- TOC entry 3712 (class 2606 OID 17790)
-- Name: wp_posts idx_16824_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_posts"
    ADD CONSTRAINT "idx_16824_primary" PRIMARY KEY ("ID");


--
-- TOC entry 3718 (class 2606 OID 17784)
-- Name: wp_termmeta idx_16845_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_termmeta"
    ADD CONSTRAINT "idx_16845_primary" PRIMARY KEY ("meta_id");


--
-- TOC entry 3722 (class 2606 OID 17787)
-- Name: wp_terms idx_16855_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_terms"
    ADD CONSTRAINT "idx_16855_primary" PRIMARY KEY ("term_id");


--
-- TOC entry 3726 (class 2606 OID 18011)
-- Name: wp_term_relationships idx_16862_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_term_relationships"
    ADD CONSTRAINT "idx_16862_primary" PRIMARY KEY ("object_id", "term_taxonomy_id");


--
-- TOC entry 3729 (class 2606 OID 17788)
-- Name: wp_term_taxonomy idx_16873_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_term_taxonomy"
    ADD CONSTRAINT "idx_16873_primary" PRIMARY KEY ("term_taxonomy_id");


--
-- TOC entry 3733 (class 2606 OID 17786)
-- Name: wp_usermeta idx_16886_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_usermeta"
    ADD CONSTRAINT "idx_16886_primary" PRIMARY KEY ("umeta_id");


--
-- TOC entry 3737 (class 2606 OID 17789)
-- Name: wp_users idx_16896_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "wordpress"."wp_users"
    ADD CONSTRAINT "idx_16896_primary" PRIMARY KEY ("ID");


--
-- TOC entry 3692 (class 1259 OID 18040)
-- Name: wp_commentmeta_comment_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_commentmeta_comment_id" ON "wordpress"."wp_commentmeta" USING "btree" ("comment_id");


--
-- TOC entry 3693 (class 1259 OID 18041)
-- Name: wp_commentmeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_commentmeta_meta_key" ON "wordpress"."wp_commentmeta" USING "btree" ("meta_key");


--
-- TOC entry 3696 (class 1259 OID 18119)
-- Name: wp_comments_comment_approved_date_gmt; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_approved_date_gmt" ON "wordpress"."wp_comments" USING "btree" ("comment_approved", "comment_date_gmt");


--
-- TOC entry 3697 (class 1259 OID 18122)
-- Name: wp_comments_comment_author_email; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_author_email" ON "wordpress"."wp_comments" USING "btree" ("comment_author_email");


--
-- TOC entry 3698 (class 1259 OID 18120)
-- Name: wp_comments_comment_date_gmt; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_date_gmt" ON "wordpress"."wp_comments" USING "btree" ("comment_date_gmt");


--
-- TOC entry 3699 (class 1259 OID 18121)
-- Name: wp_comments_comment_parent; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_parent" ON "wordpress"."wp_comments" USING "btree" ("comment_parent");


--
-- TOC entry 3700 (class 1259 OID 24207)
-- Name: wp_comments_comment_post_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_post_id" ON "wordpress"."wp_comments" USING "btree" ("comment_post_ID");


--
-- TOC entry 3703 (class 1259 OID 18155)
-- Name: wp_links_link_visible; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_links_link_visible" ON "wordpress"."wp_links" USING "btree" ("link_visible");


--
-- TOC entry 3706 (class 1259 OID 18156)
-- Name: wp_options_option_name; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE UNIQUE INDEX "wp_options_option_name" ON "wordpress"."wp_options" USING "btree" ("option_name");


--
-- TOC entry 3709 (class 1259 OID 18171)
-- Name: wp_postmeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_postmeta_meta_key" ON "wordpress"."wp_postmeta" USING "btree" ("meta_key");


--
-- TOC entry 3710 (class 1259 OID 18170)
-- Name: wp_postmeta_post_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_postmeta_post_id" ON "wordpress"."wp_postmeta" USING "btree" ("post_id");


--
-- TOC entry 3713 (class 1259 OID 24113)
-- Name: wp_posts_post_author; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_post_author" ON "wordpress"."wp_posts" USING "btree" ("post_author");


--
-- TOC entry 3714 (class 1259 OID 24111)
-- Name: wp_posts_post_name; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_post_name" ON "wordpress"."wp_posts" USING "btree" ("post_name");


--
-- TOC entry 3715 (class 1259 OID 24112)
-- Name: wp_posts_post_parent; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_post_parent" ON "wordpress"."wp_posts" USING "btree" ("post_parent");


--
-- TOC entry 3716 (class 1259 OID 24217)
-- Name: wp_posts_type_status_date; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_type_status_date" ON "wordpress"."wp_posts" USING "btree" ("post_type", "post_status", "post_date", "ID");


--
-- TOC entry 3727 (class 1259 OID 18026)
-- Name: wp_term_relationships_term_taxonomy_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_term_relationships_term_taxonomy_id" ON "wordpress"."wp_term_relationships" USING "btree" ("term_taxonomy_id");


--
-- TOC entry 3730 (class 1259 OID 17996)
-- Name: wp_term_taxonomy_taxonomy; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_term_taxonomy_taxonomy" ON "wordpress"."wp_term_taxonomy" USING "btree" ("taxonomy");


--
-- TOC entry 3731 (class 1259 OID 17995)
-- Name: wp_term_taxonomy_term_id_taxonomy; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE UNIQUE INDEX "wp_term_taxonomy_term_id_taxonomy" ON "wordpress"."wp_term_taxonomy" USING "btree" ("term_id", "taxonomy");


--
-- TOC entry 3719 (class 1259 OID 17959)
-- Name: wp_termmeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_termmeta_meta_key" ON "wordpress"."wp_termmeta" USING "btree" ("meta_key");


--
-- TOC entry 3720 (class 1259 OID 17958)
-- Name: wp_termmeta_term_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_termmeta_term_id" ON "wordpress"."wp_termmeta" USING "btree" ("term_id");


--
-- TOC entry 3723 (class 1259 OID 17969)
-- Name: wp_terms_name; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_terms_name" ON "wordpress"."wp_terms" USING "btree" ("name");


--
-- TOC entry 3724 (class 1259 OID 17968)
-- Name: wp_terms_slug; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_terms_slug" ON "wordpress"."wp_terms" USING "btree" ("slug");


--
-- TOC entry 3734 (class 1259 OID 17944)
-- Name: wp_usermeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_usermeta_meta_key" ON "wordpress"."wp_usermeta" USING "btree" ("meta_key");


--
-- TOC entry 3735 (class 1259 OID 17943)
-- Name: wp_usermeta_user_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_usermeta_user_id" ON "wordpress"."wp_usermeta" USING "btree" ("user_id");


--
-- TOC entry 3738 (class 1259 OID 17828)
-- Name: wp_users_user_email; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_users_user_email" ON "wordpress"."wp_users" USING "btree" ("user_email");


--
-- TOC entry 3739 (class 1259 OID 17826)
-- Name: wp_users_user_login_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_users_user_login_key" ON "wordpress"."wp_users" USING "btree" ("user_login");


--
-- TOC entry 3740 (class 1259 OID 17827)
-- Name: wp_users_user_nicename; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_users_user_nicename" ON "wordpress"."wp_users" USING "btree" ("user_nicename");
