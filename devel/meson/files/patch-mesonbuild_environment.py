--- mesonbuild/environment.py.orig	2020-07-08 12:43:40.944825000 -0400
+++ mesonbuild/environment.py	2020-07-08 12:44:13.532935000 -0400
@@ -324,7 +324,7 @@
     """
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
@@ -376,7 +376,7 @@
 def detect_cpu(compilers: CompilersDict):
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
