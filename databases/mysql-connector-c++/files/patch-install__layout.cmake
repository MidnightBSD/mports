--- install_layout.cmake.orig	2024-12-28 22:10:00 UTC
+++ install_layout.cmake
@@ -82,7 +82,7 @@ endif()
 
 if(NOT CMAKE_INSTALL_LIBDIR)
 
-  if(FREEBSD)
+  if(FREEBSD OR MIDNIGHTBSD)
     set(CMAKE_INSTALL_LIBDIR "lib" CACHE STRING
       "Library Install location (Relative to CMAKE_INSTALL_PREFIX)")
   elseif(IS64BIT OR SUNPRO)
