--- swift-system/cmake/modules/SwiftSupport.cmake.orig	2026-09-11 17:14:03 UTC
+++ swift-system/cmake/modules/SwiftSupport.cmake
@@ -61,6 +61,9 @@
 function(get_swift_host_os result_var_name)
   if(CMAKE_SYSTEM_NAME STREQUAL Darwin)
     set(${result_var_name} macosx PARENT_SCOPE)
+  elseif(CMAKE_SYSTEM_NAME STREQUAL MidnightBSD)
+    # MidnightBSD uses the FreeBSD Swift platform layout.
+    set(${result_var_name} freebsd PARENT_SCOPE)
   else()
     string(TOLOWER ${CMAKE_SYSTEM_NAME} cmake_system_name_lc)
     set(${result_var_name} ${cmake_system_name_lc} PARENT_SCOPE)
