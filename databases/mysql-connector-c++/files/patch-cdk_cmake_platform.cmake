--- cdk/cmake/platform.cmake.orig	2024-12-28 22:10:51 UTC
+++ cdk/cmake/platform.cmake
@@ -88,7 +88,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "SunOS")
   set(SUNOS ${CMAKE_SYSTEM_VERSION})
 endif()
 
-if(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+if(CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
   set(FREEBSD TRUE CACHE INTERNAL "")
 endif()
 
