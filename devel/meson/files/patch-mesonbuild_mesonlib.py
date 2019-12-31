--- mesonbuild/mesonlib.py.orig	2019-11-28 12:37:44.000000000 -0500
+++ mesonbuild/mesonlib.py	2019-12-30 15:39:34.007817000 -0500
@@ -466,6 +466,9 @@
 def is_freebsd() -> bool:
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd() -> bool:
+    return platform.system().lower() == 'midnightbsd'
+
 def exe_exists(arglist: typing.List[str]) -> bool:
     try:
         if subprocess.run(arglist, timeout=10).returncode == 0:
