--- soundfile.py.orig	2026-11-25 01:03:47 UTC
+++ soundfile.py
@@ -202,7 +202,7 @@ except (OSError, ImportError, TypeError):
             _explicit_libname = 'libsndfile.dylib'
         elif _sys.platform == 'win32':
             _explicit_libname = 'libsndfile.dll'
-        elif _sys.platform == 'linux':
+        elif _sys.platform == 'linux' or _sys.platform.startswith('midnightbsd'):
             _explicit_libname = 'libsndfile.so'
         else:
             raise
