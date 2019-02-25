# intel-compilers-ci
Sample CI configurations for using intel compilers

By offering both C++ & Fortran compilers for Windows, Linux, and
MacOS, intel compilers makes it easy to test your software in
cloud-based CI systems.

## How it works

This repo contains:

* a small wrapper for Intel C++ & Fortran installers for easy integration intel CI scripts.
* sample scripts for popular CI systems
* sample project to build

You can get started by cloning this repository and adding your project
to it, or by copying the intel-compilers directory into your repo. If
you don't want to include the files in your repo, just add this to
your CI config:

        wget https://github.com/rscohn2/intel-compilers-ci/archive/master.zip
	unzip master.zip
	mv intel-compilers-ci-master/intel-compilers .

The linux installer is in intel-compilers/install-linux.sh. Before
invoking the installer, you must tell it which type of license you
have and the serial number.

If you do not know your serial number, you can find it at the [Intel
Registration Center](https://registrationcenter.intel.com/en/products). If you need
a license, see below for free options for obtaining a license.

If you have a license for Parallel Studio XE, you may install C++ & Fortran with:

        IS_LICENSE_TYPE=PSXE_FORTRAN IS_PSXE_SERIAL_NUMBER=XXXX-YYYYYYYY ./intel-compilers/install-linux.sh

If you only need C++, then use:

        IS_LICENSE_TYPE=PSXE IS_PSXE_SERIAL_NUMBER=XXXX-YYYYYYYY ./intel-compilers/install-linux.sh

If you have a license for Intel System Studio, then use:

        IS_LICENSE_TYPE=ISS IS_ISS_SERIAL_NUMBER=XXXX-YYYYYYYY ./intel-compilers/install-linux.sh

When setting up a CI system, we recommend that you do not put the
environment variables in the CI script or anywhere in your source code
repo, but instead use the CI settings. See the CI system-specific
directions below. By using CI settings, someone can clone your repo
and use their own license without modifying the files.

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

## CI systems

### TravisCI

Status: [![Build Status](https://travis-ci.org/rscohn2/intel-compilers-ci.svg?branch=master)](https://travis-ci.org/rscohn2/intel-compilers-ci)

Setting the environment variable:
[Instructions](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)

### CircleCI

Status: [![CircleCI](https://circleci.com/gh/anoopmad/intel-compilers-ci.svg?style=svg)](https://circleci.com/gh/anoopmad/intel-compilers-ci)

Setting the environment variable:
[Instructions](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project)

### Gitlab CI/CD

Status: [![Build Status](https://gitlab.com/rscohn2/intel-compilers-ci/badges/master/build.svg)](https://gitlab.com/rscohn2/intel-compilers-ci/-/jobs)

Setting the environment variable: [instructions](https://docs.gitlab.com/ee/ci/variables/#protected-variables)

### Appveyor

### Azure Pipelines

## Getting a License

If you do not already have a license for the intel compilers, there
are several options, some of which are low cost or free. Please look at [Intel
System Studio License](https://software.intel.com/en-us/system-studio/choose-download) and [Intel Parallel Studio XE](https://software.intel.com/en-us/parallel-studio-xe/choose-download)
