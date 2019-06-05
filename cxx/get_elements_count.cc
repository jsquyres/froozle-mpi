/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.hpp"
#include "c/globals.h"


int MPI_Get_elements(const MPI_Status *status,
                     MPI_Datatype datatype, MPI_Count *count)
{
    printf("This is C++ MPI_Get_elements (with MPI_Count params)\n");

    // The test programs are passing in bogus statuses (e.g.,
    // MPI_STATUS_IGNORE), so generate a status here and set a value
    // based on the queried datatype.
    MPI_Status dummy_status;
    froozle_set_status(&dummy_status, datatype);

    *count = dummy_status.count;

    return MPI_SUCCESS;
}
