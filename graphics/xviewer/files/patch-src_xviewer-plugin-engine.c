--- src/xviewer-plugin-engine.c.orig
+++ src/xviewer-plugin-engine.c
@@ -36,0 +37,4 @@
+
+#if USE_GIR20
+#include <girepository/girepository.h>
+#else
@@ -37,0 +42 @@
+#endif
@@ -88,0 +94,29 @@
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
@@ -114,0 +149 @@
+#endif
