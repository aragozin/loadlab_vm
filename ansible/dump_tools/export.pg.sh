#!/bin/sh

ssh database pg_dump postgresql:///wordpress2 > wp.dump && echo Dump created as wp.dump