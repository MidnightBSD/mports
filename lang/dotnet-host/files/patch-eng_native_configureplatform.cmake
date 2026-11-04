--- eng/native/configureplatform.cmake.orig
+++ eng/native/configureplatform.cmake
@@ -161,17 +161,20 @@
     endif()
 endif(CLR_CMAKE_HOST_OS STREQUAL android)
 
-if(CLR_CMAKE_HOST_OS STREQUAL freebsd)
+if(CLR_CMAKE_HOST_OS MATCHES "freebsd|midnightbsd")
     set(CLR_CMAKE_HOST_UNIX 1)
-    if (CMAKE_SYSTEM_PROCESSOR STREQUAL amd64 OR CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
+    if (CMAKE_SYSTEM_PROCESSOR MATCHES "amd64|x86_64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
         set(CLR_CMAKE_HOST_UNIX_AMD64 1)
     elseif (CMAKE_SYSTEM_PROCESSOR STREQUAL aarch64 OR CMAKE_SYSTEM_PROCESSOR STREQUAL arm64)
         set(CLR_CMAKE_HOST_UNIX_ARM64 1)
     else()
         clr_unknown_arch()
     endif()
+    if(CLR_CMAKE_HOST_OS STREQUAL midnightbsd)
+        set(CLR_CMAKE_HOST_MIDNIGHTBSD 1)
+    endif()
     set(CLR_CMAKE_HOST_FREEBSD 1)
-endif(CLR_CMAKE_HOST_OS STREQUAL freebsd)
+endif()
 
 if(CLR_CMAKE_HOST_OS STREQUAL openbsd)
     set(CLR_CMAKE_HOST_UNIX 1)
@@ -397,10 +400,13 @@
     set(CLR_CMAKE_TARGET_TVOS 1)
 endif(CLR_CMAKE_TARGET_OS STREQUAL tvos OR CLR_CMAKE_TARGET_OS STREQUAL tvossimulator)
 
-if(CLR_CMAKE_TARGET_OS STREQUAL freebsd)
+if(CLR_CMAKE_TARGET_OS MATCHES "freebsd|midnightbsd")
     set(CLR_CMAKE_TARGET_UNIX 1)
+    if(CLR_CMAKE_TARGET_OS STREQUAL midnightbsd)
+        set(CLR_CMAKE_TARGET_MIDNIGHTBSD 1)
+    endif()
     set(CLR_CMAKE_TARGET_FREEBSD 1)
-endif(CLR_CMAKE_TARGET_OS STREQUAL freebsd)
+endif()
 
 if(CLR_CMAKE_TARGET_OS STREQUAL openbsd)
     set(CLR_CMAKE_TARGET_UNIX 1)
