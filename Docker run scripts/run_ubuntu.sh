#!/bin/sh

echo "testing ubuntu"
echo "test1"
docker run -it --rm --mount type=bind,source=/home/user/testing/output,target=/php-src/test_results sonicdart/ccompile-benchy:ubuntu ./run_test.sh
sleep 60
echo "test2"
docker run -it --rm --mount type=bind,source=/home/user/testing/output,target=/php-src/test_results sonicdart/ccompile-benchy:ubuntu ./run_test.sh
sleep 60
echo "test3"
docker run -it --rm --mount type=bind,source=/home/user/testing/output,target=/php-src/test_results sonicdart/ccompile-benchy:ubuntu ./run_test.sh
sleep 60
echo "test4"
docker run -it --rm --mount type=bind,source=/home/user/testing/output,target=/php-src/test_results sonicdart/ccompile-benchy:ubuntu ./run_test.sh
sleep 60
echo "test5"
docker run -it --rm --mount type=bind,source=/home/user/testing/output,target=/php-src/test_results sonicdart/ccompile-benchy:ubuntu ./run_test.sh