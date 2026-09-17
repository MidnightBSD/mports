--- src/core/meta-context-main.c.orig
+++ src/core/meta-context-main.c
@@ -25,7 +25,7 @@
 #include <glib.h>
 #include <gio/gio.h>
 
-#ifdef HAVE_WAYLAND
+#ifdef HAVE_LOGIND
 #include <systemd/sd-login.h>
 #endif
