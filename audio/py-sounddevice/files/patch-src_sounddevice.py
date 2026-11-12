--- src/sounddevice.py.orig
+++ src/sounddevice.py
@@ -66,7 +66,11 @@
             'bin\\libportaudio-2.dll',  # DLL from conda-forge
             'lib/libportaudio.dylib',  # dylib from anaconda
             ):
-        _libname = _find_library(_libname)
+        if _sys.platform.startswith('midnightbsd') and _libname == 'portaudio':
+            _libname = _os.path.join(
+                getattr(_sys, '_MEIPASS', '%%LOCALBASE%%/lib'), 'libportaudio.so')
+        else:
+            _libname = _find_library(_libname)
         if _libname is not None:
             break
     else:
