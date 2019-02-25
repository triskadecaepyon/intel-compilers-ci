# Ships with Precise
cmake_minimum_required(VERSION 2.8.7)

include(CTest)

add_executable (c-hello hello.c)
add_test (c-test c-hello)
