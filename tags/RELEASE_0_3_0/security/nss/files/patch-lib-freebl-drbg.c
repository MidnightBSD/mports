--- lib/freebl/drbg.c.orig	2010-10-30 16:25:53 -0400
+++ lib/freebl/drbg.c	2010-10-30 16:26:35 -0400
@@ -512,8 +512,6 @@
     if (bytes > PRNG_MAX_ADDITIONAL_BYTES) {
 	bytes = PRNG_MAX_ADDITIONAL_BYTES;
     }
-#else
-    PR_STATIC_ASSERT(sizeof(size_t) <= 4);
 #endif
 
     PZ_Lock(globalrng->lock);
