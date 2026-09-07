--- CMake/Platforms.cmake.orig	2024-10-13 00:00:00 UTC
+++ CMake/Platforms.cmake
@@ -2,7 +2,7 @@
   include(platforms/haiku)
 endif()
 
-if(CMAKE_SYSTEM_NAME MATCHES "FreeBSD|OpenBSD|DragonFly|NetBSD")
+if(CMAKE_SYSTEM_NAME MATCHES "FreeBSD|MidnightBSD|OpenBSD|DragonFly|NetBSD")
   if(CMAKE_SYSTEM_NAME MATCHES "NetBSD")
     add_definitions(-D_NETBSD_SOURCE)
   else()
