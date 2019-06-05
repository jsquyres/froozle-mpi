# Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.

AM_CPPFLAGS = \
        -I$(TOP_SRCDIR) \
        -I$(TOP_SRCDIR)/include

AM_FCFLAGS = \
        -I$(TOP_SRCDIR)/include

lib_LTLIBRARIES = libmpi_mpifh.la

libmpi_mpifh_la_SOURCES = \
        allgather_int_mpifh.c \
        comm_rank_f.f90 \
        comm_size_f.f90 \
        finalize_f.f90 \
        get_elements_f.F90 \
        get_elements_x_f.F90 \
        globals_f.c \
        init_f.f90 \
        recv_int_mpifh.c \
        send_int_mpifh.c

libmpi_mpifh_la_LIBADD = $(TOP_BUILDDIR)/c/libmpi.la
