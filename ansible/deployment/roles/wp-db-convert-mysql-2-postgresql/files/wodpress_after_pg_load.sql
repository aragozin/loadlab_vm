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

DROP DATABASE "wordpress2";
--
-- Name: wordpress2; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE "wordpress2" WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE "wordpress2" OWNER TO "root";

\connect "wordpress2"

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
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- Name: wordpress; Type: SCHEMA; Schema: -; Owner: root
--

CREATE SCHEMA "wordpress";


ALTER SCHEMA "wordpress" OWNER TO "root";

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: wp_commentmeta; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_commentmeta" (
    "meta_id" bigint NOT NULL,
    "comment_id" numeric DEFAULT '0'::numeric NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_commentmeta" OWNER TO "root";

--
-- Name: wp_commentmeta_meta_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_commentmeta_meta_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_commentmeta_meta_id_seq" OWNER TO "root";

--
-- Name: wp_commentmeta_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_commentmeta_meta_id_seq" OWNED BY "wordpress"."wp_commentmeta"."meta_id";


--
-- Name: wp_comments; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_comments" (
    "comment_id" bigint NOT NULL,
    "comment_post_id" numeric DEFAULT '0'::numeric NOT NULL,
    "comment_author" "text" NOT NULL,
    "comment_author_email" character varying(100) DEFAULT ''::character varying NOT NULL,
    "comment_author_url" character varying(200) DEFAULT ''::character varying NOT NULL,
    "comment_author_ip" character varying(100) DEFAULT ''::character varying NOT NULL,
    "comment_date" timestamp with time zone,
    "comment_date_gmt" timestamp with time zone,
    "comment_content" "text" NOT NULL,
    "comment_karma" bigint DEFAULT '0'::bigint NOT NULL,
    "comment_approved" character varying(20) DEFAULT '1'::character varying NOT NULL,
    "comment_agent" character varying(255) DEFAULT ''::character varying NOT NULL,
    "comment_type" character varying(20) DEFAULT ''::character varying NOT NULL,
    "comment_parent" numeric DEFAULT '0'::numeric NOT NULL,
    "user_id" numeric DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE "wordpress"."wp_comments" OWNER TO "root";

--
-- Name: wp_comments_comment_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_comments_comment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_comments_comment_id_seq" OWNER TO "root";

--
-- Name: wp_comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_comments_comment_id_seq" OWNED BY "wordpress"."wp_comments"."comment_id";


--
-- Name: wp_links; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_links" (
    "link_id" bigint NOT NULL,
    "link_url" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_name" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_image" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_target" character varying(25) DEFAULT ''::character varying NOT NULL,
    "link_description" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_visible" character varying(20) DEFAULT 'Y'::character varying NOT NULL,
    "link_owner" numeric DEFAULT '1'::numeric NOT NULL,
    "link_rating" bigint DEFAULT '0'::bigint NOT NULL,
    "link_updated" timestamp with time zone,
    "link_rel" character varying(255) DEFAULT ''::character varying NOT NULL,
    "link_notes" "text" NOT NULL,
    "link_rss" character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "wordpress"."wp_links" OWNER TO "root";

--
-- Name: wp_links_link_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_links_link_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_links_link_id_seq" OWNER TO "root";

--
-- Name: wp_links_link_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_links_link_id_seq" OWNED BY "wordpress"."wp_links"."link_id";


--
-- Name: wp_options; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_options" (
    "option_id" bigint NOT NULL,
    "option_name" character varying(191) DEFAULT ''::character varying NOT NULL,
    "option_value" "text" NOT NULL,
    "autoload" character varying(20) DEFAULT 'yes'::character varying NOT NULL
);


ALTER TABLE "wordpress"."wp_options" OWNER TO "root";

--
-- Name: wp_options_option_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_options_option_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_options_option_id_seq" OWNER TO "root";

--
-- Name: wp_options_option_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_options_option_id_seq" OWNED BY "wordpress"."wp_options"."option_id";


--
-- Name: wp_postmeta; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_postmeta" (
    "meta_id" bigint NOT NULL,
    "post_id" numeric DEFAULT '0'::numeric NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_postmeta" OWNER TO "root";

--
-- Name: wp_postmeta_meta_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_postmeta_meta_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_postmeta_meta_id_seq" OWNER TO "root";

--
-- Name: wp_postmeta_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_postmeta_meta_id_seq" OWNED BY "wordpress"."wp_postmeta"."meta_id";


--
-- Name: wp_posts; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_posts" (
    "id" bigint NOT NULL,
    "post_author" numeric DEFAULT '0'::numeric NOT NULL,
    "post_date" timestamp with time zone,
    "post_date_gmt" timestamp with time zone,
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
    "post_modified" timestamp with time zone,
    "post_modified_gmt" timestamp with time zone,
    "post_content_filtered" "text" NOT NULL,
    "post_parent" numeric DEFAULT '0'::numeric NOT NULL,
    "guid" character varying(255) DEFAULT ''::character varying NOT NULL,
    "menu_order" bigint DEFAULT '0'::bigint NOT NULL,
    "post_type" character varying(20) DEFAULT 'post'::character varying NOT NULL,
    "post_mime_type" character varying(100) DEFAULT ''::character varying NOT NULL,
    "comment_count" bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE "wordpress"."wp_posts" OWNER TO "root";

--
-- Name: wp_posts_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_posts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_posts_id_seq" OWNER TO "root";

--
-- Name: wp_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_posts_id_seq" OWNED BY "wordpress"."wp_posts"."id";


--
-- Name: wp_term_relationships; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_term_relationships" (
    "object_id" numeric DEFAULT '0'::numeric NOT NULL,
    "term_taxonomy_id" numeric DEFAULT '0'::numeric NOT NULL,
    "term_order" bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE "wordpress"."wp_term_relationships" OWNER TO "root";

--
-- Name: wp_term_taxonomy; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_term_taxonomy" (
    "term_taxonomy_id" bigint NOT NULL,
    "term_id" numeric DEFAULT '0'::numeric NOT NULL,
    "taxonomy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "description" "text" NOT NULL,
    "parent" numeric DEFAULT '0'::numeric NOT NULL,
    "count" bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE "wordpress"."wp_term_taxonomy" OWNER TO "root";

--
-- Name: wp_term_taxonomy_term_taxonomy_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_term_taxonomy_term_taxonomy_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_term_taxonomy_term_taxonomy_id_seq" OWNER TO "root";

--
-- Name: wp_term_taxonomy_term_taxonomy_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_term_taxonomy_term_taxonomy_id_seq" OWNED BY "wordpress"."wp_term_taxonomy"."term_taxonomy_id";


--
-- Name: wp_termmeta; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_termmeta" (
    "meta_id" bigint NOT NULL,
    "term_id" numeric DEFAULT '0'::numeric NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_termmeta" OWNER TO "root";

--
-- Name: wp_termmeta_meta_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_termmeta_meta_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_termmeta_meta_id_seq" OWNER TO "root";

--
-- Name: wp_termmeta_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_termmeta_meta_id_seq" OWNED BY "wordpress"."wp_termmeta"."meta_id";


--
-- Name: wp_terms; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_terms" (
    "term_id" bigint NOT NULL,
    "name" character varying(200) DEFAULT ''::character varying NOT NULL,
    "slug" character varying(200) DEFAULT ''::character varying NOT NULL,
    "term_group" bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE "wordpress"."wp_terms" OWNER TO "root";

--
-- Name: wp_terms_term_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_terms_term_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_terms_term_id_seq" OWNER TO "root";

--
-- Name: wp_terms_term_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_terms_term_id_seq" OWNED BY "wordpress"."wp_terms"."term_id";


--
-- Name: wp_usermeta; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_usermeta" (
    "umeta_id" bigint NOT NULL,
    "user_id" numeric DEFAULT '0'::numeric NOT NULL,
    "meta_key" character varying(255),
    "meta_value" "text"
);


ALTER TABLE "wordpress"."wp_usermeta" OWNER TO "root";

--
-- Name: wp_usermeta_umeta_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_usermeta_umeta_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_usermeta_umeta_id_seq" OWNER TO "root";

--
-- Name: wp_usermeta_umeta_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_usermeta_umeta_id_seq" OWNED BY "wordpress"."wp_usermeta"."umeta_id";


--
-- Name: wp_users; Type: TABLE; Schema: wordpress; Owner: root
--

CREATE TABLE "wordpress"."wp_users" (
    "id" bigint NOT NULL,
    "user_login" character varying(60) DEFAULT ''::character varying NOT NULL,
    "user_pass" character varying(255) DEFAULT ''::character varying NOT NULL,
    "user_nicename" character varying(50) DEFAULT ''::character varying NOT NULL,
    "user_email" character varying(100) DEFAULT ''::character varying NOT NULL,
    "user_url" character varying(100) DEFAULT ''::character varying NOT NULL,
    "user_registered" timestamp with time zone,
    "user_activation_key" character varying(255) DEFAULT ''::character varying NOT NULL,
    "user_status" bigint DEFAULT '0'::bigint NOT NULL,
    "display_name" character varying(250) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE "wordpress"."wp_users" OWNER TO "root";

--
-- Name: wp_users_id_seq; Type: SEQUENCE; Schema: wordpress; Owner: root
--

CREATE SEQUENCE "wordpress"."wp_users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "wordpress"."wp_users_id_seq" OWNER TO "root";

--
-- Name: wp_users_id_seq; Type: SEQUENCE OWNED BY; Schema: wordpress; Owner: root
--

ALTER SEQUENCE "wordpress"."wp_users_id_seq" OWNED BY "wordpress"."wp_users"."id";


--
-- Name: wp_commentmeta meta_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_commentmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"wordpress"."wp_commentmeta_meta_id_seq"'::"regclass");


--
-- Name: wp_comments comment_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_comments" ALTER COLUMN "comment_id" SET DEFAULT "nextval"('"wordpress"."wp_comments_comment_id_seq"'::"regclass");


--
-- Name: wp_links link_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_links" ALTER COLUMN "link_id" SET DEFAULT "nextval"('"wordpress"."wp_links_link_id_seq"'::"regclass");


--
-- Name: wp_options option_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_options" ALTER COLUMN "option_id" SET DEFAULT "nextval"('"wordpress"."wp_options_option_id_seq"'::"regclass");


--
-- Name: wp_postmeta meta_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_postmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"wordpress"."wp_postmeta_meta_id_seq"'::"regclass");


--
-- Name: wp_posts id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_posts" ALTER COLUMN "id" SET DEFAULT "nextval"('"wordpress"."wp_posts_id_seq"'::"regclass");


--
-- Name: wp_term_taxonomy term_taxonomy_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_term_taxonomy" ALTER COLUMN "term_taxonomy_id" SET DEFAULT "nextval"('"wordpress"."wp_term_taxonomy_term_taxonomy_id_seq"'::"regclass");


--
-- Name: wp_termmeta meta_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_termmeta" ALTER COLUMN "meta_id" SET DEFAULT "nextval"('"wordpress"."wp_termmeta_meta_id_seq"'::"regclass");


--
-- Name: wp_terms term_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_terms" ALTER COLUMN "term_id" SET DEFAULT "nextval"('"wordpress"."wp_terms_term_id_seq"'::"regclass");


--
-- Name: wp_usermeta umeta_id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_usermeta" ALTER COLUMN "umeta_id" SET DEFAULT "nextval"('"wordpress"."wp_usermeta_umeta_id_seq"'::"regclass");


--
-- Name: wp_users id; Type: DEFAULT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_users" ALTER COLUMN "id" SET DEFAULT "nextval"('"wordpress"."wp_users_id_seq"'::"regclass");


--
-- Name: wp_commentmeta idx_26349_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_commentmeta"
    ADD CONSTRAINT "idx_26349_primary" PRIMARY KEY ("meta_id");


--
-- Name: wp_comments idx_26359_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_comments"
    ADD CONSTRAINT "idx_26359_primary" PRIMARY KEY ("comment_id");


--
-- Name: wp_links idx_26378_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_links"
    ADD CONSTRAINT "idx_26378_primary" PRIMARY KEY ("link_id");


--
-- Name: wp_options idx_26397_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_options"
    ADD CONSTRAINT "idx_26397_primary" PRIMARY KEY ("option_id");


--
-- Name: wp_postmeta idx_26408_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_postmeta"
    ADD CONSTRAINT "idx_26408_primary" PRIMARY KEY ("meta_id");


--
-- Name: wp_posts idx_26418_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_posts"
    ADD CONSTRAINT "idx_26418_primary" PRIMARY KEY ("id");


--
-- Name: wp_termmeta idx_26439_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_termmeta"
    ADD CONSTRAINT "idx_26439_primary" PRIMARY KEY ("meta_id");


--
-- Name: wp_terms idx_26449_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_terms"
    ADD CONSTRAINT "idx_26449_primary" PRIMARY KEY ("term_id");


--
-- Name: wp_term_relationships idx_26456_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_term_relationships"
    ADD CONSTRAINT "idx_26456_primary" PRIMARY KEY ("object_id", "term_taxonomy_id");


--
-- Name: wp_term_taxonomy idx_26467_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_term_taxonomy"
    ADD CONSTRAINT "idx_26467_primary" PRIMARY KEY ("term_taxonomy_id");


--
-- Name: wp_usermeta idx_26480_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_usermeta"
    ADD CONSTRAINT "idx_26480_primary" PRIMARY KEY ("umeta_id");


--
-- Name: wp_users idx_26490_primary; Type: CONSTRAINT; Schema: wordpress; Owner: root
--

ALTER TABLE ONLY "wordpress"."wp_users"
    ADD CONSTRAINT "idx_26490_primary" PRIMARY KEY ("id");


--
-- Name: idx_26349_comment_id; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26349_comment_id" ON "wordpress"."wp_commentmeta" USING "btree" ("comment_id");


--
-- Name: idx_26349_meta_key; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26349_meta_key" ON "wordpress"."wp_commentmeta" USING "btree" ("meta_key");


--
-- Name: idx_26359_comment_approved_date_gmt; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26359_comment_approved_date_gmt" ON "wordpress"."wp_comments" USING "btree" ("comment_approved", "comment_date_gmt");


--
-- Name: idx_26359_comment_author_email; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26359_comment_author_email" ON "wordpress"."wp_comments" USING "btree" ("comment_author_email");


--
-- Name: idx_26359_comment_date_gmt; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26359_comment_date_gmt" ON "wordpress"."wp_comments" USING "btree" ("comment_date_gmt");


--
-- Name: idx_26359_comment_parent; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26359_comment_parent" ON "wordpress"."wp_comments" USING "btree" ("comment_parent");


--
-- Name: idx_26359_comment_post_id; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26359_comment_post_id" ON "wordpress"."wp_comments" USING "btree" ("comment_post_id");


--
-- Name: idx_26378_link_visible; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26378_link_visible" ON "wordpress"."wp_links" USING "btree" ("link_visible");


--
-- Name: idx_26397_option_name; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE UNIQUE INDEX "idx_26397_option_name" ON "wordpress"."wp_options" USING "btree" ("option_name");


--
-- Name: idx_26408_meta_key; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26408_meta_key" ON "wordpress"."wp_postmeta" USING "btree" ("meta_key");


--
-- Name: idx_26408_post_id; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26408_post_id" ON "wordpress"."wp_postmeta" USING "btree" ("post_id");


--
-- Name: idx_26418_post_author; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26418_post_author" ON "wordpress"."wp_posts" USING "btree" ("post_author");


--
-- Name: idx_26418_post_name; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26418_post_name" ON "wordpress"."wp_posts" USING "btree" ("post_name");


--
-- Name: idx_26418_post_parent; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26418_post_parent" ON "wordpress"."wp_posts" USING "btree" ("post_parent");


--
-- Name: idx_26418_type_status_date; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26418_type_status_date" ON "wordpress"."wp_posts" USING "btree" ("post_type", "post_status", "post_date", "id");


--
-- Name: idx_26439_meta_key; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26439_meta_key" ON "wordpress"."wp_termmeta" USING "btree" ("meta_key");


--
-- Name: idx_26439_term_id; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26439_term_id" ON "wordpress"."wp_termmeta" USING "btree" ("term_id");


--
-- Name: idx_26449_name; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26449_name" ON "wordpress"."wp_terms" USING "btree" ("name");


--
-- Name: idx_26449_slug; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26449_slug" ON "wordpress"."wp_terms" USING "btree" ("slug");


--
-- Name: idx_26456_term_taxonomy_id; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26456_term_taxonomy_id" ON "wordpress"."wp_term_relationships" USING "btree" ("term_taxonomy_id");


--
-- Name: idx_26467_taxonomy; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26467_taxonomy" ON "wordpress"."wp_term_taxonomy" USING "btree" ("taxonomy");


--
-- Name: idx_26467_term_id_taxonomy; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE UNIQUE INDEX "idx_26467_term_id_taxonomy" ON "wordpress"."wp_term_taxonomy" USING "btree" ("term_id", "taxonomy");


--
-- Name: idx_26480_meta_key; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26480_meta_key" ON "wordpress"."wp_usermeta" USING "btree" ("meta_key");


--
-- Name: idx_26480_user_id; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26480_user_id" ON "wordpress"."wp_usermeta" USING "btree" ("user_id");


--
-- Name: idx_26490_user_email; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26490_user_email" ON "wordpress"."wp_users" USING "btree" ("user_email");


--
-- Name: idx_26490_user_login_key; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26490_user_login_key" ON "wordpress"."wp_users" USING "btree" ("user_login");


--
-- Name: idx_26490_user_nicename; Type: INDEX; Schema: wordpress; Owner: root
--

CREATE INDEX "idx_26490_user_nicename" ON "wordpress"."wp_users" USING "btree" ("user_nicename");


--
-- Name: SCHEMA "public"; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA "public" TO PUBLIC;


--
-- PostgreSQL database dump complete
--

