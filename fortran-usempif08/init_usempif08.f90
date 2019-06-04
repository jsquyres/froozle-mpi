!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Init_f08(ierror)
  use mpi_f08_types
  implicit none

  integer, OPTIONAL, INTENT(OUT) :: ierror
  integer :: val

  write(*,*) 'This is mpi_f08 module MPI_Init_f08'

  ! Do some housekeeping (see comment in this procedure to see why it
  ! is necessary)
  call froozle_usempif08_globals_init(val)

end subroutine MPI_Init_f08
