/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


int MPI_Init(int *argc, char ***argv)
{
    printf("This is C %s\n", __func__);

#if FROOZLE_HAVE_C11_GENERIC
    printf("NOTE: This Froozle built with C11 _Generic support.  Yay!\n");
#else
    printf("NOTE: This Froozle was built without C11 _Generic support.  Bummer.\n");
#endif

    return MPI_SUCCESS;
}
