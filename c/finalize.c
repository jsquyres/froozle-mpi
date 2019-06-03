/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#define FROOZLE_BUILDING 1

#include "mpi.h"


int MPI_Finalize(void)
{
    printf("This is C MPI_Finalize\n");

    return MPI_SUCCESS;
}
