# Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.

AM_CXXFLAGS = \
        -I$(TOP_SRCDIR)/include \
        -I$(TOP_SRCDIR)

lib_LTLIBRARIES = libmpi_cxx.la

libmpi_cxx_la_SOURCES = \
        allgather_int.cc \
        allgather_count.cc \
        get_elements_int.cc \
        get_elements_count.cc \
        get_elements_x.cc \
        recv_int.cc \
        recv_count.cc \
        send_int.cc \
        send_count.cc

libmpi_cxx_la_LIBADD = $(TOP_BUILDDIR)/c/libmpi.la
