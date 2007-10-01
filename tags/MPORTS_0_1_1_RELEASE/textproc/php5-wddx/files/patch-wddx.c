--- wddx.c.orig	Sun Jan  1 13:50:16 2006
+++ wddx.c	Mon Jan 16 12:56:21 2006
@@ -18,6 +18,10 @@
 
 /* $Id: patch-wddx.c,v 1.1 2007-02-25 22:39:23 laffer1 Exp $ */
 
+#ifdef HAVE_CONFIG_H
+# include "config.h"
+#endif
+
 #include "php.h"
 
 #if HAVE_WDDX
@@ -223,7 +227,7 @@
 
 #include "ext/session/php_session.h"
 
-#if HAVE_PHP_SESSION && !defined(COMPILE_DL_SESSION)
+#if HAVE_PHP_SESSION
 /* {{{ PS_SERIALIZER_ENCODE_FUNC
  */
 PS_SERIALIZER_ENCODE_FUNC(wddx)
@@ -302,7 +306,7 @@
 {
 	le_wddx = zend_register_list_destructors_ex(release_wddx_packet_rsrc, NULL, "wddx", module_number);
 
-#if HAVE_PHP_SESSION && !defined(COMPILE_DL_SESSION)
+#if HAVE_PHP_SESSION
 	php_session_register_serializer("wddx",
 									PS_SERIALIZER_ENCODE_NAME(wddx),
 									PS_SERIALIZER_DECODE_NAME(wddx));
@@ -317,7 +321,7 @@
 PHP_MINFO_FUNCTION(wddx)
 {
 	php_info_print_table_start();
-#if HAVE_PHP_SESSION && !defined(COMPILE_DL_SESSION)
+#if HAVE_PHP_SESSION
 	php_info_print_table_header(2, "WDDX Support", "enabled" );
 	php_info_print_table_row(2, "WDDX Session Serializer", "enabled" );
 #else
