--- gnome-session/gsm-util.h.orig	2026-05-28 14:47:55 UTC
+++ gnome-session/gsm-util.h
@@ -37,7 +37,9 @@ const char * const * gsm_util_get_variable_blacklist(v
                                                      const char *value);
 const char * const * gsm_util_listenv               (void);
 const char * const * gsm_util_get_variable_blacklist(void);
+#ifdef HAVE_SYSTEMD
 
+#endif
 gboolean    gsm_util_export_activation_environment  (GError     **error);
 gboolean    gsm_util_export_user_environment        (GError     **error);
 
