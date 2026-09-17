--- gnome-session/gsm-system.c.orig
+++ gnome-session/gsm-system.c
@@ -27,3 +27,7 @@
 #include "gsm-systemd.h"
 
+#ifdef HAVE_CONSOLEKIT
+#include "gsm-consolekit.h"
+#endif
+
 enum {
@@ -252,5 +252,14 @@ gsm_get_system (void)
                 }
         }
 
+#ifdef HAVE_CONSOLEKIT
+        if (system == NULL) {
+                system = GSM_SYSTEM (gsm_consolekit_new ());
+                if (system != NULL) {
+                        g_debug ("Using ConsoleKit for session tracking");
+                }
+        }
+#endif
+
         if (system == NULL) {
                 system = gsm_system_null_new ();
