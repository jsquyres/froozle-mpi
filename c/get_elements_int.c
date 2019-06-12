/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>
#include <limits.h>

#include "mpi.h"

#include "globals.h"


int MPI_Get_elements(const MPI_Status *status,
                     MPI_Datatype datatype, int *count)
{
    printf("This is C %s\n", __func__);

    // The test programs are passing in bogus statuses (e.g.,
    // MPI_STATUS_IGNORE), so generate a status here and set a value
    // based on the queried datatype.
    MPI_Status dummy_status;
    froozle_set_status(&dummy_status, datatype);

    if (dummy_status.count > INT_MAX) {
        *count = MPI_UNDEFINED;
    } else {
        *count = dummy_status.count;
    }

    return MPI_SUCCESS;
}
