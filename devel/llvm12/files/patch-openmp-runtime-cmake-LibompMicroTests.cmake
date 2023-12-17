--- openmp/runtime/cmake/LibompMicroTests.cmake.orig	2023-12-16 16:22:03.878500000 -0500
+++ openmp/runtime/cmake/LibompMicroTests.cmake	2023-12-16 16:22:28.453705000 -0500
@@ -172,6 +172,9 @@
 if(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
   set(libomp_expected_library_deps libc.so.7 libthr.so.3 libm.so.5)
   libomp_append(libomp_expected_library_deps libhwloc.so.5 LIBOMP_USE_HWLOC)
+elseif(CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+  set(libomp_expected_library_deps libc.so.7 libthr.so.3 libm.so.5)
+  libomp_append(libomp_expected_library_deps libhwloc.so.5 LIBOMP_USE_HWLOC)
 elseif(CMAKE_SYSTEM_NAME MATCHES "NetBSD")
   set(libomp_expected_library_deps libc.so.12 libpthread.so.1 libm.so.0)
   libomp_append(libomp_expected_library_deps libhwloc.so.5 LIBOMP_USE_HWLOC)
