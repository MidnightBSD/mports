--- Zend/zend_gdb.c.orig	2024-12-17 06:39:23.000000000 -0500
+++ Zend/zend_gdb.c	2025-01-13 18:21:21.189652000 -0500
@@ -25,9 +25,8 @@
 #include <fcntl.h>
 #include <unistd.h>
 
-#if defined(__FreeBSD__) && __FreeBSD_version >= 1100000
+#if defined(__MidnightBSD__)
 # include <sys/user.h>
-# include <libutil.h>
 #endif
 
 enum {
