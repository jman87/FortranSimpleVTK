!==============================================================================!
! DESCRIPTION:
! FortranSimpleVTK provides simple extendable procedures for writing XML VTK 
! files in ASCII format. Element types supported are chosen with emphasis on
! finite element methods for solid and structural mechanics.
!==============================================================================!
module FortranSimpleVTK

  use string_operation_module, only : lowercase

  use kind_module

  use fsvtk_constants

  implicit none

  private

  public                  &
  & initialize_vtu_file,  &
  & finalize_vtu_file,    &
  & write_vtu_mesh,       &
  & write_cell_data

  !--------------------------------------!
  ! Interface Definitions for Submodules !
  !--------------------------------------!
  interface

    ! fsvtk_cells_smod.f90
    module subroutine write_cells(ne, elem, el_type, npe)
      integer(ik), intent(in)                 :: ne
      integer(ik), intent(in), dimension(:,:) :: elem
      integer(ik), intent(in), dimension(:)   :: el_type, npe  
    end subroutine
    module subroutine write_cell_data_scalar_int(ne, elem_data, data_name)
      integer(ik),  intent(in)               :: ne
      integer(ik),  intent(in), dimension(:) :: elem_data
      character(*), intent(in)               :: data_name
    end subroutine
    module subroutine write_cell_data_scalar_float(ne, elem_data, data_name)
      integer(ik),  intent(in)               :: ne
      real(rk),     intent(in), dimension(:) :: elem_data
      character(*), intent(in)               :: data_name
    end subroutine
  
    ! fsvtk_file_smod.f90
    module subroutine initialize_vtk_file(file_name, file_type)
      character(*), intent(in) :: file_name, file_type
    end subroutine
    module subroutine finalize_vtk_file
    end subroutine

    ! fsvtk_points_smod.f90
    module subroutine write_points(nn, xyz)
      integer(ik), intent(in)                 :: nn
      real(rk),    intent(in), dimension(:,:) :: xyz
    end subroutine
    module subroutine write_point_data_scalar_int(nn, node_data, data_name)
      integer(ik),  intent(in)               :: nn
      integer(ik),  intent(in), dimension(:) :: node_data
      character(*), intent(in)               :: data_name
    end subroutine
    module subroutine write_point_data_scalar_float(nn, node_data, data_name)
      integer(ik),  intent(in)               :: nn
      real(rk),     intent(in), dimension(:) :: node_data
      character(*), intent(in)               :: data_name
    end subroutine
    module subroutine write_point_data_vector_int(nn, node_data, data_name)
      integer(ik),  intent(in)                 :: nn
      integer(ik),  intent(in), dimension(:,:) :: node_data
      character(*), intent(in)                 :: data_name
    end subroutine
    module subroutine write_point_data_vector_float(nn, node_data, data_name)
      integer(ik),  intent(in)                 :: nn
      real(rk),     intent(in), dimension(:,:) :: node_data
      character(*), intent(in)                 :: data_name
    end subroutine

    ! fsvtk_vtu_smod.f90
    module subroutine initialize_vtu_file(file_name, file_type)
      character(*), intent(in) :: file_name, file_type
    end subroutine
    module subroutine finalize_vtu_file
    end subroutine
    module subroutine write_vtu_mesh(nn, ne, xyz, elem, el_type, npe)
      integer(ik), intent(in)                    :: nn, ne
      real(rk),    intent(in),    dimension(:,:) :: xyz
      integer(ik), intent(in),    dimension(:,:) :: elem
      integer(ik), intent(inout), dimension(:)   :: el_type, npe
    end subroutine

  end interface

  !----------------------!
  ! Operator Overloading !
  !----------------------!
  interface write_cell_data
    module procedure write_cell_data_scalar_int
    module procedure write_cell_data_scalar_float
  end interface
  interface write_point_data
    module procedure write_point_data_scalar_int
    module procedure write_point_data_scalar_float
    module procedure write_point_data_vector_int
    module procedure write_point_data_vector_float
  end interface

end module FortranSimpleVTK
