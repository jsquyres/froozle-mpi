!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Init(ierror)
  implicit none
  include 'mpif.h'

  integer, intent(out) :: ierror
  integer :: val

  write(*,*) 'This is mpif.h MPI_Init'
end subroutine MPI_Init
