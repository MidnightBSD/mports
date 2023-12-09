--- mesonbuild/environment.py.orig	2023-05-25 18:35:03 UTC
+++ mesonbuild/environment.py
@@ -289,7 +289,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str
     """
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_midnightbsd() or mesonlib.is_qnx() or mesonlib.is_aix():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
@@ -350,7 +350,7 @@ def detect_cpu_family(compilers: CompilersDict) -> str
 def detect_cpu(compilers: CompilersDict) -> str:
     if mesonlib.is_windows():
         trial = detect_windows_arch(compilers)
-    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix():
+    elif mesonlib.is_freebsd() or mesonlib.is_netbsd() or mesonlib.is_openbsd() or mesonlib.is_aix() or mesonlib.is_midnightbsd():
         trial = platform.processor().lower()
     else:
         trial = platform.machine().lower()
