--- mesonbuild/utils/universal.py.orig	2023-11-28 16:22:28 UTC
+++ mesonbuild/utils/universal.py
@@ -130,6 +130,7 @@ __all__ = [
     'is_hurd',
     'is_irix',
     'is_linux',
+    'is_midnightbsd',
     'is_netbsd',
     'is_openbsd',
     'is_osx',
@@ -668,6 +669,9 @@ def is_netbsd() -> bool:
 def is_freebsd() -> bool:
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd() -> bool:
+    return platform.system().lower() == 'midnightbsd'
+
 def is_irix() -> bool:
     return platform.system().startswith('irix')
 
@@ -1018,7 +1022,7 @@ def default_libdir() -> str:
                 return 'lib/' + archpath
         except Exception:
             pass
-    if is_freebsd() or is_irix():
+    if is_freebsd() or is_irix() or is_midnightbsd():
         return 'lib'
     if os.path.isdir('/usr/lib64') and not os.path.islink('/usr/lib64'):
         return 'lib64'
