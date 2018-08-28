--- terms.c.orig	2015-10-03 15:40:58.884853339 -0400
+++ terms.c	2015-10-03 15:41:34.978245408 -0400
@@ -26,7 +26,7 @@
 #endif				/* USE_GPM */
 #ifdef USE_SYSMOUSE
 #include <osreldate.h>
-#if (__FreeBSD_version >= 400017) || (__FreeBSD_kernel_version >= 400017)
+#if defined(__MidnightBSD__) || (__FreeBSD_version >= 400017) || (__FreeBSD_kernel_version >= 400017)
 #include <sys/consio.h>
 #include <sys/fbio.h>
 #else
