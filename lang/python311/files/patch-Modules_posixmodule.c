--- Modules/posixmodule.c.orig	2023-06-06 18:00:27.000000000 -0400
+++ Modules/posixmodule.c	2023-12-31 18:26:51.346167000 -0500
@@ -280,7 +280,7 @@
 #  undef HAVE_SCHED_SETAFFINITY
 #endif
 
-#if defined(HAVE_SYS_XATTR_H) && defined(__linux__) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#if defined(HAVE_SYS_XATTR_H) && defined(__linux__) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD_kernel)
 #  define USE_XATTRS
 #  include <linux/limits.h>  // Needed for XATTR_SIZE_MAX on musl libc.
 #endif
@@ -289,7 +289,7 @@
 #  include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -307,7 +307,8 @@
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #  include <sys/sysctl.h>
 #endif
 
