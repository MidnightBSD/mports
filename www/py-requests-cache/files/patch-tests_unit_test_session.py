--- tests/unit/test_session.py.orig
+++ tests/unit/test_session.py
@@ -4,0 +5 @@
+import sys
@@ -123 +124,2 @@
-    cache_key = '29de1c4491126e0b'
+    # url-normalize 2.x (python < 3.10) normalizes custom URL schemes differently than 3.0.1+
+    cache_key = '29de1c4491126e0b' if sys.version_info < (3, 10) else '045f15dceb1b8f75'
