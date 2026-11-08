--- pytest_checkdocs/compat/docutils21.py.orig
+++ pytest_checkdocs/compat/docutils21.py
@@ -23,6 +23,8 @@
     return name
 
 
-writer: Callable[[str], str | writers.Writer[Any]] = (
-    identity if version >= '0.22' else _instance_from_name
-)
+writer: Callable[[str], str | writers.Writer[Any]]
+if version >= '0.22':
+    writer = identity
+else:
+    writer = _instance_from_name
