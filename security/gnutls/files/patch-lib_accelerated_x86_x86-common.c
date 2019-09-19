--- lib/accelerated/x86/x86-common.c.orig	2019-09-19 10:35:22.902825000 -0400
+++ lib/accelerated/x86/x86-common.c	2019-09-19 10:35:43.849062000 -0400
@@ -38,12 +38,8 @@
 # include <sha-padlock.h>
 #endif
 #include <aes-padlock.h>
-#ifdef HAVE_CPUID_H
-# include <cpuid.h>
-#else
 # define __get_cpuid(...) 0
 # define __get_cpuid_count(...) 0
-#endif
 
 /* ebx, ecx, edx 
  * This is a format compatible with openssl's CPUID detection.
