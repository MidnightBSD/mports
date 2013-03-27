--- fuse_module/fuse.h.orig	2008-02-05 00:25:57.000000000 -0500
+++ fuse_module/fuse.h	2013-03-26 20:31:30.000000000 -0400
@@ -18,15 +18,31 @@
 #endif
 
 #ifndef NEW_VNODES_ADJUSTED_MANUALLY
-#if __FreeBSD_version >= 700034
+#if __MidnightBSD_version >= 3000
 #define NEW_VNODES_ADJUSTED_MANUALLY 1
 #else
 #define NEW_VNODES_ADJUSTED_MANUALLY 0
 #endif
 #endif
 
+#ifndef VFSOPS_TAKES_THREAD
+#if __MidnightBSD_version >= 4016
+#define VFSOPS_TAKES_THREAD 0
+#else
+#define VFSOPS_TAKES_THREAD 1
+#endif
+#endif
+
+#ifndef VOP_ACCESS_TAKES_ACCMODE_T
+#if __MidnightBSD_version >= 4016
+#define VOP_ACCESS_TAKES_ACCMODE_T 1
+#else
+#define VOP_ACCESS_TAKES_ACCMODE_T 0
+#endif
+#endif
+
 #ifndef VOP_OPEN_TAKES_FP
-#if __FreeBSD_version >= 700044
+#if __MidnightBSD_version >= 3000
 #define VOP_OPEN_TAKES_FP 1
 #else
 #define VOP_OPEN_TAKES_FP 0
@@ -34,7 +50,7 @@
 #endif
 
 #ifndef VN_LOCK_TAKES_THREAD
-#if __FreeBSD_version >= 800010
+#if __MidnightBSD_version >= 4016
 #define VN_LOCK_TAKES_THREAD 0
 #else
 #define VN_LOCK_TAKES_THREAD 1
@@ -42,13 +58,21 @@
 #endif
 
 #ifndef VOP_UNLOCK_TAKES_THREAD
-#if __FreeBSD_version >= 800011
+#if __MidnightBSD_version >= 4016
 #define VOP_UNLOCK_TAKES_THREAD 0
 #else
 #define VOP_UNLOCK_TAKES_THREAD 1
 #endif
 #endif
 
+#ifndef VOP_GETATTR_TAKES_THREAD
+#if __MidnightBSD_version >= 4016
+#define VOP_GETATTR_TAKES_THREAD 0
+#else
+#define VOP_GETATTR_TAKES_THREAD 1
+#endif
+#endif
+
 #ifndef USE_PRIVILEGE_API
 /*
  * __FreeBSD_version bump was omitted for introduction of
@@ -56,7 +80,7 @@
  * legacy API has been removed), so here we just use the first
  * value of __FreeBSD_version after adding the priv stuff.
  */
-#if __FreeBSD_version >= 700025
+#if __MidnightBSD_version >= 4016
 #define USE_PRIVILEGE_API 1
 #else
 #define USE_PRIVILEGE_API 0
