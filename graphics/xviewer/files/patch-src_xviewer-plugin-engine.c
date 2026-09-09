--- src/xviewer-plugin-engine.c.orig
+++ src/xviewer-plugin-engine.c
@@ -34,7 +34,11 @@
 #include <glib/gi18n.h>
 #include <glib.h>
 #include <gio/gio.h>
+#if USE_GIR20
+#include <girepository/girepository.h>
+#else
 #include <girepository.h>
+#endif
 
 #define XVIEWER_PLUGIN_DATA_DIR XVIEWER_DATA_DIR G_DIR_SEPARATOR_S "plugins"
 
@@ -86,6 +90,35 @@
 	GError *error = NULL;
 
 	/* This should be moved to libpeas */
+#if USE_GIR20
+	GIRepository *repo = gi_repository_dup_default ();
+
+	if (gi_repository_require (repo, "Peas", "1.0", 0, &error) == NULL)
+	{
+		g_warning ("Error loading Peas typelib: %s\n",
+			   error->message);
+		g_clear_error (&error);
+	}
+
+	if (gi_repository_require (repo, "PeasGtk", "1.0", 0, &error) == NULL)
+	{
+		g_warning ("Error loading PeasGtk typelib: %s\n",
+			   error->message);
+		g_clear_error (&error);
+	}
+
+	typelib_path = g_build_filename (LIBDIR, "xviewer", "girepository-1.0", NULL);
+
+	if (gi_repository_require_private (repo, typelib_path,
+					   "Xviewer", "3.0", 0, &error) == NULL)
+	{
+		g_warning ("Error loading Xviewer typelib: %s\n",
+			   error->message);
+		g_clear_error (&error);
+	}
+
+	g_object_unref (repo);
+#else
 	if (g_irepository_require (g_irepository_get_default (),
 				   "Peas", "1.0", 0, &error) == NULL)
 	{
@@ -112,6 +145,7 @@
 			   error->message);
 		g_clear_error (&error);
 	}
+#endif
 
 	engine = XVIEWER_PLUGIN_ENGINE (g_object_new (XVIEWER_TYPE_PLUGIN_ENGINE,
 						  NULL));
