--- platform_helper.py.orig	2014-06-27 19:37:05.000000000 -0400
+++ platform_helper.py	2014-10-14 20:53:44.000000000 -0400
@@ -19,7 +19,7 @@
 
 def platforms():
     return ['linux', 'darwin', 'freebsd', 'openbsd', 'solaris', 'sunos5',
-            'mingw', 'msvc', 'gnukfreebsd', 'bitrig']
+            'mingw', 'msvc', 'gnukfreebsd', 'bitrig', 'midnightbsd']
 
 class Platform(object):
     def __init__(self, platform):
@@ -33,6 +33,8 @@
             self._platform = 'freebsd'
         elif self._platform.startswith('gnukfreebsd'):
             self._platform = 'freebsd'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'midnightbsd'
         elif self._platform.startswith('openbsd'):
             self._platform = 'openbsd'
         elif self._platform.startswith('solaris'):
@@ -73,6 +75,9 @@
     def is_freebsd(self):
         return self._platform == 'freebsd'
 
+    def is_midnightbsd(self):
+        return self._platform == 'midnightbsd'
+
     def is_openbsd(self):
         return self._platform == 'openbsd'
 
