--- spa/tests/stress-ringbuffer.c.orig	2025-12-15 18:29:13.295755000 -0500
+++ spa/tests/stress-ringbuffer.c	2025-12-15 18:30:54.753357000 -0500
@@ -14,7 +14,7 @@
 #if defined(__FreeBSD__) || defined(__MidnightBSD__) || defined (__GNU__)
 #include <sys/param.h>
 #if (__FreeBSD_version >= 1400000 && __FreeBSD_version < 1400043) \
-    || (__FreeBSD_version < 1300523) || defined(__MidnightBSD__) \
+    || (__FreeBSD_version < 1300523) || (defined(__MidnightBSD__) && __MidnightBSD_version < 400000) \
     || defined (__GNU__)
 static int sched_getcpu(void) { return -1; };
 #endif
