/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.hpp"


int MPI_Get_elements(const MPI_Status *status,
                     MPI_Datatype datatype, int *count)
{
    printf("This is C++ MPI_Get_elements (with int params)\n");

    // If they asked for MPI_CHAR, return FROOZLE_TEST_SMALL_COUNT.
    // If they asked for MPI_INT, return FROOZLE_TEST_GIANT_COUNT_C (or
    // MPI_UNDEFINED, since we can't hold that value in an int -- per
    // MPI-3.1 p114).
    *count = MPI_UNDEFINED;
    if (datatype == MPI_CHAR) {
        *count = FROOZLE_TEST_SMALL_COUNT;
    }

    return MPI_SUCCESS;
}
