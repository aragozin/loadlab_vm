#!/bin/sh

base_path=$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

echo Update metrics

$base_path/../deployment/deploy.sh metrics
$base_path/../deployment/deploy.sh front

echo Hotfix complete