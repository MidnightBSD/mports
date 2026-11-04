--- drivers/gpu/drm/i915/i915_module.c.orig	2026-06-24 20:44:00.000000000 -0400
+++ drivers/gpu/drm/i915/i915_module.c	2026-06-24 20:44:00.000000000 -0400
@@ -134,7 +134,7 @@
 MODULE_DEPEND(i915kms, ttm, 1, 1, 1);
 MODULE_DEPEND(i915kms, agp, 1, 1, 1);
 MODULE_DEPEND(i915kms, linuxkpi, 1, 1, 1);
-#if __FreeBSD_version >= 1400085
+#if __FreeBSD_version >= 1400085 || defined(__MidnightBSD_version)
 MODULE_DEPEND(i915kms, linuxkpi_hdmi, 1, 1, 1);
 #endif
 MODULE_DEPEND(i915kms, dmabuf, 1, 1, 1);
