!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Init(ierror)
  implicit none
  include 'mpif.h'

  integer, intent(out) :: ierror
  integer :: val

  write(*,*) 'This is mpif.h MPI_Init'

  ! Do some housekeeping (see comment in this procedure to see why it
  ! is necessary)
  call froozle_mpifh_globals_init(val)

end subroutine MPI_Init
