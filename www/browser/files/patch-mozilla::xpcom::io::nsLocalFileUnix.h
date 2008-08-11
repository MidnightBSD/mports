--- xpcom/io/nsLocalFileUnix.h.orig	Fri Oct 19 02:48:03 2007
+++ xpcom/io/nsLocalFileUnix.h	Fri Oct 19 02:48:42 2007
@@ -73,7 +73,7 @@
 #endif
 
 // so we can statfs on freebsd
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
     #define HAVE_SYS_STATFS_H
     #define STATFS statfs
     #include <sys/param.h>
