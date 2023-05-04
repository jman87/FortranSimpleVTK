rm -f ./test/*
 
cp ./test_FortranSimpleVTK.f90 ./test/.
#cp ./src/*.f90 ./test/.

cd ./test/

#gfortran -c kind_module.f90 
#gfortran -c fsvtk_constants.f90 
#gfortran -c string_operation_module.f90
#gfortran -c fsvtk_variables.f90
#gfortran -c FortranSimpleVTK.f90
#gfortran -c fsvtk_file_smod.f90
#gfortran -c fsvtk_points_smod.f90
#gfortran -c fsvtk_cells_smod.f90
#gfortran -c fsvtk_vtu_smod.f90

#gfortran test_FortranSimpleVTK.f90 FortranSimpleVTK.o kind_module.o fsvtk_constants.o fsvtk_file_smod.o fsvtk_points_smod.o fsvtk_cells_smod.o fsvtk_vtu_smod.o fsvtk_variables.o string_operation_module.o

gfortran -o TEST_SIMPLE.exe test_FortranSimpleVTK.f90 ../bin/libFortranSimpleVTK.a -I../obj/

#mv a.out TEST_SIMPLE.exe

# Clean up
#rm -f *.mod
#rm -f *.smod
#rm -f *.o
#rm -f *.i90
#rm -f *.f90

exit

