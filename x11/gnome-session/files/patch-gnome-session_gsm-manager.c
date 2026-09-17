--- gnome-session/gsm-manager.c.orig
+++ gnome-session/gsm-manager.c
@@ -41,6 +41,13 @@
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
@@ -786,6 +786,8 @@
                 sd_notify (0, "STATUS=Running");
+#ifdef ENABLE_SYSTEMD_JOURNAL
                 sd_journal_send ("MESSAGE_ID=%s", GSM_MANAGER_STARTUP_SUCCEEDED_MSGID,
                                  "PRIORITY=%d", 5,
                                  "MESSAGE=Entering running state",
                                  NULL);
+#endif
