--- lldb/cmake/modules/LLDBConfig.cmake.orig	2026-10-13 10:01:55.000000000 -0400
+++ lldb/cmake/modules/LLDBConfig.cmake	2026-11-13 09:24:11.305383000 -0500
@@ -229,7 +229,7 @@
   set(LLDB_ENABLE_MTE OFF)
 endif()
 
-if (CMAKE_SYSTEM_NAME MATCHES "Darwin|FreeBSD" AND NOT CMAKE_GENERATOR MATCHES "Xcode")
+if (CMAKE_SYSTEM_NAME MATCHES "Darwin|MidnightBSD|FreeBSD" AND NOT CMAKE_GENERATOR MATCHES "Xcode")
   set(default_enable_dynamic_scriptinterpreters ON)
 else()
   set(default_enable_dynamic_scriptinterpreters OFF)
@@ -434,7 +434,7 @@
 
 # Figure out if lldb could use lldb-server.  If so, then we'll
 # ensure we build lldb-server when an lldb target is being built.
-if (CMAKE_SYSTEM_NAME MATCHES "AIX|Android|Darwin|FreeBSD|Linux|NetBSD|OpenBSD|Windows")
+if (CMAKE_SYSTEM_NAME MATCHES "AIX|Android|Darwin|MidnightBSD|FreeBSD|Linux|NetBSD|OpenBSD|Windows")
   set(LLDB_CAN_USE_LLDB_SERVER ON)
 else()
   set(LLDB_CAN_USE_LLDB_SERVER OFF)
