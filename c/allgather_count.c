/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Allgather_x(const void *sendbuf, MPI_Count sendcount,
                    MPI_Datatype sendtype,
                    void *recvbuf, MPI_Count recvcount,
                    MPI_Datatype recvtype, MPI_Comm comm)
{
    printf("This is C %s\n", __func__);

    return MPI_SUCCESS;
}
