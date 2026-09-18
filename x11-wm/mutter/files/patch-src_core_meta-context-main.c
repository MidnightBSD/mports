--- src/core/meta-context-main.c.orig
+++ src/core/meta-context-main.c
@@ -25,7 +25,9 @@
 #include <glib.h>
 #include <gio/gio.h>
 
-#include <systemd/sd-login.h>
+#ifdef HAVE_LOGIND
+#include <systemd/sd-login.h>
+#endif
