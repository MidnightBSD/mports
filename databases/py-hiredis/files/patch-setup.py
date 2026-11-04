--- setup.py.orig	2021-03-28 15:11:23 UTC
+++ setup.py
@@ -7 +7 @@
-import sys, imp, os, glob, io
+import sys, importlib.util, os, glob, io
@@ -10 +10,3 @@
-  module = imp.load_source("hiredis.version", "hiredis/version.py")
+  spec = importlib.util.spec_from_file_location("hiredis.version", "hiredis/version.py")
+  module = importlib.util.module_from_spec(spec)
+  spec.loader.exec_module(module)
@@ -11,9 +13,10 @@ def version():
   return module.__version__
 
 ext = Extension("hiredis.hiredis",
-  sources=sorted(glob.glob("src/*.c") +
-                 ["vendor/hiredis/%s.c" % src for src in ("alloc", "read", "sds")]),
-  include_dirs=["vendor"])
+  sources=sorted(glob.glob("src/*.c")),
+  include_dirs=["%%LOCALBASE%%/include"],
+  library_dirs=["%%LOCALBASE%%/lib"],
+  libraries=["hiredis"])
