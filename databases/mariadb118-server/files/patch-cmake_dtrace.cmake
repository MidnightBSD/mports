--- cmake/dtrace.cmake.orig
+++ cmake/dtrace.cmake
@@ -39,8 +39,8 @@
    SET(BUGGY_LINUX_DTRACE 1)
  ENDIF()
 
- # On FreeBSD, dtrace does not handle userland tracing yet
- IF(DTRACE AND NOT CMAKE_SYSTEM_NAME MATCHES "FreeBSD"
+ # On FreeBSD and MidnightBSD, dtrace does not handle userland tracing yet
+ IF(DTRACE AND NOT CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD|MidnightBSD)$"
      AND NOT BUGGY_GCC_NO_DTRACE_MODULES
      AND NOT BUGGY_LINUX_DTRACE
      AND NOT CMAKE_SYSTEM_NAME MATCHES "SunOS"
