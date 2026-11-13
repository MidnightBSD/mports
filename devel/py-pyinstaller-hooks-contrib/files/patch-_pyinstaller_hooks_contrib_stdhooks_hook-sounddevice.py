--- _pyinstaller_hooks_contrib/stdhooks/hook-sounddevice.py.orig
+++ _pyinstaller_hooks_contrib/stdhooks/hook-sounddevice.py
@@ -16,7 +16,8 @@
 
 import pathlib
 
-from PyInstaller.utils.hooks import get_module_file_attribute, logger
+from PyInstaller.compat import is_freebsd
+from PyInstaller.utils.hooks import get_module_attribute, get_module_file_attribute, logger
 
 binaries = []
 datas = []
@@ -44,6 +45,10 @@
         from PyInstaller.depend.utils import _resolveCtypesImports
 
         libname = ctypes.util.find_library("portaudio")
+        if libname is None and is_freebsd:
+            libname = get_module_attribute("sounddevice", "_libname")
+            if os.path.isabs(libname) and os.path.isfile(libname):
+                return libname
         if libname is not None:
             resolved_binary = _resolveCtypesImports([os.path.basename(libname)])
             if resolved_binary:
