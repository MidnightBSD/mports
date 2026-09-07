--- CMake/functions/devilutionx_library.cmake.orig	2024-10-13 00:00:00 UTC
+++ CMake/functions/devilutionx_library.cmake
@@ -45,7 +45,7 @@
     target_compile_options(${NAME} PUBLIC -Wall -Wextra -Wno-unused-parameter)
   endif()
 
-  if(NOT WIN32 AND NOT APPLE AND NOT ${CMAKE_SYSTEM_NAME} STREQUAL FreeBSD)
+  if(NOT WIN32 AND NOT APPLE AND NOT CMAKE_SYSTEM_NAME MATCHES "FreeBSD|MidnightBSD")
     # Enable POSIX extensions such as `readlink` and `ftruncate`.
     add_definitions(-D_POSIX_C_SOURCE=200809L)
   endif()
