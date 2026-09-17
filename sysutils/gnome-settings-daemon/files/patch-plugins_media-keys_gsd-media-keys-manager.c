Inhibit support (login1 -> ConsoleKit).

Index: plugins/media-keys/gsd-media-keys-manager.c
--- plugins/media-keys/gsd-media-keys-manager.c.orig
+++ plugins/media-keys/gsd-media-keys-manager.c
@@ -108,3 +108,3 @@
-#define SYSTEMD_DBUS_NAME                       "org.freedesktop.login1"
-#define SYSTEMD_DBUS_PATH                       "/org/freedesktop/login1"
-#define SYSTEMD_DBUS_INTERFACE                  "org.freedesktop.login1.Manager"
+#define SYSTEMD_DBUS_NAME                       "org.freedesktop.ConsoleKit"
+#define SYSTEMD_DBUS_PATH                       "/org/freedesktop/ConsoleKit/Manager"
+#define SYSTEMD_DBUS_INTERFACE                  "org.freedesktop.ConsoleKit.Manager"
