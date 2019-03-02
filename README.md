# intel-compilers-ci
Sample CI configurations for using intel compilers

By offering both C++ & Fortran compilers for Windows, Linux, and
MacOS, intel compilers makes it easy to test your software in
cloud-based CI systems.

## How it works

This repo contains:

* a small shell script that downloads and installs Intel C++ & Fortran compilers for easy integration into CI scripts.
* sample scripts for popular CI systems
* sample project to build

Setting up your project has 4 steps:


1. [Add the intel-compilers directory to the top level of your project](#add_directory)
2. [Add a few lines to your CI config file to install the compiler](#config_file)
3. [Obtain a license to use intel compilers](#get_license)
4. [Set some environment variables in the CI settings so the installer can get your license](#environment)

If you want to try it out quickly, you can clone this repo and skip steps 1 & 2.

### Add intel-compilers directory to your project <a name="add_directory">

Clone this repo and copy the intel-compilers directory into your
repo. If you don't want to include the files in your repo, just add
this to your CI config to copy it at install time:

        wget https://github.com/rscohn2/intel-compilers-ci/archive/master.zip
        unzip master.zip
        mv intel-compilers-ci-master/intel-compilers .

### Add a few lines to your CI config file to install the compiler <a name="add_directory">

We have examples for many CI systems in this repo.

### Obtain a serial number to use intel compilers <a name="get_license">

You need a license to the use the compiler. The installer uses
your serial number to fetch a license file.

If you do not already have a license for intel compilers, there
are several options, some of which are low cost or free. Please look
at [Intel Parallel Studio
XE](https://software.intel.com/en-us/parallel-studio-xe/choose-download)

You will need your serial number in the next step. If you do not know
your serial number, you can find it at the [Intel Registration
Center](https://registrationcenter.intel.com/en/products).  Treat this
serial number like a password. Do not put it in your repo!

### Set some environment variables in the CI settings so the installer can get your license <a name="environment">

The installer uses environment variables to find your serial
number. All the CI systems let you set environment variables in the
settings of the web interface. The settings are specific to your
project on the CI system and not visible to other users. See [CI
systems](#CI_systems) for specific directions.

We do not recommend setting the environment variables in the CI script or anywhere
in your source code. By using CI settings, someone can clone your repo
and use their own license without modifying the files.

If you have a license for Parallel Studio XE, you may install C++ & Fortran with:

        IS_LICENSE_TYPE=PSXE_FORTRAN
	IS_PSXE_SERIAL_NUMBER=XXXX-YYYYYYYY

If you only need C++, then use:

        IS_LICENSE_TYPE=PSXE
	IS_PSXE_SERIAL_NUMBER=XXXX-YYYYYYYY

## Sample project

We include a sample project based on [Cmake](https://cmake.org/) to
build with the C++ and Fortran compilers:

        # Build
        mkdir build
        cd build
        source /opt/intel/bin/iccvars.sh -arch intel64
        FC=ifort CC=icc CXX=icpc cmake ../src
        make
        # Test
        make test

## CI systems <a name="CI_systems">

### TravisCI

Status: [![Build Status](https://travis-ci.org/rscohn2/intel-compilers-ci.svg?branch=master)](https://travis-ci.org/rscohn2/intel-compilers-ci)

Setting the environment variable:
[Instructions](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)

### CircleCI

Status: [![CircleCI](https://circleci.com/gh/rscohn2/intel-compilers-ci.svg?style=svg)](https://circleci.com/gh/rscohn2/intel-compilers-ci)

Setting the environment variable:
[Instructions](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project)

### Gitlab CI/CD

Status: [![Build Status](https://gitlab.com/rscohn2/intel-compilers-ci/badges/master/build.svg)](https://gitlab.com/rscohn2/intel-compilers-ci/-/jobs)

Setting the environment variable: [instructions](https://docs.gitlab.com/ee/ci/variables/#protected-variables)

### Appveyor

### Azure Pipelines

## Getting a License

