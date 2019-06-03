/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.hpp"


int MPI_Send(const void *buf, MPI_Count count,
             MPI_Datatype datatype,
             int dest, int tag, MPI_Comm comm)
{
    printf("This is C++ MPI_Send_count\n");

    return MPI_SUCCESS;
}
