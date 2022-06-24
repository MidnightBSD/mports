--- jdk/src/solaris/native/java/lang/childproc.c.orig	2020-04-19 09:44:43 UTC
+++ jdk/src/solaris/native/java/lang/childproc.c
@@ -33,6 +33,7 @@
 
 #include "childproc.h"
 
+const char * const *parentPathv;
 
 ssize_t
 restartableWrite(int fd, const void *buf, size_t count)
