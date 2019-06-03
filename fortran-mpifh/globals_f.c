/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>


// The Fortran compiler will match one of these
// Note: this isn't a real MPI implementation, so we don't have to
// actually initialize these to anything (we can't use
// foo[MPI_STATUS_SIZE] declarations because that's not valid at file
// scope).

int *froozle_mpi_status_ignore = NULL;
int *froozle_mpi_status_ignore_ = NULL;
int *froozle_mpi_status_ignore__ = NULL;
int *froozle_MPI_STATUS_IGNORE = NULL;

// Need to put code here that is actually invoked from elsewhere so
// that the linker does not ignore this compilation unit (i.e., so the
// linker puts all the symbols -- including the non-code symbols -- in
// the resulting library).

static int bogus = 0;


void froozle_fortran_globals_init(int *val)
{
    // Put an external side-effect in here so that it doesn't get
    // optimized out.
    *val = ++bogus;
}

void froozle_fortran_globals_init_(int *val)
{
    *val = ++bogus;
}

void froozle_fortran_globals_init__(int *val)
{
    *val = ++bogus;
}

void FROOZLE_FORTRAN_GLOBALS_INIT(int *val)
{
    *val = ++bogus;
}
