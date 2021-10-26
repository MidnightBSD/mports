--- src/test/tests.c.orig	2021-10-26 14:02:39 UTC
+++ src/test/tests.c
@@ -6,7 +6,7 @@
 #include "env-util.h"
 #include "tests.h"
 
-#ifdef __FreeBSD__
+#ifdef __MidnightBSD__
 #define program_invocation_short_name getprogname()
 #endif
 
