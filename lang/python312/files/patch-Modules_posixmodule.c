--- Modules/posixmodule.c.orig	2024-09-06 21:03:31.000000000 -0400
+++ Modules/posixmodule.c	2024-12-04 12:18:10.716252000 -0500
@@ -286,7 +286,7 @@
 #  undef HAVE_SCHED_SETAFFINITY
 #endif
 
-#if defined(HAVE_SYS_XATTR_H) && defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#if defined(HAVE_SYS_XATTR_H) && defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD__)
 #  define USE_XATTRS
 #  include <linux/limits.h>  // Needed for XATTR_SIZE_MAX on musl libc.
 #endif
@@ -295,7 +295,7 @@
 #  include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -313,7 +313,8 @@
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #  include <sys/sysctl.h>
 #endif
 
@@ -9697,7 +9698,7 @@
     return buffer;
 }
 
-#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
+#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) \
                                 || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
@@ -10011,7 +10012,7 @@
                  Py_off_t sbytes, PyObject *headers, PyObject *trailers,
                  int flags)
 /*[clinic end generated code: output=81c4bcd143f5c82b input=b0d72579d4c69afa]*/
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /*[clinic input]
 os.sendfile
 
@@ -10052,7 +10053,7 @@
     Py_ssize_t ret;
     int async_err = 0;
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     off_t sbytes;
 #endif
@@ -13537,6 +13538,7 @@
 #elif defined(__DragonFly__) || \
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
+      defined(__MidnightBSD__)   || \
       defined(__NetBSD__)    || \
       defined(__APPLE__)
     int mib[2];
