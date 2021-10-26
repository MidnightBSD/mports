--- src/libsystemd/sd-bus/bus-gvariant.c.orig	2021-01-06 13:56:51 UTC
+++ src/libsystemd/sd-bus/bus-gvariant.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: LGPL-2.1+ */
 
-#ifdef __FreeBSD__
+#ifdef __MidnightBSD__
 #include <sys/endian.h>
 #endif
 
