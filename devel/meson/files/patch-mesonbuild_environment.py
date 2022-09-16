--- mesonbuild/environment.py.orig	2022-07-03 14:36:29 UTC
+++ mesonbuild/environment.py
@@ -303,7 +303,7 @@ def detect_cpu_family(compilers: Compile
     """
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
@@ -364,7 +364,7 @@ def detect_cpu_family(compilers: Compile
 def detect_cpu(compilers: CompilersDict) -> str:
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
