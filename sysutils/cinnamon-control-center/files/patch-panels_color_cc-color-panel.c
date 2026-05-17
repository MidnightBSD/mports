--- panels/color/cc-color-panel.c.orig	2022-07-04 07:39:25 UTC
+++ panels/color/cc-color-panel.c
@@ -31 +30,0 @@
-#include <libcinnamon-desktop/gnome-installer.h>
@@ -310,7 +308,2 @@ gcm_prefs_install_component (guint xid, GPtrArray *arg
-  const gchar *to_install[2];
-  to_install[0] = "gnome-color-manager";
-  to_install[1] = NULL;
-
-  gnome_installer_install_packages(to_install,
-                                   (GnomeInstallerClientCallback) installer_finished_cb,
-                                   data);
+  g_warning ("gnome-color-manager is required but is not installed");
+  free_data (data);
