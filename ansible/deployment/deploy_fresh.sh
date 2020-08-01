#!/bin/sh

set -e

base_path=$( cd "$(dirname "${BASH_SOURCE[0]}")/.." ; pwd -P )

cd $base_path

if [ $# -eq 0 ]
  then
    ansible-playbook -i ${base_path}/loadlab.hosts --extra-vars "wp_db_import_dump=true" ${base_path}/loadlab.yml
  else
    ansible-playbook -i ${base_path}/loadlab.hosts --extra-vars "wp_db_import_dump=true" ${base_path}/loadlab.yml -l $1
fi

