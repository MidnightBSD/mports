--- src/polari.c.orig	2022-09-17 00:00:00 UTC
+++ src/polari.c
@@ -2,7 +2,5 @@
 #include <gjs/gjs.h>

 #include "config.h"
-
-G_DEFINE_AUTOPTR_CLEANUP_FUNC (GjsContext, g_object_unref)

 #define JS_MAIN "resource:///org/gnome/Polari/js/main.js"
