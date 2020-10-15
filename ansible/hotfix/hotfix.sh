#!/bin/sh

base_path=$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

echo Update metrics

../deployment/deploy.sh metrics

echo Hotfix complete