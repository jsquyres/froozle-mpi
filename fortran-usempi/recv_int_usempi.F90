! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "fortran-config.h"

subroutine MPI_Recv(buf, count, datatype, source, tag, &
     comm, status, ierror)
  include 'mpif-constants.h'
  FROOZLE_FORTRAN_IGNORE_TKR_PREDECL buf
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: buf
  integer, intent(in) :: count
  integer, intent(in) :: datatype
  integer, intent(in) :: source
  integer, intent(in) :: tag
  integer, intent(in) :: comm
  integer, dimension(MPI_STATUS_SIZE), intent(out) :: status
  integer, intent(out) :: ierror

  write(*,*) 'This is mpi module MPI_Recv'
end subroutine MPI_Recv