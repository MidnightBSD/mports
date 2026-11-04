--- device/vr/openxr/openxr_view_configuration.cc.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/openxr_view_configuration.cc	2026-10-29 12:08:06 UTC
@@ -36,7 +36,7 @@
 // TODO(crbug.com/529457611): Windows and Linux do not support framebuffer
 // scaling.
 constexpr bool kSupportsViewportScaling =
-    !BUILDFLAG(IS_WIN) && !BUILDFLAG(IS_LINUX);
+    !BUILDFLAG(IS_WIN) && !BUILDFLAG(IS_LINUX) && !BUILDFLAG(IS_BSD);
 
 constexpr base::ByteSize kLowMemoryThreshold = base::GiB(8);
 constexpr double kLowMemoryDefaultMaxScaleFactor = 1.5f;
