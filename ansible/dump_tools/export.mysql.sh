#!/bin/sh

ssh database mysqldump wordpress > wp.dump && echo Dump created as wp.dump