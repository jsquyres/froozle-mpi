! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

module mpi_f08_types
  use, intrinsic :: ISO_C_BINDING

  ! Pull in the mpif.h constants
  include 'mpif-constants.h'

  type, BIND(C) :: MPI_Comm
     integer :: MPI_VAL
  end type MPI_Comm

  type, BIND(C) :: MPI_Datatype
     integer :: MPI_VAL
  end type MPI_Datatype

  type, BIND(C) :: MPI_Status
     integer :: MPI_SOURCE
     integer :: MPI_TAG
     integer :: MPI_ERROR
     ! Real implementations may have more fields beyond this
  end type MPI_Status

  type(MPI_Comm), bind(C, name="froozle_f08_mpi_comm_world") :: MPI_COMM_WORLD

  type(MPI_Datatype), bind(C, name="froozle_f08_mpi_character") :: MPI_CHARACTER
  type(MPI_Datatype), bind(C, name="froozle_f08_mpi_integer")   :: MPI_INTEGER

  type(MPI_Status), bind(C, name="froozle_f08_mpi_status_ignore")   :: MPI_STATUS_IGNORE

  ! Put a dummy subroutine here so that the linker does not complain
  ! that the sentinel library that we create to generate the
  ! mpi_f08_types module isn't empty.
  interface froozle_bogus
     subroutine froozle_bogus(val)
       integer, INTENT(OUT) :: val
     end subroutine froozle_bogus
  end interface froozle_bogus

end module mpi_f08_types
