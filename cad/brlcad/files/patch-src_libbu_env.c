--- src/libbu/env.c.orig	2026-05-24 00:02:33 UTC
+++ src/libbu/env.c
@@ -40,7 +40,7 @@
 #include <errno.h>
 #include "bio.h"
 
-#ifdef HAVE_SYS_SYSINFO_H
+#if defined(HAVE_SYS_SYSINFO_H) && !defined(__MidnightBSD__)
 #  include <sys/sysinfo.h>
 #endif
 
@@ -95,7 +95,7 @@ bu_avail_mem()
 long int
 bu_avail_mem()
 {
-#ifdef HAVE_SYS_SYSINFO_H
+#if defined(HAVE_SYS_SYSINFO_H) && !defined(__MidnightBSD__)
     if (!getenv("BU_AVAILABLE_MEM_NOCHECK")) {
 	struct sysinfo s;
 	long int avail_ram;
