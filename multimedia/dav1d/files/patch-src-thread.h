--- src/thread.h.orig	2020-03-01 13:50:39.879937000 -0500
+++ src/thread.h	2020-03-01 13:51:07.948748000 -0500
@@ -148,9 +148,9 @@
     pthread_setname_np(name);
 }
 
-#elif defined(__DragonFly__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+#elif defined(__DragonFly__) || defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__MidnightBSD__)
 
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
  /* ALIGN from <sys/param.h> conflicts with ALIGN from "common/attributes.h" */
 #define _SYS_PARAM_H_
 #include <sys/types.h>
