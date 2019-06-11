/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#ifndef MPI_H
#define MPI_H

/***************************************************************/

#include "mpi-config.h"
#include "mpi-common.h"

/***************************************************************/

#ifndef FROOZLE_BUILDING
#define FROOZLE_BUILDING 0
#endif

/***************************************************************/

// Always declare the _int versions

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
int MPI_Get_elements(const MPI_Status *status,
                     MPI_Datatype datatype, int *count);

// This is an MPI_Count-enabled function, but it is in MPI-3.0.  So it
// is *always* defined.
int MPI_Get_elements_x(const MPI_Status *status,
                       MPI_Datatype datatype,
                       MPI_Count *count);


#if FROOZLE_HAVE_C11_GENERIC && !FROOZLE_BUILDING

#define MPI_Send(buf, count, dt, rank, tag, comm)           \
    _Generic(count,                                         \
             default: MPI_Send,                             \
             int: MPI_Send,                                 \
             MPI_Count: MPI_Send_x                          \
             )(buf, count, dt, rank, tag, comm)

#define MPI_Recv(buf, count, dt, rank, tag, comm, status)   \
    _Generic(count,                                         \
             default: MPI_Recv,                             \
             int: MPI_Recv,                                 \
             MPI_Count: MPI_Recv_x                          \
             )(buf, count, dt, rank, tag, comm, status)

#define MPI_Allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm) \
    _Generic(sendcount,                                                 \
             default: MPI_Allgather,                                    \
             int: MPI_Allgather,                                        \
             MPI_Count: MPI_Allgather_x                                 \
             )(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm)

#define MPI_Get_elements(status, datatype, count)         \
    _Generic(count,                                       \
             default: MPI_Get_elements,                   \
             int *: MPI_Get_elements,                     \
             MPI_Count *: MPI_Get_elements_x              \
             )(status, datatype, count)

int MPI_Send_x(const void *buf, MPI_Count count,
               MPI_Datatype datatype,
               int dest, int tag, MPI_Comm comm);
int MPI_Recv_x(void *buf, MPI_Count count,
               MPI_Datatype datatype,
               int source, int tag, MPI_Comm comm,
               MPI_Status *status);
int MPI_Allgather_x(const void *sendbuf, MPI_Count sendcount,
                    MPI_Datatype sendtype,
                    void *recvbuf, MPI_Count recvcount,
                    MPI_Datatype recvtype, MPI_Comm comm);

#endif // FROOZLE_HAVE_C11_GENERIC && !FROOZLE_BUILDING

#endif // MPI_H