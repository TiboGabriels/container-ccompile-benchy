#!/bin/sh

echo "running debian"
echo "test1"
lxc-create debian -t oci -- --url docker://sonicdart/ccompile-benchy:debian
lxc-start -F --logfile ./log.txt debian ./run_test.sh
mkdir -p ./output/debian/1/
cp -r -n /var/lib/lxc/debian/rootfs/php-src/test_results/debian/ ./output/debian/1/
lxc-destroy debian
sleep 60
echo "test2"
lxc-create debian -t oci -- --url docker://sonicdart/ccompile-benchy:debian
lxc-start -F --logfile ./log.txt debian ./run_test.sh
mkdir -p ./output/debian/2/
cp -r -n /var/lib/lxc/debian/rootfs/php-src/test_results/debian/ ./output/debian/2/
lxc-destroy debian
sleep 60
echo "test3"
lxc-create debian -t oci -- --url docker://sonicdart/ccompile-benchy:debian
lxc-start -F --logfile ./log.txt debian ./run_test.sh
mkdir -p ./output/debian/3/
cp -r -n /var/lib/lxc/debian/rootfs/php-src/test_results/debian/ ./output/debian/3/
lxc-destroy debian
sleep 60
echo "test4"
lxc-create debian -t oci -- --url docker://sonicdart/ccompile-benchy:debian
lxc-start -F --logfile ./log.txt debian ./run_test.sh
mkdir -p ./output/debian/4/
cp -r -n /var/lib/lxc/debian/rootfs/php-src/test_results/debian/ ./output/debian/4/
lxc-destroy debian
sleep 60
echo "test5"
lxc-create debian -t oci -- --url docker://sonicdart/ccompile-benchy:debian
lxc-start -F --logfile ./log.txt debian ./run_test.sh
mkdir -p ./output/debian/5/
cp -r -n /var/lib/lxc/debian/rootfs/php-src/test_results/debian/ ./output/debian/5/
lxc-destroy debian