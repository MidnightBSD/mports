--- swift-corelibs-foundation/cmake/modules/SwiftSupport.cmake.orig	2024-05-31 00:46:27 UTC
+++ swift-corelibs-foundation/cmake/modules/SwiftSupport.cmake
@@ -24,7 +24,11 @@
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "armv7-a")
     set("${result_var_name}" "armv7" PARENT_SCOPE)
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "amd64")
-    set("${result_var_name}" "amd64" PARENT_SCOPE)
+    if("${CMAKE_SYSTEM_NAME}" STREQUAL "FreeBSD" OR "${CMAKE_SYSTEM_NAME}" STREQUAL "MidnightBSD")
+      set("${result_var_name}" "x86_64" PARENT_SCOPE)
+    else()
+      set("${result_var_name}" "amd64" PARENT_SCOPE)
+    endif()
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "AMD64")
     set("${result_var_name}" "x86_64" PARENT_SCOPE)
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "IA64")
@@ -51,6 +55,9 @@
 function(get_swift_host_os result_var_name)
   if(CMAKE_SYSTEM_NAME STREQUAL Darwin)
     set(${result_var_name} macosx PARENT_SCOPE)
+  elseif(CMAKE_SYSTEM_NAME STREQUAL MidnightBSD)
+    # MidnightBSD uses the FreeBSD Swift platform layout.
+    set(${result_var_name} freebsd PARENT_SCOPE)
   else()
     string(TOLOWER ${CMAKE_SYSTEM_NAME} cmake_system_name_lc)
     set(${result_var_name} ${cmake_system_name_lc} PARENT_SCOPE)
