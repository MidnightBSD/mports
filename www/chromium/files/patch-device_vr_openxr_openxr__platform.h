--- device/vr/openxr/openxr_platform.h.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/openxr_platform.h	2026-10-29 12:07:37 UTC
@@ -21,7 +21,7 @@
 #elif BUILDFLAG(IS_ANDROID)
 #include <EGL/egl.h>
 #include <jni.h>
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 #include <vulkan/vulkan_core.h>
 #endif
 
