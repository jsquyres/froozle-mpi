/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.hpp"


int MPI_Allgather(const void *sendbuf, MPI_Count sendcount,
                  MPI_Datatype sendtype,
                  void *recvbuf, MPI_Count recvcount,
                  MPI_Datatype recvtype, MPI_Comm comm)
{
    printf("This is C++ MPI_Allgather (with count params)\n");

    return MPI_SUCCESS;
}
