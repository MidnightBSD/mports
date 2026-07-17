--- boto/plugin.py.orig
+++ boto/plugin.py
@@ -39,3 +39,3 @@
 import glob
-import imp
+import importlib.util
 import os.path
@@ -69,10 +69,8 @@
 def _import_module(filename):
     (path, name) = os.path.split(filename)
     (name, ext) = os.path.splitext(name)
 
-    (file, filename, data) = imp.find_module(name, [path])
-    try:
-        return imp.load_module(name, file, filename, data)
-    finally:
-        if file:
-            file.close()
+    spec = importlib.util.spec_from_file_location(name, filename)
+    module = importlib.util.module_from_spec(spec)
+    spec.loader.exec_module(module)
+    return module
