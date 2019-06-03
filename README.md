This is a dummy, no-op MPI implementation that is an example of
[MPI Forum issue
#137](https://github.com/mpi-forum/mpi-issues/issues/137).

Specifically: the API calls in these libraries do nothing other than
print out that they were called.  The intent is to show how ticket
#137 could be implemented, and what the resulting symbols will look
like.  It also gives a platform for real experimentation with
different compilers, options, run-time environments, etc.

Froozle MPI provides only a few MPI API functions, just to give a
flavor of how things will look with ticket #137:

* MPI_INIT, MPI_FINALIZE, MPI_COMM_RANK, MPI_COMM_SIZE
* MPI_SEND, MPI_RECV
* MPI_ALLGATHER

5 flavors of the APIs are available:

1. C: in the c/ directory.  Both "int" and "MPI_Count" versions of the
send, receive, and allgather APIs are implemented.
2. C++: in the cxx/ directory.  The C symbols are used for everything
except for the send, receive, and allgather APIs.
3. Fortran mpif.h: in the fortran-mpifh/ directory.  The "glue" APIs
(init, finalize, comm_rank, comm_size) are implemented in Fortran.
The others are implemented in C, but per ticket #137, only "integer"
versions are available.
4. Fortran mpi module: in the fortran-usempi/ directory.  ...more to
write here.
5. Fortran mpi_f08 module: in the fortran-usempif08/ directory.
...more to write here.

You must have a C, C++, and Fortran compiler available to compile
Froozle.

Build Froozle with the following:

```sh
# If running from a git clone, you must have the GNU Autotools
# installed, and then run:
$ ./autogen.sh

# If you are building from a bootstrapped tarball, you can skip the
# above autogen.sh step proceed directly to the next steps.

# Run the configure script:
$ ./configure |& tee config.out

# Build Froozle
$ make -j 8 |& tee make.out

# Optionally install Froozle
$ make install
```

A few example applications are in the examples/ directory.

Comments are welcome.
