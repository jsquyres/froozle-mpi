!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Get_elements(status, datatype, count, ierr)
  implicit none

  include 'mpif-constants.h'

  integer, dimension(MPI_STATUS_SIZE), intent(in) :: status
  integer, intent(in) :: datatype
  integer, intent(out) :: count, ierr

  integer(KIND=MPI_COUNT_KIND) :: dummy

  write(*,*) 'This is mpi module MPI_Get_elements'

  ! Do the back-end work in C -- the strong type safety in Fortran is
  ! too restrictive.
  call froozle_get_elements_f(datatype, count, dummy)

  ierr = MPI_SUCCESS
end subroutine MPI_Get_elements
