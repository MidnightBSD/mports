--- include/znc/Modules.h.orig	2022-07-15 15:39:37 UTC
+++ include/znc/Modules.h
@@ -52,12 +52,14 @@
 #endif
 #endif
 
+#ifndef ZNC_EXPORT_LIB_EXPORT
 #ifdef BUILD_WITH_CMAKE
 #include <znc/znc_export_lib_export.h>
 #elif HAVE_VISIBILITY
 #define ZNC_EXPORT_LIB_EXPORT __attribute__((__visibility__("default")))
 #else
 #define ZNC_EXPORT_LIB_EXPORT
 #endif
+#endif
 
 /** C-style entry point to the module.
  *
