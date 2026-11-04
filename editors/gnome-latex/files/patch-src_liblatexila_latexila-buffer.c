--- src/liblatexila/latexila-buffer.c.orig
+++ src/liblatexila/latexila-buffer.c
@@ -41,0 +42 @@
+	static gboolean style_scheme_settings_provided = FALSE;
@@ -52,3 +53,10 @@
-	tepl_buffer_provide_style_scheme_id_gsetting (buffer,
-						      editor_settings, "scheme",
-						      TRUE);
+	if (!style_scheme_settings_provided)
+	{
+		tepl_settings_provide_style_scheme_settings (tepl_settings_get_singleton (),
+							     editor_settings,
+							     "scheme",
+							     "scheme");
+		style_scheme_settings_provided = TRUE;
+	}
+
+	tepl_buffer_connect_style_scheme_settings (buffer);
