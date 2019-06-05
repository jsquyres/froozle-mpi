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

  integer(KIND=MPI_COUNT_KIND) :: dummy

  write(*,*) 'This is mpi_f08 module MPI_Get_elements_f08'

  ! Do the back-end work in C -- the strong type safety in Fortran is
  ! too restrictive.
  call froozle_get_elements_f(datatype, count, dummy)
end subroutine MPI_Get_elements_f08
