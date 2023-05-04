submodule (FortranSimpleVTK) fsvtk_points_smod

    use fsvtk_variables, only : vu, iost

    implicit none

contains

!-------------------------------------------------------------------------------
module subroutine write_points(nn, xyz)

    ! Input Variables
    integer(ik), intent(in)                 :: nn
    real(rk),    intent(in), dimension(:,:) :: xyz

    ! Check that 3 coordinates per node are provided in xyz
    if (3/=size(xyz,1)) error stop "ERROR: First dimension of xyz must be 3"

    ! Check that nn agrees with size of xyz
    if (nn/=size(xyz,2)) error stop "ERROR: nn does not match size of xyz"

    ! Write Points
    write(vu,'(6X,A)') '<Points>'

    write(vu,'(8X,A,ES22.14E3,A,ES22.14E3,A)')  &
    & '<DataArray '                          // &
    & 'type="Float64" '                      // &
    & 'Name="Points" '                       // &
    & 'NumberOfComponents="3" '              // &
    & 'format="ascii" '                      // &
    & 'RangeMin="', minval(xyz), '" '        // &
    & 'RangeMax="', maxval(xyz), '"'         // &
    & '>'
    write(vu,'(10X,3ES22.14E3)') xyz
    write(vu,'(8X,A)') '</DataArray>'

    write(vu,'(6X,A)') '</Points>'

end subroutine write_points

!-------------------------------------------------------------------------------
module subroutine write_point_data_scalar_int(nn, node_data, data_name)

    ! Input Variables
    integer(ik),  intent(in)               :: nn
    integer(ik),  intent(in), dimension(:) :: node_data
    character(*), intent(in)               :: data_name

    ! Check that ne agrees with size of elem_data
    if (nn/=size(node_data)) &
    &   error stop "ERROR: nn does not match size of node_data"

    ! Write PointData
    write(vu,'(6X,A)',iostat=iost)             &
    & '<PointData> '                        // &
    & 'Scalars="' // trim(data_name) // '"' // &
    & '>'

    write(vu,'(8X,A)',iostat=iost)           &
    & '<DataArray '                       // &
    & 'type="Int64" '                     // &
    & 'Name="' // trim(data_name) // '" ' // &
    & 'format="ascii"'                    // &
    & '>'
    write(vu,'(10X,I0)',iostat=iost) node_data
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</PointData>'

end subroutine write_point_data_scalar_int

!-------------------------------------------------------------------------------
module subroutine write_point_data_scalar_float(nn, node_data, data_name)

    ! Input Variables
    integer(ik),  intent(in)               :: nn
    real(rk),     intent(in), dimension(:) :: node_data
    character(*), intent(in)               :: data_name

    ! Check that ne agrees with size of elem_data
    if (nn/=size(node_data)) &
    &   error stop "ERROR: nn does not match size of node_data"

    ! Write PointData
    write(vu,'(6X,A)',iostat=iost)             &
    & '<PointData> '                        // &
    & 'Scalars="' // trim(data_name) // '"' // &
    & '>'

    write(vu,'(8X,A)',iostat=iost)           &
    & '<DataArray '                       // &
    & 'type="Float64" '                   // &
    & 'Name="' // trim(data_name) // '" ' // &
    & 'format="ascii"'                    // &
    & '>'
    write(vu,'(10X,ES22.14E3)',iostat=iost) node_data
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</PointData>'

end subroutine write_point_data_scalar_float

!-------------------------------------------------------------------------------
module subroutine write_point_data_vector_int(nn, node_data, data_name)

    ! Input Variables
    integer(ik),  intent(in)                 :: nn
    integer(ik),  intent(in), dimension(:,:) :: node_data
    character(*), intent(in)                 :: data_name

    ! Internal Variables
    character(20) :: frmt
    
    ! Generate format for writing vector data
    write(frmt,'(A,I0,A)') '10X,', size(node_data,1), 'I0'

    ! Check that ne agrees with size of elem_data
    if (nn/=size(node_data,2)) &
    &   error stop "ERROR: nn does not match size of node_data"

    ! Write PointData
    write(vu,'(6X,A)',iostat=iost)             &
    & '<PointData> '                        // &
    & 'Vectors="' // trim(data_name) // '"' // &
    & '>'

    write(vu,'(8X,A)',iostat=iost)                       &
    & '<DataArray '                                   // &
    & 'type="Int64" '                                 // &
    & 'Name="' // trim(data_name) // '" '             // &
    & 'NumberOfComponents="', size(node_data,1), '" ' // &
    & 'format="ascii"'                                // &
    & '>'
    write(vu,frmt,iostat=iost) node_data
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</PointData>'

end subroutine write_point_data_vector_int

!-------------------------------------------------------------------------------
module subroutine write_point_data_vector_float(nn, node_data, data_name)

    ! Input Variables
    integer(ik),  intent(in)                 :: nn
    real(rk),     intent(in), dimension(:,:) :: node_data
    character(*), intent(in)                 :: data_name

    ! Internal Variables
    character(20) :: frmt
    
    ! Generate format for writing vector data
    write(frmt,'(A,I0,A)') '10X,', size(node_data,1), 'ES24.14E3'

    ! Check that ne agrees with size of elem_data
    if (nn/=size(node_data,2)) &
    &   error stop "ERROR: nn does not match size of node_data"

    ! Write PointData
    write(vu,'(6X,A)',iostat=iost)             &
    & '<PointData> '                        // &
    & 'Vectors="' // trim(data_name) // '"' // &
    & '>'

    write(vu,'(8X,A)',iostat=iost)                       &
    & '<DataArray '                                   // &
    & 'type="Float64" '                               // &
    & 'Name="' // trim(data_name) // '" '             // &
    & 'NumberOfComponents="', size(node_data,1), '" ' // &
    & 'format="ascii"'                                // &
    & '>'
    write(vu,frmt,iostat=iost) node_data
    write(vu,'(8X,A)',iostat=iost) '</DataArray>'

    write(vu,'(8X,A)',iostat=iost) '</PointData>'

end subroutine write_point_data_vector_float

!-------------------------------------------------------------------------------
end submodule fsvtk_points_smod
