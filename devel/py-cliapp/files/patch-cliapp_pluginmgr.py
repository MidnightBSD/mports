--- cliapp/pluginmgr.py.orig	2018-08-12 00:00:00 UTC
+++ cliapp/pluginmgr.py
@@ -26,5 +26,5 @@
 
 
-import imp
+import importlib.util
 import inspect
 import os
@@ -132,6 +132,4 @@ class PluginManager(object):
 
         name, _ = os.path.splitext(os.path.basename(pathname))
-        f = open(pathname, 'r')
-        module = imp.load_module(name, f, pathname,
-                                 ('.py', 'r', imp.PY_SOURCE))
-        f.close()
+        spec = importlib.util.spec_from_file_location(name, pathname)
+        module = importlib.util.module_from_spec(spec)
+        spec.loader.exec_module(module)
