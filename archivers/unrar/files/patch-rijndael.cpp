--- rijndael.cpp.orig	2026-06-27 11:35:32 UTC
+++ rijndael.cpp
@@ -5,0 +6 @@
+#if !defined(OPENSSL_AES)
@@ -76,0 +78 @@
+#endif // OPENSSL_AES
@@ -84,0 +87 @@
+#if !defined(OPENSSL_AES)
@@ -86,0 +90 @@
+#endif // OPENSSL_AES
@@ -88,0 +93 @@
+#if !defined(OPENSSL_AES)
@@ -94,0 +100 @@
+#endif // OPENSSL_AES
@@ -106,0 +113,25 @@
+#if defined(OPENSSL_AES)
+  const EVP_CIPHER *cipher;
+  switch(keyLen)
+  {
+    case 128:
+      cipher = EVP_aes_128_cbc();
+      break;
+    case 192:
+      cipher = EVP_aes_192_cbc();
+      break;
+    case 256:
+      cipher = EVP_aes_256_cbc();
+      break;
+  }
+
+#if OPENSSL_VERSION_NUMBER < 0x10100000L
+  EVP_CIPHER_CTX_init(&ctx);
+  EVP_CipherInit_ex(&ctx, cipher, NULL, key, initVector, Encrypt);
+  EVP_CIPHER_CTX_set_padding(&ctx, 0);
+#else // OPENSSL_VERSION_NUMBER
+  EVP_CIPHER_CTX_init(ctx);
+  EVP_CipherInit_ex(ctx, cipher, NULL, key, initVector, Encrypt);
+  EVP_CIPHER_CTX_set_padding(ctx, 0);
+#endif // OPENSSL_VERSION_NUMBER
+#else // OPENSSL_AES
@@ -135,0 +167,4 @@
+  #elif defined(__FreeBSD__) || defined(__OpenBSD__)
+    unsigned long Value;
+    int RetCode=elf_aux_info(AT_HWCAP, &Value, sizeof(Value));
+    AES_Neon=RetCode==0 && (Value & HWCAP_AES)!=0;
@@ -175,0 +211 @@
+#endif // OPENSSL_AES
@@ -183,0 +220,9 @@
+#if defined(OPENSSL_AES)
+  int outLen;
+#if OPENSSL_VERSION_NUMBER < 0x10100000L
+  EVP_CipherUpdate(&ctx, outBuffer, &outLen, input, inputLen);
+#else // OPENSSL_VERSION_NUMBER
+  EVP_CipherUpdate(ctx, outBuffer, &outLen, input, inputLen);
+#endif // OPENSSL_VERSION_NUMBER
+  return;
+#else // OPENSSL_AES
@@ -248,3 +293,5 @@
-}
-
-
+#endif // OPENSSL_AES
+}
+
+
+#if !defined(OPENSSL_AES)
@@ -315,0 +363 @@
+#endif // OPENSSL_AES
@@ -322,0 +371,9 @@
+#if defined(OPENSSL_AES)
+  int outLen;
+#if OPENSSL_VERSION_NUMBER < 0x10100000L
+  EVP_CipherUpdate(&ctx, outBuffer, &outLen, input, inputLen);
+#else // OPENSSL_VERSION_NUMBER
+  EVP_CipherUpdate(ctx, outBuffer, &outLen, input, inputLen);
+#endif // OPENSSL_VERSION_NUMBER
+  return;
+#else // OPENSSL_AES
@@ -391,3 +448,5 @@
-}
-
-
+#endif // OPENSSL_AES
+}
+
+
+#if !defined(OPENSSL_AES)
@@ -460,2 +519,4 @@
-
-
+#endif // OPENSSL_AES
+
+
+#if !defined(OPENSSL_AES)
@@ -589,0 +651 @@
+#endif // OPENSSL_AES
