!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Comm_size(comm, size, ierr)
  implicit none
  include 'mpif.h'

  integer, intent(in) :: comm
  integer, intent(out) :: size, ierr

  size = 0
  ierr = MPI_SUCCESS

  write(*,*) 'This is mpif.h MPI_Comm_size'
end subroutine MPI_Comm_size
