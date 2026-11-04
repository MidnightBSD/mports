--- cmake/FindOSS.cmake.orig	2026-10-22 19:31:51 UTC
+++ cmake/FindOSS.cmake
@@ -5,7 +5,7 @@ if(UNIX)
 if(UNIX)
   if(CMAKE_SYSTEM_NAME MATCHES "Linux")
     set(PLATFORM_PREFIX "linux/")
-  elseif(CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
+  elseif(CMAKE_SYSTEM_NAME MATCHES "FreeBSD|MidnightBSD")
     set(PLATFORM_PREFIX "sys/")
   elseif(CMAKE_SYSTEM_NAME MATCHES "OpenBSD")
     set(PLATFORM_PREFIX "machine/")
