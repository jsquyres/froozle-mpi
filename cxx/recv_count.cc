/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.hpp"


int MPI_Recv(void *buf, MPI_Count count,
             MPI_Datatype datatype,
             int source, int tag, MPI_Comm comm,
             MPI_Status *status)
{
    printf("This is C++ MPI_Recv (with count params)\n");

    return MPI_SUCCESS;
}