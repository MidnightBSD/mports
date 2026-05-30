--- panels/region/cinnamon-region-panel-xkb.h.orig	2022-06-24 12:42:06 UTC
+++ panels/region/cinnamon-region-panel-xkb.h
@@ -26,5 +26,11 @@
+#include "libgnomekbd/gkbd-desktop-config.h"
 #include "libgnomekbd/gkbd-keyboard-config.h"
 #include "libgnomekbd/gkbd-util.h"
+#define GKBD_DESKTOP_CONFIG_KEY_DEFAULT_GROUP "default-group"
+#define GKBD_DESKTOP_CONFIG_KEY_GROUP_PER_WINDOW "group-per-window"
+#define GKBD_KEYBOARD_CONFIG_KEY_LAYOUTS "layouts"
+#define GKBD_KEYBOARD_CONFIG_KEY_OPTIONS "options"
+
 G_BEGIN_DECLS
 #define CWID(s) GTK_WIDGET (gtk_builder_get_object (chooser_dialog, s))
 #define WID(s) GTK_WIDGET (gtk_builder_get_object (dialog, s))
