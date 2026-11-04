--- src/examples/video-src-fixate.c.orig	2026-03-16 11:54:17 UTC
+++ src/examples/video-src-fixate.c
@@ -20,3 +20,7 @@
 #include <sys/mman.h>
+#ifdef __linux__
 #include <sys/sysmacros.h>
+#else
+#include <sys/types.h>
+#endif
 #include <assert.h>
 #include <spa/param/dict-utils.h>
