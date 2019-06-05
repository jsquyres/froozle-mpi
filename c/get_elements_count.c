/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Get_elements_x(const MPI_Status *status,
                       MPI_Datatype datatype, MPI_Count *count)
{
    printf("This is C MPI_Get_elements_x\n");

    // If they asked for MPI_CHAR, return FROOZLE_TEST_SMALL_COUNT.
    // If they asked for MPI_INT, return FROOZLE_TEST_GIANT_COUNT_C.
    *count = (MPI_Count) MPI_UNDEFINED;
    if (datatype == MPI_CHAR) {
        *count = FROOZLE_TEST_SMALL_COUNT;
    } else if (datatype == MPI_INT) {
        *count = FROOZLE_TEST_GIANT_COUNT_C;
    }

    return MPI_SUCCESS;
}
