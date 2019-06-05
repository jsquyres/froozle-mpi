! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

  integer MPI_SUCCESS
  parameter(MPI_SUCCESS = 0)

  integer MPI_COUNT_KIND
  parameter(MPI_COUNT_KIND = 8)

  integer MPI_STATUS_SIZE, MPI_SOURCE, MPI_TAG, MPI_ERROR
  parameter(MPI_STATUS_SIZE = 32)
  parameter(MPI_SOURCE = 0)
  parameter(MPI_TAG = 1)
  parameter(MPI_ERROR = 2)

  integer MPI_UNDEFINED
  parameter(MPI_UNDEFINED = -1)
