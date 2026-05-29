--- clang/lib/Basic/Targets/OSTargets.h.orig	2025-06-13 04:54:34 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -215,0 +216,2 @@
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
