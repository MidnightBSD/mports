--- projects/openmp/runtime/cmake/LibompMicroTests.cmake.orig	2022-05-05 03:51:22 UTC
+++ projects/openmp/runtime/cmake/LibompMicroTests.cmake
@@ -172,6 +172,9 @@ set(libomp_expected_library_deps)
 if(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
   set(libomp_expected_library_deps libc.so.7 libthr.so.3 libm.so.5)
   libomp_append(libomp_expected_library_deps libhwloc.so.5 LIBOMP_USE_HWLOC)
+elseif(CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+  set(libomp_expected_library_deps libc.so.7 libthr.so.3 libm.so.5)
+  libomp_append(libomp_expected_library_deps libhwloc.so.5 LIBOMP_USE_HWLOC)
 elseif(CMAKE_SYSTEM_NAME MATCHES "NetBSD")
   set(libomp_expected_library_deps libc.so.12 libpthread.so.1 libm.so.0)
   libomp_append(libomp_expected_library_deps libhwloc.so.5 LIBOMP_USE_HWLOC)
