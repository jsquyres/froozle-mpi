! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Allgather_l_f08(sendbuf,sendcount,sendtype,recvbuf,recvcount,recvtype, &
     comm,ierror)
  use :: mpi_f08_types
  implicit none
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE, INTENT(IN) :: sendbuf
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: recvbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror

  write(*,*) 'This is mpi_f08 module MPI_Allgather_l_f08'

  if (present(ierror)) ierror = MPI_SUCCESS
end subroutine MPI_Allgather_l_f08
