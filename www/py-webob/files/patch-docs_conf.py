--- docs/conf.py.orig
+++ docs/conf.py
@@ -1 +1 @@
-import pkg_resources
+import importlib.metadata as metadata
@@ -5,0 +6,2 @@
+sys.path.insert(0, os.path.abspath('../src'))
+
@@ -30 +32 @@
-version = release = pkg_resources.get_distribution('webob').version
+version = release = metadata.version("webob")
