--- Modules/posixmodule.c.orig	2026-10-21 13:48:20 UTC
+++ Modules/posixmodule.c
@@ -313,7 +313,7 @@ corresponding Unix manual entries for more information
 #endif
 
 #if defined(HAVE_SYS_XATTR_H)
-#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD_kernel__)
 #    define USE_XATTRS
 #    include <linux/limits.h>  // Needed for XATTR_SIZE_MAX on musl libc.
 #  endif
@@ -327,7 +327,7 @@ corresponding Unix manual entries for more information
 #  include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -345,7 +345,8 @@ corresponding Unix manual entries for more information
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #  include <sys/sysctl.h>
 #endif
 
@@ -11489,7 +11490,7 @@ os_read_impl(PyObject *module, int fd, Py_ssize_t leng
     return buffer;
 }
 
-#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
+#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) \
                                 || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
@@ -11804,7 +11805,7 @@ os_sendfile_impl(PyObject *module, int out_fd, int in_
                  Py_off_t sbytes, PyObject *headers, PyObject *trailers,
                  int flags)
 /*[clinic end generated code: output=81c4bcd143f5c82b input=b0d72579d4c69afa]*/
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /*[clinic input]
 os.sendfile
 
@@ -11845,7 +11846,7 @@ os_sendfile_impl(PyObject *module, int out_fd, int in_
     Py_ssize_t ret;
     int async_err = 0;
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     off_t sbytes;
 #endif
@@ -15422,6 +15423,7 @@ os_cpu_count_impl(PyObject *module)
 #elif defined(__DragonFly__) || \
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
+      defined(__MidnightBSD__)   || \
       defined(__NetBSD__)    || \
       defined(__APPLE__)
     ncpu = 0;
