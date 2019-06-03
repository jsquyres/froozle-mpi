# Copyright (c) 2019 Cisco Systems.  All rights reserved.

bin_PROGRAMS = \
        example_c \
        example_cxx \
        example_mpifh

example_c_LDADD = $(TOP_BUILDDIR)/c/libmpi.la

example_cxx_SOURCES = example_cxx.cc
example_cxx_LDADD   = $(TOP_BUILDDIR)/cxx/libmpi_cxx.la

example_mpifh_SOURCES = example_mpifh.F90
example_mpifh_LDADD   = $(TOP_BUILDDIR)/fortran-mpifh/libmpi_mpifh.la
