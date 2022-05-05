--- projects/openmp/runtime/cmake/LibompHandleFlags.cmake.orig	2022-05-05 03:51:30 UTC
+++ projects/openmp/runtime/cmake/LibompHandleFlags.cmake
@@ -125,7 +125,7 @@ function(libomp_get_libflags libflags)
   if(${IA32})
     libomp_append(libflags_local -lirc_pic LIBOMP_HAVE_IRC_PIC_LIBRARY)
   endif()
-  if(${CMAKE_SYSTEM_NAME} MATCHES "DragonFly|FreeBSD")
+  if(${CMAKE_SYSTEM_NAME} MATCHES "DragonFly|FreeBSD|MidnightBSD")
     libomp_append(libflags_local "-Wl,--no-as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
     libomp_append(libflags_local "-lm")
     libomp_append(libflags_local "-Wl,--as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
