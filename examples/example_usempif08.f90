! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!
! This is likely not a valid MPI application.  Its only purpose is to
! compile and link properly; it will almost certainly not run
! correctly with a valid / complete MPI implementation.
!

subroutine do_sends()
  use mpi_f08
  implicit none

  integer :: buffer
  integer :: ierr, i = 32
  integer(kind=MPI_COUNT_KIND) :: bigI = 8589934592_MPI_COUNT_KIND

  write(*,*) '>> The following functions should call MPI_Send (with int params)'
  call MPI_Send(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)
  call MPI_Send(buffer, i, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)

  write(*,*) '>> The following functions should call MPI_Send_count'
  call MPI_Send(buffer, bigI, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)
  call MPI_Send(buffer, 858993459_MPI_COUNT_KIND, MPI_CHARACTER, &
       0, 0, MPI_COMM_WORLD, ierr)
end subroutine do_sends

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine do_recvs()
  use mpi_f08
  implicit none

  integer :: buffer
  integer :: ierr, i = 32
  integer(kind=MPI_COUNT_KIND) :: bigI = 8589934592_MPI_COUNT_KIND

  write(*,*) '>> The following functions should call MPI_Recv (with int params)'
  call MPI_Recv(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)
  call MPI_Recv(buffer, i, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)

  write(*,*) '>> The following functions should call MPI_Recv_count'
  call MPI_Recv(buffer, bigI, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)
  call MPI_Recv(buffer, 8589934592_MPI_COUNT_KIND, MPI_CHARACTER, &
       0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE, ierr)
end subroutine do_recvs

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine do_allgathers()
  use mpi_f08
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
  write(*,*) '>> The following functions should call MPI_Allgather_count'
  call MPI_Allgather(buffer, bigI, MPI_CHARACTER, &
       buffer, bigI, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
  call MPI_Allgather(buffer, bigI, MPI_CHARACTER, &
       buffer, 8589934592_MPI_COUNT_KIND, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
end subroutine do_allgathers

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program example_mpifh
  use mpi_f08
  implicit none

  integer :: rank, size, ierr

  call MPI_Init(ierr)

  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

  call do_sends()
  call do_recvs()
  call do_allgathers()

  call MPI_Finalize(ierr)
end program example_mpifh
