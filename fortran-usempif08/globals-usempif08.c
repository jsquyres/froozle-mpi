/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>

typedef struct {
    int val;
} froozle_usempif08_handle_t;

froozle_usempif08_handle_t froozle_f08_mpi_comm_world = {0};
froozle_usempif08_handle_t froozle_f08_mpi_status_ignore = {1};

// These values are hard-coded in:
// - c/globals.c
// - fortran-usempif08/globals-usempif08.c
// - include/mpif-handlers.h
// Do not change them in one place without changing them in all places!
froozle_usempif08_handle_t froozle_f08_mpi_integer = {0};
froozle_usempif08_handle_t froozle_f08_mpi_character = {1};

// Need to put code here that is actually invoked from elsewhere so
// that the linker does not ignore this compilation unit (i.e., so the
// linker puts all the symbols -- including the non-code symbols -- in
// the resulting library).

static int bogus = 0;


void froozle_usempif08_globals_init(int *val)
{
    // Put an external side-effect in here so that it doesn't get
    // optimized out.
    *val = ++bogus;
}

void froozle_usempif08_globals_init_(int *val)
{
    *val = ++bogus;
}

void froozle_usempif08_globals_init__(int *val)
{
    *val = ++bogus;
}

void FROOZLE_USEMPIF08_GLOBALS_INIT(int *val)
{
    *val = ++bogus;
}
