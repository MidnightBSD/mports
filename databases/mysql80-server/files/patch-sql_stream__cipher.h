--- sql/stream_cipher.h.orig	2025-08-19 10:33:36 UTC
+++ sql/stream_cipher.h
@@ -27,3 +27,4 @@
 #include <openssl/evp.h>
 #include <memory>
 #include <string>
+#include <vector>
@@ -40,2 +41,2 @@
 using Key_string =
-    std::basic_string<unsigned char, my_char_traits<unsigned char>>;
+    std::vector<unsigned char>;
