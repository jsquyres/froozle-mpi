!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Finalize_f08(ierror)
  implicit none

  integer, OPTIONAL, INTENT(OUT) :: ierror

  write(*,*) 'This is mpi_f08 finalize MPI_Finalize_f08'
end subroutine MPI_Finalize_f08
