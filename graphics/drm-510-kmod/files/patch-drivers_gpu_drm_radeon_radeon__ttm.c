--- drivers/gpu/drm/radeon/radeon_ttm.c.orig	2026-11-10 05:00:00 UTC
+++ drivers/gpu/drm/radeon/radeon_ttm.c
@@ -913,7 +913,8 @@
 	man->size = size >> PAGE_SHIFT;
 }
 
-#if defined(__linux__) || __FreeBSD_version > 1400033
+#if defined(__linux__) || __FreeBSD_version > 1400033 || \
+    (defined(__MidnightBSD_version) && __MidnightBSD_version >= 402000)
 static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
 #else
 static vm_fault_t radeon_ttm_fault(struct vm_area_struct *dummy, struct vm_fault *vmf)
@@ -929,7 +930,8 @@
 
 	rdev = radeon_get_rdev(bo->bdev);
 	down_read(&rdev->pm.mclk_lock);
-#if defined(__linux__) || __FreeBSD_version > 1400033
+#if defined(__linux__) || __FreeBSD_version > 1400033 || \
+    (defined(__MidnightBSD_version) && __MidnightBSD_version >= 402000)
 	ret = ttm_bo_vm_fault(vmf);
 #else
 	ret = ttm_bo_vm_fault(dummy, vmf);
