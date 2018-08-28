--- xpcom/base/nsMemoryReporterManager.cpp.orig	2016-10-24 08:59:36.688374810 -0400
+++ xpcom/base/nsMemoryReporterManager.cpp	2016-10-24 09:01:11.131350056 -0400
@@ -175,11 +175,11 @@
 
 #elif defined(__DragonFly__) || defined(__FreeBSD__) \
     || defined(__NetBSD__) || defined(__OpenBSD__) \
-    || defined(__FreeBSD_kernel__)
+    || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 
 #include <sys/param.h>
 #include <sys/sysctl.h>
-#if defined(__DragonFly__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__DragonFly__) || defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 #include <sys/user.h>
 #endif
 
@@ -196,7 +196,7 @@
 #if defined(__DragonFly__)
 #define KP_SIZE(kp) (kp.kp_vm_map_size)
 #define KP_RSS(kp) (kp.kp_vm_rssize * getpagesize())
-#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
+#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 #define KP_SIZE(kp) (kp.ki_size)
 #define KP_RSS(kp) (kp.ki_rssize * getpagesize())
 #elif defined(__NetBSD__)
@@ -258,7 +258,7 @@
   return ResidentDistinguishedAmount(aN);
 }
 
-#ifdef __FreeBSD__
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <libutil.h>
 #include <algorithm>
 
