--- tools/lldb/cmake/modules/LLDBConfig.cmake.orig	2020-12-18 14:57:38.000000000 -0500
+++ tools/lldb/cmake/modules/LLDBConfig.cmake	2023-01-26 00:28:49.141911000 -0500
@@ -293,7 +293,7 @@
 
 # Figure out if lldb could use lldb-server.  If so, then we'll
 # ensure we build lldb-server when an lldb target is being built.
-if (CMAKE_SYSTEM_NAME MATCHES "Android|Darwin|FreeBSD|Linux|NetBSD|Windows")
+if (CMAKE_SYSTEM_NAME MATCHES "Android|Darwin|MidnightBSD|FreeBSD|Linux|NetBSD|Windows")
   set(LLDB_CAN_USE_LLDB_SERVER ON)
 else()
   set(LLDB_CAN_USE_LLDB_SERVER OFF)
