--- Modules/posixmodule.c.orig	2022-04-18 10:43:44.030327000 -0400
+++ Modules/posixmodule.c	2022-04-18 10:46:09.067046000 -0400
@@ -247,7 +247,7 @@
 #  undef HAVE_SCHED_SETAFFINITY
 #endif
 
-#if defined(HAVE_SYS_XATTR_H) && defined(__GLIBC__) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#if defined(HAVE_SYS_XATTR_H) && defined(__GLIBC__) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD_kernel__)
 #  define USE_XATTRS
 #endif
 
@@ -255,7 +255,7 @@
 #  include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -273,7 +273,8 @@
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #  include <sys/sysctl.h>
 #endif
 
