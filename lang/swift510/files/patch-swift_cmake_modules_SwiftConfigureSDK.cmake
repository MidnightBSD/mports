--- swift/cmake/modules/SwiftConfigureSDK.cmake.orig	2024-06-06 04:26:30 UTC
+++ swift/cmake/modules/SwiftConfigureSDK.cmake
@@ -378,15 +378,24 @@
           message(FATAL_ERROR "unknown arch for ${prefix}: ${arch}")
         endif()
       elseif("${prefix}" STREQUAL "FREEBSD")
-        if(NOT arch MATCHES "(arm64|x86_64)")
+        if(NOT arch MATCHES "(aarch64|x86_64)")
           message(FATAL_ERROR "unsupported arch for FreeBSD: ${arch}")
         endif()
 
-        if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL "FreeBSD")
-          message(WARNING "CMAKE_SYSTEM_VERSION will not match target")
-        endif()
+        if(CMAKE_HOST_SYSTEM_NAME STREQUAL "MidnightBSD")
+          # MidnightBSD's compiler targets a FreeBSD triple; take the OS
+          # version from it rather than from the MidnightBSD release.
+          execute_process(COMMAND ${CMAKE_C_COMPILER} -dumpmachine
+            OUTPUT_VARIABLE freebsd_system_version
+            OUTPUT_STRIP_TRAILING_WHITESPACE)
+          string(REGEX REPLACE ".*-freebsd([0-9.]+).*" "\\1" freebsd_system_version "${freebsd_system_version}")
+        else()
+          if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL "FreeBSD")
+            message(WARNING "CMAKE_SYSTEM_VERSION will not match target")
+          endif()
 
-        string(REGEX REPLACE "[-].*" "" freebsd_system_version ${CMAKE_SYSTEM_VERSION})
+          string(REGEX REPLACE "[-].*" "" freebsd_system_version ${CMAKE_SYSTEM_VERSION})
+        endif()
         message(STATUS "FreeBSD Version: ${freebsd_system_version}")
 
         set(SWIFT_SDK_FREEBSD_ARCH_${arch}_TRIPLE "${arch}-unknown-freebsd${freebsd_system_version}")
