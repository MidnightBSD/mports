--- compiler-rt/cmake/config-ix.cmake.orig	2025-01-14 04:41:02.000000000 -0500
+++ compiler-rt/cmake/config-ix.cmake	2026-04-30 00:00:00.000000000 -0400
@@ -836,7 +836,7 @@
 endif()

 if (PROFILE_SUPPORTED_ARCH AND NOT LLVM_USE_SANITIZER AND
-    OS_NAME MATCHES "Darwin|Linux|FreeBSD|Windows|Android|Fuchsia|SunOS|NetBSD|AIX|WASI|Haiku")
+    OS_NAME MATCHES "Darwin|Linux|MidnightBSD|FreeBSD|Windows|Android|Fuchsia|SunOS|NetBSD|AIX|WASI|Haiku")
   set(COMPILER_RT_HAS_PROFILE TRUE)
 else()
   set(COMPILER_RT_HAS_PROFILE FALSE)
