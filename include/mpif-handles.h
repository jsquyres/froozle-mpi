! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

  integer MPI_COMM_WORLD
  parameter(MPI_COMM_WORLD = 0)

  integer MPI_INTEGER, MPI_CHARACTER
  ! These values are hard-coded in:
  ! - c/globals.c
  ! - fortran-usempif08/globals-usempif08.c
  ! - include/mpif-handlers.h
  ! Do not change them in one place without changing them in all places!
  parameter(MPI_INTEGER = 0)
  parameter(MPI_CHARACTER = 1)
