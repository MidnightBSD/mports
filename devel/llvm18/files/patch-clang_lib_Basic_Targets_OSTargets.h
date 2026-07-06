--- clang/lib/Basic/Targets/OSTargets.h.orig	2024-06-18 11:13:42 UTC
+++ clang/lib/Basic/Targets/OSTargets.h
@@ -204,6 +204,12 @@
     // setting this to 1 is conforming even if all the basic source
     // character literals have the same encoding as char and wchar_t.
     Builder.defineMacro("__STDC_MB_MIGHT_NEQ_WC__", "1");
+    unsigned Release = Triple.getOSMajorVersion();
+    if (Release == 0U)
+      Release = 8U;
+    unsigned CCVersion = FREEBSD_CC_VERSION;
+    if (CCVersion == 0U)
+      CCVersion = Release * 100000U + 1U;
     Builder.defineMacro("__MidnightBSD__", Twine(Release));
     Builder.defineMacro("__MidnightBSD_cc_version", Twine(CCVersion));
   }
 
 public:
