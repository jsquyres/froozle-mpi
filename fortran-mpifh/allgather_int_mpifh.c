/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>

#include <mpi.h>


static int froozle_mpi_allgather(const void *sendbuf, int *sendcount,
                                 int *sendtype,
                                 void *recvbuf, int *recvcount,
                                 int *recvtype, int *comm,
                                 int *ierr)
{
    printf("This is mpif.h MPI_Allgather (integer)\n");
    return MPI_SUCCESS;
}

int mpi_allgather(const void *sendbuf, int *sendcount,
                  int *sendtype,
                  void *recvbuf, int *recvcount,
                  int *recvtype, int *comm,
                  int *ierr)
{
    return froozle_mpi_allgather(sendbuf, sendcount, sendtype,
                                 recvbuf, recvcount, recvtype,
                                 comm, ierr);
}

int mpi_allgather_(const void *sendbuf, int *sendcount,
                   int *sendtype,
                   void *recvbuf, int *recvcount,
                   int *recvtype, int *comm,
                   int *ierr)
{
    return froozle_mpi_allgather(sendbuf, sendcount, sendtype,
                                 recvbuf, recvcount, recvtype,
                                 comm, ierr);
}

int mpi_allgather__(const void *sendbuf, int *sendcount,
                    int *sendtype,
                    void *recvbuf, int *recvcount,
                    int *recvtype, int *comm,
                    int *ierr)
{
    return froozle_mpi_allgather(sendbuf, sendcount, sendtype,
                                 recvbuf, recvcount, recvtype,
                                 comm, ierr);
}

int MPI_ALLGATHER(const void *sendbuf, int *sendcount,
                  int *sendtype,
                  void *recvbuf, int *recvcount,
                  int *recvtype, int *comm,
                  int *ierr)
{
    return froozle_mpi_allgather(sendbuf, sendcount, sendtype,
                                 recvbuf, recvcount, recvtype,
                                 comm, ierr);
}
