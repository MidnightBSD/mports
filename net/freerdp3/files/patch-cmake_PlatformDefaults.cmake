--- cmake/PlatformDefaults.cmake.orig	2026-10-22 19:31:51 UTC
+++ cmake/PlatformDefaults.cmake
@@ -20,7 +20,7 @@ if(USE_PLATFORM_DEFAULT)
     set(WINPR_TIMEZONE_FILE "/etc/timezone")
   endif()
 
-  if("${CMAKE_SYSTEM_NAME}" MATCHES "FreeBSD")
+  if("${CMAKE_SYSTEM_NAME}" MATCHES "FreeBSD|MidnightBSD")
     set(BSD TRUE CACHE INTERNAL "platform default")
     set(FREEBSD TRUE CACHE INTERNAL "platform default")
     set(EPOLLSHIM TRUE CACHE INTERNAL "platform default")
