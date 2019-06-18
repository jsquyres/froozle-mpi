!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Comm_rank(comm, rank, ierr)
  implicit none
  include 'mpif.h'

  integer, intent(in) :: comm
  integer, intent(out) :: rank, ierr

  rank = 0
  ierr = MPI_SUCCESS

  write(*,*) 'This is mpif.h MPI_Comm_rank'
end subroutine MPI_Comm_rank
