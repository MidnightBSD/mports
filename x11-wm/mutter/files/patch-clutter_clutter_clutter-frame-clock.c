--- clutter/clutter/clutter-frame-clock.c.orig
+++ clutter/clutter/clutter-frame-clock.c
@@ -1691 +1691 @@
-  g_string_append_printf (string, "%ld µs", max_update_time_estimate_us);
+  g_string_append_printf (string, "%" G_GINT64_FORMAT " µs", max_update_time_estimate_us);
@@ -1698 +1698 @@
-  g_string_append_printf (string, "\nVblank duration: %ld µs +",
+  g_string_append_printf (string, "\nVblank duration: %" G_GINT64_FORMAT " µs +",
@@ -1700 +1700 @@
-  g_string_append_printf (string, "\nUpdate duration: %ld µs +",
+  g_string_append_printf (string, "\nUpdate duration: %" G_GINT64_FORMAT " µs +",
