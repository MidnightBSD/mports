--- src/liblatexila/latexila-prefs.c.orig
+++ src/liblatexila/latexila-prefs.c
@@ -58,0 +59 @@
+	GtkWidget *style_scheme_chooser;
@@ -74,0 +76,5 @@
+
+	style_scheme_chooser = GTK_WIDGET (tepl_style_scheme_chooser_simple_new (FALSE));
+	g_settings_bind (editor_settings, "scheme",
+			 style_scheme_chooser, "style-scheme-id",
+			 G_SETTINGS_BIND_DEFAULT);
@@ -76,2 +82 @@
-			   tepl_prefs_create_color_scheme_component (editor_settings,
-								     "scheme"));
+			   style_scheme_chooser);
