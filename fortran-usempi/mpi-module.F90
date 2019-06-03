! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "fortran-config.h"

module mpi
  ! Pull in the mpif.h declarations (e.g., constants, sentinels)
  include 'mpif.h'

  ! The only things we list below are interfaces that are not listed
  ! in mpif.h (e.g., all the subroutines)

  interface MPI_Init
     subroutine MPI_Init(ierror)
       integer, intent(out) :: ierror
     end subroutine MPI_Init
  end interface MPI_Init

  interface MPI_Finalize
     subroutine MPI_Finalize(ierror)
       integer, intent(out) :: ierror
     end subroutine MPI_Finalize
  end interface MPI_Finalize

  interface MPI_Comm_rank
     subroutine MPI_Comm_rank(comm, rank, ierror)
       integer, intent(in) :: comm
       integer, intent(out) :: rank
       integer, intent(out) :: ierror
     end subroutine MPI_Comm_rank
  end interface MPI_Comm_rank

  interface MPI_Comm_size
     subroutine MPI_Comm_size(comm, size, ierror)
       integer, intent(in) :: comm
       integer, intent(out) :: size
       integer, intent(out) :: ierror
     end subroutine MPI_Comm_size
  end interface MPI_Comm_size

  interface MPI_Allgather
     subroutine MPI_Allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, &
          recvtype, comm, ierror)
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL sendbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, intent(in) :: sendbuf
       integer, intent(in) :: sendcount
       integer, intent(in) :: sendtype
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL recvbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: recvbuf
       integer, intent(in) :: recvcount
       integer, intent(in) :: recvtype
       integer, intent(in) :: comm
       integer, intent(out) :: ierror
     end subroutine MPI_Allgather

     subroutine MPI_Allgather_count(sendbuf, sendcount, sendtype, recvbuf, recvcount, &
          recvtype, comm, ierror)
       include 'mpif-constants.h'
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL sendbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, intent(in) :: sendbuf
       integer(kind=MPI_COUNT_KIND), intent(in) :: sendcount
       integer, intent(in) :: sendtype
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL recvbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: recvbuf
       integer(kind=MPI_COUNT_KIND), intent(in) :: recvcount
       integer, intent(in) :: recvtype
       integer, intent(in) :: comm
       integer, intent(out) :: ierror
     end subroutine MPI_Allgather_count
  end interface MPI_Allgather

  interface MPI_Send
     subroutine MPI_Send(buf, count, datatype, dest, tag, &
          comm, ierror)
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, intent(in) :: buf
       integer, intent(in) :: count
       integer, intent(in) :: datatype
       integer, intent(in) :: dest
       integer, intent(in) :: tag
       integer, intent(in) :: comm
       integer, intent(out) :: ierror
     end subroutine MPI_Send

     subroutine MPI_Send_count(buf, count, datatype, dest, tag, &
          comm, ierror)
       include 'mpif-constants.h'
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, intent(in) :: buf
       integer(kind=MPI_COUNT_KIND), intent(in) :: count
       integer, intent(in) :: datatype
       integer, intent(in) :: dest
       integer, intent(in) :: tag
       integer, intent(in) :: comm
       integer, intent(out) :: ierror
     end subroutine MPI_Send_count
  end interface MPI_Send

  interface MPI_Recv
     subroutine MPI_Recv(buf, count, datatype, source, tag, &
          comm, status, ierror)
       include 'mpif-constants.h'
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: buf
       integer, intent(in) :: count
       integer, intent(in) :: datatype
       integer, intent(in) :: source
       integer, intent(in) :: tag
       integer, intent(in) :: comm
       integer, dimension(MPI_STATUS_SIZE), intent(out) :: status
       integer, intent(out) :: ierror
     end subroutine MPI_Recv

       subroutine MPI_Recv_count(buf, count, datatype, source, tag, &
          comm, status, ierror)
       include 'mpif-constants.h'
       FROOZLE_FORTRAN_IGNORE_TKR_PREDECL buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: buf
       integer(kind=MPI_COUNT_KIND), intent(in) :: count
       integer, intent(in) :: datatype
       integer, intent(in) :: source
       integer, intent(in) :: tag
       integer, intent(in) :: comm
       integer, dimension(MPI_STATUS_SIZE), intent(out) :: status
       integer, intent(out) :: ierror
     end subroutine MPI_Recv_count
  end interface MPI_Recv

end module mpi
