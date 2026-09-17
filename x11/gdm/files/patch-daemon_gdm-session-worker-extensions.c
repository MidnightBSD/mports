--- daemon/gdm-session-worker.c.orig
+++ daemon/gdm-session-worker.c
@@ -3333,8 +3333,10 @@ gdm_session_worker_handle_initialize (GdmDBusWorker
         while (g_variant_iter_loop (&iter, "{sv}", &key, &value)) {
                 if (g_strcmp0 (key, "service") == 0) {
                         worker->service = g_variant_dup_string (value, NULL);
+#ifdef SUPPORTS_PAM_EXTENSIONS
                 } else if (g_strcmp0 (key, "extensions") == 0) {
                         g_autofree const char **supported_extensions = g_variant_get_strv (value, NULL);
 
                         worker->extensions = filter_extensions (supported_extensions);
+#endif
