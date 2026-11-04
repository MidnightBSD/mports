--- lib/freebl/unix_rand.c.orig	2025-02-28 03:25:02.000000000 -0500
+++ lib/freebl/unix_rand.c	2025-03-26 14:51:52.774814000 -0400
@@ -160,7 +160,7 @@
 
 #endif
 
-#if defined(FREEBSD) || defined(NETBSD) || defined(DARWIN) || defined(OPENBSD) || defined(NTO) || defined(__riscos__) || defined(__GNU__) || defined(__FreeBSD_kernel__) || defined(__NetBSD_kernel__)
+#if defined(MIDNIGHTBSD) || defined(FREEBSD) || defined(NETBSD) || defined(DARWIN) || defined(OPENBSD) || defined(NTO) || defined(__riscos__) || defined(__GNU__) || defined(__MidnightBSD_kernel__) || defined(__FreeBSD_kernel__) || defined(__NetBSD_kernel__)
 #include <sys/times.h>
 
 static size_t
@@ -672,7 +672,7 @@
     for (cp = files; *cp; cp++)
         RNG_FileForRNG(*cp);
 
-#if defined(BSDI) || defined(FREEBSD) || defined(NETBSD) || defined(OPENBSD) || defined(DARWIN) || defined(LINUX) || defined(HPUX)
+#if defined(BSDI) || defined(MIDNIGHTBSD) || defined(FREEBSD) || defined(NETBSD) || defined(OPENBSD) || defined(DARWIN) || defined(LINUX) || defined(HPUX)
     if (bytes)
         return;
 #endif
