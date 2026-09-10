--- test/test-nemo-search-engine.c.orig
+++ test/test-nemo-search-engine.c
@@ -1,0 +2 @@
+#include <libnemo-private/nemo-global-preferences.h>
@@ -28 +29 @@ finished_cb (NemoSearchEngine *engine)
-//	gtk_main_quit ();
+	gtk_main_quit ();
@@ -37,0 +39 @@ main (int argc, char* argv[])
+	nemo_global_preferences_init ();
