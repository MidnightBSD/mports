--- canna/widedef.h.orig	2026-05-24 19:59:30.608642000 -0400
+++ canna/widedef.h	2026-05-25 00:45:47.946369000 -0400
@@ -31,12 +31,12 @@
 # include <osreldate.h>
 #endif

-#if (defined(__FreeBSD__) && __FreeBSD_version < 500000) \
+#if (defined(__FreeBSD__) && !defined(__MidnightBSD__) && __FreeBSD_version < 500000) \
     || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
 # include <machine/ansi.h>
 #endif

-#if (defined(__FreeBSD__) && __FreeBSD_version < 500000) \
+#if (defined(__FreeBSD__) && !defined(__MidnightBSD__) && __FreeBSD_version < 500000) \
     || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__)
 # ifdef _BSD_WCHAR_T_
 #  undef _BSD_WCHAR_T_
@@ -52,7 +52,8 @@
 #  include <stddef.h>
 #  define _WCHAR_T
 # endif
-#elif defined(__FreeBSD__) && __FreeBSD_version >= 500000
+#elif (defined(__FreeBSD__) && !defined(__MidnightBSD__) && __FreeBSD_version >= 500000) \
+    || defined(__MidnightBSD__)
 # ifdef WCHAR16
 typedef unsigned short wchar_t;
 #  define _WCHAR_T_DECLARED
