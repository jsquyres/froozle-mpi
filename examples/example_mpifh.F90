program example_mpifh
  implicit none
  include 'mpif.h'

  integer BUFLEN
  parameter(BUFLEN=32)

  character, dimension(BUFLEN) :: buffer
  integer :: rank, size, ierr

  call MPI_Init(ierr)

  call MPI_Comm_rank(MPI_COMM_WORLD, rank, ierr)
  call MPI_Comm_size(MPI_COMM_WORLD, size, ierr)

  ! There are no count-sized arguments in mpif.h

  call MPI_Send(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)
  call MPI_Send(buffer, SIZE, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, ierr)

  call MPI_Recv(buffer, 32, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)
  call MPI_Recv(buffer, SIZE, MPI_CHARACTER, 0, 0, MPI_COMM_WORLD, &
       MPI_STATUS_IGNORE, ierr)

  call MPI_Allgather(buffer, 32, MPI_CHARACTER, &
       buffer, 32, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)
  call MPI_Allgather(buffer, SIZE, MPI_CHARACTER, &
       buffer, SIZE, MPI_CHARACTER, &
       MPI_COMM_WORLD, ierr)

  call MPI_Finalize(ierr)

end program example_mpifh
