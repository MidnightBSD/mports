--- media/gfx/mappable_shared_image_video_frame_pool.cc.orig	2026-10-26 21:13:14 UTC
+++ media/gfx/mappable_shared_image_video_frame_pool.cc
@@ -684,7 +684,7 @@
   }
 
   bool is_software_backed_video_frame = !video_frame->HasSharedImage();
-#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   is_software_backed_video_frame &= !video_frame->HasDmaBufs();
 #endif
 
@@ -1100,7 +1100,7 @@
       gpu::SHARED_IMAGE_USAGE_WEBGPU_READ);
 #endif
 
-#if BUILDFLAG(IS_CHROMEOS)
+#if BUILDFLAG(IS_CHROMEOS) || BUILDFLAG(IS_BSD)
   // Gate this on SharedImage usage as ScopedAccess now CHECKs for it.
   // TOOD(crbug.com/425634684, crbug.com/413659843): Check for webgpu support
   // from SharedImageCapabilities, once this metadata is compatible.
