--- mesonbuild/mesonlib.py.orig	2018-09-30 18:06:24.003423000 -0400
+++ mesonbuild/mesonlib.py	2018-09-30 18:07:00.673471000 -0400
@@ -328,6 +328,9 @@
 def is_freebsd():
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd():
+    return platform.system().lower() == 'midnightbsd'
+
 def for_windows(is_cross, env):
     """
     Host machine is windows?
