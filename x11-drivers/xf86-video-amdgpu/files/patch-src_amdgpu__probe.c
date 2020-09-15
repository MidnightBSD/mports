--- src/amdgpu_probe.c.orig	2020-09-15 00:16:53.141725000 -0400
+++ src/amdgpu_probe.c	2020-09-15 00:17:24.197080000 -0400
@@ -50,7 +50,7 @@
 #include "xf86drmMode.h"
 #include "dri.h"
 
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 #include <xf86_OSproc.h>
 #endif
 
@@ -93,7 +93,7 @@
 {
 	int ret = drmCheckModesettingSupported(busIdString);
 
-#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
+#if defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || defined(__MidnightBSD__)
 	if (ret) {
 		if (xf86LoadKernelModule("amdgpukms"))
 			ret = drmCheckModesettingSupported(busIdString);
