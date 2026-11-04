--- jdbc/thread/my_pthread.h.orig	2023-03-23 16:32:48 UTC
+++ jdbc/thread/my_pthread.h
@@ -36,7 +36,7 @@
 #define _my_pthread_h
 
 #ifndef ETIME
-#define ETIME ETIMEDOUT				/* For FreeBSD */
+#define ETIME ETIMEDOUT				/* For MidnightBSD */
 #endif
 
 #ifdef  __cplusplus
