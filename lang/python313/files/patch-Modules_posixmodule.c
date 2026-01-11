--- Modules/posixmodule.c.orig	2025-12-05 11:06:33.000000000 -0500
+++ Modules/posixmodule.c	2026-01-11 17:24:55.590459000 -0500
@@ -313,7 +313,7 @@
 #endif
 
 #if defined(HAVE_SYS_XATTR_H)
-#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD_kernel__)
 #    define USE_XATTRS
 #    include <linux/limits.h>  // Needed for XATTR_SIZE_MAX on musl libc.
 #  endif
@@ -327,7 +327,7 @@
 #  include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -345,7 +345,8 @@
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #  include <sys/sysctl.h>
 #endif
 
@@ -11414,7 +11415,7 @@
     return buffer;
 }
 
-#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
+#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) \
                                 || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
@@ -11728,7 +11729,7 @@
                  Py_off_t sbytes, PyObject *headers, PyObject *trailers,
                  int flags)
 /*[clinic end generated code: output=81c4bcd143f5c82b input=b0d72579d4c69afa]*/
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /*[clinic input]
 os.sendfile
 
@@ -11769,7 +11770,7 @@
     Py_ssize_t ret;
     int async_err = 0;
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     off_t sbytes;
 #endif
@@ -15317,6 +15318,7 @@
 #elif defined(__DragonFly__) || \
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
+      defined(__MidnightBSD__)   || \
       defined(__NetBSD__)    || \
       defined(__APPLE__)
     ncpu = 0;
