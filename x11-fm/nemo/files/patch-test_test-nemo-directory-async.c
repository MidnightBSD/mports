--- test/test-nemo-directory-async.c.orig
+++ test/test-nemo-directory-async.c
@@ -9 +8,0 @@
-#if 0
@@ -18 +16,0 @@
-#endif
@@ -60,0 +58 @@
+	g_timeout_add (5000, quit_cb, NULL);
