--- lib/freebl/unix_rand.c.orig	2018-08-31 08:55:53.000000000 -0400
+++ lib/freebl/unix_rand.c	2018-10-16 10:57:04.926486000 -0400
@@ -160,7 +160,7 @@
 
 #endif
 
-#if defined(SCO) || defined(UNIXWARE) || defined(BSDI) || defined(FREEBSD) || defined(NETBSD) || defined(DARWIN) || defined(OPENBSD) || defined(NTO) || defined(__riscos__) || defined(__GNU__) || defined(__FreeBSD_kernel__) || defined(__NetBSD_kernel__)
+#if defined(SCO) || defined(UNIXWARE) || defined(BSDI) || defined(MIDNIGHTBSD) || defined(FREEBSD) || defined(NETBSD) || defined(DARWIN) || defined(OPENBSD) || defined(NTO) || defined(__riscos__) || defined(__GNU__) || defined(__FreeBSD_kernel__) || defined(__NetBSD_kernel__)
 #include <sys/times.h>
 
 static size_t
@@ -759,7 +759,7 @@
     for (cp = files; *cp; cp++)
         RNG_FileForRNG(*cp);
 
-#if defined(BSDI) || defined(FREEBSD) || defined(NETBSD) || defined(OPENBSD) || defined(DARWIN) || defined(LINUX) || defined(HPUX)
+#if defined(BSDI) || defined(MIDNIGHTBSD) || defined(FREEBSD) || defined(NETBSD) || defined(OPENBSD) || defined(DARWIN) || defined(LINUX) || defined(HPUX)
     if (bytes)
         return;
 #endif
