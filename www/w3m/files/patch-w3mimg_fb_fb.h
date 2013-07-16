--- w3mimg/fb/fb.h.orig	2003-07-08 00:48:17.000000000 +0900
+++ w3mimg/fb/fb.h	2007-11-23 02:43:22.000000000 +0900
@@ -1,7 +1,11 @@
 /* $Id: patch-w3mimg_fb_fb.h,v 1.1 2013-07-16 12:32:55 laffer1 Exp $ */
 #ifndef fb_header
 #define fb_header
+#if defined(__linux__)
 #include <linux/fb.h>
+#elif defined(__FreeBSD__)
+#include <sys/fbio.h> 
+#endif
 
 typedef struct {
     int num;
