! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!
! This is likely not a valid MPI application.  Its only purpose is to
! compile and link properly; it will almost certainly not run
! correctly with a valid / complete MPI implementation.
!

#include "froozle_config_fortran.h"

subroutine do_sends()
  use mpi
  implicit none

  integer :: buffer
  integer :: ierr, i = 32
  integer(kind=MPI_COUNT_KIND) :: bigI = 8589934592_MPI_COUNT_KIND

  write(*,*) '>> The following functions should call MPI_Send (with int params)'
  call MPI_Send(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)
  call MPI_Send(buffer, i, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)

  write(*,*) '>> The following functions should call MPI_Send_y'
  call MPI_Send(buffer, bigI, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)
  call MPI_Send(buffer, 858993459_MPI_COUNT_KIND, MPI_CHARACTER, &
       0, 0, MPI_COMM_WORLD, ierr)
end subroutine do_sends

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine do_recvs()
  use mpi
  implicit none

  integer :: buffer
  integer :: ierr, i = 32
  integer(kind=MPI_COUNT_KIND) :: bigI = 8589934592_MPI_COUNT_KIND

  write(*,*) '>> The following functions should call MPI_Recv (with int params)'
  call MPI_Recv(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)
  call MPI_Recv(buffer, i, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)

  write(*,*) '>> The following functions should call MPI_Recv_y'
  call MPI_Recv(buffer, bigI, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)
  call MPI_Recv(buffer, 8589934592_MPI_COUNT_KIND, MPI_CHARACTER, &
       0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
end subroutine do_recvs

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine do_allgathers()
  use mpi
  implicit none

  integer :: buffer
  integer :: ierr, i = 32
  integer(kind=MPI_COUNT_KIND) :: bigI = 8589934592_MPI_COUNT_KIND

  write(*,*) '>> The following functions should call MPI_Allgather (with int params)'
  call MPI_Allgather(buffer, 32, MPI_CHARACTER, &
       buffer, 32, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
  call MPI_Allgather(buffer, i, MPI_CHARACTER, &
       buffer, i, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
  write(*,*) '>> The following functions should call MPI_Allgather_y'
  call MPI_Allgather(buffer, bigI, MPI_CHARACTER, &
       buffer, bigI, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
  call MPI_Allgather(buffer, bigI, MPI_CHARACTER, &
       buffer, 8589934592_MPI_COUNT_KIND, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
end subroutine do_allgathers

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine check_eq_i(a, b)
  implicit none

  integer :: a, b

  if (a .ne. b) then
     write(*,*) 'ERROR (integer): ', a, '!=', 'b'
     stop 1
  endif
end subroutine check_eq_i

subroutine check_eq_c(a, b)
  use mpi
  implicit none

  integer(kind=MPI_COUNT_KIND) :: a, b

  if (a .ne. b) then
     write(*,*) 'ERROR (MPI_COUNT_KIND): ', a, '!=', 'b'
     stop 2
  endif
end subroutine check_eq_c

subroutine do_get_elements()
  use mpi

  integer :: i, ierr
  integer(KIND=MPI_COUNT_KIND) :: c

  write(*,*) ">> The following functions call MPI_Get_elements"
  call MPI_Get_elements(MPI_STATUS_IGNORE, MPI_CHARACTER, i, ierr)
  call check_eq_i(i, FROOZLE_TEST_SMALL_COUNT)
  call MPI_Get_elements(MPI_STATUS_IGNORE, MPI_INTEGER, i, ierr)
  call check_eq_i(i, MPI_UNDEFINED)

  write(*,*) ">> The following functions call MPI_Get_elements_y"
  call MPI_Get_elements(MPI_STATUS_IGNORE, MPI_CHARACTER, c, ierr)
  call check_eq_c(c, INT(FROOZLE_TEST_SMALL_COUNT, KIND=MPI_COUNT_KIND))
  call MPI_Get_elements(MPI_STATUS_IGNORE, MPI_INTEGER, c, ierr)
  call check_eq_c(c, FROOZLE_TEST_GIANT_COUNT_F)

  write(*,*) ">> The following functions call MPI_Get_elements_x"
  call MPI_Get_elements_x(MPI_STATUS_IGNORE, MPI_CHARACTER, c, ierr)
  call check_eq_c(c, INT(FROOZLE_TEST_SMALL_COUNT, KIND=MPI_COUNT_KIND))
  call MPI_Get_elements_x(MPI_STATUS_IGNORE, MPI_INTEGER, c, ierr)
  call check_eq_c(c, FROOZLE_TEST_GIANT_COUNT_F)
end subroutine do_get_elements

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program example_usempi
  use mpi
  implicit none

  integer :: rank, size, ierr

  call MPI_Init(ierr)

  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

  call do_sends()
  call do_recvs()
  call do_allgathers()
  call do_get_elements()

  call MPI_Finalize(ierr)
end program example_usempi
