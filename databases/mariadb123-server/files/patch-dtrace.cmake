--- cmake/dtrace.cmake.orig	2026-10-03 00:00:00 UTC
+++ cmake/dtrace.cmake
@@ -43 +43 @@
- IF(DTRACE AND NOT CMAKE_SYSTEM_NAME MATCHES "FreeBSD"
+ IF(DTRACE AND NOT CMAKE_SYSTEM_NAME MATCHES "FreeBSD|MidnightBSD"
