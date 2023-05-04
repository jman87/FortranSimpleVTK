program test_FortranSimpleVTK

    use, intrinsic :: iso_fortran_env, only : ik=>int32, rk=>real64

    use FortranSimpleVTK, only : &
    &   initialize_vtu_file, finalize_vtu_file, write_vtu_mesh

    implicit none

    integer(ik), parameter :: nn=27
    integer(ik), parameter :: ne=1


    real(rk), dimension(3,27) :: xyz =  &
    & reshape([ &
    & 1,1,1,2,2,2,3,3,3,4,4,4,5,5,5, &
    & 6,6,6,7,7,7,8,8,8,9,9,9,10,10,10, &
    & 11,11,11,12,12,12,13,13,13,14,14,14,15,15,15, &
    & 16,16,16,17,17,17,18,18,18,19,19,19,20,20,20, &
    & 21,21,21,22,22,22,23,23,23,24,24,24,25,25,25, &
    & 26,26,26,27,27,27 &
    & ], [3,27])

    integer(ik), dimension(27,ne) :: elem = reshape( &
    &[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],&
    &[27,ne])

    integer(ik), dimension(1:ne) :: el_type=[27]
    integer(ik), dimension(1:ne) :: npe=[27]
    
    print *, 'xyz:'
    print '(3F10.3)', xyz

    call initialize_vtu_file('output', 'vtu')
    call write_vtu_mesh(nn,ne,xyz,elem,el_type,npe)
    call finalize_vtu_file
    
end program
