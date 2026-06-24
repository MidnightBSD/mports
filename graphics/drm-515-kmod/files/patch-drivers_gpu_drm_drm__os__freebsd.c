--- drivers/gpu/drm/drm_os_freebsd.c.orig	2026-06-24 20:44:00.000000000 -0400
+++ drivers/gpu/drm/drm_os_freebsd.c	2026-06-24 20:44:00.000000000 -0400
@@ -211,7 +211,7 @@
 MODULE_DEPEND(drmn, pci, 1, 1, 1);
 MODULE_DEPEND(drmn, mem, 1, 1, 1);
 MODULE_DEPEND(drmn, linuxkpi, 1, 1, 1);
-#if __FreeBSD_version >= 1400085
+#if __FreeBSD_version >= 1400085 || defined(__MidnightBSD_version)
 MODULE_DEPEND(drmn, linuxkpi_hdmi, 1, 1, 1);
 #endif
 MODULE_DEPEND(drmn, dmabuf, 1, 1, 1);
