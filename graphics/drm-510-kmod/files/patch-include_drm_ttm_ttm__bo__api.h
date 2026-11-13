--- include/drm/ttm/ttm_bo_api.h.orig	2026-11-10 05:00:00 UTC
+++ include/drm/ttm/ttm_bo_api.h
@@ -623,7 +623,8 @@
 				    pgoff_t num_prefault,
 				    pgoff_t fault_page_size);
 
-#if defined(__linux__) || __FreeBSD_version > 1400033
+#if defined(__linux__) || __FreeBSD_version > 1400033 || \
+    (defined(__MidnightBSD_version) && __MidnightBSD_version >= 402000)
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
 #elif defined (__FreeBSD__)
 vm_fault_t ttm_bo_vm_fault(struct vm_area_struct *dummy, struct vm_fault *vmf);
