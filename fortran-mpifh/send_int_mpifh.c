/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>

#include <mpi.h>


static int froozle_mpi_send(const void *buf, int *count,
                            int *datatype,
                            int *dest, int *tag, int *comm,
                            int *ierr)
{
    printf("This is mpif.h MPI_Send (integer)\n");
    return MPI_SUCCESS;
}

int mpi_send(const void *buf, int *count,
             int *datatype,
             int *dest, int *tag, int *comm,
             int *ierr)
{
    return froozle_mpi_send(buf, count, datatype, dest, tag, comm, ierr);
}

int mpi_send_(const void *buf, int *count,
              int *datatype,
              int *dest, int *tag, int *comm,
              int *ierr)
{
    return froozle_mpi_send(buf, count, datatype, dest, tag, comm, ierr);
}

int mpi_send__(const void *buf, int *count,
               int *datatype,
               int *dest, int *tag, int *comm,
               int *ierr)
{
    return froozle_mpi_send(buf, count, datatype, dest, tag, comm, ierr);
}

int MPI_SEND(const void *buf, int *count,
             int *datatype,
             int *dest, int *tag, int *comm,
             int *ierr)
{
    return froozle_mpi_send(buf, count, datatype, dest, tag, comm, ierr);
}
