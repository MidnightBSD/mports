--- drivers/gpu/drm/linux_fb.c.orig	2026-11-10 05:00:00 UTC
+++ drivers/gpu/drm/linux_fb.c
@@ -94,6 +94,20 @@
 {
 	struct fb_info *fb;
 
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+	/*
+	 * Called from the amdgpu and i915 probe error paths.  Only touch
+	 * the softc when vt_freeze_main_vd() could have frozen it: it is
+	 * an fb_info only for these drivers, and may be NULL otherwise.
+	 */
+	if (main_vd == NULL || main_vd->vd_driver == NULL ||
+	    main_vd->vd_softc == NULL ||
+	    (strcmp(main_vd->vd_driver->vd_name, "efifb") != 0 &&
+	    strcmp(main_vd->vd_driver->vd_name, "vbefb") != 0 &&
+	    strcmp(main_vd->vd_driver->vd_name, "ofwfb") != 0 &&
+	    strcmp(main_vd->vd_driver->vd_name, "fb") != 0))
+		return;
+#endif
 	fb = main_vd->vd_softc;
 	fb->fb_flags &= ~FB_FLAG_NOWRITE;
 }
