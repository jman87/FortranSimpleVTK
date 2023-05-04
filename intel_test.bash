./cl.bash

make clean
make all

rm -f ./test/TEST_Intel.exe
rm -f ./test/output.vtu

mkdir -p test

cp ./test_FortranSimpleVTK.f90 ./test/.

cd ./test/

ifort -o TEST_Intel.exe -O2 -std18 test_FortranSimpleVTK.f90 -I../obj/ -L../bin/ -lFortranSimpleVTK

rm -f *.i90

./TEST_Intel.exe

exit

