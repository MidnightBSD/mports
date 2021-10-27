--- src/basic/missing.h.orig	2021-01-06 13:56:51 UTC
+++ src/basic/missing.h
@@ -70,7 +70,7 @@
 #define TASK_COMM_LEN 16
 #endif
 
-#ifdef __FreeBSD__
+#if defined(__MidnightBSD__) || defined(__FreeBSD__)
 #define ENOMEDIUM       (INT_MAX - 1)
 #define ENOPKG          (INT_MAX - 2)
 #define EUNATCH         (INT_MAX - 3)
