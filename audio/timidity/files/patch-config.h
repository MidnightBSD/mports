--- config.h.orig	1996-06-01 08:54:49.000000000 -0400
+++ config.h	2026-02-23 15:11:24.247267000 -0500
@@ -216,6 +216,22 @@
 # error No byte sex defined
 # endif
 #endif /* linux */
+
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+#include <errno.h>
+#include <machine/endian.h>
+#if BYTE_ORDER == LITTLE_ENDIAN
+#undef BIG_ENDIAN
+#undef PDP_ENDIAN
+#elif BYTE_ORDER == BIG_ENDIAN
+#undef LITTLE_ENDIAN
+#undef PDP_ENDIAN
+#else
+# error No valid byte sex defined
+#endif
+#define USE_LDEXP
+#define PI M_PI
+#endif
 
 /* Win32 on Intel machines */
 #ifdef __WIN32__
