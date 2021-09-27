--- projects/openmp/runtime/src/kmp_platform.h.orig	2021-09-27 05:04:39 UTC
+++ projects/openmp/runtime/src/kmp_platform.h
@@ -19,6 +19,7 @@
 #define KMP_OS_LINUX 0
 #define KMP_OS_DRAGONFLY 0
 #define KMP_OS_FREEBSD 0
+#define KMP_OS_MidnightBSD 0
 #define KMP_OS_NETBSD 0
 #define KMP_OS_OPENBSD 0
 #define KMP_OS_DARWIN 0
@@ -57,6 +58,12 @@
 #define KMP_OS_FREEBSD 1
 #endif
 
+#if (defined __MidnightBSD__)
+#undef KMP_OS_FREEBSD
+#define KMP_OS_FREEBSD 1
+#define KMP_OS_MIDNIGHTBSD 1
+#endif
+
 #if (defined __NetBSD__)
 #undef KMP_OS_NETBSD
 #define KMP_OS_NETBSD 1
