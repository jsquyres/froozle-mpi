# Copyright (c) 2019 Cisco Systems.  All rights reserved.

AM_CPPFLAGS = -I$(TOP_SRCDIR)/c

mpif   = -I$(TOP_SRCDIR)/include
usempi = -I$(TOP_BUILDDIR)/fortran-usempi
usef08 = -I$(TOP_BUILDDIR)/fortran-usempif08

bin_PROGRAMS = \
        example_c \
        example_cxx \
        example_mpifh \
        example_usempi \
        example_usempif08

example_c_LDADD = $(TOP_BUILDDIR)/c/libmpi.la

example_cxx_SOURCES = example_cxx.cc
example_cxx_LDADD   = $(TOP_BUILDDIR)/c/libmpi.la

example_mpifh_SOURCES = example_mpifh.F90
example_mpifh_FCFLAGS = $(mpif)
example_mpifh_LDADD   = $(TOP_BUILDDIR)/fortran-mpifh/libmpi_mpifh.la

example_usempi_SOURCES = example_usempi.F90
example_usempi_FCFLAGS = $(mpif) $(usempi)
example_usempi_LDADD   = \
        $(TOP_BUILDDIR)/fortran-usempi/libmpi_usempi.la \
        $(TOP_BUILDDIR)/fortran-mpifh/libmpi_mpifh.la

example_usempif08_SOURCES = example_usempif08.F90
example_usempif08_FCFLAGS = $(usef08)
example_usempif08_LDADD   = \
        $(TOP_BUILDDIR)/fortran-usempif08/libmpi_usempif08.la \
        $(TOP_BUILDDIR)/fortran-mpifh/libmpi_mpifh.la
