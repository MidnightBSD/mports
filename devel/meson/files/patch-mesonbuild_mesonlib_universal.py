--- mesonbuild/mesonlib/universal.py.orig	2022-08-13 08:48:38 UTC
+++ mesonbuild/mesonlib/universal.py
@@ -111,6 +111,7 @@ __all__ = [
     'is_hurd',
     'is_irix',
     'is_linux',
+    'is_midnightbsd',
     'is_netbsd',
     'is_openbsd',
     'is_osx',
@@ -675,6 +676,9 @@ def is_netbsd() -> bool:
 def is_freebsd() -> bool:
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd() -> bool:
+    return platform.system().lower() == 'midnightbsd'
+
 def is_irix() -> bool:
     return platform.system().startswith('irix')
 
@@ -961,7 +965,7 @@ def default_libdir() -> str:
                 return 'lib/' + archpath
         except Exception:
             pass
-    if is_freebsd() or is_irix():
+    if is_freebsd() or is_irix() or is_midnightbsd():
         return 'lib'
     if os.path.isdir('/usr/lib64') and not os.path.islink('/usr/lib64'):
         return 'lib64'
@@ -989,7 +993,7 @@ def get_library_dirs() -> T.List[str]:
     # problematic, please raise the issue on the mailing list.
     unixdirs = ['/usr/local/lib', '/usr/lib', '/lib']
 
-    if is_freebsd():
+    if is_freebsd() or is_midnightbsd():
         return unixdirs
     # FIXME: this needs to be further genericized for aarch64 etc.
     machine = platform.machine()
