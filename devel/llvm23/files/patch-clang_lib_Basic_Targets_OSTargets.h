--- clang/lib/Basic/Targets/OSTargets.h.orig
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -219,6 +219,8 @@
     if (CCVersion == 0U)
       CCVersion = Release * 100000U + 1U;
 
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
     Builder.defineMacro("__FreeBSD__", Twine(Release));
     Builder.defineMacro("__FreeBSD_cc_version", Twine(CCVersion));
     Builder.defineMacro("__KPRINTF_ATTRIBUTE__");
