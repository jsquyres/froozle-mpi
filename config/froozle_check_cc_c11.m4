dnl -*- shell-script -*-
dnl
dnl Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
dnl                         University Research and Technology
dnl                         Corporation.  All rights reserved.
dnl Copyright (c) 2004-2006 The University of Tennessee and The University
dnl                         of Tennessee Research Foundation.  All rights
dnl                         reserved.
dnl Copyright (c) 2004-2008 High Performance Computing Center Stuttgart,
dnl                         University of Stuttgart.  All rights reserved.
dnl Copyright (c) 2004-2006 The Regents of the University of California.
dnl                         All rights reserved.
dnl Copyright (c) 2007-2009 Sun Microsystems, Inc.  All rights reserved.
dnl Copyright (c) 2008-2019 Cisco Systems, Inc.  All rights reserved.
dnl Copyright (c) 2012-2017 Los Alamos National Security, LLC. All rights
dnl                         reserved.
dnl Copyright (c) 2015-2019 Research Organization for Information Science
dnl                         and Technology (RIST).  All rights reserved.
dnl $COPYRIGHT$
dnl
dnl Additional copyrights may follow
dnl
dnl $HEADER$
dnl

AC_DEFUN([FROOZLE_CC_HELPER],[
    AC_MSG_CHECKING([$1])

    AC_LINK_IFELSE([AC_LANG_PROGRAM([$3],[$4])],
                   [$2=1
                    froozle_cc_helper_result=yes],
                   [$2=0
                    froozle_cc_helper_result=no])

    AC_MSG_RESULT([$froozle_cc_helper_result])
])

dnl ---------------------------------------------------------------------

AC_DEFUN([FROOZLE_PROG_CC_C11_HELPER],[
    froozle_prog_cc_c11_helper_CFLAGS_save=$CFLAGS
    CFLAGS="$CFLAGS $1"

    FROOZLE_CC_HELPER([if $CC $1 supports C11 _Generic keyword], [froozle_prog_cc_c11_helper__Generic_available],
                   [[#define FOO(x) (_Generic (x, int: 1))]], [[static int x, y; y = FOO(x);]])

    AS_IF([test $froozle_prog_cc_c11_helper__Generic_available -eq 1],
          [$2],
          [$3])

    CFLAGS=$froozle_prog_cc_c11_helper_CFLAGS_save
])

dnl ---------------------------------------------------------------------

AC_DEFUN([FROOZLE_CHECK_CC_C11_BACKEND],[
    AC_MSG_CHECKING([if $CC requires a flag for C11])
    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
#if __STDC_VERSION__ < 201112L
#error "Without any CLI flags, this compiler does not support C11"
#endif
                                       ]],[])],
                      [froozle_cv_c11_flag_required=no],
                      [froozle_cv_c11_flag_required=yes])
    AC_MSG_RESULT([$froozle_cv_c11_flag_required])

    if test "x$froozle_cv_c11_flag_required" = "xno" ; then
        AC_MSG_NOTICE([verifying $CC supports C11 without a flag])
        FROOZLE_PROG_CC_C11_HELPER([], [], [froozle_cv_c11_flag_required=yes])
    fi

    if test "x$froozle_cv_c11_flag_required" = "xyes" ; then
        froozle_prog_cc_c11_flags="-std=gnu11 -std=c11 -c11"

        AC_MSG_NOTICE([checking if $CC supports C11 with a flag])
        froozle_cv_c11_flag=
        for flag in $(echo $froozle_prog_cc_c11_flags | tr ' ' '\n') ; do
            FROOZLE_PROG_CC_C11_HELPER([$flag],[froozle_cv_c11_flag=$flag],[])
            if test "x$froozle_cv_c11_flag" != "x" ; then
                CFLAGS="$CFLAGS $froozle_cv_c11_flag"
                AC_MSG_NOTICE([using $flag to enable C11 support])
                froozle_cv_c11_supported=yes
                break
            fi
        done
    else
        AC_MSG_NOTICE([no flag required for C11 support])
        froozle_cv_c11_supported=yes
    fi

    AC_MSG_CHECKING([if compiler supports C11 at all])
    AS_IF([test "$froozle_cv_c11_supported" = "yes"],
          [FROOZLE_HAVE_C11_GENERIC=1])
    AC_MSG_RESULT([$froozle_cv_c11_supported])
])

dnl ---------------------------------------------------------------------

AC_DEFUN([FROOZLE_CHECK_CC_C11],[
    AC_REQUIRE([AC_PROG_CC])

    froozle_cv_c11_supported=no
    FROOZLE_HAVE_C11_GENERIC=0

    AC_ARG_ENABLE([c11-generic],
	[AC_HELP_STRING([--disable-c11-generic],
                   [disable the use of C11 _Generic (i.e., pretend that this C compiler does not support _Generic)])])

    AC_MSG_CHECKING([if want to use C11 _Generic])
    AS_IF([test "$enable_c11_generic" != "no"],
        [AC_MSG_RESULT([yes])
	 FROOZLE_CHECK_CC_C11_BACKEND],
	[AC_MSG_RESULT([no])])

    AC_DEFINE_UNQUOTED([FROOZLE_HAVE_C11_GENERIC],
          [$FROOZLE_HAVE_C11_GENERIC],
	  [Whether the C compiler supports C11 _Generic or not])
])
