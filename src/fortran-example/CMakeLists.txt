# Ships with Precise
cmake_minimum_required(VERSION 2.8.7)

include(CTest)

enable_language(Fortran)
add_executable (f-hello hello.f)
add_test (fortran-test f-hello)
