/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>
#include <limits.h>

#include "mpi.h"
#include "c/globals.h"


// The Fortran compiler will match one of these.
// Note: this isn't a real MPI implementation, so we don't have to
// actually initialize these to anything (we can't use
// foo[MPI_STATUS_SIZE] declarations because that's not valid at file
// scope).

int *froozle_mpi_status_ignore = NULL;
int *froozle_mpi_status_ignore_ = NULL;
int *froozle_mpi_status_ignore__ = NULL;
int *froozle_MPI_STATUS_IGNORE = NULL;


//
// This function does the work of Fortran MPI_GET_ELEMENTS[_X] in C
// because the type restrictions for MPI_STATUS are too strong in
// Fortran (specifically, a status must be an array of INTEGERS).
//
// This is quite similar to real MPI implementations: the Fortran
// array of INTEGER, DIMENSION(MPI_STATUS_SIZE) is just large enough
// to be the same size as the MPI_Status in C, and the implementation
// switches the meaning of the pointer to the chunk of memory pointing
// to the status back and forth between the C and Fortran
// representation as relevant.
//
void froozle_get_elements_f(int *datatype_f,
                            int *small_count_f, MPI_Count *big_count_f)
{
    MPI_Datatype datatype;

    // These values are hard-coded in include/mpif-handles.h.  Do not
    // change them there without changing them here!
    if (*datatype_f == 0) {
        // It's really MPI_INTEGER, but it's good enough for froozle
        // purposes
        datatype = MPI_INT;
    } else if (*datatype_f == 1) {
        // It's really MPI_CHARACTER, but it's good enough for froozle
        // purposes
        datatype = MPI_CHAR;
    }

    // Fill a dummy status with a count
    MPI_Status status;
    froozle_set_status(&status, datatype);

    // Fill both the small_count_f and big_count_f as relevant.  If
    // the count fits into the small_count_f, set it.  Otherwise, per
    // MPI-3.1 p114, set small_count_f to MPI_UNDEFINED.  The caller
    // will use whichever value is relevant to them.
    if (status.count > INT_MAX) {
        *small_count_f = MPI_UNDEFINED;
    } else {
        *small_count_f = (int) status.count;
    }
    *big_count_f = status.count;
}

void froozle_get_elements_f_(int *datatype_f,
                             int *small_count_f, MPI_Count *big_count_f)
{
    froozle_get_elements_f(datatype_f, small_count_f, big_count_f);
}

void froozle_get_elements_f__(int *datatype_f,
                              int *small_count_f, MPI_Count *big_count_f)
{
    froozle_get_elements_f(datatype_f, small_count_f, big_count_f);
}

void FROOZLE_GET_ELEMENTS_F(int *datatype_f,
                            int *small_count_f, MPI_Count *big_count_f)
{
    froozle_get_elements_f(datatype_f, small_count_f, big_count_f);
}
