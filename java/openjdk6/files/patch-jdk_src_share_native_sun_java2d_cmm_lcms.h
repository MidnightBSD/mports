--- jdk/src/share/native/sun/java2d/cmm/lcms/lcms.h.orig	2016-09-03 19:16:46.240159711 -0400
+++ jdk/src/share/native/sun/java2d/cmm/lcms/lcms.h	2016-09-03 19:17:23.909158095 -0400
@@ -71,7 +71,7 @@
 // #define LCMS_DLL_BUILD   1
 
 // Uncomment if you are trying the engine in a non-windows environment
-// like linux, SGI, VAX, FreeBSD, BeOS, etc.
+// like linux, SGI, VAX, MidnightBSD, FreeBSD, BeOS, etc.
 #define NON_WINDOWS  1
 
 // Uncomment this one if you are using big endian machines (only meaningful
@@ -190,7 +190,7 @@
 #   define USE_BIG_ENDIAN      1
 #endif
 
-#if defined(__OpenBSD__) || defined(__NetBSD__) || defined(__FreeBSD__)
+#if defined(__OpenBSD__) || defined(__NetBSD__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #  include <sys/types.h>
 #  define USE_INT64           1
 #  define LCMSSLONGLONG       int64_t
@@ -210,7 +210,7 @@
 
 #include <string.h>
 
-#if defined(__GNUC__) || defined(__FreeBSD__)
+#if defined(__GNUC__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #   include <unistd.h>
 #endif
 
