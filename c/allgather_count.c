/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Allgather_y(const void *sendbuf, MPI_Count sendcount,
                    MPI_Datatype sendtype,
                    void *recvbuf, MPI_Count recvcount,
                    MPI_Datatype recvtype, MPI_Comm comm)
{
    printf("This is C MPI_Allgather_y\n");

    return MPI_SUCCESS;
}
