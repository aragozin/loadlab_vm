#!/bin/sh

base_path=$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

cat $base_path/wp_pg_schema.sql | ssh database 'cat > /tmp/wp_pg_schema.sql'

ssh database << EOF

yum -y install pgloader
dropdb wordpress2 || true

createdb wordpress2

psql wordpress2 < /tmp/wp_pg_schema.sql

cat > /tmp/pgload.cmd << EOS

LOAD DATABASE
     FROM      mysql://root@localhost/wordpress
     INTO postgresql:///wordpress2

 WITH quote identifiers

 CAST 
     type datetime
     to "timestamp without time zone" drop not null drop default
          using zero-dates-to-null

;

EOS

echo /tmp/pgload.cmd

pgloader /tmp/pgload.cmd

EOF

echo Export complete to wordpress2 db

ssh database pg_dump postgresql:///wordpress2 > /tmp/wp.dump.1
cat /tmp/wp.dump.1 | sed 's/OWNER TO root/OWNER TO "wordpress"/g' > /tmp/wp.dump.2 
cat /tmp/wp.dump.2 | sed 's/SET client_encoding = '\''SQL_ASCII'\''/SET client_encoding = '\''UTF8'\''/g' > /tmp/wp.dump.3 
cat /tmp/wp.dump.3 | sed 's/timestamp without time zone,/timestamp without time zone DEFAULT \"now\"\(\) NOT NULL,/g' > wp.dump

ssh database dropdb wordpress2