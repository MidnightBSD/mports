--- src/3rdparty/cl.h.orig	2025-05-18 15:02:01.765408000 -0400
+++ src/3rdparty/cl.h	2025-05-18 15:02:58.184598000 -0400
@@ -25,6 +25,18 @@
 #ifndef XMRIG_CL_H
 #define XMRIG_CL_H
 
+#if !defined(CL_EXT_PREFIX__VERSION_1_1_DEPRECATED)
+    #define CL_EXT_PREFIX__VERSION_1_1_DEPRECATED
+#endif
+#if !defined(CL_EXT_SUFFIX__VERSION_1_1_DEPRECATED)
+    #define CL_EXT_SUFFIX__VERSION_1_1_DEPRECATED
+#endif
+#if !defined(CL_EXT_PREFIX__VERSION_1_2_DEPRECATED)
+    #define CL_EXT_PREFIX__VERSION_1_2_DEPRECATED
+#endif
+#if !defined(CL_EXT_SUFFIX__VERSION_1_2_DEPRECATED)
+    #define CL_EXT_SUFFIX__VERSION_1_2_DEPRECATED
+#endif
 
 #if defined(__APPLE__)
 #   include <OpenCL/cl.h>
