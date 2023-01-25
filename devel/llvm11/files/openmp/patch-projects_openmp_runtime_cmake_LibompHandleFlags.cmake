--- projects/openmp/runtime/cmake/LibompHandleFlags.cmake.orig	2020-12-18 14:57:38.000000000 -0500
+++ projects/openmp/runtime/cmake/LibompHandleFlags.cmake	2023-01-25 18:20:36.921636000 -0500
@@ -125,7 +125,7 @@
   if(${IA32})
     libomp_append(libflags_local -lirc_pic LIBOMP_HAVE_IRC_PIC_LIBRARY)
   endif()
-  if(${CMAKE_SYSTEM_NAME} MATCHES "DragonFly|FreeBSD")
+  if(${CMAKE_SYSTEM_NAME} MATCHES "DragonFly|MidnightBSD|FreeBSD")
     libomp_append(libflags_local "-Wl,--no-as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
     libomp_append(libflags_local "-lm")
     libomp_append(libflags_local "-Wl,--as-needed" LIBOMP_HAVE_AS_NEEDED_FLAG)
