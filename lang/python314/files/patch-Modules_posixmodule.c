--- Modules/posixmodule.c.orig	2026-02-03 10:32:20.000000000 -0500
+++ Modules/posixmodule.c	2026-02-15 13:09:28.027422000 -0500
@@ -125,7 +125,7 @@
 #  include <linux/sched.h>        // SCHED_IDLE, SCHED_RR
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) || defined(__APPLE__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -142,6 +142,7 @@
 #if defined(__DragonFly__) || \
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
+    defined(__MidnightBSD__)   || \
     defined(__NetBSD__)    || \
     defined(__APPLE__)
 #  include <sys/sysctl.h>
@@ -244,7 +245,7 @@
 
 
 #if defined(HAVE_SYS_XATTR_H)
-#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD_kernel__)
 #    define USE_XATTRS
 #    include <linux/limits.h>  // Needed for XATTR_SIZE_MAX on musl libc.
 #  endif
@@ -4396,7 +4397,7 @@
             argument_unavailable_error("link", "follow_symlinks=True");
             return NULL;
         }
-#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || (defined(__sun) && defined(__SVR4))
+#elif defined(__APPLE__) || defined(__MidnightBSD__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || (defined(__sun) && defined(__SVR4))
         if (follow_symlinks == 0) {
             argument_unavailable_error("link", "follow_symlinks=False");
             return NULL;
@@ -11540,7 +11541,7 @@
     return result;
 }
 
-#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
+#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) \
                                 || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
@@ -11854,7 +11855,7 @@
                  Py_off_t sbytes, PyObject *headers, PyObject *trailers,
                  int flags)
 /*[clinic end generated code: output=81c4bcd143f5c82b input=b0d72579d4c69afa]*/
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /*[clinic input]
 os.sendfile
 
@@ -11895,7 +11896,7 @@
     Py_ssize_t ret;
     int async_err = 0;
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     off_t sbytes;
 #endif
@@ -15443,6 +15444,7 @@
 #elif defined(__DragonFly__) || \
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
+      defined(__MidnightBSD__)   || \
       defined(__NetBSD__)    || \
       defined(__APPLE__)
     ncpu = 0;
