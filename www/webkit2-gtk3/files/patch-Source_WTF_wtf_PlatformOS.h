--- Source/WTF/wtf/PlatformOS.h.orig	2020-11-28 20:31:49 UTC
+++ Source/WTF/wtf/PlatformOS.h
@@ -85,7 +85,7 @@
 #endif
 
 /* OS(FREEBSD) - FreeBSD */
-#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__DragonFly__) || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 #define WTF_OS_FREEBSD 1
 #endif
 
