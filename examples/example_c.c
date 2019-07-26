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

#if FROOZLE_HAVE_C11_GENERIC
    printf(">> The following functions should call MPI_Send_l\n");
    MPI_Count bigI = 8589934592;
    MPI_Send(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);

    // This one will generate a compiler warning (or error!) if you
    // have no C11 _Generic support.
    MPI_Send(buffer, 8589934592, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    MPI_Send(buffer, (MPI_Count) 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
#endif

    // Let's also make sure that taking function pointers of both C
    // functions work (i.e., the back-end MPI_Send function and the
    // MPI_Send_l function).
    typedef int (*int_fn_t)(const void *buf, int count,
                            MPI_Datatype datatype,
                            int dest, int tag, MPI_Comm comm);
    typedef int (*count_fn_t)(const void *buf, MPI_Count count,
                              MPI_Datatype datatype,
                              int dest, int tag, MPI_Comm comm);

    // Note that the assignment from "MPI_Send" works even though
    // there is a #define for "MPI_Send" to a C11 _Generic expression
    // because the assignment below does not use () after MPI_Send, and
    // therefore the #define does not actually pre-processor replace the
    // "MPI_Send" below with the C11 _Generic expression.  Hence,
    // "MPI_Send" below returns a pointer to the int flavor of the MPI_Send
    // function.

    // Now that we have function pointers, the normal C promotion
    // rules apply to the count parameter.
    printf(">> The following functions should call MPI_Send (with int params)\n");
    int_fn_t int_fn = MPI_Send;
    int_fn(buffer, i, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    int_fn(buffer, smallI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);

#if FROOZLE_HAVE_C11_GENERIC
    // JMS Per the MPI Forum Virtual meeting on 2018-07-23, the
    // MPI_Send_l function a) will be renamed MPI_Send_x, and b) will always
    // be available, even if C11 _Generic isn't.  A future pull request will
    // make these changes.
    printf(">> The following functions should call MPI_Send_l\n");
    count_fn_t count_fn = MPI_Send_l;
    count_fn(buffer, i, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    count_fn(buffer, smallI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
    count_fn(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD);
#endif
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

#if FROOZLE_HAVE_C11_GENERIC
    printf(">> The following functions should call MPI_Recv_l\n");
    MPI_Count bigI = 8589934592;
    MPI_Recv(buffer, bigI, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);

    MPI_Recv(buffer, 8589934592, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
    MPI_Recv(buffer, (MPI_Count) 32, MPI_CHAR, 0, 0, MPI_COMM_WORLD,
             MPI_STATUS_IGNORE);
#endif
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

#if FROOZLE_HAVE_C11_GENERIC
    printf(">> The following functions should call MPI_Allgather_l\n");
    MPI_Count bigI = 8589934592;
    MPI_Allgather(buffer, bigI, MPI_CHAR,
                  buffer, bigI, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather(buffer, 8589934592, MPI_CHAR,
                  buffer, 8589934592, MPI_CHAR, MPI_COMM_WORLD);
    MPI_Allgather(buffer, (MPI_Count) 32, MPI_CHAR,
                  buffer, (MPI_Count) 32, MPI_CHAR, MPI_COMM_WORLD);
#endif
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
    printf(">> The following functions call MPI_Get_elements\n");
    int count_i;
    MPI_Get_elements(MPI_STATUS_IGNORE, MPI_CHAR, &count_i);
    CHECK_EQ(count_i, 42);
    MPI_Get_elements(MPI_STATUS_IGNORE, MPI_INT, &count_i);
    CHECK_EQ(count_i, MPI_UNDEFINED);

    MPI_Count count_c;
#if FROOZLE_HAVE_C11_GENERIC
    printf(">> The following functions call MPI_Get_elements_l\n");
    MPI_Get_elements(MPI_STATUS_IGNORE, MPI_CHAR, &count_c);
    CHECK_EQ(count_c, (MPI_Count) FROOZLE_TEST_SMALL_COUNT);
    MPI_Get_elements(MPI_STATUS_IGNORE, MPI_INT, &count_c);
    CHECK_EQ(count_c, FROOZLE_TEST_GIANT_COUNT_C);
#endif

    printf(">> The following functions call MPI_Get_elements_x\n");
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
