--- swift-asn1/cmake/modules/SwiftSupport.cmake.orig	2023-09-18 10:20:51 UTC
+++ swift-asn1/cmake/modules/SwiftSupport.cmake
@@ -42,6 +42,12 @@
     set("${result_var_name}" "armv7" PARENT_SCOPE)
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "AMD64")
     set("${result_var_name}" "x86_64" PARENT_SCOPE)
+  elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "amd64")
+    if("${CMAKE_SYSTEM_NAME}" STREQUAL "FreeBSD" OR "${CMAKE_SYSTEM_NAME}" STREQUAL "MidnightBSD")
+      set("${result_var_name}" "x86_64" PARENT_SCOPE)
+    else()
+      set("${result_var_name}" "amd64" PARENT_SCOPE)
+    endif()
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "IA64")
     set("${result_var_name}" "itanium" PARENT_SCOPE)
   elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "x86")
@@ -64,6 +70,9 @@
 function(get_swift_host_os result_var_name)
   if(CMAKE_SYSTEM_NAME STREQUAL Darwin)
     set(${result_var_name} macosx PARENT_SCOPE)
+  elseif(CMAKE_SYSTEM_NAME STREQUAL MidnightBSD)
+    # MidnightBSD uses the FreeBSD Swift platform layout.
+    set(${result_var_name} freebsd PARENT_SCOPE)
   else()
     string(TOLOWER ${CMAKE_SYSTEM_NAME} cmake_system_name_lc)
     set(${result_var_name} ${cmake_system_name_lc} PARENT_SCOPE)
