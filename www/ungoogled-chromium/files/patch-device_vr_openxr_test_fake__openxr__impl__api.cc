--- device/vr/openxr/test/fake_openxr_impl_api.cc.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/test/fake_openxr_impl_api.cc	2026-10-29 12:08:07 UTC
@@ -16,7 +16,7 @@
 #include <wrl.h>
 #endif
 
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 #include <vector>
 #endif
 
@@ -298,7 +298,7 @@
             "D3D11Device is nullptr");
 
   GetTestHelper().SetD3DDevice(binding->device);
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   // Linux sessions are Vulkan-bound: next points to
   // XrGraphicsBindingVulkan2KHR.
   const XrGraphicsBindingVulkan2KHR* binding =
@@ -708,7 +708,7 @@
   RETURN_IF_XR_FAILED(GetTestHelper().ValidateSession(session));
   // Linux advertises both RGBA and BGRA SRGB so the Vulkan binding's format
   // selection can be tested. Windows/Android keep a single hardcoded format.
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   constexpr uint32_t kNumFormats = 2;
 #else
   constexpr uint32_t kNumFormats = 1;
@@ -735,7 +735,7 @@
 #elif BUILDFLAG(IS_ANDROID)
   // This is what is hardcoded in `OpenXrGraphicsBindingOpenGLES`.
   formats[0] = OpenXrTestHelper::kSwapchainFormat;
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   // SAFETY: `formats` is a caller-provided array of at least
   // `format_capacity_input` elements, which the RETURN_IFs above confirmed
   // is >= *format_count_output == kNumFormats.
@@ -816,7 +816,7 @@
 
     image.image = texture_ids[i];
   }
-#elif BUILDFLAG(IS_LINUX)
+#elif BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   // SAFETY: Test-only implementation of a C-Style API that thus has to provide
   // arrays as a pointer and a size. The sole callers are our own product/test
   // code.
@@ -1385,7 +1385,7 @@
   return XR_SUCCESS;
 }
 
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 // --- XR_KHR_vulkan_enable2 pass-through implementations ----------------------
 // These forward Vulkan creation calls to the real Vulkan loader so that unit
 // tests can work with actual VkInstance/VkDevice handles (via SwiftShader).
@@ -1537,7 +1537,7 @@
   TRY_LOAD_METHOD(xrCreateReferenceSpace);
   TRY_LOAD_METHOD(xrCreateSession);
   TRY_LOAD_METHOD(xrCreateSwapchain);
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   TRY_LOAD_METHOD(xrCreateVulkanDeviceKHR);
   TRY_LOAD_METHOD(xrCreateVulkanInstanceKHR);
 #endif
@@ -1569,7 +1569,7 @@
   TRY_LOAD_METHOD(xrGetReferenceSpaceBoundsRect);
   TRY_LOAD_METHOD(xrGetViewConfigurationProperties);
   TRY_LOAD_METHOD(xrGetVisibilityMaskKHR);
-#if BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
   TRY_LOAD_METHOD(xrGetVulkanGraphicsDevice2KHR);
   TRY_LOAD_METHOD(xrGetVulkanGraphicsRequirements2KHR);
 #endif
