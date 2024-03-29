!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Comm_size_f08(comm, size, ierror)
  use :: mpi_f08_types, only : MPI_Comm, MPI_SUCCESS
  implicit none
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror

  write(*,*) 'This is mpi_f08 module MPI_Comm_size_f08'

  size = 0
  ierror = MPI_SUCCESS
end subroutine MPI_Comm_size_f08
