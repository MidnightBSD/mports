
$FreeBSD: ports/net/vncreflector/files/patch-main.c,v 1.1 2005/01/20 10:35:48 brooks Exp $

--- main.c.orig
+++ main.c
@@ -464,7 +464,7 @@
 
 static int init_screen_info(void)
 {
-  union _LITTLE_ENDIAN {
+  union {
     CARD32 value32;
     CARD8 test;
   } little_endian;
