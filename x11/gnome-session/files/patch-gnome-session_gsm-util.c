--- gnome-session/gsm-util.c.orig	2026-05-28 14:47:55 UTC
+++ gnome-session/gsm-util.c
@@ -75,12 +75,6 @@ static const char * const variable_unsetlist[] = {
     "LC_COLLATE",
     "LC_MONETARY",
     "LC_MESSAGES",
-    "LC_PAPER",
-    "LC_NAME",
-    "LC_ADDRESS",
-    "LC_TELEPHONE",
-    "LC_MEASUREMENT",
-    "LC_IDENTIFICATION",
     "LC_ALL",
 
     NULL
@@ -316,6 +310,7 @@ gsm_util_export_activation_environment (GError     **e
         return environment_updated;
 }
 
+#ifdef HAVE_SYSTEMD
 gboolean
 gsm_util_export_user_environment (GError     **error)
 {
@@ -441,6 +436,7 @@ gsm_util_update_user_environment (const char  *variabl
 
         return environment_updated;
 }
+#endif
 
 void
 gsm_util_setenv (const char *variable,
@@ -464,12 +460,14 @@ gsm_util_setenv (const char *variable,
                 g_clear_error (&error);
         }
 
+#ifdef HAVE_SYSTEMD
         /* If this fails, the system user session won't get the updated environment
          */
         if (!gsm_util_update_user_environment (variable, value, &error)) {
                 g_debug ("Could not make systemd aware of %s=%s environment variable: %s", variable, value, error->message);
                 g_clear_error (&error);
         }
+#endif
 }
 
 const char * const *
