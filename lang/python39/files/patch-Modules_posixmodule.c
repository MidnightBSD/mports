--- Modules/posixmodule.c.orig	2021-04-04 08:56:53.000000000 -0400
+++ Modules/posixmodule.c	2021-05-10 23:53:31.290526000 -0400
@@ -248,7 +248,7 @@
 #  include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #  ifdef HAVE_SYS_SOCKET_H
 #    include <sys/socket.h>
 #  endif
@@ -266,7 +266,8 @@
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #  include <sys/sysctl.h>
 #endif
 
@@ -9134,7 +9135,7 @@
     fdwalk(_fdwalk_close_func, lohi);
 #else
     fd_low = Py_MAX(fd_low, 0);
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
     if (fd_high >= sysconf(_SC_OPEN_MAX)) {
         /* Any errors encountered while closing file descriptors are ignored */
         closefrom(fd_low);
@@ -9394,7 +9395,7 @@
     return buffer;
 }
 
-#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
+#if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__) \
                                 || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
@@ -9700,7 +9701,7 @@
                  Py_off_t sbytes, PyObject *headers, PyObject *trailers,
                  int flags)
 /*[clinic end generated code: output=81c4bcd143f5c82b input=b0d72579d4c69afa]*/
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
+#elif defined(__FreeBSD__) || defined(__DragonFly__) || defined(__MidnightBSD__)
 /*[clinic input]
 os.sendfile
 
@@ -9741,7 +9742,7 @@
     Py_ssize_t ret;
     int async_err = 0;
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     off_t sbytes;
 #endif
@@ -13000,7 +13001,8 @@
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
       defined(__NetBSD__)    || \
-      defined(__APPLE__)
+      defined(__APPLE__)     || \
+      defined(__MidnightBSD__)
     int mib[2];
     size_t len = sizeof(ncpu);
     mib[0] = CTL_HW;
