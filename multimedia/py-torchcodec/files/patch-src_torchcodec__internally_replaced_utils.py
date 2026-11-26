--- src/torchcodec/_internally_replaced_utils.py.orig	2026-11-24 00:00:00 UTC
+++ src/torchcodec/_internally_replaced_utils.py
@@ -26 +26 @@
-    if sys.platform == "linux" or sys.platform.startswith("freebsd"):
+    if sys.platform == "linux" or sys.platform.startswith(("freebsd", "midnightbsd")):
