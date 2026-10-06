--- rijndael.cpp.orig	2026-06-27 11:35:32 UTC
+++ rijndael.cpp
@@ -3,6 +3,7 @@
  **************************************************************************/
 #include "rar.hpp"
 
+#if !defined(OPENSSL_AES)
 #ifdef USE_SSE
 #include <wmmintrin.h>
 #endif
@@ -74,6 +75,7 @@
     dest[I]=src[I];
 #endif
 }
+#endif // OPENSSL_AES
 
 
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@@ -82,16 +84,20 @@
 
 Rijndael::Rijndael()
 {
+#if !defined(OPENSSL_AES)
   if (S5[0]==0)
     GenerateTables();
+#endif // OPENSSL_AES
   m_uRounds = 0;
   CBCMode = true; // Always true for RAR.
+#if !defined(OPENSSL_AES)
 #ifdef USE_SSE
   AES_NI=false;
 #endif
 #ifdef USE_NEON_AES
   AES_Neon=false;
 #endif
+#endif // OPENSSL_AES
 }
 
 
@@ -104,6 +110,33 @@

 void Rijndael::Init(bool Encrypt,const byte *key,uint keyLen,const byte * initVector)
 {
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
+    default:
+      return;
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
   // Check SIMD here instead of constructor, so if object is a part of some
   // structure memset'ed before use, these variables are not lost.
 #if defined(USE_SSE)
@@ -173,6 +206,7 @@
 
   if(!Encrypt)
     keyEncToDec();
+#endif // OPENSSL_AES
 }
 
 
@@ -181,6 +215,15 @@
   if (inputLen <= 0)
     return;
 
+#if defined(OPENSSL_AES)
+  int outLen;
+#if OPENSSL_VERSION_NUMBER < 0x10100000L
+  EVP_CipherUpdate(&ctx, outBuffer, &outLen, input, inputLen);
+#else // OPENSSL_VERSION_NUMBER
+  EVP_CipherUpdate(ctx, outBuffer, &outLen, input, inputLen);
+#endif // OPENSSL_VERSION_NUMBER
+  return;
+#else // OPENSSL_AES
   size_t numBlocks = inputLen/16;
 #if defined(USE_SSE)
   if (AES_NI)
@@ -245,9 +288,11 @@
     input += 16;
   }
   Copy128(m_initVector,prevBlock);
-}
-
-
+#endif // OPENSSL_AES
+}
+
+
+#if !defined(OPENSSL_AES)
 #ifdef USE_SSE
 void Rijndael::blockEncryptSSE(const byte *input,size_t numBlocks,byte *outBuffer)
 {
@@ -313,6 +358,7 @@
   return;
 }
 #endif
+#endif // OPENSSL_AES
 
   
 void Rijndael::blockDecrypt(const byte *input, size_t inputLen, byte *outBuffer)
@@ -320,6 +366,15 @@
   if (inputLen <= 0)
     return;
 
+#if defined(OPENSSL_AES)
+  int outLen;
+#if OPENSSL_VERSION_NUMBER < 0x10100000L
+  EVP_CipherUpdate(&ctx, outBuffer, &outLen, input, inputLen);
+#else // OPENSSL_VERSION_NUMBER
+  EVP_CipherUpdate(ctx, outBuffer, &outLen, input, inputLen);
+#endif // OPENSSL_VERSION_NUMBER
+  return;
+#else // OPENSSL_AES
   size_t numBlocks=inputLen/16;
 #if defined(USE_SSE)
   if (AES_NI)
@@ -388,9 +443,11 @@
   }
 
   memcpy(m_initVector,iv,16);
-}
-
-
+#endif // OPENSSL_AES
+}
+
+
+#if !defined(OPENSSL_AES)
 #ifdef USE_SSE
 void Rijndael::blockDecryptSSE(const byte *input, size_t numBlocks, byte *outBuffer)
 {
@@ -457,8 +514,10 @@
   memcpy(m_initVector,iv,16);
 }
 #endif
-
-
+#endif // OPENSSL_AES
+
+
+#if !defined(OPENSSL_AES)
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 // ALGORITHM
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@@ -587,6 +646,7 @@
     U1[b][0]=U2[b][1]=U3[b][2]=U4[b][3]=T5[I][0]=T6[I][1]=T7[I][2]=T8[I][3]=gmul(b,0xe);
   }
 }
+#endif // OPENSSL_AES
 
 
 #if 0
