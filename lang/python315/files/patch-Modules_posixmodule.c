--- Modules/posixmodule.c.orig	2026-10-21 05:55:12 UTC
+++ Modules/posixmodule.c
@@ -130,7 +130,7 @@
 #  include <linux/sched.h>        // SCHED_IDLE, SCHED_RR
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) || defined(__APPLE__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -147,6 +147,7 @@
 #if defined(__DragonFly__) || \
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
+    defined(__MidnightBSD__)   || \
     defined(__NetBSD__)    || \
     defined(__APPLE__)
 #  include <sys/sysctl.h>
@@ -249,7 +250,7 @@
 
 
 #if defined(HAVE_SYS_XATTR_H)
-#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#  if defined(HAVE_LINUX_LIMITS_H) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD_kernel__)
 #    define USE_XATTRS
 #    include <linux/limits.h>  // Needed for XATTR_SIZE_MAX on musl libc.
 #  endif
@@ -4887,7 +4888,7 @@ os_link_impl(PyObject *module, path_t *src, path_t *ds
             argument_unavailable_error("link", "follow_symlinks=True");
             return NULL;
         }
-#elif defined(__APPLE__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || (defined(__sun) && defined(__SVR4))
+#elif defined(__APPLE__) || defined(__MidnightBSD__) || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || (defined(__sun) && defined(__SVR4))
         if (follow_symlinks == 0) {
             argument_unavailable_error("link", "follow_symlinks=False");
             return NULL;
@@ -12120,7 +12121,7 @@ os_readinto_impl(PyObject *module, int fd, Py_buffer *
     return result;
 }
 
-#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
+#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__MidnightBSD__) || defined(__DragonFly__) \
                                 || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
@@ -12436,7 +12437,7 @@ os_sendfile_impl(PyObject *module, int out_fd, int in_
                  Py_off_t sbytes, PyObject *headers, PyObject *trailers,
                  int flags)
 /*[clinic end generated code: output=81c4bcd143f5c82b input=b0d72579d4c69afa]*/
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /*[clinic input]
 os.sendfile
 
@@ -12487,7 +12488,7 @@ os_sendfile_impl(PyObject *module, int out_fd, int in_
     assert(count >= 0);
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     off_t sbytes;
 #endif
@@ -16107,6 +16108,7 @@ os_cpu_count_impl(PyObject *module)
 #elif defined(__DragonFly__) || \
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
+      defined(__MidnightBSD__)   || \
       defined(__NetBSD__)    || \
       defined(__APPLE__)
     ncpu = 0;
