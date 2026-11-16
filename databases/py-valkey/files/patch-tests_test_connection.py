--- tests/test_connection.py
+++ tests/test_connection.py
@@ -0,0 +1 @@
+import errno
@@ -338 +339,3 @@
-    assert str(e.value) == "Error 111 connecting to localhost:9999. Connection refused."
+    assert str(e.value) == (
+        f"Error {errno.ECONNREFUSED} connecting to localhost:9999. Connection refused."
+    )
