--- unlzh.c.orig	2024-08-09 22:06:03 UTC
+++ unlzh.c
@@ -307,6 +307,12 @@ static void
 huf_decode_start ()
 {
+    /* Needed in case LEFT and RIGHT are reused from a previous
+       LZW decompression.  It may be overkill to clear all of both
+       arrays, but nobody has had time to analyze this carefully.  */
+    memzero (left, (2 * NC - 1) * sizeof *left);
+    memzero (right, (2 * NC - 1) * sizeof *right);
+
     init_getbits();  blocksize = 0;
 }
