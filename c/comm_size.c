/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Comm_size(MPI_Comm comm, int *size)
{
    printf("This is C MPI_Comm_size\n");

    return MPI_SUCCESS;
}
