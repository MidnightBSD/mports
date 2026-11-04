--- llvm-project/compiler-rt/cmake/base-config-ix.cmake.orig	2024-05-24 18:46:43 UTC
+++ llvm-project/compiler-rt/cmake/base-config-ix.cmake
@@ -93,6 +93,10 @@
     # The CMAKE_SYSTEM_NAME for Android is Android, but the OS is Linux and the
     # driver will search for compiler-rt libraries in the "linux" directory.
     set(COMPILER_RT_OS_DIR linux)
+  elseif(CMAKE_SYSTEM_NAME MATCHES "MidnightBSD")
+    # MidnightBSD's compiler targets a FreeBSD triple, so the driver searches
+    # for compiler-rt libraries in the "freebsd" directory.
+    set(COMPILER_RT_OS_DIR freebsd)
   else()
     string(TOLOWER ${CMAKE_SYSTEM_NAME} COMPILER_RT_OS_DIR)
   endif()
