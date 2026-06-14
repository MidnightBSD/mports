--- clang/lib/Basic/Targets/OSTargets.h.orig	2024-06-18 11:13:42 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -204,6 +204,8 @@
     // setting this to 1 is conforming even if all the basic source
     // character literals have the same encoding as char and wchar_t.
     Builder.defineMacro("__STDC_MB_MIGHT_NEQ_WC__", "1");
+    Builder.defineMacro("__MidnightBSD__", Twine(Release));
+    Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
   }
 
 public:
