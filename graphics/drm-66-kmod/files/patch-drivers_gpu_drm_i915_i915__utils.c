--- drivers/gpu/drm/i915/i915_utils.c.orig	2026-11-14 23:40:20.201753000 -0500
+++ drivers/gpu/drm/i915/i915_utils.c	2026-11-14 23:40:20.216435000 -0500
@@ -29,11 +29,19 @@
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
+#ifdef __linux__
 	if (is_error)
 		dev_printk(level, kdev, "%pV", &vaf);
 	else
 		dev_printk(level, kdev, "[" DRM_NAME ":%ps] %pV",
 			   __builtin_return_address(0), &vaf);
+#elif defined(__FreeBSD__)
+	/* The kernel printf(9) knows neither %pV nor %ps. */
+	device_print_prettyname(kdev->bsddev);
+	if (!is_error)
+		printf("[" DRM_NAME "] ");
+	vprintf(fmt, args);
+#endif
 
 	va_end(args);
 
