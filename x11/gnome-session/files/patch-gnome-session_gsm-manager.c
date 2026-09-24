--- gnome-session/gsm-manager.c.orig	2026-05-28 14:47:55 UTC
+++ gnome-session/gsm-manager.c
@@ -40,9 +40,16 @@
 #include "gsm-manager.h"
 #include "org.gnome.SessionManager.h"
 
+#ifdef ENABLE_SYSTEMD_JOURNAL
 #include <systemd/sd-journal.h>
+#endif
 
+#ifdef HAVE_SYSTEMD
 #include <systemd/sd-daemon.h>
+#else
+#define sd_notify(u, m) do {} while (0)
+#define sd_notifyf(u, m, ...) do {} while (0)
+#endif
 
 #include "gsm-app.h"
 #include "gsm-client.h"
@@ -778,19 +785,23 @@ start_phase (GsmManager *manager)
 
         switch (manager->phase) {
         case GSM_MANAGER_PHASE_INITIALIZATION:
+#ifdef ENABLE_SYSTEMD_JOURNAL
                 sd_notify (0, "READY=1\nSTATUS=Waiting for session to start");
                 break;
         case GSM_MANAGER_PHASE_APPLICATION:
                 sd_notify (0, "STATUS=Starting applications");
+#endif
                 gsm_exported_manager_emit_session_running (manager->skeleton);
                 do_phase_startup (manager);
                 break;
         case GSM_MANAGER_PHASE_RUNNING:
                 sd_notify (0, "STATUS=Running");
+#ifdef ENABLE_SYSTEMD_JOURNAL
                 sd_journal_send ("MESSAGE_ID=%s", GSM_MANAGER_STARTUP_SUCCEEDED_MSGID,
                                  "PRIORITY=%d", 5,
                                  "MESSAGE=Entering running state",
                                  NULL);
+#endif
                 if (manager->pending_end_session_tasks != NULL)
                         complete_end_session_tasks (manager);
                 g_object_unref (manager->end_session_cancellable);
