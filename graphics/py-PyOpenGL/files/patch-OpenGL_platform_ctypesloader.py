--- OpenGL/platform/ctypesloader.py.orig	2025-08-18 02:12:45 UTC
+++ OpenGL/platform/ctypesloader.py
@@ -30,7 +30,7 @@
     """
     if isinstance( dllType, ctypes.LibraryLoader ):
         dllType = dllType._dlltype
-    if sys.platform.startswith('linux'):
+    if sys.platform.startswith(('linux', 'midnightbsd')):
         return _loadLibraryPosix(dllType, name, mode)
     else:
         return _loadLibraryWindows(dllType, name, mode)
