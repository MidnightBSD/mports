--- mesonbuild/envconfig.py.orig	2026-09-09 00:00:00 UTC
+++ mesonbuild/envconfig.py
@@ -588,7 +588,7 @@ def detect_cpu_family(compilers: T.Dict[str, Compiler]) -> str:
     """
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
@@ -654,7 +654,7 @@ def detect_cpu(compilers: T.Dict[str, Compiler]) -> str:
 def detect_cpu(compilers: T.Dict[str, Compiler]) -> str:
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
