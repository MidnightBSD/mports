--- daemon/test-startup.c.orig	2026-09-11 00:00:00 UTC
+++ daemon/test-startup.c
@@ -33,0 +34 @@
+#include <unistd.h>
@@ -128,0 +130,5 @@ test_control_noaccess (Test *test,
+	if (geteuid () == 0) {
+		g_test_skip ("root bypasses directory permissions");
+		return;
+	}
+
