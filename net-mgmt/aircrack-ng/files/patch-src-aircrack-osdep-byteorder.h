--- src/aircrack-osdep/byteorder.h.orig	2019-03-15 19:51:45.941283000 -0400
+++ src/aircrack-osdep/byteorder.h	2019-03-15 19:53:16.235480000 -0400
@@ -232,7 +232,7 @@
 #endif
 
 // FreeBSD
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #undef ushort
 #undef uint
 #include <sys/types.h>
