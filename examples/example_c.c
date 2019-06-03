/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#include <stdio.h>

#include <mpi.h>

#define SIZE 32


//
// JMS Also add example in here showing what happens with function pointers.
//

typedef int (*foo)(const void *buf, int count,
                   MPI_Datatype datatype,
                   int dest, int tag, MPI_Comm comm);

int main(int argc, char **argv)
{
    MPI_Init(NULL, NULL);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    printf(">> The following functions should call MPI_Send (with int params)\n");
    char buffer[SIZE];
    int i = SIZE;
    MPI_Send(buffer, i, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    MPI_Send(buffer, 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD);

    // Deliberately use a wrong-sized variable
    short smallI = 16;
    MPI_Send(buffer, smallI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);

    printf(">> The following functions should call MPI_Send_count\n");
    MPI_Count bigI = 8589934592;
    MPI_Send(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    // This one will generate a compiler warning (or error!) if you
    // have no C11 _Generic support.
    MPI_Send(buffer, 8589934592, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    MPI_Send(buffer, (MPI_Count) 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD);

    MPI_Finalize();

    return 0;
}
