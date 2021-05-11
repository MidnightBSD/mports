--- python2/pyinotify.py.orig	2021-05-11 17:21:40 UTC
+++ python2/pyinotify.py
@@ -204,7 +204,7 @@ class _CtypesLibcINotifyWrapper(INotifyW
         assert ctypes
 
         try_libc_name = 'c'
-        if sys.platform.startswith('freebsd'):
+        if sys.platform.startswith('freebsd') or sys.platform.startswith('midnightbsd'):
             try_libc_name = 'inotify'
 
         libc_name = None
