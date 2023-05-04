module fsvtk_variables

use, intrinsic :: iso_fortran_env, only : &
&   stdout => output_unit,                &
&   stderr => error_unit

use kind_module, only : ik, rk

implicit none

save

public 

! Error Checking
integer :: iost=0

! File Properties
character(:), allocatable :: vtk_file ! VTK output file name
character(:), allocatable :: vtk_type ! VTK file type
character(3)              :: vtk_ext  ! VTK file extension
integer(ik)               :: vu       ! Output file unit

end module fsvtk_variables
