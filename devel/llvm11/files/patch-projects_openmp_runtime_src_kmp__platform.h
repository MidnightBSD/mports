--- projects/openmp/runtime/src/kmp_platform.h.orig	2022-05-05 03:49:40 UTC
+++ projects/openmp/runtime/src/kmp_platform.h
@@ -56,6 +56,11 @@
 #define KMP_OS_FREEBSD 1
 #endif
 
+#if (defined __MidnightBSD__)
+#undef KMP_OS_FREEBSD
+#define KMP_OS_FREEBSD 1
+#endif
+
 #if (defined __NetBSD__)
 #undef KMP_OS_NETBSD
 #define KMP_OS_NETBSD 1
