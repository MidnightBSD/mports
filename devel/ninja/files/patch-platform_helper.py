--- platform_helper.py.orig	2013-06-04 14:47:31.000000000 -0400
+++ platform_helper.py	2013-09-18 21:39:49.000000000 -0400
@@ -18,7 +18,7 @@
 import sys
 
 def platforms():
-    return ['linux', 'darwin', 'freebsd', 'openbsd', 'solaris', 'sunos5',
+    return ['linux', 'darwin', 'freebsd', 'midnightbsd', 'openbsd', 'solaris', 'sunos5',
             'mingw', 'msvc', 'gnukfreebsd8']
 
 class Platform( object ):
@@ -33,6 +33,8 @@
             self._platform = 'freebsd'
         elif self._platform.startswith('gnukfreebsd8'):
             self._platform = 'freebsd'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'midnightbsd'
         elif self._platform.startswith('openbsd'):
             self._platform = 'openbsd'
         elif self._platform.startswith('solaris'):
@@ -64,6 +66,9 @@
     def is_freebsd(self):
         return self._platform == 'freebsd'
 
+    def is_midnightbsd(self):
+        return self._platform == 'midnightbsd'
+
     def is_openbsd(self):
         return self._platform == 'openbsd'
 
