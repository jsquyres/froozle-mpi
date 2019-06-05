/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#ifndef FROOZLE_GLOBALS_H
#define FROOZLE_GLOBALS_H

#include "froozle_config.h"

// It is required that the caller include "mpi.h" or "mpi.hpp", as
// relevant, before including this file.

#if defined(c_plusplus) || defined(__cplusplus)
extern "C" {
#endif

    struct froozle_comm {
        int bogus;
    };

    struct froozle_datatype {
        int bogus;
    };


    void froozle_set_status(MPI_Status *status, MPI_Datatype datatype);

#if defined(c_plusplus) || defined(__cplusplus)
}
#endif

#endif // FROOZLE_GLOBALS_H
