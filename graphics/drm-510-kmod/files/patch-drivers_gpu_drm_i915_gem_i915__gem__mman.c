--- drivers/gpu/drm/i915/gem/i915_gem_mman.c.orig	2026-11-10 05:00:00 UTC
+++ drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -301,7 +301,8 @@
 	}
 }
 
-#if defined(__linux__) || __FreeBSD_version > 1400033
+#if defined(__linux__) || __FreeBSD_version > 1400033 || \
+    (defined(__MidnightBSD_version) && __MidnightBSD_version >= 402000)
 static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
 #elif defined(__FreeBSD__)
 static vm_fault_t vm_fault_cpu(struct vm_area_struct *dummy, struct vm_fault *vmf)
@@ -344,7 +345,8 @@
 	return i915_error_to_vmf_fault(err);
 }
 
-#if defined(__linux__) || __FreeBSD_version > 1400033
+#if defined(__linux__) || __FreeBSD_version > 1400033 || \
+    (defined(__MidnightBSD_version) && __MidnightBSD_version >= 402000)
 static vm_fault_t vm_fault_gtt(struct vm_fault *vmf)
 #elif defined(__FreeBSD__)
 static vm_fault_t vm_fault_gtt(struct vm_area_struct *dummy, struct vm_fault *vmf)
