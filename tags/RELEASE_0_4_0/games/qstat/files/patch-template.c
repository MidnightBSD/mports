--- template.c.orig	Sat Mar 22 12:22:31 2008
+++ template.c	Sat Mar 22 12:22:50 2008
@@ -21,7 +21,7 @@
 #include <ctype.h>
 #include <time.h>
 
-#if defined(__hpux) || defined(_AIX) || defined(__FreeBSD__)
+#if defined(__hpux) || defined(_AIX) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <sys/types.h>
 #endif
 
