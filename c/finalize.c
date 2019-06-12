/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Finalize(void)
{
    printf("This is C %s\n", __func__);

    return MPI_SUCCESS;
}
