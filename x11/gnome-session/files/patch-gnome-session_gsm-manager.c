--- gnome-session/gsm-manager.c.orig
+++ gnome-session/gsm-manager.c
@@ -42,0 +43 @@
+#ifdef ENABLE_SYSTEMD_JOURNAL
@@ -43,0 +45 @@
+#endif
@@ -44,0 +47 @@
+#ifdef HAVE_SYSTEMD
@@ -45,0 +49,4 @@
+#else
+#define sd_notify(u, m) do {} while (0)
+#define sd_notifyf(u, m, ...) do {} while (0)
+#endif
@@ -780,0 +788 @@
+#ifdef ENABLE_SYSTEMD_JOURNAL
@@ -784,0 +793 @@
+#endif
