/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Send_y(const void *buf, MPI_Count count,
               MPI_Datatype datatype,
               int dest, int tag, MPI_Comm comm)
{
    printf("This is C MPI_Send_y\n");

    return MPI_SUCCESS;
}
