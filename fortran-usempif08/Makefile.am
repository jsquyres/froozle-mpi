# Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.

AM_FCFLAGS = -I$(TOP_BUILDDIR)/fortran-mpifh -I$(TOP_SRCDIR)/fortran-mpifh

lib_LTLIBRARIES = libmpi_usempif08_types.la libmpi_usempif08.la

libmpi_usempif08_types_la_SOURCES = \
        mpi-f08-types-module.F90

libmpi_usempif08_la_SOURCES = \
        mpi-f08-module.F90 \
        globals-usempif08.c \
        allgather_int_usempif08.F90 \
        allgather_count_usempif08.F90 \
        comm_rank_usempif08.f90 \
        comm_size_usempif08.f90 \
        get_elements_int_usempif08.F90 \
        get_elements_count_usempif08.F90 \
        get_elements_x_usempif08.F90 \
        init_usempif08.f90 \
        finalize_usempif08.f90 \
        recv_int_usempif08.F90 \
        recv_count_usempif08.F90 \
        send_int_usempif08.F90 \
        send_count_usempif08.F90

# Manually set some dependencies (because Automake doesn't know how to
# calculate Fortran dependencies)
mpi_f08_types.mod: libmpi_usempif08_types.la

mpi-f08-module.lo: mpi_f08_types.mod
allgather_int_usempif08.lo: mpi_f08_types.mod
allgather_count_usempif08.lo: mpi_f08_types.mod
comm_rank_usempif08.lo: mpi_f08_types.mod
comm_size_usempif08.lo: mpi_f08_types.mod
get_elements_int_usempif08.lo: mpi_f08_types.mod
get_elements_count_usempif08.lo: mpi_f08_types.mod
get_elements_x_usempif08.lo: mpi_f08_types.mod
init_usempif08.lo: mpi_f08_types.mod
finalize_usempif08.lo: mpi_f08_types.mod
recv_int_usempif08.lo: mpi_f08_types.mod
recv_count_usempif08.lo: mpi_f08_types.mod
send_int_usempif08.lo: mpi_f08_types.mod
send_count_usempif08.lo: mpi_f08_types.mod

#
# Clean up generated and module files
#

MOSTLYCLEANFILES = *.mod
CLEANFILES       = *.i90

# Install the generated .mod files.  Unfortunately, each F90 compiler
# may generate different filenames, so we have to use a glob.  :-(

install-exec-hook:
	@ for file in `ls *.mod`; do \
	  echo $(INSTALL) $$file $(DESTDIR)$(libdir); \
	  $(INSTALL) $$file $(DESTDIR)$(libdir); \
	done

uninstall-local:
	@ for file in `ls *.mod`; do \
	  echo rm -f $(DESTDIR)$(libdir)/$$file; \
	  rm -f $(DESTDIR)$(libdir)/$$file; \
	done
