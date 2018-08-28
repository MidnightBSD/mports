--- xpcom/base/nsDebugImpl.cpp.orig	2016-10-24 10:05:15.168349918 -0400
+++ xpcom/base/nsDebugImpl.cpp	2016-10-24 10:06:06.460607384 -0400
@@ -43,7 +43,7 @@
 #endif
 
 #if defined(XP_MACOSX) || defined(__DragonFly__) || defined(__FreeBSD__) \
- || defined(__NetBSD__) || defined(__OpenBSD__)
+ || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__MidnightBSD__)
 #include <stdbool.h>
 #include <unistd.h>
 #include <sys/param.h>
@@ -54,7 +54,7 @@
 #include <sys/proc.h>
 #endif
 
-#if defined(__DragonFly__) || defined(__FreeBSD__)
+#if defined(__DragonFly__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <sys/user.h>
 #endif
 
@@ -70,7 +70,7 @@
 #define KP_FLAGS kp_proc.p_flag
 #elif defined(__DragonFly__)
 #define KP_FLAGS kp_flags
-#elif defined(__FreeBSD__)
+#elif defined(__FreeBSD__) || defined(__MidnightBSD__)
 #define KP_FLAGS ki_flag
 #elif defined(__OpenBSD__) && !defined(_P_TRACED)
 #define KP_FLAGS p_psflags
@@ -173,7 +173,7 @@
 #if defined(XP_WIN)
   *aResult = ::IsDebuggerPresent();
 #elif defined(XP_MACOSX) || defined(__DragonFly__) || defined(__FreeBSD__) \
-   || defined(__NetBSD__) || defined(__OpenBSD__)
+   || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__MidnightBSD__)
   // Specify the info we're looking for
   int mib[] = {
     CTL_KERN,
