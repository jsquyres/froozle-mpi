dnl -*- shell-script -*-
dnl
dnl Copyright (c) 2004-2006 The Trustees of Indiana University and Indiana
dnl                         University Research and Technology
dnl                         Corporation.  All rights reserved.
dnl Copyright (c) 2004-2005 The University of Tennessee and The University
dnl                         of Tennessee Research Foundation.  All rights
dnl                         reserved.
dnl Copyright (c) 2004-2005 High Performance Computing Center Stuttgart,
dnl                         University of Stuttgart.  All rights reserved.
dnl Copyright (c) 2004-2005 The Regents of the University of California.
dnl                         All rights reserved.
dnl Copyright (c) 2007      Los Alamos National Security, LLC.  All rights
dnl                         reserved.
dnl Copyright (c) 2007      Sun Microsystems, Inc.  All rights reserved.
dnl Copyright (c) 2009-2015 Cisco Systems, Inc.  All rights reserved.
dnl $COPYRIGHT$
dnl
dnl Additional copyrights may follow
dnl
dnl $HEADER$

dnl Does this compiler support (void*)-like functionality for MPI choice
dnl buffers?  If so, which flavor?
AC_DEFUN([FROOZLE_FORTRAN_CHECK_IGNORE_TKR], [
    FROOZLE_FORTRAN_IGNORE_TKR_PREDECL=
    FROOZLE_FORTRAN_IGNORE_TKR_TYPE=

    AS_VAR_PUSHDEF([fortran_ignore_tkr_data],
                   [froozle_cv_fortran_ignore_tkr_data])

    # Note that we can only cache 1 value at a time, but this test
    # needs to check for 2 things: the ignore TKR predecl and the
    # type.  So we encode them into a string of the form
    # <1|0>:<type>:<predecl>.  Ugh.
    AC_CACHE_CHECK([Fortran compiler ignore TKR syntax],
                    fortran_ignore_tkr_data,
                    [_FROOZLE_FORTRAN_CHECK_IGNORE_TKR])
    AS_VAR_COPY([result], [fortran_ignore_tkr_data])

    # Parse the result
    happy=`echo $result | cut -d: -f1`
    type=`echo $result | cut -d: -f2`
    predecl=`echo $result | cut -d: -f3-`

    AS_IF([test $happy -eq 1],
          [FROOZLE_FORTRAN_IGNORE_TKR_PREDECL=$predecl
           FROOZLE_FORTRAN_IGNORE_TKR_TYPE=$type
           $1],
          [$2])

    AC_SUBST(FROOZLE_FORTRAN_IGNORE_TKR_PREDECL)
    AC_SUBST(FROOZLE_FORTRAN_IGNORE_TKR_TYPE)
    AC_DEFINE_UNQUOTED([FROOZLE_FORTRAN_IGNORE_TKR_PREDECL],
        [$FROOZLE_FORTRAN_IGNORE_TKR_PREDECL],
        [Pre-declaration for Fortran ignore TKR])
    AC_DEFINE_UNQUOTED([FROOZLE_FORTRAN_IGNORE_TKR_TYPE],
        [$FROOZLE_FORTRAN_IGNORE_TKR_TYPE],
        [Ceclaration for Fortran ignore TKR])

    AS_VAR_POPDEF([fortran_ignore_tkr_data])
])

################

AC_DEFUN([_FROOZLE_FORTRAN_CHECK_IGNORE_TKR], [
    # If we were called here, it means that the value was not cached,
    # so we need to check several different things.  Since CACHE_CHECK
    # puts up a MSG_CHECKING, we need to terminate it with a bogus
    # answer before doing the individual checks.
    AC_MSG_RESULT([not cached; checking variants])

    # Default values
    froozle_fortran_ignore_tkr_predecl=!
    froozle_fortran_ignore_tkr_type=real

    # Vendor-neutral, TYPE(*) syntax
    FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB(
         [!], [type(*)],
         [TYPE(*), DIMENSION(*)],
         [happy=1], [happy=0])

    # GCC compilers
    AS_IF([test $happy -eq 0],
          [FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB(
              [!GCC\$ ATTRIBUTES NO_ARG_CHECK ::], [type(*), dimension(*)],
              [!GCC\$ ATTRIBUTES NO_ARG_CHECK],
              [happy=1], [happy=0])])
    # Intel compilers
    AS_IF([test $happy -eq 0],
          [FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB(
              [!DEC\$ ATTRIBUTES NO_ARG_CHECK ::], [real, dimension(*)],
              [!DEC\$ ATTRIBUTES NO_ARG_CHECK],
              [happy=1], [happy=0])])
    # Solaris Studio compilers
    # Note that due to a compiler bug, we have been advised by Oracle to
    # use the "character(*)" type
    AS_IF([test $happy -eq 0],
          [FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB(
              [!\$PRAGMA IGNORE_TKR], [character(*)],
              [!\$PRAGMA IGNORE_TKR],
              [happy=1], [happy=0])])
    # Cray compilers
    AS_IF([test $happy -eq 0],
          [FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB(
              [!DIR\$ IGNORE_TKR], [real, dimension(*)],
              [!DIR\$ IGNORE_TKR],
              [happy=1], [happy=0])])
    # IBM compilers
    AS_IF([test $happy -eq 0],
          [FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB(
              [!IBM* IGNORE_TKR], [real, dimension(*)],
              [!IBM* IGNORE_TKR],
              [happy=1], [happy=0])])

    AS_VAR_SET(fortran_ignore_tkr_data,
               [${happy}:${froozle_fortran_ignore_tkr_type}:${froozle_fortran_ignore_tkr_predecl}])

    # Now put the original CACHE_CHECK MSG_CHECKING back so that it can
    # output the MSG_RESULT.
    AC_MSG_CHECKING([Fortran compiler ignore TKR syntax])
])dnl

dnl ###################################

dnl Generic check to see if Fortran compiler supports (void*)-like
dnl functionality
dnl $1: pre-decl qualifier line -- likely a compiler directive
dnl $2: parameter type
dnl $3: message for AC-MSG-CHECKING
dnl $4: action to take if the test passes
dnl $5: action to take if the test fails
AC_DEFUN([FROOZLE_FORTRAN_CHECK_IGNORE_TKR_SUB], [
    AC_LANG_PUSH([Fortran])
    AC_MSG_CHECKING([for Fortran compiler support of $3])
    AC_COMPILE_IFELSE(AC_LANG_PROGRAM([],[[!
! Autoconf puts "program main" at the top

  interface
     subroutine force_assumed_shape(a, count)
     integer :: count
     complex, dimension(:,:) :: a
     end subroutine force_assumed_shape
  end interface

  interface
     subroutine foo(buffer, count)
       $1 buffer
       $2, intent(in) :: buffer
       integer, intent(in) :: count
     end subroutine foo
  end interface

! Simple interface with an un-typed first argument (e.g., a choice buffer)
  integer :: count
  real :: buffer1(3)
  character :: buffer2
  complex :: buffer3(4,4)
  complex, pointer, dimension(:,:) :: ptr
  target :: buffer3
  integer :: buffer4
  ptr => buffer3

! Set some known values (somewhat irrelevant for this test, but just be
! sure that the values are initialized)
  a = 17
  buffer1(1) = 4.5
  buffer1(2) = 6.7
  buffer1(3) = 8.9
  buffer2 = 'a'

! Call with one type for the first argument
  call foo(buffer1, count)
! Call with a different type for the first argument
  call foo(buffer2, count)
! Force us through an assumed shape
  call force_assumed_shape(buffer3, count)
! Force a pointer call through an assumed shape (!)
  ptr => buffer3
! Also try with a simple scalar integer
! (Intel 2016 compiler suite only partially supports GCC pragmas;
! they work with all the above buffer types, but fail with a
! simple scalar integer)
  call foo(buffer4, count)

  end program

  subroutine force_assumed_shape(a, count)
    integer :: count
    real, dimension(:,:) :: a
    call foo(a, count)
  end subroutine force_assumed_shape

! Autoconf puts "end" after the last line
  subroutine bogus
]]),
                    [msg=yes
                     froozle_fortran_ignore_tkr_predecl="$1"
                     froozle_fortran_ignore_tkr_type="$2"
                     $4],
                    [msg=no
                     $5])
  AC_MSG_RESULT($msg)
  AC_LANG_POP([Fortran])
])
