--- cmake/modules/buildtools/FindTexturePacker.cmake.orig	2026-05-25 23:41:12 UTC
+++ cmake/modules/buildtools/FindTexturePacker.cmake
@@ -54,7 +54,7 @@ if(NOT TARGET TexturePacker::TexturePack
     endif()
-    # Ship TexturePacker only on Linux and FreeBSD
-    if(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD" OR CMAKE_SYSTEM_NAME STREQUAL "Linux")
+    # Ship TexturePacker only on Linux and BSD platforms that use this install layout
+    if(CMAKE_SYSTEM_NAME MATCHES "^(FreeBSD|MidnightBSD)$" OR CMAKE_SYSTEM_NAME STREQUAL "Linux")
       # But skip shipping it if build architecture can be executed on host
       # and TEXTUREPACKER_EXECUTABLE is found
       if(NOT (HOST_CAN_EXECUTE_TARGET AND TEXTUREPACKER_EXECUTABLE))
