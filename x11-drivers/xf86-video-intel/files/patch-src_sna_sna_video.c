--- src/sna/sna_video.c.orig	2021-01-15 15:59:05.000000000 -0500
+++ src/sna/sna_video.c	2021-10-13 23:30:51.946012000 -0400
@@ -59,7 +59,7 @@
 #include "intel_options.h"
 
 #include <xf86xv.h>
-#if defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__NetBSD__)
+#if defined(__OpenBSD__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__MidnightBSD__)
 #include <sys/types.h>
 #include <sys/endian.h>
 #ifdef __OpenBSD__
