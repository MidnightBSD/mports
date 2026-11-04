--- src/main.c.orig
+++ src/main.c
@@ -27,8 +27,12 @@
 #include "config.h"
 #endif
 #ifdef HAVE_INTROSPECTION
+#if USE_GIR20
+#include <girepository/girepository.h>
+#else
 #include <girepository.h>
 #endif
+#endif
 
 #include "xviewer-application.h"
 #include "xviewer-application-internal.h"
@@ -102,8 +106,12 @@
 	 * Using gtk_get_option_group here initializes gtk during parsing */
 	g_option_context_add_group (ctx, gtk_get_option_group (FALSE));
 #ifdef HAVE_INTROSPECTION
+#if USE_GIR20
+	g_option_context_add_group (ctx, gi_repository_get_option_group ());
+#else
 	g_option_context_add_group (ctx, g_irepository_get_option_group ());
 #endif
+#endif
 
 	if (!g_option_context_parse (ctx, &argc, &argv, &error)) {
 		gchar *help_msg;
