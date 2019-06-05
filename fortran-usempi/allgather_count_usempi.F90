! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Allgather_count(sendbuf, sendcount, sendtype, recvbuf, recvcount, &
     recvtype, comm, ierror)
  include 'mpif-constants.h'
  FROOZLE_FORTRAN_IGNORE_TKR_PREDECL sendbuf
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE, intent(in) :: sendbuf
  integer(kind=MPI_COUNT_KIND), intent(in) :: sendcount
  integer, intent(in) :: sendtype
  FROOZLE_FORTRAN_IGNORE_TKR_PREDECL recvbuf
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: recvbuf
  integer(kind=MPI_COUNT_KIND), intent(in) :: recvcount
  integer, intent(in) :: recvtype
  integer, intent(in) :: comm
  integer, intent(out) :: ierror

  write(*,*) 'This is mpi module MPI_Allgather_count'
end subroutine MPI_Allgather_count
