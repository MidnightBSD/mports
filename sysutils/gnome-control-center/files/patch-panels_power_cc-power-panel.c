--- panels/power/cc-power-panel.c.orig	2026-09-11 00:00:00 UTC
+++ panels/power/cc-power-panel.c
@@ -646,3 +646,3 @@ can_suspend_or_hibernate (CcPowerPanel *self,
-                                         "org.freedesktop.login1",
-                                         "/org/freedesktop/login1",
-                                         "org.freedesktop.login1.Manager",
+                                         "org.freedesktop.ConsoleKit",
+                                         "/org/freedesktop/ConsoleKit/Manager",
+                                         "org.freedesktop.ConsoleKit.Manager",
@@ -1461,3 +1461,3 @@ cc_power_panel_init (CcPowerPanel *self)
-  g_settings_bind (self->gsd_settings, "power-saver-profile-on-low-battery",
-                   self->power_saver_low_battery_row, "active",
-                   G_SETTINGS_BIND_DEFAULT);
+  /* g_settings_bind (self->gsd_settings, "power-saver-profile-on-low-battery",
+                   self->power_saver_low_battery_row, "active",
+                   G_SETTINGS_BIND_DEFAULT); */
