include(CTest)

enable_language(Fortran)
add_executable (f-hello hello.f)
add_test (fortran-test f-hello)
