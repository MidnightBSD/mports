--- src/ptyxis-tab.c.orig	2026-03-17 00:26:25 UTC
+++ src/ptyxis-tab.c
@@ -26,0 +27 @@
+#include <sys/wait.h>
@@ -28,4 +29,2 @@
-#ifdef __linux__
-# include <libportal/portal.h>
-# include <libportal-gtk4/portal-gtk4.h>
-#endif
+#include <libportal/portal.h>
+#include <libportal-gtk4/portal-gtk4.h>
@@ -124 +122,0 @@
-#ifdef __linux__
@@ -126 +123,0 @@
-#endif
@@ -2204 +2200,0 @@
-#ifdef __linux__
@@ -2309,10 +2304,0 @@
-#else
-void
-ptyxis_tab_open_uri (PtyxisTab  *self,
-                     const char *uri)
-{
-  G_GNUC_BEGIN_IGNORE_DEPRECATIONS
-  gtk_show_uri (GTK_WINDOW (gtk_widget_get_root (GTK_WIDGET (self))), uri, 0);
-  G_GNUC_END_IGNORE_DEPRECATIONS
-}
-#endif
