# Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.

AM_CPPFLAGS = \
        -DFROOZLE_BUILDING=1 \
        -I$(TOP_SRCDIR)/include

lib_LTLIBRARIES = libmpi.la

libmpi_la_SOURCES = \
        globals.c \
        globals.h \
        allgather_int.c \
        allgather_count.c \
        comm_rank.c \
        comm_size.c \
        finalize.c \
        get_elements_int.c \
        get_elements_x.c \
        init.c \
        recv_int.c \
        recv_count.c \
        send_int.c \
        send_count.c
