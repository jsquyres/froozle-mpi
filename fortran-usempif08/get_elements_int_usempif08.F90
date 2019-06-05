! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Get_elements_f08(status, datatype, count, ierr)
  use :: mpi_f08_types
  implicit none

  type(MPI_Status), intent(in) :: status
  type(MPI_Datatype), intent(in) :: datatype
  integer, intent(out) :: count
  integer, optional, intent(out) :: ierr

  write(*,*) 'This is mpi_f08 module MPI_Get_elements_f08'

  ! If they asked for MPI_CHAR, return FROOZLE_TEST_SMALL_COUNT.
  ! If they asked for MPI_INT, return FROOZLE_TEST_GIANT_COUNT (or
  ! MPI_UNDEFINED, since we can't hold that value in an int -- per
  ! MPI-3.1 p114).
  count = MPI_UNDEFINED
  if (datatype%MPI_VAL .eq. MPI_CHARACTER%MPI_VAL) then
     count = FROOZLE_TEST_SMALL_COUNT
  endif
end subroutine MPI_Get_elements_f08
