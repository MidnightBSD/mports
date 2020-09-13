--- Modules/posixmodule.c.orig	2020-03-10 02:11:12.000000000 -0400
+++ Modules/posixmodule.c	2020-06-27 17:28:06.872914000 -0400
@@ -105,7 +105,7 @@
 #undef HAVE_SCHED_SETAFFINITY
 #endif
 
-#if defined(HAVE_SYS_XATTR_H) && defined(__GLIBC__) && !defined(__FreeBSD_kernel__) && !defined(__GNU__)
+#if defined(HAVE_SYS_XATTR_H) && defined(__GLIBC__) && !defined(__FreeBSD_kernel__) && !defined(__GNU__) && !defined(__MidnightBSD__)
 #define USE_XATTRS
 #endif
 
@@ -113,7 +113,7 @@
 #include <sys/xattr.h>
 #endif
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifdef HAVE_SYS_SOCKET_H
 #include <sys/socket.h>
 #endif
@@ -131,7 +131,8 @@
     defined(__OpenBSD__)   || \
     defined(__FreeBSD__)   || \
     defined(__NetBSD__)    || \
-    defined(__APPLE__)
+    defined(__APPLE__)     || \
+    defined(__MidnightBSD__)
 #include <sys/sysctl.h>
 #endif
 
@@ -7810,8 +7811,16 @@
     int i;
     Py_BEGIN_ALLOW_THREADS
     _Py_BEGIN_SUPPRESS_IPH
-    for (i = Py_MAX(fd_low, 0); i < fd_high; i++)
-        close(i);
+    fd_low = Py_MAX(fd_low, 0);
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
+    if (fd_high >= sysconf(_SC_OPEN_MAX)) {
+        closefrom(fd_low);
+    } else
+#endif
+    {
+        for (i = fd_low; i < fd_high; i++)
+            close(i);
+    }
     _Py_END_SUPPRESS_IPH
     Py_END_ALLOW_THREADS
     Py_RETURN_NONE;
@@ -8058,7 +8067,7 @@
 }
 
 #if (defined(HAVE_SENDFILE) && (defined(__FreeBSD__) || defined(__DragonFly__) \
-                                || defined(__APPLE__))) \
+                                || defined(__MidnightBSD__) || defined(__APPLE__))) \
     || defined(HAVE_READV) || defined(HAVE_PREADV) || defined (HAVE_PREADV2) \
     || defined(HAVE_WRITEV) || defined(HAVE_PWRITEV) || defined (HAVE_PWRITEV2)
 static int
@@ -8346,7 +8355,7 @@
     int async_err = 0;
     off_t offset;
 
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__APPLE__) || defined(__MidnightBSD__)
 #ifndef __APPLE__
     Py_ssize_t len;
 #endif
@@ -11422,7 +11431,8 @@
       defined(__OpenBSD__)   || \
       defined(__FreeBSD__)   || \
       defined(__NetBSD__)    || \
-      defined(__APPLE__)
+      defined(__APPLE__)     || \
+      defined(__MidnightBSD__)
     int mib[2];
     size_t len = sizeof(ncpu);
     mib[0] = CTL_HW;
