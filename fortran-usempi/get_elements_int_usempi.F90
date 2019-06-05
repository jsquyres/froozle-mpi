!     Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Get_elements(status, datatype, count, ierr)
  implicit none

  include 'mpif-constants.h'
  include 'mpif-handles.h'

  integer, dimension(MPI_STATUS_SIZE), intent(in) :: status
  integer, intent(in) :: datatype
  integer, intent(out) :: count, ierr

  write(*,*) 'This is mpi module MPI_Get_elements'

  ! If they asked for MPI_CHAR, return FROOZLE_TEST_SMALL_COUNT.
  ! If they asked for MPI_INT, return FROOZLE_TEST_GIANT_COUNT (or
  ! MPI_UNDEFINED, since we can't hold that value in an int -- per
  ! MPI-3.1 p114).
  count = MPI_UNDEFINED
  if (datatype .eq. MPI_CHARACTER) then
     count = FROOZLE_TEST_SMALL_COUNT
  endif
end subroutine MPI_Get_elements
