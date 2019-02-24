# intel-compilers-ci
Sample CI configurations for using intel compilers

## How it works

This is a minimal wrapper for the parallel studio installer in silent
mode, which can be invoked from the command line without user
interaction.

For each OS, there is a configuration file and a script. The script is
called from the CI configuration (e.g. .travis.yml) and uses the
configuration file to drive the install.

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

### CircleCI

### Gitlab CI/CD

### Appveyor

### Azure Pipelines
