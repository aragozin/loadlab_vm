#!/bin/bash

set -e

base_path=$( cd "$(dirname "${BASH_SOURCE[0]}")/.." ; pwd -P )

cd $base_path

if [ $# -eq 0 ]
  then
    ansible-playbook -i loadlab.hosts --extra-vars "wp_db_import_dump=true" loadlab.yml
  else
    ansible-playbook -i loadlab.hosts --extra-vars "wp_db_import_dump=true" loadlab.yml -l $1
fi

