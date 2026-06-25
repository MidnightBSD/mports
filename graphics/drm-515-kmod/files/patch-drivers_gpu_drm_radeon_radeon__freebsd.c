--- drivers/gpu/drm/radeon/radeon_freebsd.c.orig	2026-06-24 20:44:00.000000000 -0400
+++ drivers/gpu/drm/radeon/radeon_freebsd.c	2026-06-24 20:44:00.000000000 -0400
@@ -7,7 +7,7 @@
 MODULE_DEPEND(radeonkms, drmn, 2, 2, 2);
 MODULE_DEPEND(radeonkms, ttm, 1, 1, 1);
 MODULE_DEPEND(radeonkms, linuxkpi, 1, 1, 1);
-#if __FreeBSD_version >= 1400085
+#if __FreeBSD_version >= 1400085 || defined(__MidnightBSD_version)
 MODULE_DEPEND(radeonkms, linuxkpi_hdmi, 1, 1, 1);
 #endif
 MODULE_DEPEND(radeonkms, dmabuf, 1, 1, 1);
