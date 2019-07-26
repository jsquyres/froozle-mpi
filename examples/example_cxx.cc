/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 *
 * This is likely not a valid MPI application.  Its only purpose is to
 * compile and link properly; it will almost certainly not run
 * correctly with a valid / complete MPI implementation.
 */

#include "froozle_config.h"

#include <stdio.h>
#include <stdlib.h>

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

    printf(">> The following functions should call MPI_Send_x\n");
    MPI_Count bigI = 8589934592;
    MPI_Send_x(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    MPI_Send_x(buffer, 8589934592, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    MPI_Send_x(buffer, (MPI_Count) 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
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

    printf(">> The following functions should call MPI_Recv_x\n");
    MPI_Count bigI = 8589934592;
    MPI_Recv_x(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
               MPI_STATUS_IGNORE);
    MPI_Recv_x(buffer, 8589934592, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
               MPI_STATUS_IGNORE);
    MPI_Recv_x(buffer, (MPI_Count) 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
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

    printf(">> The following functions should call MPI_Allgather_x\n");
    MPI_Count bigI = 8589934592;
    MPI_Allgather_x(buffer, bigI, MPI_CHAR,
                    buffer, bigI, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather_x(buffer, 8589934592, MPI_CHAR,
                    buffer, 8589934592, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather_x(buffer, (MPI_Count) 32, MPI_CHAR,
                    buffer, (MPI_Count) 32, MPI_CHAR, MPI_COMM_WORLD);
}

static void check_eq(MPI_Count a, MPI_Count b, int line)
{
    if (a != b) {
        printf("ERROR: %ld != %ld at line %d\n",
               (long) a, (long) b, line);
        exit(1);
    }
}

#define CHECK_EQ(a, b) check_eq((a), (b), __LINE__)

static void do_get_elements(void)
{
    printf(">> The following functions call MPI_Get_elements (with int params)\n");
    int count_i;
    MPI_Get_elements(MPI_STATUS_IGNORE, MPI_CHAR, &count_i);
    CHECK_EQ(count_i, 42);
    MPI_Get_elements(MPI_STATUS_IGNORE, MPI_INT, &count_i);
    CHECK_EQ(count_i, MPI_UNDEFINED);

    printf(">> The following functions call MPI_Get_elements_x\n");
    MPI_Count count_c;
    MPI_Get_elements_x(MPI_STATUS_IGNORE, MPI_CHAR, &count_c);
    CHECK_EQ(count_c, (MPI_Count) FROOZLE_TEST_SMALL_COUNT);
    MPI_Get_elements_x(MPI_STATUS_IGNORE, MPI_INT, &count_c);
    CHECK_EQ(count_c, FROOZLE_TEST_GIANT_COUNT_C);
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
    do_get_elements();

    MPI_Finalize();

    return 0;
}
