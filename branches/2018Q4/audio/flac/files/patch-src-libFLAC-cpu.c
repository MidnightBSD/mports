--- src/libFLAC/cpu.c.orig	2016-08-05 19:04:31.804282954 -0400
+++ src/libFLAC/cpu.c	2016-08-05 19:05:05.624281843 -0400
@@ -77,7 +77,7 @@
 #include <machine/cpu.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 #include <sys/types.h>
 #include <sys/sysctl.h>
 #endif
@@ -213,7 +213,7 @@
 		disable_sse(info);
 #elif defined FLAC__SSE_OS
 		/* assume user knows better than us; leave as detected above */
-#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__) || defined(__APPLE__)
+#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 		int sse = 0;
 		size_t len;
 		/* at least one of these must work: */
