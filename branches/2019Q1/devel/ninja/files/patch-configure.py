--- configure.py.orig	2018-10-15 20:54:50.164894000 -0400
+++ configure.py	2018-10-15 20:56:00.366593000 -0400
@@ -46,6 +46,8 @@
             self._platform = 'freebsd'
         elif self._platform.startswith('gnukfreebsd'):
             self._platform = 'freebsd'
+        elif self._platform.startswith('midnightbsd'):
+            self._platform = 'midnightbsd'
         elif self._platform.startswith('openbsd'):
             self._platform = 'openbsd'
         elif self._platform.startswith('solaris') or self._platform == 'sunos5':
@@ -67,7 +69,7 @@
     def known_platforms():
       return ['linux', 'darwin', 'freebsd', 'openbsd', 'solaris', 'sunos5',
               'mingw', 'msvc', 'gnukfreebsd', 'bitrig', 'netbsd', 'aix',
-              'dragonfly']
+              'dragonfly', 'midnightbsd']
 
     def platform(self):
         return self._platform
@@ -98,11 +100,11 @@
         return self._platform == 'aix'
 
     def uses_usr_local(self):
-        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly')
+        return self._platform in ('freebsd', 'openbsd', 'bitrig', 'dragonfly', 'midnightbsd')
 
     def supports_ppoll(self):
         return self._platform in ('freebsd', 'linux', 'openbsd', 'bitrig',
-                                  'dragonfly')
+                                  'dragonfly', 'midnightbsd')
 
     def supports_ninja_browse(self):
         return (not self.is_windows()
