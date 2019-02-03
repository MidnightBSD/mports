--- xpcom/base/nsMemoryInfoDumper.cpp.orig	2016-10-23 15:41:16.947596090 -0400
+++ xpcom/base/nsMemoryInfoDumper.cpp	2016-10-23 15:41:48.738476444 -0400
@@ -38,7 +38,7 @@
 #define MOZ_SUPPORTS_FIFO 1
 #endif
 
-#if defined(XP_LINUX) || defined(__FreeBSD__)
+#if defined(XP_LINUX) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #define MOZ_SUPPORTS_RT_SIGNALS 1
 #endif
 
