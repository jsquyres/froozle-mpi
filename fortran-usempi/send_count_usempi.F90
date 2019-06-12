! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Send_y(buf, count, datatype, dest, tag, &
     comm, ierror)
  include 'mpif-constants.h'
  FROOZLE_FORTRAN_IGNORE_TKR_PREDECL buf
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE, intent(in) :: buf
  integer(KIND=MPI_COUNT_KIND), intent(in) :: count
  integer, intent(in) :: datatype
  integer, intent(in) :: dest
  integer, intent(in) :: tag
  integer, intent(in) :: comm
  integer, intent(out) :: ierror

  write(*,*) 'This is mpi module MPI_Send_y'
end subroutine MPI_Send_y
