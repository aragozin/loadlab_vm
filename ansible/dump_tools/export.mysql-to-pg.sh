#!/bin/sh

ssh database << EOF

yum install pgloader
dropdb wordpress2 || true

createdb wordpress2

pgloader --with "quote identifiers" mysql://root@localhost/wordpress postgresql:///wordpress2

psql wordpress2 << EOS

ALTER DATABASE "wordpress" OWNER TO "wordpress";
ALTER SCHEMA "wordpress" OWNER TO "wordpress";
ALTER TABLE wordpress.wp_commentmeta OWNER TO "wordpress";
ALTER TABLE wordpress.wp_commentmeta_meta_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_comments OWNER TO "wordpress";
ALTER TABLE wordpress.wp_comments_comment_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_links OWNER TO "wordpress";
ALTER TABLE wordpress.wp_links_link_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_options OWNER TO "wordpress";
ALTER TABLE wordpress.wp_options_option_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_postmeta OWNER TO "wordpress";
ALTER TABLE wordpress.wp_postmeta_meta_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_posts OWNER TO "wordpress";
ALTER TABLE wordpress.wp_posts_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_term_relationships OWNER TO "wordpress";
ALTER TABLE wordpress.wp_term_taxonomy OWNER TO "wordpress";
ALTER TABLE wordpress.wp_term_taxonomy_term_taxonomy_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_termmeta OWNER TO "wordpress";
ALTER TABLE wordpress.wp_termmeta_meta_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_terms OWNER TO "wordpress";
ALTER TABLE wordpress.wp_terms_term_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_usermeta OWNER TO "wordpress";
ALTER TABLE wordpress.wp_usermeta_umeta_id_seq OWNER TO "wordpress";
ALTER TABLE wordpress.wp_users OWNER TO "wordpress";
ALTER TABLE wordpress.wp_users_id_seq OWNER TO "wordpress";

EOS

EOF

echo Export complete to wordpress2 db

ssh database pg_dump postgresql:///wordpress2 | sed 's/OWNER to root/OWNER to "wordpress"/g' > wp.dump

ssh database dropdb wordpress2