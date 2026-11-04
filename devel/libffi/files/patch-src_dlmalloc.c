--- src/dlmalloc.c.orig	2018-09-09 16:08:20.368660000 -0400
+++ src/dlmalloc.c	2018-09-09 16:08:41.490213000 -0400
@@ -1195,7 +1195,7 @@
 #ifndef LACKS_UNISTD_H
 #include <unistd.h>     /* for sbrk */
 #else /* LACKS_UNISTD_H */
-#if !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__NetBSD__)
+#if !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__MidnightBSD__)
 extern void*     sbrk(ptrdiff_t);
 #endif /* FreeBSD etc */
 #endif /* LACKS_UNISTD_H */
