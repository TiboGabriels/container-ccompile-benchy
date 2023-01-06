# Docker CCompile Benchy
Docker Ccompile benchy is a benchmark tool for testing different container environments.
It does this by providing a slim container image tasked with compiling php-src and measuring the time needed aswell as ram/cpu usage.

This tool was developed by me for my Bachelor Thesis Software Engineering @Howest

## Usage
first build one of the images, you can do so like this:
`docker build --no-cache -t sonicdart/ccompile-benchy:{distro} -f {distro}.Dockerfile ./`
Replace alpine with ubuntu or debian.

You may also pull the image from the docker regestry with `docker pull sonicdart/ccompile-benchy:{distro}`

### Docker
next run the container and execute the test script from within:
`docker run -it --rm --mount type=bind,source={output directory},target=/php-src/test_results sonicdart/ccompile-benchy:{distro} ./run_test.sh`
replace output directory with an absolute path to where you want the result files.

### LXC
first create a template with
`lxc-create {distro} -t oci -- --url docker://sonicdart/ccompile-benchy:{distro}`
afterwards you can run the container once using
`lxc-start -F --logfile ./log.txt {distro} ./run_test.sh`
by default, the entire filesystem (including the test output) is accessable in `/var/lib/lxc/{distro}/rootfs/`

## Output
The test script outputs 3 files:
* test_duration_{datetime}
  outputs the time command measuring the make command
* test_output_{datetime}
  outputs the make commands output
* test_internal_resources_{datetime}
  outputs a csv file logging memory and cpu usage each second.

## Links
Dockerhub: https://hub.docker.com/r/sonicdart/ccompile-benchy

## Disclaimer
this tool includes PHP software, freely available from http://www.php.net/software/.
