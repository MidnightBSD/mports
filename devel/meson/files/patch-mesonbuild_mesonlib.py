--- mesonbuild/mesonlib.py.orig	2019-06-16 14:54:18.000000000 -0400
+++ mesonbuild/mesonlib.py	2019-08-29 12:30:53.434739000 -0400
@@ -463,6 +463,9 @@
 def is_freebsd() -> bool:
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd() -> bool:
+    return platform.system().lower() == 'midnightbsd'
+
 def exe_exists(arglist: List[str]) -> bool:
     try:
         if subprocess.run(arglist, timeout=10).returncode == 0:
