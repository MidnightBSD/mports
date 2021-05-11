--- python3/pyinotify.py.orig	2021-05-11 17:22:51 UTC
+++ python3/pyinotify.py
@@ -202,7 +202,7 @@ class _CtypesLibcINotifyWrapper(INotifyW
         assert ctypes
 
         try_libc_name = 'c'
-        if sys.platform.startswith('freebsd'):
+        if sys.platform.startswith('freebsd') or sys.platform.startswith('midnightbsd'):
             try_libc_name = 'inotify'
 
         libc_name = None
