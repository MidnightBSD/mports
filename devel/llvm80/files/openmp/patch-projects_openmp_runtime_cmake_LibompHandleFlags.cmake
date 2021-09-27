--- projects/openmp/runtime/cmake/LibompHandleFlags.cmake.orig	2018-12-10 13:45:00 UTC
+++ projects/openmp/runtime/cmake/LibompHandleFlags.cmake
@@ -164,6 +164,11 @@ function(libomp_get_libflags libflags)
     libomp_append(libflags_local "-lm")
     libomp_append(libflags_local "-Wl,--as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
   ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "DragonFly")
+  IF(${CMAKE_SYSTEM_NAME} MATCHES "MidnightBSD")
+    libomp_append(libflags_local "-Wl,--no-as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
+    libomp_append(libflags_local "-lm")
+    libomp_append(libflags_local "-Wl,--as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
+  ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "MidnightBSD")
   IF(${CMAKE_SYSTEM_NAME} MATCHES "NetBSD")
     libomp_append(libflags_local -lm)
   ENDIF(${CMAKE_SYSTEM_NAME} MATCHES "NetBSD")
