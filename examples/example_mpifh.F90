! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!
! This is likely not a valid MPI application.  Its only purpose is to
! compile and link properly; it will almost certainly not run
! correctly with a valid / complete MPI implementation.
!

#include "froozle_config_fortran.h"

program example_mpifh
  implicit none
  include 'mpif.h'

  integer BUFLEN
  parameter(BUFLEN=32)

  character, dimension(BUFLEN) :: buffer
  integer :: rank, size, ierr
  integer :: small_count
  integer(KIND=MPI_COUNT_KIND) :: big_count

  call MPI_Init(ierr)

  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

  ! There are no count-sized arguments in mpif.h

  call MPI_Send(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)
  call MPI_Send(buffer, SIZE, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)

  call MPI_Recv(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)
  call MPI_Recv(buffer, SIZE, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)

  call MPI_Allgather(buffer, 32, MPI_CHARACTER, &
       buffer, 32, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
  call MPI_Allgather(buffer, SIZE, MPI_CHARACTER, &
       buffer, SIZE, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)

  call MPI_Get_elements(MPI_STATUS_IGNORE, MPI_CHARACTER, small_count, ierr)
  if (small_count .ne. FROOZLE_TEST_SMALL_COUNT) then
     write(*,*) "ERROR: ", small_count, "!=", FROOZLE_TEST_SMALL_COUNT
     stop 1
  endif
  call MPI_Get_elements(MPI_STATUS_IGNORE, MPI_INTEGER, small_count, ierr)
  if (small_count .ne. MPI_UNDEFINED) then
     write(*,*) "ERROR: ", small_count, "!=", MPI_UNDEFINED
     stop 1
  endif
  call MPI_Get_elements_x(MPI_STATUS_IGNORE, MPI_CHARACTER, big_count, ierr)
  if (big_count .ne. FROOZLE_TEST_SMALL_COUNT) then
     write(*,*) "ERROR: ", big_count, "!=", FROOZLE_TEST_SMALL_COUNT
     stop 1
  endif
  call MPI_Get_elements_x(MPI_STATUS_IGNORE, MPI_INTEGER, big_count, ierr)
  if (big_count .ne. FROOZLE_TEST_GIANT_COUNT_F) then
     write(*,*) "ERROR: ", big_count, "!=", FROOZLE_TEST_GIANT_COUNT_F
     stop 1
  endif

  call MPI_Finalize(ierr)

end program example_mpifh
