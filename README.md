# Introduction

This is a dummy, no-op MPI implementation that is an example of
[MPI Forum issue
#137](https://github.com/mpi-forum/mpi-issues/issues/137).

Specifically: the API calls in these libraries do nothing other than
print out that they were called.  The intent is to show how ticket
#137 could be implemented, and what the resulting symbols will look
like.  It also gives a platform for real experimentation with
different compilers, options, run-time environments, etc.

## Overview of APIs

Froozle MPI provides only a few MPI API functions, just to give a
flavor of how things will look with ticket #137:

* MPI_INIT, MPI_FINALIZE, MPI_COMM_RANK, MPI_COMM_SIZE
* MPI_SEND, MPI_RECV
* MPI_ALLGATHER
* MPI_GET_ELEMENTS, MPI_GET_ELEMENTS_X

## API languages / bindings

5 flavors of the APIs are available:

1. C: in the c/ directory.  Both "int" and "MPI_Count" versions of the
send, receive, and allgather APIs are implemented.
2. C++: in the cxx/ directory.  The C symbols are used for everything
except for the send, receive, and allgather APIs.
3. Fortran mpif.h: in the fortran-mpifh/ directory.  The "glue" APIs
(init, finalize, comm_rank, comm_size) are implemented in Fortran.
The others are implemented in C, but per ticket #137, only "integer"
versions are available.
4. Fortran mpi module: in the fortran-usempi/ directory.  These APIs
expand on the mpif.h interface -- only new send/recv/allgather APIs
are provided here.  The rest "fall back", so to speak, to those in
libmpi_mpifh.la.
5. Fortran mpi_f08 module: in the fortran-usempif08/ directory.  Per
the MPI spec, all the mpi_f08 module subroutines have unique symbols,
so they *all* have their own implementations (unlike the "mpi"
module).

# Rationale

## The `_y` suffix

The `MPI_Count`-variant symbols in C and Fortran have a suffix of `_y`
-- not `_x`, as has been long-discussed in the Forum.  We chose `_y`
for the following reasons:

1. It's just as short as `_x`.
1. MPI-3.0 added several `_x` functions (e.g.,
   MPI_GET_ELEMENTS_COUNT_X).
   1. We wanted to make a clean separation between the MPI-3 functions
      (i.e,. the `_x` functions) and the new symbols added in MPI-4
      (i.e., the `_y` functions).
   1. There is actually a problem with the Fortran `mpi` and `mpi_f08`
      modules such that we *couldn't* have the underlying subroutine
      names be `_x` because they would conflict with the
      already-existing MPI-3 functions.  For example, the Fortran
      language does not allow the same subroutine `MPI_GET_ELEMENTS_X`
      to be in multiple explicit interfaces (i.e., `MPI_GET_ELEMENTS`
      and `MPI_GET_ELEMENTS_X`).  Hence, we *had* to have a different
      suffix for at least the `_x` functions added in MPI-3 in the
      Fortran modules.  It seemed simpler to have a different suffix
      for *all* functions (in all language bindings) rather than to
      create a narrowly-scoped exception.

## Fortran and C++ do not call C

The Fortran bindings do not call the underlying C bindings, mainly
because this is just a proof-of-concept implementation.  They could
easily call the underlying C APIs, just like a real implementation --
we just did not bother to do so.

The C++ bindings, however, have a technical reason why they do not
call the underlying C bindings.  Specifically: it is not possible for
the C++ bindings to directly call the C bindings in this design
because the C and C++ bindings have the same name.  There's no way to
force the invocation of the C `MPI_Send()` from within either of the
C++ `MPI_Send()` overloaded functions.  Instead, the C++ bindings in a
real implementation would need to call some other back-end
function(s).

# Prerequisites

You must have a C, C++, and Fortran compiler available to compile
Froozle.

If you are compiling from a git clone (i.e., if you need to run
`autogen.sh`), you will need the GNU Autotools installed:

* Autoconf
* Automake
* Libtool

# Limitations

1. The `configure` script does not properly check if your Fortran
   compiler does not support "ignore TKR" functionality, nor does it
   check if your compiler does not support Fortran'08 functionality.
1. If your Fortran build fails in weird ways, you might need a newer
   Fortran compiler.
1. No `PMPI_`-prefixed bindings are included.

# Build instructions

Build Froozle with the following:

```sh
# If running from a git clone, you must have the GNU Autotools
# installed, and then run:
$ ./autogen.sh

# If you are building from a bootstrapped tarball, you can skip the
# above autogen.sh step proceed directly to the next steps.

# Run the configure script
$ ./configure

# Build Froozle
$ make -j 8

# Optionally install Froozle
$ make install
```

# Optional features

`configure` takes the following options:

* `--disable-c11-generic`: This option will disable the `MPI_Count`
  versions of the C bindings.  Specifically: `MPI_Count` will still be
  whatever size it will be per (chapter 2 of MPI-3.1), but the C
  bindings for `MPI_SEND` et al. will only have `int` count-enabled
  variants, not `MPI_Count`-enabled variants.

# Examples

After building, you should examine and run the examples in the
`examples` directory.

Comments are welcome.
