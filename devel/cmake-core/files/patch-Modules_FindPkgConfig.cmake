--- Modules/FindPkgConfig.cmake.orig	2024-09-03 14:59:27.678427000 -0400
+++ Modules/FindPkgConfig.cmake	2024-09-03 14:59:56.669569000 -0400
@@ -394,6 +394,9 @@
     if(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD" AND NOT CMAKE_CROSSCOMPILING)
       list(APPEND _lib_dirs "libdata/pkgconfig")
     endif()
+    if(CMAKE_SYSTEM_NAME STREQUAL "MidnightBSD" AND NOT CMAKE_CROSSCOMPILING)
+      list(APPEND _lib_dirs "libdata/pkgconfig")
+    endif()
     list(APPEND _lib_dirs "lib/pkgconfig")
     list(APPEND _lib_dirs "share/pkgconfig")
 
