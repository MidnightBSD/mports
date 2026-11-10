--- drivers/gpu/drm/ttm/ttm_bo_vm.c.orig	2026-11-10 05:00:00 UTC
+++ drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -416,7 +416,8 @@
 }
 EXPORT_SYMBOL(ttm_bo_vm_fault_reserved);
 
-#if defined(__linux__) || __FreeBSD_version > 1400033
+#if defined(__linux__) || __FreeBSD_version > 1400033 || \
+    (defined(__MidnightBSD_version) && __MidnightBSD_version >= 402000)
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
 #elif defined (__FreeBSD__)
 vm_fault_t ttm_bo_vm_fault(struct vm_area_struct *dummy, struct vm_fault *vmf)
