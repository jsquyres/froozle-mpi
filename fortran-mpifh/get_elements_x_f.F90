! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Get_elements_x(status, datatype, count, ierr)
  implicit none

  include 'mpif.h'

  integer, dimension(MPI_STATUS_SIZE), intent(in) :: status
  integer, intent(in) :: datatype
  integer(KIND=MPI_COUNT_KIND), intent(out) :: count
  integer, intent(out) :: ierr

  integer :: dummy

  write(*,*) 'This is mpif.h MPI_Get_elements_x'

  ! Do the back-end work in C -- the strong type safety in Fortran is
  ! too restrictive.
  call froozle_get_elements_f(datatype, dummy, count)
end subroutine MPI_Get_elements_x
