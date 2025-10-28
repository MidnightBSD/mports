--- lib/https.c.orig	2025-10-28 01:02:14 UTC
+++ lib/https.c
@@ -23,6 +23,10 @@
 #include <unistd.h>
 #include <fcntl.h>
 
+#if defined(__MidnightBSD__) || defined(__FreeBSD__)
+#include <radlib.h>
+#endif
+
 #include <openssl/bio.h>
 #include <openssl/err.h>
 #include <openssl/evp.h>
