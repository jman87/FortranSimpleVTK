submodule (FortranSimpleVTK) fsvtk_cells_smod

    use fsvtk_variables, only : vu, iost

    implicit none

contains

!-------------------------------------------------------------------------------
module subroutine write_cells(ne, elem, el_type, npe)

    ! Input Variables
    integer(ik), intent(in)                 :: ne
    integer(ik), intent(in), dimension(:,:) :: elem
    integer(ik), intent(in), dimension(:)   :: el_type, npe

    ! Internal Variables
    integer(ik) :: i

    ! Check that ne agrees with size of elem
    if (ne/=size(elem,2)) error stop "ERROR: ne does not match size of elem"

    ! Check that ne agrees with size of el_type
    if (ne/=size(el_type)) error stop "ERROR: ne does not match size of el_type"

    ! Check that ne agrees with size of npe
    if (ne/=size(npe)) error stop "ERROR: ne does not match size of npe"

    ! Write Cells
    write(vu,'(6X,A)',iostat=iost) '<Cells>'
    
    write(vu,'(8X,A)',iostat=iost) &
    & '<DataArray '             // &
    & 'type="Int64" '           // &
    & 'Name="connectivity" '    // &
    & 'format="ascii"'          // &
    & '>'
    write(vu,'(10X,I0,2X,I0,2X,I0,2X,I0)') (elem(1:npe(i),i), i=1, ne)
    write(vu,'(8X,A)') '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) &
    & '<DataArray '             // &
    & 'type="Int64" '           // &
    & 'Name="offsets" '         // &
    & 'format="ascii"'          // &
    & '>'
    write(vu,'(10X,I0)',iostat=iost) npe
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) &
    & '<DataArray '             // &
    & 'type="Int32" '           // &
    & 'Name="types" '           // &
    & 'format="ascii"'          // &
    & '>'
    write(vu,'(10X,I0)',iostat=iost) el_type
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</Cells>'

end subroutine write_cells

!-------------------------------------------------------------------------------
module subroutine write_cell_data_scalar_int(ne, elem_data, data_name)

    ! Input Variables
    integer(ik),  intent(in)               :: ne
    integer(ik),  intent(in), dimension(:) :: elem_data
    character(*), intent(in)               :: data_name

    ! Check that ne agrees with size of elem_data
    if (ne/=size(elem_data)) &
    &   error stop "ERROR: ne does not match size of elem_data"

    ! Write CellData
    write(vu,'(6X,A)',iostat=iost)             &
    & '<CellData> '                         // &
    & 'Scalars="' // trim(data_name) // '"' // &
    & '>'

    write(vu,'(8X,A)',iostat=iost)           &
    & '<DataArray '                       // &
    & 'type="Int64" '                     // &
    & 'Name="' // trim(data_name) // '" ' // &
    & 'format="ascii"'                    // &
    & '>'
    write(vu,'(10X,I0)',iostat=iost) elem_data
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</CellData>'

end subroutine write_cell_data_scalar_int

!-------------------------------------------------------------------------------
module subroutine write_cell_data_scalar_float(ne, elem_data, data_name)

    ! Input Variables
    integer(ik),  intent(in)               :: ne
    real(rk),     intent(in), dimension(:) :: elem_data
    character(*), intent(in)               :: data_name

    ! Check that ne agrees with size of elem_data
    if (ne/=size(elem_data)) &
    &   error stop "ERROR: ne does not match size of elem_data"

    ! Write CellData
    write(vu,'(6X,A)',iostat=iost)             &
    & '<CellData> '                         // &
    & 'Scalars="' // trim(data_name) // '"' // &
    & '>'

    write(vu,'(8X,A)',iostat=iost)           &
    & '<DataArray '                       // &
    & 'type="Float64" '                   // &
    & 'Name="' // trim(data_name) // '" ' // &
    & 'format="ascii"'                    // &
    & '>'
    write(vu,'(10X,ES22.14E3)',iostat=iost) elem_data
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</CellData>'

end subroutine write_cell_data_scalar_float

!-------------------------------------------------------------------------------
end submodule fsvtk_cells_smod
