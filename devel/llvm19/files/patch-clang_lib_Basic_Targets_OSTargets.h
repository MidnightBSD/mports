--- clang/lib/Basic/Targets/OSTargets.h.orig	2025-01-14 04:41:02 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -189,5 +189,7 @@ protected:
     Builder.defineMacro("__FreeBSD__", Twine(Release));
     Builder.defineMacro("__FreeBSD_cc_version", Twine(CCVersion));
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
     Builder.defineMacro("__KPRINTF_ATTRIBUTE__");
     DefineStd(Builder, "unix", Opts);
     if (this->HasFloat128)
