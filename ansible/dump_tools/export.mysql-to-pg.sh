#!/bin/sh

ssh database << EOF

yum install pgloader
dropdb wordpress2 || true

createdb wordpress2

pgloader --with "quote identifiers" mysql://root@localhost/wordpress postgresql:///wordpress2

psql wordpress2 << EOS

ALTER DATABASE "wordpress2" OWNER TO "wordpress";

EOS

EOF

echo Export complete to wordpress2 db

ssh database pg_dump postgresql:///wordpress2 | sed 's/OWNER to root/OWNER to "wordpress"/g' > wp.dump

ssh database dropdb wordpress2