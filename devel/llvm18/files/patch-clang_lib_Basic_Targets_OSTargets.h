--- clang/lib/Basic/Targets/OSTargets.h.orig	2024-06-18 11:13:42 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -186,6 +186,8 @@ protected:
 
     Builder.defineMacro("__FreeBSD__", Twine(Release));
     Builder.defineMacro("__FreeBSD_cc_version", Twine(CCVersion));
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
     Builder.defineMacro("__KPRINTF_ATTRIBUTE__");
     DefineStd(Builder, "unix", Opts);
     if (this->HasFloat128)
