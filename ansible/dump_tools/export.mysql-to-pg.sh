#!/bin/sh

ssh database << EOF

yum install pgloader
dropdb wordpress2 || true

createdb wordpress2

cat > /tmp/pgload.cmd << EOS

LOAD DATABASE
     FROM      mysql://root@localhost/wordpress
     INTO postgresql:///wordpress2

 WITH quote identifiers
;

EOS

echo /tmp/pgload.cmd

pgloader /tmp/pgload.cmd

EOF

echo Export complete to wordpress2 db

ssh database pg_dump postgresql:///wordpress2 | sed 's/OWNER TO root/OWNER TO "wordpress"/g' > wp.dump

ssh database dropdb wordpress2