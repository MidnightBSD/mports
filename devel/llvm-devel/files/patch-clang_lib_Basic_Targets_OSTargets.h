--- clang/lib/Basic/Targets/OSTargets.h.orig	2026-10-13 10:01:55.000000000 -0400
+++ clang/lib/Basic/Targets/OSTargets.h	2026-11-13 00:47:44.406201000 -0500
@@ -242,6 +242,8 @@
 
     Builder.defineMacro("__FreeBSD__", Twine(Release));
     Builder.defineMacro("__FreeBSD_cc_version", Twine(CCVersion));
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
     Builder.defineMacro("__KPRINTF_ATTRIBUTE__");
     DefineStd(Builder, "unix", Opts);
     if (this->HasFloat128)
