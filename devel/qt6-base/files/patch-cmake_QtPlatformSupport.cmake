Treat MidnightBSD as FreeBSD for platform detection purposes.

--- cmake/QtPlatformSupport.cmake.orig	2026-05-11 20:54:55 UTC
+++ cmake/QtPlatformSupport.cmake
@@ -43,7 +43,7 @@ else()
     set(OPENBSD 0)
 endif()
 
-if(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
+if(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD" OR CMAKE_SYSTEM_NAME STREQUAL "MidnightBSD")
     set(FREEBSD 1)
 else()
     set(FREEBSD 0)
