--- src/3rdparty/masm/wtf/Platform.h.orig	2019-02-25 07:56:40.000000000 -0500
+++ src/3rdparty/masm/wtf/Platform.h	2019-10-05 20:40:36.045597000 -0400
@@ -222,6 +222,7 @@
 #elif defined(__ARM_ARCH_6__) \
     || defined(__ARM_ARCH_6J__) \
     || defined(__ARM_ARCH_6K__) \
+    || defined(__ARM_ARCH_6KZ__) \
     || defined(__ARM_ARCH_6Z__) \
     || defined(__ARM_ARCH_6ZK__) \
     || defined(__ARM_ARCH_6T2__) \
@@ -384,7 +385,7 @@
 #endif
 
 /* OS(FREEBSD) - FreeBSD */
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 #define WTF_OS_FREEBSD 1
 #endif
 
