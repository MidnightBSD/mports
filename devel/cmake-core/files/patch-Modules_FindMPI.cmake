--- Modules/FindMPI.cmake.orig	2025-01-02 17:39:15.216259000 -0500
+++ Modules/FindMPI.cmake	2025-01-02 17:40:26.059287000 -0500
@@ -1345,6 +1345,10 @@
   # SUSE Linux Enterprise Server stores its MPI implementations under /usr/lib64/mpi/gcc/<name>
   # We enumerate the subfolders and append each as a prefix
   MPI_search_mpi_prefix_folder("/usr/lib64/mpi/gcc")
+elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "MidnightBSD")
+  # MidnightBSD ships mpich under the normal system paths - but available openmpi implementations
+  # will be found in /usr/local/mpi/<name>
+  MPI_search_mpi_prefix_folder("/usr/local/mpi")
 elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "FreeBSD")
   # FreeBSD ships mpich under the normal system paths - but available openmpi implementations
   # will be found in /usr/local/mpi/<name>
