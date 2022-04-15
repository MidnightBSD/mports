--- Zend/zend_gdb.c.orig	2022-04-14 23:09:24.074491000 -0400
+++ Zend/zend_gdb.c	2022-04-14 23:10:01.659845000 -0400
@@ -25,7 +25,9 @@
 #include <fcntl.h>
 #include <unistd.h>
 
-#if defined(__FreeBSD__)
+#if defined(__MidnightBSD__)
+# include <sys/user.h>
+#elif defined(__FreeBSD__)
 # include <sys/user.h>
 # include <libutil.h>
 #endif
