--- clang/lib/Basic/Targets/OSTargets.h.orig	2023-01-12 02:12:30.000000000 -0500
+++ clang/lib/Basic/Targets/OSTargets.h	2025-03-27 10:36:38.881888000 -0400
@@ -201,6 +201,10 @@
 #define FREEBSD_CC_VERSION 0U
 #endif
 
+#ifndef MIDNIGHTBSD_CC_VERSION
+#define MIDNIGHTBSD_CC_VERSION 0U
+#endif
+
 // FreeBSD Target
 template <typename Target>
 class LLVM_LIBRARY_VISIBILITY FreeBSDTargetInfo : public OSTargetInfo<Target> {
@@ -212,9 +216,12 @@
     unsigned Release = Triple.getOSMajorVersion();
     if (Release == 0U)
       Release = 8U;
-    unsigned CCVersion = FREEBSD_CC_VERSION;
+    unsigned CCVersion = MIDNIGHTBSD_CC_VERSION;
     if (CCVersion == 0U)
       CCVersion = Release * 100000U + 1U;
+    
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
 
     Builder.defineMacro("__FreeBSD__", Twine(Release));
     Builder.defineMacro("__FreeBSD_cc_version", Twine(CCVersion));
