--- runtime/nsd_ossl.c.orig
+++ runtime/nsd_ossl.c
@@ -949,7 +949,7 @@ osslPostHandshakeCheck(nsd_ossl_t *pNsd) {
     if (SSL_get_shared_ciphers(pNsd->pNetOssl->ssl, szDbg, sizeof szDbg) != NULL)
         dbgprintf("osslPostHandshakeCheck: Debug Shared ciphers = %s\\n", szDbg);
 
-#if OPENSSL_VERSION_NUMBER >= 0x10002000L && !defined(ENABLE_WOLFSSL)
+#if OPENSSL_VERSION_NUMBER >= 0x10002000L && !defined(ENABLE_WOLFSSL) && !defined(LIBRESSL_VERSION_NUMBER)
     if (SSL_get_shared_curve(pNsd->pNetOssl->ssl, -1) == 0) {
         // This is not a failure
         LogMsg(0, RS_RET_NO_ERRCODE, LOG_INFO,
