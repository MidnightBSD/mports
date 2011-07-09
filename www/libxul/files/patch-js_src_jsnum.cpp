--- js/src/jsnum.cpp.orig	2010-01-05 22:35:17.000000000 -0500
+++ js/src/jsnum.cpp	2010-01-11 05:10:19.000000000 -0500
@@ -43,6 +43,9 @@
 /*
  * JS number type and wrapper class.
  */
+#if defined(__MidnightBSD__)
+#include <sys/param.h>
+#endif
 #ifdef XP_OS2
 #define _PC_53  PC_53
 #define _MCW_EM MCW_EM
@@ -691,8 +694,18 @@
 
 #else
 
+#if defined(__MidnightBSD__)
+#if __BSD_VISIBLE == 0
+#error __BSD_VISIBLE is zero, so fedisableexcept is not defined
+#endif
+#include <fenv.h>
+#define FIX_FPU() ((void)fedisableexcept(FE_ALL_EXCEPT))
+#else
+
 #define FIX_FPU() ((void)0)
 
+#endif /* defined(__FreeBSD__) && __FreeBSD_version >= 503000 */
+
 #endif
 
 JSBool
