--- tests/test_asyncio/test_connection.py
+++ tests/test_asyncio/test_connection.py
@@ -1,0 +2 @@
+import errno
@@ -540 +541,3 @@
-    assert str(e.value).startswith("Error 111 connecting to 127.0.0.1:9999. Connect")
+    assert str(e.value).startswith(
+        f"Error {errno.ECONNREFUSED} connecting to 127.0.0.1:9999. Connect"
+    )
