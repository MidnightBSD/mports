--- mesonbuild/environment.py.orig	2020-10-30 04:17:30.000000000 -0400
+++ mesonbuild/environment.py	2020-11-21 02:44:15.211761000 -0500
@@ -354,7 +354,7 @@
     """
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
@@ -409,7 +409,7 @@
 def detect_cpu(compilers: CompilersDict):
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
