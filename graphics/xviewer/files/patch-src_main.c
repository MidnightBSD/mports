--- src/main.c.orig
+++ src/main.c
@@ -29,0 +30,3 @@
+#if USE_GIR20
+#include <girepository/girepository.h>
+#else
@@ -31,0 +35 @@
+#endif
@@ -104,0 +109,3 @@
+#if USE_GIR20
+	g_option_context_add_group (ctx, gi_repository_get_option_group ());
+#else
@@ -106,0 +114 @@
+#endif
