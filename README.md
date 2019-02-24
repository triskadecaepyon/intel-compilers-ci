# intel-compilers-ci
Sample CI configurations for using intel compilers

## How it works

This is a minimal wrapper for the parallel studio installer in silent
mode, which can be invoked from the command line without user
interaction.

For each OS, there is a configuration file and a script. The script is
called from the CI configuration (e.g. .travis.yml) and uses the
configuration file to drive the install.

To use the script, you must have a license to use Intel Parallel
Studio XE Composer Edition. The script requires that you set the
ACTIVATION_SERIAL_NUMBER environment variable equal to the serial
number. We recommend that you set the variable in the web interface to
the CI system. If you put it directly in the config file, then others
will be able to see your serial number, and it will be less convenient
for others to clone your repository and use their own serial number.

## Compiler versions

This repo has branches for each Parallel Studio releases of Intel compilers 

## Sample project

        # Build
        mkdir build
        cd build
        source /opt/intel/bin/iccvars.sh -arch intel64
        FC=ifort CC=icc CXX=icpc cmake ../src
        make
        # Test
        make test

## CI systems

### TravisCI

Status: [![Build Status](https://travis-ci.org/rscohn2/intel-compilers-ci.svg?branch=master)](https://travis-ci.org/rscohn2/intel-compilers-ci)

Setting the environment variable:
[Instructions](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)

### CircleCI

### Gitlab CI/CD

### Appveyor

### Azure Pipelines
