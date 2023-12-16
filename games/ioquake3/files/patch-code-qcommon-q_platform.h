--- code/qcommon/q_platform.h.orig	2009-03-02 12:29:30.000000000 -0500
+++ code/qcommon/q_platform.h	2023-12-09 11:54:09.020844000 -0500
@@ -177,7 +177,7 @@
 
 //=================================================================== BSD ===
 
-#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__)
+#if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__) || defined(__MidnightBSD__)
 
 #include <sys/types.h>
 #include <machine/endian.h>
@@ -186,7 +186,9 @@
   #define __BSD__
 #endif
 
-#if defined(__FreeBSD__)
+#if defined(__MidnightBSD__)
+#define OS_STRING "midnightbsd"
+#elif defined(__FreeBSD__)
 #define OS_STRING "freebsd"
 #elif defined(__OpenBSD__)
 #define OS_STRING "openbsd"
@@ -199,8 +201,14 @@
 
 #ifdef __i386__
 #define ARCH_STRING "i386"
+#elif defined __amd64__
+#define ARCH_STRING "amd64"
 #elif defined __axp__
 #define ARCH_STRING "alpha"
+#elif defined __powerpc64__
+#define ARCH_STRING "ppc64"
+#elif defined __powerpc__
+#define ARCH_STRING "ppc"
 #endif
 
 #if BYTE_ORDER == BIG_ENDIAN
