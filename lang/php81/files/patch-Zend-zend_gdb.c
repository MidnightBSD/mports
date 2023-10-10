--- Zend/zend_gdb.c.orig	2023-08-01 12:16:09.000000000 -0400
+++ Zend/zend_gdb.c	2023-10-10 16:16:02.086494000 -0400
@@ -25,7 +25,10 @@
 #include <fcntl.h>
 #include <unistd.h>
 
-#if defined(__FreeBSD__) && __FreeBSD_version >= 1100000
+
+#if defined(__MidnightBSD__)
+# include <sys/user.h>
+#elif defined(__FreeBSD__) && __FreeBSD_version >= 1100000
 # include <sys/user.h>
 # include <libutil.h>
 #endif
