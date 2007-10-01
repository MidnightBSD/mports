--- ./urlview.c.orig	Tue Apr  3 15:01:31 2007
+++ ./urlview.c	Tue Apr  3 15:01:31 2007
@@ -46,6 +46,8 @@
 #include <rx/rxposix.h>
 #endif
 
+#include "quote.h"
+
 #define DEFAULT_REGEXP "(((https?|ftp|gopher)://|(mailto|file|news):)[^' \t<>\"]+|(www|web|w3)\\.[-a-z0-9.]+)[^' \t.,;<>\"\\):]"
 #define DEFAULT_COMMAND "url_handler.sh %s"
 #define SYSTEM_INITFILE "/usr/local/etc/urlview.conf"
