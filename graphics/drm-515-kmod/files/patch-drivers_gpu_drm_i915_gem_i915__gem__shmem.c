--- drivers/gpu/drm/i915/gem/i915_gem_shmem.c.orig	2026-06-11 16:40:32.692159000 -0400
+++ drivers/gpu/drm/i915/gem/i915_gem_shmem.c	2026-06-11 16:40:32.695544000 -0400
@@ -14,7 +14,7 @@
 #include "i915_scatterlist.h"
 #include "i915_trace.h"
 
-#if !defined(__FreeBSD_version) || __FreeBSD_version < 1400080
+#if (!defined(__FreeBSD_version) || __FreeBSD_version < 1400080) && !defined(__MidnightBSD_version)
 static inline unsigned long totalram_pages(void) { return physmem; }
 #endif
 
