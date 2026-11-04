--- src/util.cc.orig	2022-09-08 13:14:25 UTC
+++ src/util.cc
@@ -40,7 +40,7 @@
 
 #include <vector>
 
-#if defined(__APPLE__) || defined(__FreeBSD__)
+#if defined(__APPLE__) || defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <sys/sysctl.h>
 #elif defined(__SVR4) && defined(__sun)
 #include <unistd.h>
@@ -54,7 +54,7 @@
 #include "string_piece_util.h"
 #endif
 
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
 #include <sys/cpuset.h>
 #endif
 
@@ -708,7 +708,7 @@ int GetProcessorCount() {
   // The number of exposed processors might not represent the actual number of
   // processors threads can run on. This happens when a CPU set limitation is
   // active, see https://github.com/ninja-build/ninja/issues/1278
-#if defined(__FreeBSD__)
+#if defined(__FreeBSD__) || defined(__MidnightBSD__)
   cpuset_t mask;
   CPU_ZERO(&mask);
   if (cpuset_getaffinity(CPU_LEVEL_WHICH, CPU_WHICH_TID, -1, sizeof(mask),
