--- lib/freebl/unix_rand.c.orig	2010-10-30 16:11:44 -0400
+++ lib/freebl/unix_rand.c	2010-10-30 16:12:40 -0400
@@ -188,7 +188,7 @@
 
 #if defined(SCO) || defined(UNIXWARE) || defined(BSDI) || defined(FREEBSD) \
     || defined(NETBSD) || defined(DARWIN) || defined(OPENBSD) \
-    || defined(NTO) || defined(__riscos__)
+    || defined(NTO) || defined(MIDNIGHTBSD) || defined(__riscos__)
 #include <sys/times.h>
 
 #define getdtablesize() sysconf(_SC_OPEN_MAX)
@@ -946,7 +946,7 @@
 
 #if defined(BSDI) || defined(FREEBSD) || defined(NETBSD) \
     || defined(OPENBSD) || defined(DARWIN) || defined(LINUX) \
-    || defined(HPUX)
+    || defined(HPUX) || defined(MIDNIGHTBSD)
     if (bytes)
         return;
 #endif
