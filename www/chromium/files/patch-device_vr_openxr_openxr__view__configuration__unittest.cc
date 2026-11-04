--- device/vr/openxr/openxr_view_configuration_unittest.cc.orig	2026-10-26 21:13:13 UTC
+++ device/vr/openxr/openxr_view_configuration_unittest.cc	2026-10-29 12:08:06 UTC
@@ -23,7 +23,7 @@
 constexpr uint32_t kMaxImageWidth = 8192;
 constexpr uint32_t kMaxImageHeight = 8192;
 
-#if !BUILDFLAG(IS_WIN) && !BUILDFLAG(IS_LINUX)
+#if !BUILDFLAG(IS_WIN) && !BUILDFLAG(IS_LINUX) && !BUILDFLAG(IS_BSD)
 // Per-view max texture width limit is 16384 / 2 = 8192.
 // Raw max is 8192x8192.
 // max_scale_w = 8192 / 1440 = 5.6888...
@@ -59,7 +59,7 @@
 
 // Viewport scaling isn't supported on Windows or Linux, validate default
 // behavior.
-#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_LINUX)
+#if BUILDFLAG(IS_WIN) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 
 TEST(OpenXrViewPropertiesTest, ValidateNoFramebufferScale) {
   OpenXrViewProperties properties(kDefaultXrViewProperties, /*view_count=*/2,
@@ -164,6 +164,6 @@
   ValidateScale(properties, kDefaultDoubleWideScaleFactor);
 }
 
-#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_LINUX)
+#endif  // BUILDFLAG(IS_WIN) || BUILDFLAG(IS_LINUX) || BUILDFLAG(IS_BSD)
 
 }  // namespace device
