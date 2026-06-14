--- clang/lib/Basic/Targets/OSTargets.h.orig	2025-09-09 16:27:02 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -215,0 +216,2 @@
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
