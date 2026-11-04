--- lib/pkcs11h-openssl.c.orig	2020-01-01 00:00:00 UTC
+++ lib/pkcs11h-openssl.c
@@ -334,7 +334,7 @@ static struct {
 #endif
 } __openssl_methods;
 
-#if OPENSSL_VERSION_NUMBER < 0x10100001L
+#if OPENSSL_VERSION_NUMBER < 0x10100001L || defined(LIBRESSL_VERSION_NUMBER)
 static
 int
 __pkcs11h_openssl_ex_data_dup (
@@ -347,10 +347,14 @@ __pkcs11h_openssl_ex_data_dup (
 #else
 int
 __pkcs11h_openssl_ex_data_dup (
 	CRYPTO_EX_DATA *to,
 	const CRYPTO_EX_DATA *from,
+#if OPENSSL_VERSION_NUMBER >= 0x30000000L
+	void **from_d,
+#else
 	void *from_d,
+#endif
 	int idx,
 	long argl,
 	void *argp
