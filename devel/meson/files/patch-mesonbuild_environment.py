--- mesonbuild/environment.py.orig	2021-02-20 13:16:54 UTC
+++ mesonbuild/environment.py
@@ -385,7 +385,7 @@ def detect_cpu_family(compilers: Compile
     """
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
@@ -443,7 +443,7 @@ def detect_cpu_family(compilers: Compile
 def detect_cpu(compilers: CompilersDict):
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
