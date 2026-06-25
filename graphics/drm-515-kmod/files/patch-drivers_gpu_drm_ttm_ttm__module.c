--- drivers/gpu/drm/ttm/ttm_module.c.orig	2026-06-24 20:44:00.000000000 -0400
+++ drivers/gpu/drm/ttm/ttm_module.c	2026-06-24 20:44:00.000000000 -0400
@@ -94,7 +94,7 @@
 #ifdef CONFIG_AGP
 MODULE_DEPEND(ttm, drmn, 2, 2, 2);
 MODULE_DEPEND(ttm, linuxkpi, 1, 1, 1);
-#if __FreeBSD_version >= 1400085
+#if __FreeBSD_version >= 1400085 || defined(__MidnightBSD_version)
 MODULE_DEPEND(ttm, linuxkpi_hdmi, 1, 1, 1);
 #endif
 MODULE_DEPEND(ttm, dmabuf, 1, 1, 1);
