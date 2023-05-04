cp ./test/test_FortranSimpleVTK.f90 ./obj/.

cd ./obj

rm -f *.mod
rm -f *.smod
rm -f *.o
rm -f *.i90
rm -f a.out

cd ../src

rm -f *.mod
rm -f *.smod
rm -f *.o
rm -f *.i90
rm -f a.out

ifort -c kind_module.f90 
ifort -c fsvtk_constants.f90 
ifort -c string_operation_module.f90
ifort -c fsvtk_variables.f90
ifort -c FortranSimpleVTK.f90
ifort -c fsvtk_file_smod.f90
ifort -c fsvtk_points_smod.f90
ifort -c fsvtk_cells_smod.f90
ifort -c fsvtk_vtu_smod.f90

mv *.o ../obj/.
# mv *.i90 ../obj/.
mv *.mod ../obj/.
mv *.smod ../obj/.

cd ../obj/

ifort test_FortranSimpleVTK.f90 FortranSimpleVTK.o kind_module.o fsvtk_constants.o fsvtk_file_smod.o fsvtk_points_smod.o fsvtk_cells_smod.o fsvtk_vtu_smod.o fsvtk_variables.o string_operation_module.o

mv a.out ../test/TEST_SIMPLE.exe

# Clean up .i90 files created by bug in ifort
cd ../
rm obj/*.i90
rm src/*.i90
rm test/*.i90

exit

