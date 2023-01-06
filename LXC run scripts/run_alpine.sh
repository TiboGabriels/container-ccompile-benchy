#!/bin/sh

echo "running alpine"
echo "test1"
lxc-create alpine -t oci -- --url docker://sonicdart/ccompile-benchy:alpine
lxc-start -F --logfile ./log.txt alpine ./run_test.sh
mkdir -p ./output/alpine/1/
cp -r -n /var/lib/lxc/alpine/rootfs/php-src/test_results/alpine/ ./output/alpine/1/
lxc-destroy alpine
sleep 60
echo "test2"
lxc-create alpine -t oci -- --url docker://sonicdart/ccompile-benchy:alpine
lxc-start -F --logfile ./log.txt alpine ./run_test.sh
mkdir -p ./output/alpine/2/
cp -r -n /var/lib/lxc/alpine/rootfs/php-src/test_results/alpine/ ./output/alpine/2/
lxc-destroy alpine
sleep 60
echo "test3"
lxc-create alpine -t oci -- --url docker://sonicdart/ccompile-benchy:alpine
lxc-start -F --logfile ./log.txt alpine ./run_test.sh
mkdir -p ./output/alpine/3/
cp -r -n /var/lib/lxc/alpine/rootfs/php-src/test_results/alpine/ ./output/alpine/3/
lxc-destroy alpine
sleep 60
echo "test4"
lxc-create alpine -t oci -- --url docker://sonicdart/ccompile-benchy:alpine
lxc-start -F --logfile ./log.txt alpine ./run_test.sh
mkdir -p ./output/alpine/4/
cp -r -n /var/lib/lxc/alpine/rootfs/php-src/test_results/alpine/ ./output/alpine/4/
lxc-destroy alpine
sleep 60
echo "test5"
lxc-create alpine -t oci -- --url docker://sonicdart/ccompile-benchy:alpine
lxc-start -F --logfile ./log.txt alpine ./run_test.sh
mkdir -p ./output/alpine/5/
cp -r -n /var/lib/lxc/alpine/rootfs/php-src/test_results/alpine/ ./output/alpine/5/
lxc-destroy alpine