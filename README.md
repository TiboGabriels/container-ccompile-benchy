# Docker CCompile Benchy
Docker Ccompile benchy is a benchmark tool for testing different container environments.
It does this by providing a slim container image tasked with compiling php-src and measuring the time needed aswell as ram/cpu usage.

This tool was developed by me for my Bachelor Thesis Software Engineering @Howest

## Usage
first build one of the images, you can do so like this:
`docker build --no-cache -t tibogabriels/ccompile-benchy:alpine -f alpine.Dockerfile ./`
for the other distro's simply replace alpine with ubuntu or debian.

### Docker
next run the container and execute the test script:
`docker run -it --rm --mount type=bind,source={output directory},target=/php-src/test_results tibogabriels/ccompile-benchy:alpine ./run_test.sh`
replace output directory with an absolute path to where you want the result files.

## Output
The test script outputs 3 files:
* test_duration_{datetime}
  outputs the time command measuring the make command
* test_output_{datetime}
  outputs the make commands output
* test_internal_resources_{datetime}
  outputs a csv file logging memory and cpu usage each second.


## Disclaimer
this tool includes PHP software, freely available from http://www.php.net/software/.
