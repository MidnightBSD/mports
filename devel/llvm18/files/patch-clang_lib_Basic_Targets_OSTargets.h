--- clang/lib/Basic/Targets/OSTargets.h.orig	2024-06-18 11:13:42 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -215,0 +216,2 @@
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
