/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>

#include <mpi.h>


static int froozle_mpi_recv(const void *buf, int *count,
                            int *datatype,
                            int *dest, int *tag, int *comm,
                            int *status, int *ierr)
{
    printf("This is mpif.h MPI_Recv (integer)\n");
    return MPI_SUCCESS;
}

int mpi_recv(const void *buf, int *count,
             int *datatype,
             int *dest, int *tag, int *comm,
             int *status, int *ierr)
{
    return froozle_mpi_recv(buf, count, datatype, dest, tag, comm, status, ierr);
}

int mpi_recv_(const void *buf, int *count,
              int *datatype,
              int *dest, int *tag, int *comm,
              int *status, int *ierr)
{
    return froozle_mpi_recv(buf, count, datatype, dest, tag, comm, status, ierr);
}

int mpi_recv__(const void *buf, int *count,
               int *datatype,
               int *dest, int *tag, int *comm,
               int *status, int *ierr)
{
    return froozle_mpi_recv(buf, count, datatype, dest, tag, comm, status, ierr);
}

int MPI_RECV(const void *buf, int *count,
             int *datatype,
             int *dest, int *tag, int *comm,
             int *status, int *ierr)
{
    return froozle_mpi_recv(buf, count, datatype, dest, tag, comm, status, ierr);
}
