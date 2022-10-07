--- tools/lldb/cmake/modules/LLDBConfig.cmake.orig	2022-06-06 11:27:20.602370000 -0400
+++ tools/lldb/cmake/modules/LLDBConfig.cmake	2022-06-06 11:27:36.363711000 -0400
@@ -404,7 +404,7 @@
 
 # Figure out if lldb could use lldb-server.  If so, then we'll
 # ensure we build lldb-server when an lldb target is being built.
-if (CMAKE_SYSTEM_NAME MATCHES "Android|Darwin|FreeBSD|Linux|NetBSD")
+if (CMAKE_SYSTEM_NAME MATCHES "Android|Darwin|FreeBSD|Linux|NetBSD|MidnightBSD")
   set(LLDB_CAN_USE_LLDB_SERVER 1)
 else()
   set(LLDB_CAN_USE_LLDB_SERVER 0)
