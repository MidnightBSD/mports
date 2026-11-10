--- nvidia-drm-conftest.h.orig	2024-03-11 17:52:16 UTC
+++ nvidia-drm-conftest.h
@@ -98,7 +98,10 @@
 
 /* For nv_drm_gem_prime_force_fence_signal */
 #ifndef spin_is_locked
-#if ((__FreeBSD_version >= 1500000) && (__FreeBSD_version < 1500018)) || (__FreeBSD_version < 1401501)
+#if defined(__MidnightBSD_version) && __MidnightBSD_version >= 402004
+/* LinuxKPI from FreeBSD stable/15: spinlock_t is a struct mtx. */
+#define spin_is_locked(lock) mtx_owned(lock)
+#elif ((__FreeBSD_version >= 1500000) && (__FreeBSD_version < 1500018)) || (__FreeBSD_version < 1401501)
 #define spin_is_locked(lock) mtx_owned(lock.m)
 #else
 #define spin_is_locked(lock) mtx_owned(lock)
@@ -139,11 +142,9 @@
  */
 #define drm_atomic_state_free drm_atomic_state_put
 
-#if __FreeBSD_version < 1300000
 /* redefine LIST_HEAD_INIT to the linux version */
 #include <linux/list.h>
 #define LIST_HEAD_INIT(name) LINUX_LIST_HEAD_INIT(name)
-#endif
 
 /*
  * FreeBSD currently has only vmf_insert_pfn_prot defined, and it has a
