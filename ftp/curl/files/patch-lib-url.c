--- lib/url.c.orig	2023-02-13 02:37:04.000000000 -0500
+++ lib/url.c	2023-03-09 16:14:53.254924000 -0500
@@ -637,6 +637,10 @@
   set->maxage_conn = 118;
   set->maxlifetime_conn = 0;
   set->http09_allowed = FALSE;
+#if defined(__FreeBSD_version)
+  /* different handling of signals and threads */
+  set->no_signal = TRUE;
+#endif
 #ifdef USE_HTTP2
   set->httpwant = CURL_HTTP_VERSION_2TLS
 #else
