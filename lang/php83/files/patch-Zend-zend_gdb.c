--- Zend/zend_gdb.c.orig	2023-10-10 10:47:21.000000000 -0400
+++ Zend/zend_gdb.c	2023-10-25 11:15:08.496774000 -0400
@@ -25,7 +25,9 @@
 #include <fcntl.h>
 #include <unistd.h>
 
-#if defined(__FreeBSD__) && __FreeBSD_version >= 1100000
+#if defined(__MidnightBSD__)
+# include <sys/user.h>
+#elif defined(__FreeBSD__) && __FreeBSD_version >= 1100000
 # include <sys/user.h>
 # include <libutil.h>
 #endif
