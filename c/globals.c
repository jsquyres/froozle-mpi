/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include "froozle_config.h"

#include <stdio.h>

#define FROOZLE_BUILDING 1

#include "mpi.h"

struct froozle_comm {
    int bogus;
};

struct froozle_datatype {
    int bogus;
};

#define MPI_STATUS_SIZE 32

struct froozle_status {
    int bogus[MPI_STATUS_SIZE];
};


static struct froozle_comm froozle_comm_world = {0};

static struct froozle_datatype froozle_int = {0};
static struct froozle_datatype froozle_char = {0};

static struct froozle_status froozle_status_ignore = {0};

MPI_Comm MPI_COMM_WORLD = &froozle_comm_world;

MPI_Datatype MPI_INT = &froozle_int;
MPI_Datatype MPI_CHAR = &froozle_char;

MPI_Status *MPI_STATUS_IGNORE = &froozle_status_ignore;
