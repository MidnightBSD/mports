--- cmake/modules/FindLibDvdNav.cmake.orig	2025-12-12 00:02:55 UTC
+++ cmake/modules/FindLibDvdNav.cmake
@@ -67,6 +67,6 @@ if(NOT TARGET LibDvdNav::LibDvdNav)
     find_program(AUTORECONF autoreconf REQUIRED)
-    if (CMAKE_HOST_SYSTEM_NAME MATCHES "(Free|Net|Open)BSD")
+    if (CMAKE_HOST_SYSTEM_NAME MATCHES "(Free|Net|Open|Midnight)BSD")
       find_program(MAKE_EXECUTABLE gmake)
     endif()
     find_program(MAKE_EXECUTABLE make REQUIRED)
