# Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.

AM_CPPFLAGS = \
        -I$(TOP_SRCDIR)/c \
        -I$(TOP_SRCDIR)/config

lib_LTLIBRARIES = libmpi_mpifh.la

libmpi_mpifh_la_SOURCES = \
        mpif.h \
        mpif-constants.h \
        mpif-handles.h \
        mpif-sentinels.h \
        allgather_int_mpifh.c \
        comm_rank_f.f90 \
        comm_size_f.f90 \
        finalize_f.f90 \
        get_elements_f.F90 \
        globals_f.c \
        init_f.f90 \
        recv_int_mpifh.c \
        send_int_mpifh.c
