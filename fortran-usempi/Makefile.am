# Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.

AM_FCFLAGS = -I$(TOP_SRCDIR)/include

lib_LTLIBRARIES = libmpi_usempi.la

nodist_libmpi_usempi_la_SOURCES = \
        mpi-module.F90

libmpi_usempi_la_SOURCES = \
        allgather_int_usempi.F90 \
        get_elements_int_usempi.F90 \
        get_elements_x_usempi.F90 \
        recv_int_usempi.F90 \
        send_int_usempi.F90

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
