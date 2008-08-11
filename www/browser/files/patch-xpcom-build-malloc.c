--- xpcom/build/malloc.c.orig	Fri Oct 19 02:38:36 2007
+++ xpcom/build/malloc.c	Fri Oct 19 02:39:51 2007
@@ -918,7 +918,7 @@
 
 
 #ifdef LACKS_UNISTD_H
-#if !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__NetBSD__)
+#if !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__MidnightBSD__)
 #if __STD_C
 extern Void_t*     sbrk(ptrdiff_t);
 #else
