--- src/libsystemd/sd-bus/bus-protocol.h.orig	2021-01-06 13:56:51 UTC
+++ src/libsystemd/sd-bus/bus-protocol.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: LGPL-2.1+ */
 #pragma once
 
-#ifdef __FreeBSD__
+#if defined(__MidnightBSD__) || defined(__FreeBSD__)
 #include <machine/endian.h>
 #else
 #include <endian.h>
@@ -46,7 +46,7 @@ enum {
         _BUS_INVALID_ENDIAN = 0,
         BUS_LITTLE_ENDIAN   = 'l',
         BUS_BIG_ENDIAN      = 'B',
-#if (defined(__FreeBSD__) && _BYTE_ORDER == _BIG_ENDIAN) || (defined(__linux__) && __BYTE_ORDER == __BIG_ENDIAN)
+#if ( (defined(__MidnightBSD__) || defined(__FreeBSD__)) && _BYTE_ORDER == _BIG_ENDIAN) || (defined(__linux__) && __BYTE_ORDER == __BIG_ENDIAN)
         BUS_NATIVE_ENDIAN   = BUS_BIG_ENDIAN,
         BUS_REVERSE_ENDIAN  = BUS_LITTLE_ENDIAN
 #else
