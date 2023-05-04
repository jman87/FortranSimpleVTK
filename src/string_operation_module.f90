module string_operation_module

    implicit none

    character(*), parameter :: lower_case = 'abcdefghijklmnopqrstuvwxyz'
    character(*), parameter :: upper_case = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    private
    public lowercase, uppercase

contains

!-------------------------------------------------------------------------------
pure function lowercase(input_string) result(output_string)

    ! Variables
    character(*), intent(in)     :: input_string
    character(len(input_string)) :: output_string
    integer :: i, n

    ! Copy input string
    output_string = input_string

    ! Convert case character by character
    do i = 1, len(output_string)
        n = index(upper_case, output_string(i:i))
        if (n/=0) then
            output_string(i:i) = lower_case(n:n)
        end if
    end do

end function lowercase

!-------------------------------------------------------------------------------
pure function uppercase(input_string) result(output_string)

    ! Variables
    character(*), intent(in)     :: input_string
    character(len(input_string)) :: output_string
    integer :: i, n

    ! Copy input string
    output_string = input_string

    ! Convert case character by character
    do i = 1, len(output_string)
        n = index(lower_case, output_string(i:i))
        if (n/=0) then
            output_string(i:i) = upper_case(n:n)
        end if
    end do

end function uppercase

!-------------------------------------------------------------------------------
end module
