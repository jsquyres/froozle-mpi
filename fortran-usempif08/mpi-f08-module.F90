! -*- f90 -*-
!
! Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
!

#include "froozle_config_fortran.h"

module mpi_f08
  use mpi_f08_types

  interface  MPI_Init
     subroutine MPI_Init_f08(ierror)
       implicit none
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Init_f08
  end interface  MPI_Init

  interface  MPI_Finalize
     subroutine MPI_Finalize_f08(ierror)
       implicit none
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Finalize_f08
  end interface  MPI_Finalize

  interface  MPI_Comm_rank
     subroutine MPI_Comm_rank_f08(comm,rank,ierror)
       use :: mpi_f08_types, only : MPI_Comm
       implicit none
       TYPE(MPI_Comm), INTENT(IN) :: comm
       INTEGER, INTENT(OUT) :: rank
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Comm_rank_f08
  end interface  MPI_Comm_rank

  interface  MPI_Comm_size
     subroutine MPI_Comm_size_f08(comm,size,ierror)
       use :: mpi_f08_types, only : MPI_Comm
       implicit none
       TYPE(MPI_Comm), INTENT(IN) :: comm
       INTEGER, INTENT(OUT) :: size
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Comm_size_f08
  end interface  MPI_Comm_size

  interface MPI_Get_elements
     subroutine MPI_Get_elements_f08(status, datatype, count, ierr)
       use :: mpi_f08_types
       implicit none
       type(MPI_Status), intent(in) :: status
       type(MPI_Datatype), intent(in) :: datatype
       integer, intent(out) :: count
       integer, optional, intent(out) :: ierr
     end subroutine MPI_Get_elements_f08

     subroutine MPI_Get_elements_count_f08(status, datatype, count, ierr)
       use :: mpi_f08_types
       implicit none
       type(MPI_Status), intent(in) :: status
       type(MPI_Datatype), intent(in) :: datatype
       integer(kind=MPI_COUNT_KIND), intent(out) :: count
       integer, optional, intent(out) :: ierr
     end subroutine MPI_Get_elements_count_f08
  end interface MPI_Get_elements

  interface MPI_Get_elements_x
     subroutine MPI_Get_elements_x_f08(status, datatype, count, ierr)
       use :: mpi_f08_types
       implicit none
       type(MPI_Status), intent(in) :: status
       type(MPI_Datatype), intent(in) :: datatype
       integer(kind=MPI_COUNT_KIND), intent(out) :: count
       integer, optional, intent(out) :: ierr
     end subroutine MPI_Get_elements_x_f08
  end interface MPI_Get_elements_x

  interface  MPI_Allgather
     subroutine MPI_Allgather_f08(sendbuf,sendcount,sendtype,recvbuf,recvcount,recvtype, &
          comm,ierror)
       use :: mpi_f08_types
       implicit none
       !DEC$ ATTRIBUTES NO_ARG_CHECK :: sendbuf, recvbuf
       !GCC$ ATTRIBUTES NO_ARG_CHECK :: sendbuf, recvbuf
       !$PRAGMA IGNORE_TKR sendbuf, recvbuf
       !DIR$ IGNORE_TKR sendbuf, recvbuf
       !IBM* IGNORE_TKR sendbuf, recvbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, INTENT(IN) :: sendbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: recvbuf
       INTEGER, INTENT(IN) :: sendcount, recvcount
       TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
       TYPE(MPI_Comm), INTENT(IN) :: comm
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Allgather_f08

     subroutine MPI_Allgather_count_f08(sendbuf,sendcount,sendtype,recvbuf,recvcount,recvtype, &
          comm,ierror)
       use :: mpi_f08_types
       implicit none
       !DEC$ ATTRIBUTES NO_ARG_CHECK :: sendbuf, recvbuf
       !GCC$ ATTRIBUTES NO_ARG_CHECK :: sendbuf, recvbuf
       !$PRAGMA IGNORE_TKR sendbuf, recvbuf
       !DIR$ IGNORE_TKR sendbuf, recvbuf
       !IBM* IGNORE_TKR sendbuf, recvbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, INTENT(IN) :: sendbuf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: recvbuf
       INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: sendcount, recvcount
       TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
       TYPE(MPI_Comm), INTENT(IN) :: comm
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Allgather_count_f08
  end interface  MPI_Allgather

  interface  MPI_Send
     subroutine MPI_Send_f08(buf,count,datatype,dest,tag,comm,ierror)
       use :: mpi_f08_types
       implicit none
       !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf
       !GCC$ ATTRIBUTES NO_ARG_CHECK :: buf
       !$PRAGMA IGNORE_TKR buf
       !DIR$ IGNORE_TKR buf
       !IBM* IGNORE_TKR buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE, INTENT(IN) :: buf
       INTEGER, INTENT(IN) :: count, dest, tag
       TYPE(MPI_Datatype), INTENT(IN) :: datatype
       TYPE(MPI_Comm), INTENT(IN) :: comm
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Send_f08

     subroutine MPI_Send_count_f08(buf,count,datatype,dest,tag,comm,ierror)
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
     end subroutine MPI_Send_count_f08
  end interface  MPI_Send

  interface  MPI_Recv
     subroutine MPI_Recv_f08(buf,count,datatype,source,tag,comm,status,ierror)
       use :: mpi_f08_types
       implicit none
       !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf
       !GCC$ ATTRIBUTES NO_ARG_CHECK :: buf
       !$PRAGMA IGNORE_TKR buf
       !DIR$ IGNORE_TKR buf
       !IBM* IGNORE_TKR buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: buf
       INTEGER, INTENT(IN) :: count, source, tag
       TYPE(MPI_Datatype), INTENT(IN) :: datatype
       TYPE(MPI_Comm), INTENT(IN) :: comm
       TYPE(MPI_Status) :: status
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Recv_f08

     subroutine MPI_Recv_count_f08(buf,count,datatype,source,tag,comm,status,ierror)
       use :: mpi_f08_types
       implicit none
       !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf
       !GCC$ ATTRIBUTES NO_ARG_CHECK :: buf
       !$PRAGMA IGNORE_TKR buf
       !DIR$ IGNORE_TKR buf
       !IBM* IGNORE_TKR buf
       FROOZLE_FORTRAN_IGNORE_TKR_TYPE :: buf
       INTEGER, INTENT(IN) :: source, tag
       INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
       TYPE(MPI_Datatype), INTENT(IN) :: datatype
       TYPE(MPI_Comm), INTENT(IN) :: comm
       TYPE(MPI_Status) :: status
       INTEGER, OPTIONAL, INTENT(OUT) :: ierror
     end subroutine MPI_Recv_count_f08
  end interface  MPI_Recv

end module mpi_f08
