--- content/renderer/renderer_blink_platform_impl.h.orig	2026-10-26 21:13:14 UTC
+++ content/renderer/renderer_blink_platform_impl.h	2026-10-29 14:17:36 UTC
@@ -287,7 +287,7 @@
                                const gpu::GPUInfo& gpu_info) const;
 
 #if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_MAC) || \
-    BUILDFLAG(IS_WIN)
+    BUILDFLAG(IS_WIN) || BUILDFLAG(IS_BSD)
   std::unique_ptr<blink::WebSandboxSupport> sandbox_support_;
 #endif
 
