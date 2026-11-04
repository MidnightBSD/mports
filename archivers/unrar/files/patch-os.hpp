--- os.hpp.orig	2026-06-27 11:35:31 UTC
+++ os.hpp
@@ -166,0 +167 @@
+#ifdef __linux__
@@ -167,0 +169 @@
+#endif
@@ -175,0 +178,4 @@
+
+#if defined(OPENSSL_AES)
+#include <openssl/evp.h>
+#endif // OPENSSL_AES
