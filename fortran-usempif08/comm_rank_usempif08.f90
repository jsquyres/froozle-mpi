!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

subroutine MPI_Comm_rank_f08(comm, rank, ierror)
  use :: mpi_f08_types, only : MPI_Comm
  implicit none
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: rank
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror

  write(*,*) 'This is mpi_f08 module MPI_Comm_rank_f08'
end subroutine MPI_Comm_rank_f08
