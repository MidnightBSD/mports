--- md5-crypt/md5.c.orig	2008-12-05 21:00:23 UTC
+++ md5-crypt/md5.c
@@ -25,6 +25,7 @@
 #endif
 
 #include <sys/types.h>
+#include <stdint.h>
 
 #if STDC_HEADERS || defined _LIBC
 # include <stdlib.h>
@@ -247,7 +248,7 @@ md5_process_bytes (buffer, len, ctx)
     }
 
   /* Process misaligned blocks. */
-  while ((len > 64) && ((((unsigned int) buffer) & 3) != 0)) {
+  while ((len > 64) && ((((uintptr_t) buffer) & 3) != 0)) {
     memcpy(ctx->buffer, buffer, 64);
     md5_process_block(ctx->buffer, 64, ctx);
     buffer = (const char *) buffer + 64;
