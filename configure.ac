# Copyright (c) 2019 Cisco Systems, Inc.
#
# This is a sample / no-op 6-function MPI to demonstrate BigCount
# symbols.  It is intended for the MPI tools community so that they
# can see what the impact will be for the proposed BigCount changes
# for MPI-4.0.
#

AC_INIT([froozle-mpi],
        [1.0],
        [https://mpi-forum.org/])
AC_PREREQ(2.60)
AC_CONFIG_AUX_DIR(config)
AC_CONFIG_MACRO_DIR(config)

AC_LANG([C])

dnl ----------------------------------------------------------------

AM_INIT_AUTOMAKE([foreign dist-bzip2 subdir-objects no-define 1.13.4])
AM_SILENT_RULES([yes])

dnl ----------------------------------------------------------------

LT_INIT

AM_ENABLE_SHARED
AM_DISABLE_STATIC

dnl ----------------------------------------------------------------


AH_TOP([/* -*- c -*-
 * Copyright (c) 2019 Cisco Systems, Inc.  All rights reserved.
 */

#ifndef FROOZLE_CONFIG_H
#define FROOZLE_CONFIG_H

#include "froozle_config_top.h"
])
AH_BOTTOM([
#include "froozle_config_bottom.h"
#endif /* FROOZLE_CONFIG_H */
])

AC_CONFIG_HEADER([config/froozle_config.h])

dnl ----------------------------------------------------------------

CFLAGS_save=$CFLAGS
CXXFLAGS_save=$CXXFLAGS
FCFLAGS_save=$FCFLAGS

AC_PROG_CC
AC_PROG_CXX
AC_PROG_FC

CFLAGS=$CFLAGS_save
CXXFLAGS=$CXXFLAGS_save
FCFLAGS=$FCFLAGS_save

AC_FC_SRCEXT([f90])

# Make sure we got all 3 compilers.  Because this is a demo project,
# we'll just refuse to continue if we didn't get all 3.
AS_IF([test -z "$CC" -o -z "$CXX" -o -z "$FC"],
      [AC_MSG_WARN([Froozle MPI requires C, C++, and Fortran compilers.])
       AC_MSG_ERROR([Cannot continue])])

dnl ----------------------------------------------------------------

TOP_BUILDDIR=`pwd`

cd "$srcdir"
TOP_SRCDIR=`pwd`
cd "$TOP_BUILDDIR"

AC_SUBST(TOP_SRCDIR)
AC_SUBST(TOP_BUILDDIR)

CPPFLAGS="$CPPFLAGS -I$TOP_SRCDIR/config"
CXXPPFLAGS="$CPPFLAGS -I$TOP_SRCDIR/config"

dnl ----------------------------------------------------------------

FROOZLE_CHECK_CC_C11
FROOZLE_FORTRAN_CHECK_IGNORE_TKR

dnl ----------------------------------------------------------------

AC_CONFIG_HEADER([c/mpi-config.h])
AC_CONFIG_HEADER([fortran-usempi/fortran-config.h])

AC_OUTPUT([
    Makefile
    config/Makefile

    c/Makefile
    fortran-mpifh/Makefile
    fortran-usempi/Makefile
    fortran-usempif08/Makefile
    cxx/Makefile

    examples/Makefile
])
dnl    fortran-usempi/mpi-module.f90
