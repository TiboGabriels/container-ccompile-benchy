#!/bin/sh

cd /php-src
{ time make -j $(nproc) ; } > test_duration_"`date +"%d-%m-%Y-%T"`" 2>&1
echo cat test_duration*
