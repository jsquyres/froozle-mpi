/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#ifndef MPI_HPP
#define MPI_HPP

/***************************************************************/

#include "mpi-config.h"
extern "C" {
#include "mpi-common.h"
}

/***************************************************************/

// MPI_Count variants

int MPI_Send(const void *buf, MPI_Count count,
             MPI_Datatype datatype,
             int dest, int tag, MPI_Comm comm);
int MPI_Recv(void *buf, MPI_Count count,
             MPI_Datatype datatype,
             int source, int tag, MPI_Comm comm,
             MPI_Status *status);
int MPI_Allgather(const void *sendbuf, MPI_Count sendcount,
                  MPI_Datatype sendtype,
                  void *recvbuf, MPI_Count recvcount,
                  MPI_Datatype recvtype, MPI_Comm comm);

// int variants

int MPI_Send(const void *buf, int count,
             MPI_Datatype datatype,
             int dest, int tag, MPI_Comm comm);
int MPI_Recv(void *buf, int count,
             MPI_Datatype datatype,
             int source, int tag, MPI_Comm comm,
             MPI_Status *status);
int MPI_Allgather(const void *sendbuf, int sendcount,
                  MPI_Datatype sendtype,
                  void *recvbuf, int recvcount,
                  MPI_Datatype recvtype, MPI_Comm comm);

#endif // MPI_HPP
