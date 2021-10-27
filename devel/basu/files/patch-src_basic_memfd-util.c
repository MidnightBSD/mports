--- src/basic/memfd-util.c.orig	2021-01-06 13:56:51 UTC
+++ src/basic/memfd-util.c
@@ -9,7 +9,7 @@
 #include "memfd-util.h"
 
 int memfd_set_sealed(int fd) {
-#if defined(__FreeBSD__) && __FreeBSD__ < 13
+#if defined(__MidnightBSD__) || (defined(__FreeBSD__) && __FreeBSD__ < 13)
         return 0;
 #else
         int r;
