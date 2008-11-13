--- php_pcre.c.orig	2007-11-14 08:11:40.000000000 +0100
+++ php_pcre.c	2007-11-14 08:11:50.000000000 +0100
@@ -18,6 +18,10 @@
 
 /* $Id: patch-php_pcre.c,v 1.1 2008-11-13 00:34:48 laffer1 Exp $ */
 
+#ifdef HAVE_CONFIG_H
+#include "config.h"
+#endif
+
 #include "php.h"
 #include "php_ini.h"
 #include "php_globals.h"
