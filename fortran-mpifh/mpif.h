! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

  integer MPI_SUCCESS
  parameter(MPI_SUCCESS = 0)

  integer MPI_COMM_WORLD
  parameter(MPI_COMM_WORLD = 0)

  integer MPI_INTEGER, MPI_CHARACTER
  parameter(MPI_INTEGER = 0)
  parameter(MPI_CHARACTER = 1)

  integer MPI_COUNT_KIND
  parameter(MPI_COUNT_KIND = 8)

  integer MPI_STATUS_SIZE
  parameter(MPI_STATUS_SIZE = 32)

  integer, dimension(MPI_STATUS_SIZE) :: MPI_STATUS_IGNORE
  common/froozle_mpi_status_ignore/MPI_STATUS_IGNORE
