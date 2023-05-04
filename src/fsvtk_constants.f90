module fsvtk_constants

! use kind_module, only : ik, rk

implicit none

public

! Define byte_order as "LittleEndian" or "BigEndian" depending on machine
character(*), parameter :: endianType='"LittleEndian"'

end module fsvtk_constants
