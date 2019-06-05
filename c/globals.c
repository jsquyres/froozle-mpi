/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#include "mpi.h"


struct froozle_comm {
    int bogus;
};

struct froozle_datatype {
    int bogus;
};

static struct froozle_comm froozle_comm_world = {0};

// These values are hard-coded in:
// - c/globals.c
// - fortran-usempif08/globals-usempif08.c
// - include/mpif-handlers.h
// Do not change them in one place without changing them in all places!
static struct froozle_datatype froozle_int = {0};
static struct froozle_datatype froozle_char = {1};

static struct froozle_status froozle_status_ignore = {0};

MPI_Comm MPI_COMM_WORLD = &froozle_comm_world;

MPI_Datatype MPI_INT = &froozle_int;
MPI_Datatype MPI_CHAR = &froozle_char;

MPI_Status *MPI_STATUS_IGNORE = &froozle_status_ignore;

const int MPI_UNDEFINED = -1;


void froozle_set_status(MPI_Status *status, MPI_Datatype datatype)
{
    // If they asked for MPI_CHAR, set FROOZLE_TEST_SMALL_COUNT.
    // If they asked for MPI_INT, set FROOZLE_TEST_GIANT_COUNT_C.
    // Otherwise, set MPI_UNDEFINED.
    status->count = MPI_UNDEFINED;
    if (MPI_CHAR == datatype) {
        status->count = FROOZLE_TEST_SMALL_COUNT;
    } else if (MPI_INT == datatype) {
        status->count = FROOZLE_TEST_GIANT_COUNT_C;
    }
}
