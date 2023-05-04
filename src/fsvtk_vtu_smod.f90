submodule (FortranSimpleVTK) fsvtk_vtu_smod

    use fsvtk_variables, only : vtk_type, vu, iost

    implicit none


contains


!-------------------------------------------------------------------------------
module subroutine initialize_vtu_file(file_name, file_type)
    character(*), intent(in) :: file_name, file_type
    call initialize_vtk_file(file_name, file_type)
end subroutine

!-------------------------------------------------------------------------------
module subroutine finalize_vtu_file
    call finalize_vtk_file
end subroutine

!-------------------------------------------------------------------------------
module subroutine write_vtu_mesh(nn, ne, xyz, elem, el_type, npe)

    ! Input Variables
    integer(ik), intent(in)                    :: nn, ne
    real(rk),    intent(in),    dimension(:,:) :: xyz
    integer(ik), intent(in),    dimension(:,:) :: elem
    integer(ik), intent(inout), dimension(:)   :: el_type, npe

    ! Write Piece
    write(vu,'(4X,A,I0,A,I0,A)')  &
    & '<Piece '                // &
    & 'NumberOfPoints="',         &
    & nn,                         &
    & '" '                     // &
    & 'NumberOfCells="',          &
    & ne,                         &
    & '"'                      // &
    & '>'

    ! call write_point_data
    ! call write_cell_data

    call write_points(nn, xyz)

    call write_cells(ne, elem, el_type, npe)

    write(vu,'(4X,A)') '</Piece>'

end subroutine write_vtu_mesh

!-------------------------------------------------------------------------------


!-------------------------------------------------------------------------------
end submodule fsvtk_vtu_smod
