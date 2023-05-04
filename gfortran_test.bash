./cl.bash

make clean
make all

rm -f ./test/TEST_GFortran.exe
rm -f ./test/output.vtu

mkdir -p test

cp ./test_FortranSimpleVTK.f90 ./test/.

cd ./test/

gfortran -o TEST_GFortran.exe -O2 -std=f2018 test_FortranSimpleVTK.f90 -I../obj/ -L../bin/ -lFortranSimpleVTK

rm -f *.i90

./TEST_GFortran.exe

exit

