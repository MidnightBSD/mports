--- crypto/threads_pthread.c.orig	2026-06-09 11:37:55 UTC
+++ crypto/threads_pthread.c
@@ -81,6 +81,10 @@
 #define BROKEN_CLANG_ATOMICS
 #endif
 
+#if defined(__FreeBSD__) && defined(__i386__)
+#define BROKEN_CLANG_ATOMICS
+#endif
+
 #if defined(OPENSSL_THREADS) && !defined(CRYPTO_TDEBUG) && !defined(OPENSSL_SYS_WINDOWS)
 
 #if defined(OPENSSL_SYS_UNIX)
