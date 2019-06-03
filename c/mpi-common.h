/*
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#ifndef MPI_COMMON_H
#define MPI_COMMON_H

/***************************************************************/

struct froozle_comm;
struct froozle_datatype;
struct froozle_status;

typedef struct froozle_comm *MPI_Comm;
typedef struct froozle_datatype *MPI_Datatype;

typedef struct froozle_status MPI_Status;

typedef long MPI_Count;

enum {
    MPI_SUCCESS
};

extern MPI_Comm MPI_COMM_WORLD;

extern MPI_Datatype MPI_INT;
extern MPI_Datatype MPI_CHAR;

extern const int MPI_STATUS_SIZE;

extern MPI_Status *MPI_STATUS_IGNORE;

/***************************************************************/

// These functions do not have count arguments, and are therefore
// shared between both C and C++ interfaces.

int MPI_Init(int *argc, char ***argv);
int MPI_Comm_rank(MPI_Comm comm, int *rank);
int MPI_Comm_size(MPI_Comm comm, int *size);
int MPI_Finalize(void);

#endif // !MPI_COMMON_H
