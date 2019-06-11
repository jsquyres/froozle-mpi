! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

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

     subroutine MPI_Allgather_x(sendbuf, sendcount, sendtype, recvbuf, recvcount, &
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
     end subroutine MPI_Allgather_x
  end interface MPI_Allgather

  interface MPI_Get_elements
     subroutine MPI_Get_elements(status, datatype, count, ierr)
       include 'mpif-constants.h'
       integer, dimension(MPI_STATUS_SIZE), intent(in) :: status
       integer, intent(in) :: datatype
       integer, intent(out) :: count, ierr
     end subroutine MPI_Get_elements

     ! The _x version of this interface effectively already exists (as
     ! a different interface), so we have to give the underlying
     ! function a different name.
     subroutine MPI_Get_elements_count(status, datatype, count, ierr)
       include 'mpif-constants.h'
       integer, dimension(MPI_STATUS_SIZE), intent(in) :: status
       integer, intent(in) :: datatype
       integer(kind=MPI_COUNT_KIND), intent(out) :: count
       integer, intent(out) :: ierr
     end subroutine MPI_Get_elements_count
  end interface MPI_Get_elements

  interface MPI_Get_elements_x
     subroutine MPI_Get_elements_x(status, datatype, count, ierr)
       include 'mpif-constants.h'
       integer, dimension(MPI_STATUS_SIZE), intent(in) :: status
       integer, intent(in) :: datatype
       integer(kind=MPI_COUNT_KIND), intent(out) :: count
       integer, intent(out) :: ierr
     end subroutine MPI_Get_elements_x
  end interface MPI_Get_elements_x

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

     subroutine MPI_Send_x(buf, count, datatype, dest, tag, &
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
     end subroutine MPI_Send_x
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

       subroutine MPI_Recv_x(buf, count, datatype, source, tag, &
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
     end subroutine MPI_Recv_x
  end interface MPI_Recv

  ! Back-end C function to do the work for MPI_Get_elements[_x]
  interface froozle_get_elements_f
     subroutine froozle_get_elements_f(datatype, small, big)
       include 'mpif-constants.h'
       integer, intent(in) :: datatype
       integer, intent(out) :: small
       integer(KIND=MPI_COUNT_KIND), intent(out) :: big
     end subroutine froozle_get_elements_f
  end interface froozle_get_elements_f

end module mpi
