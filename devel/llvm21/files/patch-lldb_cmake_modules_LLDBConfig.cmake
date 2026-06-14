--- lldb/cmake/modules/LLDBConfig.cmake.orig	2025-01-14 04:41:02.000000000 -0500
+++ lldb/cmake/modules/LLDBConfig.cmake	2026-05-05 00:00:00.000000000 -0400
@@ -309,7 +309,7 @@
 # Figure out if lldb could use lldb-server.  If so, then we'll
 # ensure we build lldb-server when an lldb target is being built.
-if (CMAKE_SYSTEM_NAME MATCHES "AIX|Android|Darwin|FreeBSD|Linux|NetBSD|OpenBSD|Windows")
+if (CMAKE_SYSTEM_NAME MATCHES "AIX|Android|Darwin|MidnightBSD|FreeBSD|Linux|NetBSD|OpenBSD|Windows")
   set(LLDB_CAN_USE_LLDB_SERVER ON)
 else()
   set(LLDB_CAN_USE_LLDB_SERVER OFF)
