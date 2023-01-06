#!/bin/sh

echo "running ubuntu"
echo "test1"
lxc-create ubuntu -t oci -- --url docker://sonicdart/ccompile-benchy:ubuntu
lxc-start -F --logfile ./log.txt ubuntu ./run_test.sh
mkdir -p ./output/ubuntu/1/
cp -r -n /var/lib/lxc/ubuntu/rootfs/php-src/test_results/ubuntu/ ./output/ubuntu/1/
lxc-destroy ubuntu
sleep 60
echo "test2"
lxc-create ubuntu -t oci -- --url docker://sonicdart/ccompile-benchy:ubuntu
lxc-start -F --logfile ./log.txt ubuntu ./run_test.sh
mkdir -p ./output/ubuntu/2/
cp -r -n /var/lib/lxc/ubuntu/rootfs/php-src/test_results/ubuntu/ ./output/ubuntu/2/
lxc-destroy ubuntu
sleep 60
echo "test3"
lxc-create ubuntu -t oci -- --url docker://sonicdart/ccompile-benchy:ubuntu
lxc-start -F --logfile ./log.txt ubuntu ./run_test.sh
mkdir -p ./output/ubuntu/3/
cp -r -n /var/lib/lxc/ubuntu/rootfs/php-src/test_results/ubuntu/ ./output/ubuntu/3/
lxc-destroy ubuntu
sleep 60
echo "test4"
lxc-create ubuntu -t oci -- --url docker://sonicdart/ccompile-benchy:ubuntu
lxc-start -F --logfile ./log.txt ubuntu ./run_test.sh
mkdir -p ./output/ubuntu/4/
cp -r -n /var/lib/lxc/ubuntu/rootfs/php-src/test_results/ubuntu/ ./output/ubuntu/4/
lxc-destroy ubuntu
sleep 60
echo "test5"
lxc-create ubuntu -t oci -- --url docker://sonicdart/ccompile-benchy:ubuntu
lxc-start -F --logfile ./log.txt ubuntu ./run_test.sh
mkdir -p ./output/ubuntu/5/
cp -r -n /var/lib/lxc/ubuntu/rootfs/php-src/test_results/ubuntu/ ./output/ubuntu/5/
lxc-destroy ubuntu
