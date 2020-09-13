--- mesonbuild/mesonlib.py.orig	2020-06-14 15:40:08.000000000 -0400
+++ mesonbuild/mesonlib.py	2020-07-08 12:43:12.409013000 -0400
@@ -507,6 +507,9 @@
 def is_freebsd() -> bool:
     return platform.system().lower() == 'freebsd'
 
+def is_midnightbsd() -> bool:
+    return platform.system().lower() == 'midnightbsd'
+
 def is_irix() -> bool:
     return platform.system().startswith('irix')
 
@@ -729,7 +732,7 @@
                 return 'lib/' + archpath
         except Exception:
             pass
-    if is_freebsd() or is_irix():
+    if is_freebsd() or is_irix() or is_midnightbsd():
         return 'lib'
     if os.path.isdir('/usr/lib64') and not os.path.islink('/usr/lib64'):
         return 'lib64'
@@ -757,7 +760,7 @@
     # problematic, please raise the issue on the mailing list.
     unixdirs = ['/usr/local/lib', '/usr/lib', '/lib']
 
-    if is_freebsd():
+    if is_freebsd() or is_midnightbsd():
         return unixdirs
     # FIXME: this needs to be further genericized for aarch64 etc.
     machine = platform.machine()
