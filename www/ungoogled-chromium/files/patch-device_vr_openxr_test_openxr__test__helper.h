--- device/vr/openxr/test/openxr_test_helper.h.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/test/openxr_test_helper.h	2026-10-29 12:07:37 UTC
@@ -130,7 +130,7 @@
   void SetOpenGLESInfo(EGLDisplay display, EGLContext context);
   const std::vector<uint32_t>& GetSwapchainTextureIDs(XrSwapchain swapchain);
 #endif
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   // Stashed from xrCreateVulkanInstanceKHR so the later Vulkan device calls
   // can resolve functions without the caller passing them back in.
   void SetVulkanGetInstanceProcAddr(PFN_vkGetInstanceProcAddr proc_addr);
@@ -281,7 +281,7 @@
   absl::flat_hash_map<XrSwapchain, uint32_t> acquired_swapchain_textures_;
   absl::flat_hash_map<XrSwapchain, std::vector<uint32_t>>
       opengl_es_textures_arrays_;
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   PFN_vkGetInstanceProcAddr vulkan_get_instance_proc_addr_ = nullptr;
   VkInstance vulkan_instance_ = VK_NULL_HANDLE;
 #endif
