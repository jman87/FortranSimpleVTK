submodule (FortranSimpleVTK) fsvtk_file_smod

    use fsvtk_variables, only : vtk_file, vtk_type, vtk_ext, vu, iost

    implicit none

contains

!-------------------------------------------------------------------------------
module subroutine initialize_vtk_file(file_name, file_type)

    ! Input Variables
    character(*), intent(in) :: file_name, file_type

    ! Set vtk_ext
    vtk_ext  = lowercase(file_type)

    ! Set vtk_type
    if (allocated(vtk_type)) deallocate(vtk_type)
    select case(vtk_ext)
    case ('vti')
        vtk_type = 'ImageData'
        error stop 'ERROR: Serial ImageData type (vti) is not supported!'
    case ('vtp')
        vtk_type = 'PolyData'
        error stop 'ERROR: Serial PolyData type (vtp) is not supported!'
    case ('vtr')
        vtk_type = 'RectilinearGrid'
        error stop 'ERROR: Serial RectilinearGrid type (vtr) is not supported!'
    case ('vts')
        vtk_type = 'StructuredGrid'
        error stop 'ERROR: Serial StructuredGrid type (vts) is not supported!'
    case ('vtu')
        vtk_type = 'UnstructuredGrid'
    case ('pvti')
        vtk_type = 'ImageData'
        error stop &
        &   'ERROR: Parallel ImageData type (pvti) is not supported!'
    case ('pvtp')
        vtk_type = 'PolyData'
        error stop &
        &   'ERROR: Parallel PolyData type (pvtp) is not supported!'
    case ('pvtr')
        vtk_type = 'RectilinearGrid'
        error stop &
        &   'ERROR: Parallel RectilinearGrid type (pvtr) is not supported!'
    case ('pvts')
        vtk_type = 'StructuredGrid'
        error stop &
        &   'ERROR: Parallel StructuredGrid type (pvts) is not supported!'
    case ('pvtu')
        vtk_type = 'UnstructuredGrid'
        error stop &
        &   'ERROR: Parallel UnstructuredGrid type (pvtu) is not supported!'
    case default
        error stop 'ERROR: type ' // vtk_ext // ' is not supported!'
    end select

    ! Set vtk_file
    if (allocated(vtk_file)) deallocate(vtk_file)
    vtk_file = trim(file_name) // '.' // vtk_ext

    ! Open File
    open( newunit=vu, file=vtk_file, &
    & status='replace', action='write', iostat=iost)

    ! Test Open
    if (iost/=0) error stop "ERROR OPENING "// vtk_file //" FOR OUTPUT"

    ! Line 1
    write(vu,'(A)',iostat=iost)                      &
    & '<VTKFile type="' // trim(vtk_type) // '" ' // &
    & 'version="2.2" '                            // &
    & 'byte_order="LittleEndian" '                // &
    & 'header_type="UInt64">'
    if (iost/=0) error stop "ERROR WRITING TO "// vtk_file //" FOR OUTPUT"

    ! Line 2
    write(vu,'(2X,A)',iostat=iost) '<' // trim(vtk_type) // '>'

end subroutine initialize_vtk_file

!-------------------------------------------------------------------------------
module subroutine finalize_vtk_file

    ! Next to last line
    write(vu,'(2X,A)',iostat=iost) '</' // trim(vtk_type) // '>'

    ! Next to last line
    write(vu,'(A)',iostat=iost) '</VTKFile>'

end subroutine finalize_vtk_file

!-------------------------------------------------------------------------------
end submodule fsvtk_file_smod
