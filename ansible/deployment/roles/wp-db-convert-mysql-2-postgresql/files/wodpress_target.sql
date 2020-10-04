--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

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
-- Name: wordpress; Type: DATABASE; Schema: -; Owner: wordpress
--

CREATE DATABASE "wordpress" WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';


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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


--
-- Name: field("anyelement", "anyarray"); Type: FUNCTION; Schema: public; Owner: wordpress
--

CREATE FUNCTION "public"."field"("anyelement", VARIADIC "anyarray") RETURNS bigint
    LANGUAGE "sql" IMMUTABLE
    AS $_$
SELECT rownum
FROM (SELECT ROW_NUMBER() OVER () AS rownum, elem
	FROM unnest($2) elem) numbered
WHERE numbered.elem = $1
UNION ALL
SELECT 0
$_$;


ALTER FUNCTION "public"."field"("anyelement", VARIADIC "anyarray") OWNER TO "wordpress";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: wp_commentmeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_commentmeta" (
    "meta_id" bigint NOT NULL,
    "comment_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "public"."wp_commentmeta" OWNER TO "wordpress";

--
-- Name: wp_commentmeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_commentmeta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_commentmeta_seq" OWNER TO "wordpress";

--
-- Name: wp_commentmeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_commentmeta_seq" OWNED BY "public"."wp_commentmeta"."meta_id";


--
-- Name: wp_comments; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_comments" (
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


ALTER TABLE "public"."wp_comments" OWNER TO "wordpress";

--
-- Name: wp_comments_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_comments_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_comments_seq" OWNER TO "wordpress";

--
-- Name: wp_comments_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_comments_seq" OWNED BY "public"."wp_comments"."comment_ID";


--
-- Name: wp_links; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_links" (
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


ALTER TABLE "public"."wp_links" OWNER TO "wordpress";

--
-- Name: wp_links_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_links_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_links_seq" OWNER TO "wordpress";

--
-- Name: wp_links_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_links_seq" OWNED BY "public"."wp_links"."link_id";


--
-- Name: wp_options; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_options" (
    "option_id" bigint NOT NULL,
    "option_name" character varying(191) DEFAULT ''::character varying NOT NULL,
    "option_value" "text" NOT NULL,
    "autoload" character varying(20) DEFAULT 'yes'::character varying NOT NULL
);


ALTER TABLE "public"."wp_options" OWNER TO "wordpress";

--
-- Name: wp_options_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_options_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_options_seq" OWNER TO "wordpress";

--
-- Name: wp_options_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_options_seq" OWNED BY "public"."wp_options"."option_id";


--
-- Name: wp_postmeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_postmeta" (
    "meta_id" bigint NOT NULL,
    "post_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "public"."wp_postmeta" OWNER TO "wordpress";

--
-- Name: wp_postmeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_postmeta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_postmeta_seq" OWNER TO "wordpress";

--
-- Name: wp_postmeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_postmeta_seq" OWNED BY "public"."wp_postmeta"."meta_id";


--
-- Name: wp_posts; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_posts" (
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


ALTER TABLE "public"."wp_posts" OWNER TO "wordpress";

--
-- Name: wp_posts_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_posts_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_posts_seq" OWNER TO "wordpress";

--
-- Name: wp_posts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_posts_seq" OWNED BY "public"."wp_posts"."ID";


--
-- Name: wp_term_relationships; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_term_relationships" (
    "object_id" bigint DEFAULT 0 NOT NULL,
    "term_taxonomy_id" bigint DEFAULT 0 NOT NULL,
    "term_order" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."wp_term_relationships" OWNER TO "wordpress";

--
-- Name: wp_term_taxonomy; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_term_taxonomy" (
    "term_taxonomy_id" bigint NOT NULL,
    "term_id" bigint DEFAULT 0 NOT NULL,
    "taxonomy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "description" "text" NOT NULL,
    "parent" bigint DEFAULT 0 NOT NULL,
    "count" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."wp_term_taxonomy" OWNER TO "wordpress";

--
-- Name: wp_term_taxonomy_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_term_taxonomy_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_term_taxonomy_seq" OWNER TO "wordpress";

--
-- Name: wp_term_taxonomy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_term_taxonomy_seq" OWNED BY "public"."wp_term_taxonomy"."term_taxonomy_id";


--
-- Name: wp_termmeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_termmeta" (
    "meta_id" bigint NOT NULL,
    "term_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "public"."wp_termmeta" OWNER TO "wordpress";

--
-- Name: wp_termmeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_termmeta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_termmeta_seq" OWNER TO "wordpress";

--
-- Name: wp_termmeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_termmeta_seq" OWNED BY "public"."wp_termmeta"."meta_id";


--
-- Name: wp_terms; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_terms" (
    "term_id" bigint NOT NULL,
    "name" character varying(200) DEFAULT ''::character varying NOT NULL,
    "slug" character varying(200) DEFAULT ''::character varying NOT NULL,
    "term_group" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."wp_terms" OWNER TO "wordpress";

--
-- Name: wp_terms_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_terms_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_terms_seq" OWNER TO "wordpress";

--
-- Name: wp_terms_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_terms_seq" OWNED BY "public"."wp_terms"."term_id";


--
-- Name: wp_usermeta; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_usermeta" (
    "umeta_id" bigint NOT NULL,
    "user_id" bigint DEFAULT '0'::bigint NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "public"."wp_usermeta" OWNER TO "wordpress";

--
-- Name: wp_usermeta_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_usermeta_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_usermeta_seq" OWNER TO "wordpress";

--
-- Name: wp_usermeta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_usermeta_seq" OWNED BY "public"."wp_usermeta"."umeta_id";


--
-- Name: wp_users; Type: TABLE; Schema: public; Owner: wordpress
--

CREATE TABLE "public"."wp_users" (
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


ALTER TABLE "public"."wp_users" OWNER TO "wordpress";

--
-- Name: wp_users_seq; Type: SEQUENCE; Schema: public; Owner: wordpress
--

CREATE SEQUENCE "public"."wp_users_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."wp_users_seq" OWNER TO "wordpress";

--
-- Name: wp_users_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: wordpress
--

ALTER SEQUENCE "public"."wp_users_seq" OWNED BY "public"."wp_users"."ID";


--
-- Name: wp_commentmeta meta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_commentmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"public"."wp_commentmeta_seq"'::"regclass");


--
-- Name: wp_comments comment_ID; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_comments" ALTER COLUMN "comment_ID" SET DEFAULT "nextval"('"public"."wp_comments_seq"'::"regclass");


--
-- Name: wp_links link_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_links" ALTER COLUMN "link_id" SET DEFAULT "nextval"('"public"."wp_links_seq"'::"regclass");


--
-- Name: wp_options option_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_options" ALTER COLUMN "option_id" SET DEFAULT "nextval"('"public"."wp_options_seq"'::"regclass");


--
-- Name: wp_postmeta meta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_postmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"public"."wp_postmeta_seq"'::"regclass");


--
-- Name: wp_posts ID; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_posts" ALTER COLUMN "ID" SET DEFAULT "nextval"('"public"."wp_posts_seq"'::"regclass");


--
-- Name: wp_term_taxonomy term_taxonomy_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_term_taxonomy" ALTER COLUMN "term_taxonomy_id" SET DEFAULT "nextval"('"public"."wp_term_taxonomy_seq"'::"regclass");


--
-- Name: wp_termmeta meta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_termmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"public"."wp_termmeta_seq"'::"regclass");


--
-- Name: wp_terms term_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_terms" ALTER COLUMN "term_id" SET DEFAULT "nextval"('"public"."wp_terms_seq"'::"regclass");


--
-- Name: wp_usermeta umeta_id; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_usermeta" ALTER COLUMN "umeta_id" SET DEFAULT "nextval"('"public"."wp_usermeta_seq"'::"regclass");


--
-- Name: wp_users ID; Type: DEFAULT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_users" ALTER COLUMN "ID" SET DEFAULT "nextval"('"public"."wp_users_seq"'::"regclass");


--
-- Name: wp_commentmeta idx_16755_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_commentmeta"
    ADD CONSTRAINT "idx_16755_primary" PRIMARY KEY ("meta_id");


--
-- Name: wp_comments idx_16765_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_comments"
    ADD CONSTRAINT "idx_16765_primary" PRIMARY KEY ("comment_ID");


--
-- Name: wp_links idx_16784_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_links"
    ADD CONSTRAINT "idx_16784_primary" PRIMARY KEY ("link_id");


--
-- Name: wp_options idx_16803_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_options"
    ADD CONSTRAINT "idx_16803_primary" PRIMARY KEY ("option_id");


--
-- Name: wp_postmeta idx_16814_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_postmeta"
    ADD CONSTRAINT "idx_16814_primary" PRIMARY KEY ("meta_id");


--
-- Name: wp_posts idx_16824_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_posts"
    ADD CONSTRAINT "idx_16824_primary" PRIMARY KEY ("ID");


--
-- Name: wp_termmeta idx_16845_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_termmeta"
    ADD CONSTRAINT "idx_16845_primary" PRIMARY KEY ("meta_id");


--
-- Name: wp_terms idx_16855_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_terms"
    ADD CONSTRAINT "idx_16855_primary" PRIMARY KEY ("term_id");


--
-- Name: wp_term_relationships idx_16862_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_term_relationships"
    ADD CONSTRAINT "idx_16862_primary" PRIMARY KEY ("object_id", "term_taxonomy_id");


--
-- Name: wp_term_taxonomy idx_16873_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_term_taxonomy"
    ADD CONSTRAINT "idx_16873_primary" PRIMARY KEY ("term_taxonomy_id");


--
-- Name: wp_usermeta idx_16886_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_usermeta"
    ADD CONSTRAINT "idx_16886_primary" PRIMARY KEY ("umeta_id");


--
-- Name: wp_users idx_16896_primary; Type: CONSTRAINT; Schema: public; Owner: wordpress
--

ALTER TABLE ONLY "public"."wp_users"
    ADD CONSTRAINT "idx_16896_primary" PRIMARY KEY ("ID");


--
-- Name: wp_commentmeta_comment_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_commentmeta_comment_id" ON "public"."wp_commentmeta" USING "btree" ("comment_id");


--
-- Name: wp_commentmeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_commentmeta_meta_key" ON "public"."wp_commentmeta" USING "btree" ("meta_key");


--
-- Name: wp_comments_comment_approved_date_gmt; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_approved_date_gmt" ON "public"."wp_comments" USING "btree" ("comment_approved", "comment_date_gmt");


--
-- Name: wp_comments_comment_author_email; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_author_email" ON "public"."wp_comments" USING "btree" ("comment_author_email");


--
-- Name: wp_comments_comment_date_gmt; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_date_gmt" ON "public"."wp_comments" USING "btree" ("comment_date_gmt");


--
-- Name: wp_comments_comment_parent; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_parent" ON "public"."wp_comments" USING "btree" ("comment_parent");


--
-- Name: wp_comments_comment_post_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_comments_comment_post_id" ON "public"."wp_comments" USING "btree" ("comment_post_ID");


--
-- Name: wp_links_link_visible; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_links_link_visible" ON "public"."wp_links" USING "btree" ("link_visible");


--
-- Name: wp_options_option_name; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE UNIQUE INDEX "wp_options_option_name" ON "public"."wp_options" USING "btree" ("option_name");


--
-- Name: wp_postmeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_postmeta_meta_key" ON "public"."wp_postmeta" USING "btree" ("meta_key");


--
-- Name: wp_postmeta_post_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_postmeta_post_id" ON "public"."wp_postmeta" USING "btree" ("post_id");


--
-- Name: wp_posts_post_author; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_post_author" ON "public"."wp_posts" USING "btree" ("post_author");


--
-- Name: wp_posts_post_name; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_post_name" ON "public"."wp_posts" USING "btree" ("post_name");


--
-- Name: wp_posts_post_parent; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_post_parent" ON "public"."wp_posts" USING "btree" ("post_parent");


--
-- Name: wp_posts_type_status_date; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_posts_type_status_date" ON "public"."wp_posts" USING "btree" ("post_type", "post_status", "post_date", "ID");


--
-- Name: wp_term_relationships_term_taxonomy_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_term_relationships_term_taxonomy_id" ON "public"."wp_term_relationships" USING "btree" ("term_taxonomy_id");


--
-- Name: wp_term_taxonomy_taxonomy; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_term_taxonomy_taxonomy" ON "public"."wp_term_taxonomy" USING "btree" ("taxonomy");


--
-- Name: wp_term_taxonomy_term_id_taxonomy; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE UNIQUE INDEX "wp_term_taxonomy_term_id_taxonomy" ON "public"."wp_term_taxonomy" USING "btree" ("term_id", "taxonomy");


--
-- Name: wp_termmeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_termmeta_meta_key" ON "public"."wp_termmeta" USING "btree" ("meta_key");


--
-- Name: wp_termmeta_term_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_termmeta_term_id" ON "public"."wp_termmeta" USING "btree" ("term_id");


--
-- Name: wp_terms_name; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_terms_name" ON "public"."wp_terms" USING "btree" ("name");


--
-- Name: wp_terms_slug; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_terms_slug" ON "public"."wp_terms" USING "btree" ("slug");


--
-- Name: wp_usermeta_meta_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_usermeta_meta_key" ON "public"."wp_usermeta" USING "btree" ("meta_key");


--
-- Name: wp_usermeta_user_id; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_usermeta_user_id" ON "public"."wp_usermeta" USING "btree" ("user_id");


--
-- Name: wp_users_user_email; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_users_user_email" ON "public"."wp_users" USING "btree" ("user_email");


--
-- Name: wp_users_user_login_key; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_users_user_login_key" ON "public"."wp_users" USING "btree" ("user_login");


--
-- Name: wp_users_user_nicename; Type: INDEX; Schema: public; Owner: wordpress
--

CREATE INDEX "wp_users_user_nicename" ON "public"."wp_users" USING "btree" ("user_nicename");


--
-- Name: SCHEMA "pg_catalog"; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA "pg_catalog" TO "wordpress";


--
-- PostgreSQL database dump complete
--

