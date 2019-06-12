! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

subroutine MPI_Send_y_f08(buf,count,datatype,dest,tag,comm,ierror)
  use :: mpi_f08_types
  implicit none
  !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf
  !GCC$ ATTRIBUTES NO_ARG_CHECK :: buf
  !$PRAGMA IGNORE_TKR buf
  !DIR$ IGNORE_TKR buf
  !IBM* IGNORE_TKR buf
  FROOZLE_FORTRAN_IGNORE_TKR_TYPE, INTENT(IN) :: buf
  INTEGER, INTENT(IN) :: dest, tag
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror

  write(*,*) 'This is mpi_f08 module MPI_Send_y_f08'
end subroutine MPI_Send_y_f08
