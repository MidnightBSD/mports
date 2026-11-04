--- device/vr/openxr/test/openxr_test_helper.cc.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/test/openxr_test_helper.cc	2026-10-29 12:08:06 UTC
@@ -79,7 +79,7 @@
       XR_KHR_COMPOSITION_LAYER_CYLINDER_EXTENSION_NAME,
       XR_KHR_COMPOSITION_LAYER_EQUIRECT2_EXTENSION_NAME,
       XR_KHR_COMPOSITION_LAYER_CUBE_EXTENSION_NAME,
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
       // Vulkan graphics binding for Linux sessions.
       XR_KHR_VULKAN_ENABLE2_EXTENSION_NAME,
 #endif
@@ -1011,7 +1011,7 @@
   DCHECK_NE(display, EGL_NO_DISPLAY);
   DCHECK_NE(context, EGL_NO_CONTEXT);
 }
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 void OpenXrTestHelper::SetVulkanGetInstanceProcAddr(
     PFN_vkGetInstanceProcAddr proc_addr) {
   DCHECK(proc_addr);
