--- drivers/gpu/drm/amd/amdgpu/amdgpu_freebsd.c.orig	2026-06-24 20:44:00.000000000 -0400
+++ drivers/gpu/drm/amd/amdgpu/amdgpu_freebsd.c	2026-06-24 20:44:00.000000000 -0400
@@ -7,7 +7,7 @@
 MODULE_DEPEND(amdgpu, drmn, 2, 2, 2);
 MODULE_DEPEND(amdgpu, ttm, 1, 1, 1);
 MODULE_DEPEND(amdgpu, linuxkpi, 1, 1, 1);
-#if __FreeBSD_version >= 1400085
+#if __FreeBSD_version >= 1400085 || defined(__MidnightBSD_version)
 MODULE_DEPEND(amdgpu, linuxkpi_hdmi, 1, 1, 1);
 #endif
 MODULE_DEPEND(amdgpu, dmabuf, 1, 1, 1);
