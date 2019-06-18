!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Finalize(ierror)
  implicit none
  include 'mpif.h'

  integer, intent(out) :: ierror

  write(*,*) 'This is mpif.h MPI_Finalize'

  ierror = MPI_SUCCESS
end subroutine MPI_Finalize
