--- mesonbuild/mesonlib.py.orig	2018-10-15 21:08:41.713343000 -0400
+++ mesonbuild/mesonlib.py	2018-10-15 21:09:12.147491000 -0400
@@ -292,6 +292,9 @@
 def is_freebsd():
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd():
+    return platform.system().lower() == 'midnightbsd'
+
 def for_windows(is_cross, env):
     """
     Host machine is windows?
