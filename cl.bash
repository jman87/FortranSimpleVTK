# Clean bin
rm -f ./bin/*.exe
rm -f ./bin/*.a
rm -f ./bin/a.out

# Clean obj
rm -f ./obj/a.out
rm -f ./obj/*.mod
rm -f ./obj/*.smod
rm -f ./obj/*.o
rm -f ./obj/*.i90

# Clean src
rm -f ./src/a.out
rm -f ./src/*.mod
rm -f ./src/*.smod
rm -f ./src/*.o
rm -f ./src/*.i90

# Clean test
rm -f ./test/test_FortranSimpleVTK.f90
rm -f ./test/TEST_SIMPLE.exe
rm -f ./test/output.vtu

exit
