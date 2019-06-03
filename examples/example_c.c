/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 *
 * This is likely not a valid MPI application.  Its only purpose is to
 * compile and link properly; it will almost certainly not run
 * correctly with a valid / complete MPI implementation.
 */

#include <stdio.h>

#include <mpi.h>

#define SIZE 32
char buffer[SIZE];


//
// JMS Also add example in here showing what happens with function pointers.
//


static void do_sends(void)
{
    printf(">> The following functions should call MPI_Send (with int params)\n");
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
}

static void do_recvs(void)
{
    printf(">> The following functions should call MPI_Recv (with int params)\n");
    int i = SIZE;
    MPI_Recv(buffer, i, MPI_CHAR, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    MPI_Recv(buffer, 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

    // Deliberately use a wrong-sized variable
    short smallI = 16;
    MPI_Recv(buffer, smallI, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

    printf(">> The following functions should call MPI_Recv_count\n");
    MPI_Count bigI = 8589934592;
    MPI_Recv(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

    // This one will generate a compiler warning (or error!) if you
    // have no C11 _Generic support.
    MPI_Recv(buffer, 8589934592, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    MPI_Recv(buffer, (MPI_Count) 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
}

static void do_allgathers(void)
{
    printf(">> The following functions should call MPI_Allgather (with int params)\n");
    int i = 32;
    MPI_Allgather(buffer, i, MPI_CHAR,
                  buffer, i, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather(buffer, 32, MPI_CHAR,
                  buffer, 32, MPI_CHAR, MPI_COMM_WORLD);

    // Deliberately use a wrong-sized variable
    short smallI = 16;
    MPI_Allgather(buffer, smallI, MPI_CHAR,
                  buffer, smallI, MPI_CHAR, MPI_COMM_WORLD);

    printf(">> The following functions should call MPI_Allgather_count\n");
    MPI_Count bigI = 8589934592;
    MPI_Allgather(buffer, bigI, MPI_CHAR,
                  buffer, bigI, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather(buffer, 8589934592, MPI_CHAR,
                  buffer, 8589934592, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather(buffer, (MPI_Count) 32, MPI_CHAR,
                  buffer, (MPI_Count) 32, MPI_CHAR, MPI_COMM_WORLD);
}

int main(int argc, char **argv)
{
    MPI_Init(NULL, NULL);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    do_sends();
    do_recvs();
    do_allgathers();

    MPI_Finalize();

    return 0;
}
