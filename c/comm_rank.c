/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Comm_rank(MPI_Comm comm, int *rank)
{
    printf("This is C %s\n", __func__);

    return MPI_SUCCESS;
}
