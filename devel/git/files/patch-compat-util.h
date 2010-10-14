--- git-compat-util.h.orig	2010-10-14 12:48:13 -0400
+++ git-compat-util.h	2010-10-14 12:49:03 -0400
@@ -56,7 +56,8 @@
 # define _XOPEN_SOURCE 500
 # endif
 #elif !defined(__APPLE__) && !defined(__FreeBSD__) && !defined(__USLC__) && \
-      !defined(_M_UNIX) && !defined(__sgi) && !defined(__DragonFly__)
+      !defined(_M_UNIX) && !defined(__sgi) && !defined(__DragonFly__) && \
+      !defined(__MidnightBSD__)
 #define _XOPEN_SOURCE 600 /* glibc2 and AIX 5.3L need 500, OpenBSD needs 600 for S_ISLNK() */
 #define _XOPEN_SOURCE_EXTENDED 1 /* AIX 5.3L needs this */
 #endif
