--- nse_ssl_cert.cc.orig
+++ nse_ssl_cert.cc
@@ -495,7 +495,8 @@
   else {
     /* According to RFC 5480 section 2.1.1, explicit curves must not be used with
        X.509. This may change in the future, but for now it doesn't seem worth it
        to add in code to extract the extra parameters. */
-#if defined(LIBRESSL_VERSION_NUMBER)
+#if defined(LIBRESSL_VERSION_NUMBER) || \
+    (defined(OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x30000000L)
     /* LibreSSL doesn't have EC_GROUP_get_field_type, and explicit curves are rare.
      * Just mark as UNKNOWN. */
     lua_pushstring(L, "UNKNOWN");
