--- prance/convert.py.orig	2026-07-19 05:27:27 UTC
+++ prance/convert.py	2026-11-14 06:05:48 UTC
@@ -39 +39 @@
-    data = spec_str
+    data = spec_str.encode("utf-8")
