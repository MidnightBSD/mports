--- mesonbuild/mesonlib.py.orig	2021-01-06 10:39:48 UTC
+++ mesonbuild/mesonlib.py
@@ -518,6 +518,9 @@ def is_netbsd() -> bool:
 def is_freebsd() -> bool:
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd() -> bool:
+    return platform.system().lower() == 'midnightbsd'
+
 def is_irix() -> bool:
     return platform.system().startswith('irix')
 
@@ -749,7 +752,7 @@ def default_libdir() -> str:
                 return 'lib/' + archpath
         except Exception:
             pass
-    if is_freebsd() or is_irix():
+    if is_freebsd() or is_irix() or is_midnightbsd():
         return 'lib'
     if os.path.isdir('/usr/lib64') and not os.path.islink('/usr/lib64'):
         return 'lib64'
@@ -777,7 +780,7 @@ def get_library_dirs() -> T.List[str]:
     # problematic, please raise the issue on the mailing list.
     unixdirs = ['/usr/local/lib', '/usr/lib', '/lib']
 
-    if is_freebsd():
+    if is_freebsd() or is_midnightbsd():
         return unixdirs
     # FIXME: this needs to be further genericized for aarch64 etc.
     machine = platform.machine()
