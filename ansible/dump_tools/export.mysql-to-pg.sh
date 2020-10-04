#!/bin/sh

ssh database << EOF

yum -y install pgloader
dropdb wordpress2 || true

createdb wordpress2

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

ssh database pg_dump postgresql:///wordpress2 \
    | sed 's/OWNER TO root/OWNER TO "wordpress"/g' \
    | sed 's/SET client_encoding = \'SQL_ASCII\'/SET client_encoding = \'UTF8\'/g' \
    | sed 's/timestamp without time zone,/timestamp without time zone DEFAULT "now"() NOT NULL,/g' \
    > wp.dump

ssh database dropdb wordpress2